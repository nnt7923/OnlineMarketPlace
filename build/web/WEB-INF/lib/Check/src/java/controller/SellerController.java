/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.microsoft.sqlserver.jdbc.SQLServerException;
import dao.AccountDAO;
import dao.SellerDAO;
import model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Seller;

@WebServlet({
    "/seller/dashboard",
    "/seller/profile",
    "/seller/edit",
    "/seller/update"
})

public class SellerController extends HttpServlet {

    private AccountDAO accountDAO;
    private static final Logger logger = Logger.getLogger(SellerController.class.getName());

    @Override
    public void init() throws ServletException {
        super.init();
        accountDAO = new AccountDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        switch (path) {
            case "/seller/dashboard":
                showDashboard(request, response);
                break;
            case "/seller/profile":
                showProfile(request, response);
                break;
            case "/seller/edit":
                editProfile(request, response); // Thay đổi hàm này để hiển thị form chỉnh sửa
                break;
            case "/seller/update":
                updateProfile(request, response); // Thay đổi hàm này để hiển thị form chỉnh sửa
                break;
        }
    }

    private void showDashboard(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("./dashboard.jsp").forward(request, response);
    }

    private void showProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);  // Không tạo session mới nếu chưa có
        Account account = null;

        if (session != null) {  // Kiểm tra session có tồn tại
            account = (Account) session.getAttribute("account");
        }

        if (account == null) {
            // Nếu không có thông tin account, chuyển hướng về trang đăng nhập
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        } else {
            request.setAttribute("account", account);
            request.getRequestDispatcher("./profile.jsp").forward(request, response);
        }
    }

    private void editProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);  // Không tạo session mới nếu chưa có
        Account account = null;

        if (session != null) {  // Kiểm tra session có tồn tại
            account = (Account) session.getAttribute("account");
        }

        if (account == null) {
            // Nếu không có thông tin account, chuyển hướng về trang đăng nhập
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        } else {
            request.setAttribute("account", account);
            request.getRequestDispatcher("editProfile.jsp").forward(request, response); 
        }
    }

    private void updateProfile(HttpServletRequest request, HttpServletResponse response)
            throws IOException {


        try {
            // Lấy thông tin từ request

            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            
            
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");

            if (account != null) {
                // Cập nhật thông tin tài khoản
                account.setUsername(username);
                account.setEmail(email);
                account.setPhone(phone);
                account.setAddress(address);

                // Gọi phương thức update từ SellerDAO để cập nhật vào cơ sở dữ liệu
                accountDAO.update(account);

                // Chuyển hướng về trang hiển thị thông tin tài khoản
                response.sendRedirect("profile?service=showProfile");
            } else {
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error updating profile: " + e.getMessage(), e);
            response.sendRedirect("profile.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
                PrintWriter out = response.getWriter();
           out.println(path);
        switch (path) {
            case "/seller/update":
                updateProfile(request, response); // Thay đổi hàm này để hiển thị form chỉnh sửa
                break;
            default:
                response.sendRedirect("./dashboard.jsp");
                break;
        }
 
    }
}
