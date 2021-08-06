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
@WebServlet(name = "addtocart", urlPatterns = {"/addtocart"})
public class addtocart extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        registration reg = new registration(session);
        
        try {
            if (request.getParameter("addtocart") != null) {
                String p_id = request.getParameter("p_id");
                int quantity= Integer.parseInt(request.getParameter("quantity"));
                String status = reg.addtocart(p_id , quantity);
                if (status.equals("success")) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Item Added To Cart...!!!');");
                    out.println("</script>");
                    /*  out.println ->  used for writing html code in the java file.
                        <script>    ->  start with script tag.
                        alert()     ->  displays message in alert box.
                    */
                    RequestDispatcher rd1 = request.getRequestDispatcher("cart.jsp");
                    rd1.forward(request, response);
                }
            } else if (request.getParameter("delete") != null) {
                int c_id = Integer.parseInt(request.getParameter("cid"));
                int status = reg.deletecart(c_id);
                if (status > 0) {
                    RequestDispatcher rd1 = request.getRequestDispatcher("cart.jsp");
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
