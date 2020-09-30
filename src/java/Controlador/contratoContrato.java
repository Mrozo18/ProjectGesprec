/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ModeloDAO.ContratoDAO;
import ModeloVO.ContratoVO;
import Util.CAcciones;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dell_1
 */
@WebServlet(name = "contratoContrato", urlPatterns = {"/contratoContrato"})
public class contratoContrato extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        int opcion = Integer.parseInt(request.getParameter("opcion"));

        String idPersona = request.getParameter("txt_idPersona");
        String fechainicio_Contrato = request.getParameter("dt_fechaInicio");
        String diasHabiles = request.getParameter("txt_diasHabiles");
        String estado = request.getParameter("txt_estado");
        String observacion = request.getParameter("txt_Observacion");
        String ultimaActualizacion = request.getParameter("dt_ultimaActua");
        String idtipoContrato = request.getParameter("txt_tipoContrato");
        String idModalidad = request.getParameter("txt_modalidad");
        String nombre_Modalidad = request.getParameter(null);
        String nombre_TipoContrato = request.getParameter(null);
        // 
        String idcontrato = request.getParameter("txt_idContrato");
        

        ContratoVO contVO = new ContratoVO(idtipoContrato, idPersona, fechainicio_Contrato, diasHabiles, estado, observacion, ultimaActualizacion, idtipoContrato, idModalidad, nombre_Modalidad, nombre_TipoContrato);
        ContratoDAO contDAO = new ContratoDAO(contVO);

        switch (opcion) {

            case 1:// Agregar registro
                if (contDAO.AgregarRegistro()) {
                    contDAO.setRequisitosContrato();
                    request.setAttribute("MensajeExitoR", "El producto fue registrado correctamente");

                } else {
                    request.setAttribute("MensajeErrorR", "El producto no fue registrado correctamente");
                }
                request.getRequestDispatcher("consultarContrato.jsp").forward(request, response);  // xD 
                break;
            case 2: // Actualizar registro
               // contVO.setIdContrato(idcontrato);
                if (contDAO.ActualizarRegistro(Integer.parseInt(idcontrato)) == true) {
                    request.setAttribute("MensajeExitoA", "El producto fue actualizado correctamente");

                } else {
                    request.setAttribute("MensajeErrorA", "El producto no fue actualizado correctamente");
                }
                request.getRequestDispatcher("consultarContrato.jsp").forward(request, response);

                break;

            case 3: // COnsultar contrato

                int contrato = Integer.parseInt(request.getParameter("contrato"));
                System.out.println("ññegp");
                contVO = contDAO.consultarContrato(contrato);
                response.getWriter().write(CAcciones.crearObjetoJson(contVO));

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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(contratoContrato.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(contratoContrato.class.getName()).log(Level.SEVERE, null, ex);
        }
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
