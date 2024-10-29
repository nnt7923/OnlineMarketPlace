/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.http.Cookie;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author Admin
 */
public class LogoutController extends jakarta.servlet.http.HttpServlet {
   
    protected void processRequest(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
    throws jakarta.servlet.ServletException, IOException {
        request.getSession().setAttribute("account", null);
        Cookie cEmail = new Cookie("email", "");
        Cookie cPass = new Cookie("password", "");

        cEmail.setMaxAge(-1);
        cPass.setMaxAge(-1);

        response.addCookie(cEmail);
        response.addCookie(cPass);
        response.sendRedirect("./home.jsp");
    }

    @Override
    protected void doGet(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
    throws jakarta.servlet.ServletException, IOException {
        processRequest(request, response);
    } 

    @Override
    protected void doPost(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response)
    throws jakarta.servlet.ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
