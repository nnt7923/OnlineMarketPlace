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
        // Xóa thông tin account trong session
        request.getSession().setAttribute("account", null);

        // Tạo cookies trống cho email và password
        Cookie cEmail = new Cookie("email", "");
        Cookie cPass = new Cookie("password", "");

        // Đặt thời gian sống của cookies là -1 (xóa ngay lập tức)
        cEmail.setMaxAge(0);  // Sửa thành 0 để xóa cookie
        cPass.setMaxAge(0);   // Sửa thành 0 để xóa cookie

        // Thêm cookies vào response
        response.addCookie(cEmail);
        response.addCookie(cPass);

        // Chuyển hướng về trang /home
        String contextPath = request.getContextPath(); // Lấy context path hiện tại
        response.sendRedirect(contextPath + "/home");
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
