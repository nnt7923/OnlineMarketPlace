///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package controller;
//
//import dao.AccountDAO;
//import model.Account;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//
//@WebServlet(name = "LoginController", urlPatterns = {"/login"})
//public class LoginController extends HttpServlet {
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//
//        AccountDAO dao = new AccountDAO();
//        Account account = dao.login(username, password);
//
//        if (account != null) {
//            HttpSession session = request.getSession();
//            session.setAttribute("account", account);
//            response.sendRedirect("index.html");  // Chuyển hướng khi đăng nhập thành công
//        } else {
//            request.setAttribute("errorMessage", "Invalid username or password");
//            request.getRequestDispatcher("login.jsp").forward(request, response);  // Trả về trang login nếu thất bại
//        }
//    }
//}
