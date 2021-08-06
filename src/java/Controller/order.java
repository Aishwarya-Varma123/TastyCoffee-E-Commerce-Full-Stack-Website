/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "order", urlPatterns = {"/order"})
public class order extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        HttpSession session = request.getSession();
        registration reg = new registration(session);
        try {
            if (request.getParameter("submit") != null) {
                //request.getParameter   ->  for fetching all input fields.
                String order_address = request.getParameter("address");
                String order_city = request.getParameter("city");
                String order_state = request.getParameter("state");
                String order_pincode = request.getParameter("pincode");
                String tcost = request.getParameter("tcost");
                String email = request.getParameter("email");
                String status = reg.orderdetails(order_address, order_city, order_state,order_pincode, tcost);
                if (status.equals("success")) {
                    final StringBuilder sb = new StringBuilder("<html> "); 
                    sb.append("<body>");
                    sb.append("<div>");
                    sb.append("<p class=notsobig-text>Hello<strong> " + session.getAttribute("uname") + ",</strong></p>"); 
                    sb.append("<p class=notsobig-text>Your order is confirmed.</p>");
                    sb.append("</div>");
                    sb.append("</body>");
                    sb.append("</html>");
                    reg.SendMail(sb.toString(), "Your TastyCoffee Order Confirmation.", email); 
                   // reg.SendMail("Hello " + session.getAttribute("uname") + "!\n Your order is confirmed.", "Your TastyCoffee Order Confirmation.", email);
                    RequestDispatcher rd1 = request.getRequestDispatcher("myorder.jsp");
                    rd1.forward(request, response);
                }
            } else if (request.getParameter("deleteorder") != null) {
                int oid = Integer.parseInt(request.getParameter("orderid"));
                int status = reg.deleteorder(oid);
                if (status > 0) {
                    RequestDispatcher rd1 = request.getRequestDispatcher("myorder.jsp");
                    rd1.forward(request, response);
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
