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


@WebServlet(name = "register", urlPatterns = {"/register"})
public class register extends HttpServlet 
{
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter(); 
        HttpSession session = request.getSession();
        registration reg = new registration(session);
        try
        {
            if (request.getParameter("register") != null)
            {
                String name = request.getParameter("name"); // fetches name field from jsp page.
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String pw = request.getParameter("pw");
                String cp = request.getParameter("cp");
                
                String status = reg.registration(name, phone, email, pw);
                    if (status.equals("existed")) 
                    {
                        request.setAttribute("status", "This email address is already associated with an account.");
                        RequestDispatcher rd1 = request.getRequestDispatcher("createaccount.jsp");
                        rd1.forward(request, response);
                    } 
                    else if (status.equals("success")) 
                    {
                        final StringBuilder sb = new StringBuilder("<html> "); 
                        sb.append("<body>");
                        sb.append("<div>");
                        sb.append("<p class=notsobig-text>Hello<strong> " + session.getAttribute("uname") + ",</strong></p>"); 
                        sb.append("<p class=notsobig-text>Welcome to TastyCoffee!</p>");
                        sb.append("<p class=notsobig-text>You've activated your customer account.</p>");
                        sb.append("</div>");
                        sb.append("</body>");
                        sb.append("</html>");
                        reg.SendMail(sb.toString(), "Customer account confirmation", email);
                        //reg.SendMail("Hello " + session.getAttribute("uname") + "!\nWelcome to TastyCoffee!\n\nYou've activated your customer account.", "Customer account confirmation", email);
                        RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                        rd1.forward(request, response);

                    } 
                    else if (status.equals("failure")) 
                    {
                        request.setAttribute("status", "Registration failed.");
                        RequestDispatcher rd1 = request.getRequestDispatcher("createaccount.jsp");
                        rd1.forward(request, response);
                    }
            }
            
            else if (request.getParameter("login") != null)
            {
                String email = request.getParameter("email"); 
                String pass = request.getParameter("pw");
                String status = reg.login(email, pass);
                

                if (status.equals("success")) 
                {
                    RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                    rd1.forward(request, response);  
                } 
                else if (status.equals("failure")) 
                {
                    request.setAttribute("status1", "Incorrect email or password.");
                    RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
                    rd1.forward(request, response); 
                }
            } 
            
            else if (request.getParameter("logout") != null) //invoked from header.jsp file ., when user taps on logout
            {
                session.invalidate(); //session is destroyed.

                RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");

                rd1.forward(request, response); //control goes to index.jsp.

            }
            
            else if(session.getAttribute("uname") != null && request.getParameter("update") != null)
                
            {
                String name=request.getParameter("name");
                String pno=request.getParameter("pno");
                
                registration u=new registration(session);
                String status=u.update(name,pno);
                if(status.equals("success"))
                {
                    request.setAttribute("status", "Profile Successfully Updated");
                    RequestDispatcher rd1=request.getRequestDispatcher("editprofile.jsp");
                    rd1.forward(request, response);
                }
                
                else
                {
                    request.setAttribute("status", "Updation Failed");
                    RequestDispatcher rd1=request.getRequestDispatcher("editprofile.jsp");
                    rd1.forward(request, response); 
                
                }
            }
            
            
        }
        catch(Exception e)
        {
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
