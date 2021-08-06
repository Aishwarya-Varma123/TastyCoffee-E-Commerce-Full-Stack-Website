/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.registration;

/**
 *
 * @author Aish
 */
@WebServlet(name = "delete", urlPatterns = {"/delete"})
public class delete extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        try {
            if (request.getParameter("deleteuser") != null) {
                int id = Integer.parseInt(request.getParameter("userid"));

                registration reg = new registration(session);
                String status = reg.delete(id);
                if (status.equals("success")) {

                    request.getRequestDispatcher("adminusers.jsp").forward(request, response);
                }

                if (status.equals("failure")) {
                    request.setAttribute("status", "Deletion Failed");
                    request.getRequestDispatcher("adminusers.jsp").forward(request, response);

                }
            }
            else if (request.getParameter("deliverorder") != null) {
                int o_id = Integer.parseInt(request.getParameter("orderid"));

                registration reg = new registration(session);
                int status = reg.admindeliverorder(o_id);
                if (status>0) {

                    request.getRequestDispatcher("adminorders.jsp").forward(request, response);
                }

                else {
                    request.setAttribute("status", "Delivery Failed");
                    request.getRequestDispatcher("adminorders.jsp").forward(request, response);

                }
            }
            
            else if (request.getParameter("deleteproduct") != null) {
                int p_id = Integer.parseInt(request.getParameter("pid"));

                registration reg = new registration(session);
                String status = reg.admindeleteproduct(p_id);
                if (status.equals("success")) {

                    request.getRequestDispatcher("adminproducts.jsp").forward(request, response);
                }

                if (status.equals("failure")) {
                    request.setAttribute("status", "Deletion Failed");
                    request.getRequestDispatcher("adminproducts.jsp").forward(request, response);

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
