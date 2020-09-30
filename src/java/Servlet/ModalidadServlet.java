/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import ModeloDAO.ModalidadDAO;
import ModeloVO.Modalidad;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ModalidadServlet", urlPatterns = {"/ModalidadServlet"})
public class ModalidadServlet extends HttpServlet {

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
    private ModalidadDAO modalidadDAO = new ModalidadDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            switch (action) {
                case "buscar":
                    ArrayList<Modalidad> search = new ArrayList<>();
                    try {
                        String data = request.getParameter("q");
                        if (isNumeric(data)) {
                            search = modalidadDAO.getBy("Id_Modalidad = " + data);
                        } else {
                            search = modalidadDAO.getBy("Nombre_Modalidad Like '%" + data + "%'");
                        }
                    } catch (Exception e) {
                        search = modalidadDAO.getAll();
                    }
                    request.setAttribute("busqueda", search);
                    getServletContext().getRequestDispatcher("/listaModalidades.jsp").forward(request, response);
                    break;
                case "modificar":
                    Modalidad modalidad = new Modalidad();
                    modalidad.setIdModalidad(Integer.parseInt(request.getParameter("IdMod")));
                    modalidad.setNombre_Modalidad(request.getParameter("NombreMod"));
                    ModalidadDAO modalidadDAO = new ModalidadDAO();
                    modalidadDAO.actualizarModalidad(modalidad);
                    response.sendRedirect("listaModalidades.jsp");
                    break;
//                case "delete":
//                    System.out.println("go to delete");
//                    delete(request, response);
//                    break;
            }
        } catch (Exception e) {
            return;
        }
    }

    public boolean isNumeric(String str) {
        try {
            Double.parseDouble(str);
            return true;
        } catch (NumberFormatException e) {
            return false;
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
        Modalidad modalidad = new Modalidad();
        modalidad.setNombre_Modalidad(request.getParameter("NombreMod"));
        ModalidadDAO modalidadDAO = new ModalidadDAO();
        modalidadDAO.crearModalidad(modalidad);
        response.sendRedirect("listaModalidades.jsp");
    }
    
//    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
//        Modalidad modalidad = modalidadDAO.g(Integer.parseInt(request.getParameter("id")));
//        ModalidadDAO.delete(modalidad);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
//        dispatcher.forward(request, response);
//    }

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
