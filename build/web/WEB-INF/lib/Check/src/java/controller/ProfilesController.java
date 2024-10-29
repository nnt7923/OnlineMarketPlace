/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import dao.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;
import model.Account;
import model.Customer;

/**
 *
 * @author Admin
 */
public class ProfilesController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("account");

        if (user != null) {
            int userId = user.getAccountId();
            AccountDAO userDB = new AccountDAO();
            Account userGetted = userDB.getUserById(userId);

            if (userGetted != null) {
                // Gán thông tin tài kho?n vào request
                request.setAttribute("account", userGetted);
                // Gán thông tin khách hàng vào request t? ??i t??ng account
                request.setAttribute("customer", userGetted.getCustomer());
            }
            request.getRequestDispatcher("profiles.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        AccountDAO accountDAO = new AccountDAO();
        PrintWriter out = response.getWriter();

        // L?y các thông tin t? request
        String username = request.getParameter("username");
        String fullName = request.getParameter("fullName");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        // Log thông tin ?? ki?m tra xem d? li?u có b? null không
        System.out.println("Username: " + username);
        System.out.println("FullName: " + fullName);
        System.out.println("Email: " + email);
        System.out.println("Address: " + address);
        System.out.println("Phone: " + phone);
        System.out.println("Date of Birth: " + dob);
        System.out.println("Gender: " + gender);

        // N?u b?t k? tr??ng nào là null, tr? v? thông báo l?i và k?t thúc x? lý
        if (username == null || email == null || phone == null || address == null) {
            out.print("{\"success\": false, \"message\": \"Required fields are missing.\"}");
            out.flush();
            return;
        }

        // L?y thông tin user t? session và c?p nh?t
        Account user = (Account) session.getAttribute("account");
        if (user != null) {
            user.setUsername(username);
            user.setEmail(email);
            user.setPhone(phone);
            user.setAddress(address);

            boolean accountUpdated = accountDAO.updateAccount(user);
            if (accountUpdated) {
                out.print("{\"success\": true}");
            } else {
                out.print("{\"success\": false, \"message\": \"Update failed.\"}");
            }
        } else {
            out.print("{\"success\": false, \"message\": \"User not found in session.\"}");
        }
        out.flush();
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
