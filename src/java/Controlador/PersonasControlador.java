/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.PersonasDAO;
import java.util.Random;
import ModeloVO.PersonasVO;
import Util.CEncriptacion;
import Util.CEnvioemail;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author melis
 */
@WebServlet(name = "personasControlador", urlPatterns = {"/personasControlador"})
public class PersonasControlador extends HttpServlet {

    int id;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        CEnvioemail email = new CEnvioemail();

        String pass = "";
        Random rndpass = new Random();

        for (int i = 0; i < 4; i++) {
            pass += rndpass.nextInt(10);
            pass += (char) (rndpass.nextInt(10) + 65);
        }

        String contraseña = CEncriptacion.encriptar(pass);

        String sesionRol = (String) session.getAttribute("ROL");
        int opcion = Integer.parseInt(request.getParameter("opcion"));

        String nombrePersona = request.getParameter("txtnombrePersona");
        String apellidoPersona = request.getParameter("txtapellidoPersona");
        String telefonoPersona = request.getParameter("txttelefonoPersona");
        String emailPersona = request.getParameter("txtemailPersona");
        String usuario = request.getParameter("usuario");
        String rol = request.getParameter("rol");
        String estado = request.getParameter("estado");

        //String idUsuario = request.getParameter("txtidUsuario");
        PersonasVO PersonVO = new PersonasVO();

        PersonVO.setNombrePersona(nombrePersona);
        PersonVO.setApellidoPersona(apellidoPersona);
        PersonVO.setEmailPersona(emailPersona);
        PersonVO.setTelefonoPersona(telefonoPersona);
        PersonVO.setEstadoPersona(estado);
        PersonVO.setUsuario(usuario);
        PersonVO.setId_rol(rol);
        PersonVO.setContrasena(contraseña);

        PersonasDAO PersonasDAO = new PersonasDAO(PersonVO);

        switch (opcion) {

            case 1:// Agregar registro
                if (PersonasDAO.AgregarRegistro() == true) {
                    email.enviarCorreo(emailPersona, "Registro", pass);

                    request.setAttribute("MensajeExitoR", " La Persona fue agregada correctamente");

                } else {
                    request.setAttribute("MensajeErrorR", "Error al agregar la persona");
                }
                request.getRequestDispatcher("RegistrarPersonas.jsp").forward(request, response);
                break;
            case 2: // Actualizar registro
                if (PersonasDAO.ActualizarRegistro()) {

                    request.setAttribute("MensajeExitoA", "La Persona fue actulizada correctamente");

                } else {
                    request.setAttribute("MensajeErrorA", "Error al actualizar la Persona");
                }
                request.getRequestDispatcher("ConsultarPersonas.jsp").forward(request, response);

                break;

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
