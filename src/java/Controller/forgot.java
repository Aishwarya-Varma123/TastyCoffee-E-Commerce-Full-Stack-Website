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
import model.user;

/**
 *
 * @author Aish
 */
@WebServlet(name = "forgot", urlPatterns = {"/forgot"})
public class forgot extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        registration reg = new registration(session);
        try
        {
            if (request.getParameter("forgotpassword") != null) 
            {
                String email = request.getParameter("email"); 
                int count = reg.ValidateEmail(email); 
                if (count == 0) 
                {
                    request.setAttribute("status", "Enter valid email address.");
                    RequestDispatcher rd = request.getRequestDispatcher("forgotpass.jsp");
                    rd.forward(request, response);
                } 
                else 
                {
                    int randnumber = 0;
                    randnumber = (int) (Math.random() * 10000); 
                    
                    String code = "" + randnumber; 
                    String idname = reg.FetchNameByEmail(email); 
                    String id = idname.split("_")[0]; 
                    String uname = idname.split("_")[1]; 
                    reg.PasswordTrack(id, uname, email, randnumber + "");
                    final StringBuilder sb = new StringBuilder("<html> "); 
                    sb.append("<body>");
                    sb.append("<div style='width:100%; background:aliceblue;'>");
                    sb.append("<p class=notsobig-text>Hi<strong> " + uname + ",</strong></p>"); 
                    sb.append("<p class=notsobig-text>You have requested to reset your password. Kindly click the below button to reset.</p>");
                    sb.append("<div><a target='_blank' style='text-decoration:none; padding:2px 14px; background: #8bc34a; border-radius:2px; border:1px solid #76b031; font-family: Helvetica,Arial,sans-serif; display:inline-block;'  href='http://localhost:8080/TastyCoffee/forgot?code1=" + code + "&&email=" + email + "'><strong style='font-size:14px; font-weight:bold; color:white; white-space:nowrap;'>Reset Password</strong></a></div>");
                    sb.append("</div>");
                    sb.append("</body>");
                    sb.append("</html>");
                    reg.SendMail(sb.toString(), "Password Reset Link", email); 
                    session.setAttribute("securitycode", code); 
                    request.setAttribute("status", "Verification code successfully sent on your email.");
                    RequestDispatcher rd = request.getRequestDispatcher("forgotpass.jsp");
                    rd.forward(request, response);
                }
            } 
            
            else if (request.getParameter("code1") != null && request.getParameter("email") != null) 
            {
                try 
                {
                    String code1 = request.getParameter("code1").replace(" ", "+"); 
                    
                    String email = request.getParameter("email"); 
                    
                    user s = reg.getpasswordtrackdetails(email, code1);
                    
                    String name = "", uemail = "", scode = "";
                    if (s.getName().length() > 0) 
                    {
                        name = s.getName(); 
                        uemail = s.getEmail();
                        scode = s.getPw();
                    }

                    if (code1.equals(scode)) 
                    {
                        session.setAttribute("scode", scode); 
                        session.setAttribute("npuname", name);
                        session.setAttribute("npuemail", uemail);
                        RequestDispatcher rd = request.getRequestDispatcher("newpass.jsp");
                        rd.forward(request, response);
                    } 
                    else 
                    {
                        request.setAttribute("status", "Invalid or expired verification link.");
                        RequestDispatcher rd = request.getRequestDispatcher("forgotpass.jsp");
                        rd.forward(request, response);
                    }
                } 
                catch (Exception e) 
                {
                    e.printStackTrace();
                }
            }
            
            else if (session.getAttribute("scode") != null && request.getParameter("submit_newpassword") != null) 
            {
                try 
                {
                    int status = 0, inpasstrack = 0;
                    String uemail=session.getAttribute("npuemail").toString();
                    String uname = session.getAttribute("npuname").toString();
                    String scode = session.getAttribute("scode").toString();

                    String pass = request.getParameter("n_password");
                    String cpass = request.getParameter("c_password");
                    
                    if (pass.equals(cpass)) 
                    {
                        status = reg.updatepassword(uemail, pass); 
                        inpasstrack = reg.updatepasswordinpasstrack(uemail, scode, pass); 
                        session.setAttribute("npuname", null); 
                        session.setAttribute("npuemail", null);
                        session.setAttribute("scode", null);
                        request.setAttribute("status", "Password Reset Successful!!");
                        RequestDispatcher rd = request.getRequestDispatcher("login.jsp"); 
                        rd.forward(request, response); 
                    } 
                    else 
                    {
                        //request.setAttribute("status", "Passwords do not match!");
                        RequestDispatcher rd = request.getRequestDispatcher("newpass.jsp");
                        rd.forward(request, response);
                    }
                } 
                catch (Exception e) 
                {
                    e.printStackTrace();
                }
            }

        }
        catch (Exception e) 
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
