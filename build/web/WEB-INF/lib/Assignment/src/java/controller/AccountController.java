package controller;

import entity.Account;
import model.DAOAccount;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Vector;

@WebServlet(name = "AccountController", urlPatterns = {"/AccountControllerURL"})
public class AccountController extends HttpServlet {

    private DAOAccount daoAccount = new DAOAccount();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);

        String service = request.getParameter("service");
        if (service == null) {
            service = "login";
        }

        switch (service) {
            case "login":
                handleLogin(request, response);
                break;

            case "register":
                handleRegister(request, response);
                break;

            case "logout":
                handleLogout(request, response);
                break;

            case "forgotpassword":
                handleForgotPassword(request, response);
                break;

            default:
                response.sendRedirect("index.jsp");
                break;
        }
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Account account = daoAccount.getAllAccounts().stream()
                .filter(acc -> acc.getUser().equals(username) && acc.getPass().equals(password))
                .findFirst()
                .orElse(null);

        if (account != null && account.isActive()) {
            HttpSession session = request.getSession();
            session.setAttribute("account", account);
            response.sendRedirect("dashboard.jsp");
        } else {
            request.setAttribute("loginError", "Invalid username or password.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void handleRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ form đăng ký
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Thiết lập vai trò cho tài khoản mới: luôn là Seller (isSell = 1) và không phải Admin (isAdmin = 0)
        int isSell = 1; // Tất cả tài khoản mới đều là Seller
        int isAdmin = 0; // Tất cả tài khoản mới đều không phải Admin
        boolean active = true; // Mặc định tài khoản mới là hoạt động

        // Kiểm tra tính hợp lệ của dữ liệu đầu vào
        if (username != null && !username.trim().isEmpty() && password != null && !password.trim().isEmpty()) {
            // Kiểm tra xem tên người dùng đã tồn tại chưa
            Account existingAccount = daoAccount.getAccountByUsername(username);

            if (existingAccount == null) {
                // Nếu không tồn tại, tạo tài khoản mới
                Account newAccount = new Account(username, password, isSell, isAdmin, active);
                daoAccount.addAccount(newAccount);
                // Chuyển hướng người dùng đến trang đăng nhập
                response.sendRedirect("login.jsp");
            } else {
                // Nếu tên người dùng đã tồn tại, hiển thị lỗi
                request.setAttribute("registerError", "Username already exists.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            // Nếu tên người dùng hoặc mật khẩu không hợp lệ, hiển thị lỗi
            request.setAttribute("registerError", "Username and password are required.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void handleLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("login.jsp");
    }

    private void handleForgotPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");

        // Assuming email is the username for simplicity
        Account account = daoAccount.getAllAccounts().stream()
                .filter(acc -> acc.getUser().equals(email))
                .findFirst()
                .orElse(null);

        if (account != null) {
            account.setPass(newPassword);
            daoAccount.updateAccount(account);
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("forgotPasswordError", "Email not found.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("forgotpassword.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "AccountController handles user login, registration, logout, and password recovery.";
    }
}
