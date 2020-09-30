/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.SeguimientoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author melis
 */
@WebServlet(name = "Seguimiento", urlPatterns = {"/Seguimiento"})
public class Seguimiento extends HttpServlet {
    

    SeguimientoDAO seguimiento = new SeguimientoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Seguimiento</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Seguimiento at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String accion = request.getParameter("accion");
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        switch (accion) {
            case "Consultar": // Consulta de requisitos

                System.out.println("ctr");

                String modalidad = request.getParameter("modalidad");
                List requisitos = seguimiento.consultarRequisitos(modalidad);

                request.setAttribute("requisitos", requisitos);

                break;
            default:

                throw new AssertionError();
        }
        
        request.getRequestDispatcher("requisitos.jsp").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
