/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.UsuarioDAO;
import ModeloVO.Usuario;
import Util.CEncriptacion;
import Util.CEnvioemail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author melis
 */
public class validar extends HttpServlet {

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

        UsuarioDAO daous = new UsuarioDAO();
        Usuario usuvo = new Usuario();
        CEnvioemail mail = new CEnvioemail();

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String accion = request.getParameter("accion");
        HttpSession session = request.getSession();
        switch (accion) {
            case "Ingresar":

                String usuario = request.getParameter("usuario");
                String contrasena = request.getParameter("pass");

                Usuario user = new Consultas().autenticacion(usuario, contrasena);

                if (user.getId_rol() != null) {

                    if (user.getContrasena().equals(contrasena) && user.getNombreUsu().equals(usuario)) {
                        user.setNombreUsu(null);
                        user.setContrasena(null);
                        session.setAttribute("ROL", user.getId_rol());

                        switch (user.getId_rol()) {
                            case "1":
                                response.sendRedirect("Dashboard.jsp");
                                break;
                            case "2":
                                response.sendRedirect("Dashboard.jsp");
                                break;
                            default:
                                response.sendRedirect("sesion.jsp");
                        }
                        user.setId_rol(null);
                    } else {
                        response.sendRedirect("sesion.jsp");
                    }
                } else {
                    System.out.println("llego aca");
                    response.sendRedirect("sesion.jsp");
                }
                break;

            case "Cerrar":
                session.invalidate();
                request.getRequestDispatcher("sesion.jsp").forward(request, response);
                break;

            case "Confirmar":

                String usuarioconfirma = request.getParameter("usuario");
                usuvo = daous.validarCorreo(usuarioconfirma);

                if (usuvo.getId() > 0) {

                    String codigo = "";
                    Random random = new Random();

                    for (int i = 0; i < 4; i++) {
                        codigo += random.nextInt(10);
                        codigo += (char) (random.nextInt(10) + 65);
                    }

                    session.setAttribute("CODIGOCONFIRMACION", codigo);
                    session.setAttribute("USUARIO", usuvo.getId());

                    System.out.println("cvosdigo" + codigo);

                    mail.enviarCorreo(usuvo.getNombreUsu(), "Recoverypass", codigo);
                    request.getRequestDispatcher("codigo.jsp").forward(request, response);

                } else {
                    request.setAttribute("alert", "Este usuario no existe");
                    request.getRequestDispatcher("recoverypass.jsp").forward(request, response);
                }

                break;

            case "Comprobar":

                String codigo = request.getParameter("codigo");
                if (codigo != null) {
                    if (codigo.equalsIgnoreCase((String) session.getAttribute("CODIGOCONFIRMACION"))) {
                        request.getRequestDispatcher("updatepass.jsp").forward(request, response);
                    } else {
                        request.setAttribute("alert", "Código invalido");
                        request.getRequestDispatcher("codigo.jsp").forward(request, response);
                    }
                }

                break;

            case "Updatepass":

                String pass = request.getParameter("pass");
                String passconfirma = request.getParameter("passconfirm");
                if (pass.equals(passconfirma)) {
                    if (daous.updatePassword(pass, (int) session.getAttribute("USUARIO")) == true) {
                        request.setAttribute("html", "<a href='sesion.jsp' >Iniciar sesion</a>");
                        request.setAttribute("alert", "Clave actualizada");
                    } else {
                        request.setAttribute("alert", "no se actualizo");
                    }
                } else {
                    request.setAttribute("mensaje", "Las contraseñas no coinciden");
                }
                request.getRequestDispatcher("updatepass.jsp").forward(request, response);

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
