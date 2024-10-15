/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import model.Account;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.Files;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.SecretKey;

/**
 *
 * @author nntru
 */
@WebServlet(name = "VerifyCodeController", urlPatterns = {"/VerifyCodeController"})
public class VerifyCodeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String flag = (String) request.getParameter("flag");
        String code = request.getParameter("code"); // otp
        String authCode = (String) session.getAttribute("authCode"); // generate code
        Long codeGeneratedTime = (Long) session.getAttribute("codeGeneratedTime");

        if (authCode != null && codeGeneratedTime != null) {
            long currentTime = System.currentTimeMillis();
            long timeElapsed = (currentTime - codeGeneratedTime) / 1000;

            if (timeElapsed > 120) {
                request.setAttribute("message", "Verification code expired");
                session.removeAttribute("authCode");
                request.getRequestDispatcher("verifyCode.jsp").forward(request, response);
            } else if (authCode.equals(code) && flag.equalsIgnoreCase("register")) {
                String email = (String) session.getAttribute("email");
                String phone = (String) session.getAttribute("phone");
                String username = (String) session.getAttribute("username");
                int role = (int) session.getAttribute("role");
                String password = (String) session.getAttribute("password");
                String address = (String) session.getAttribute("address");
                AccountDAO dao = new AccountDAO();

                boolean addAccount = dao.add(new Account(username, password, email, phone, address, role, "active"));
                session.removeAttribute("authCode");
                session.setAttribute("message", "Successful account registration");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else if (authCode.equals(code) && flag.equalsIgnoreCase("forgotPassword")) {
                request.getRequestDispatcher("newPassword.jsp").forward(request, response);
            } else {
                session.setAttribute("message", "Confirmation code is incorrect");
                request.getRequestDispatcher("verifyCode.jsp").forward(request, response);
            }
        } else {
            response.getWriter().println("Confirmation code not found. Please try again.");
        }
    }

    private byte[] convertPathToByteArray(Path path) {
        try {
            return Files.readAllBytes(path);
        } catch (IOException e) {
            e.printStackTrace();

            return new byte[0];
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
