package controller;

import dao.AccountDAO;
import model.Account;
import model.GoogleAccount;
import model.Role;
import controller.GoogleLogin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException, SQLException {
    response.setContentType("text/html;charset=UTF-8");

    String code = request.getParameter("code");
    String error = request.getParameter("error");

    if (error != null) {
        request.setAttribute("errorMessage", "Authorization failed or cancelled.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }

    if (code != null) {
        GoogleLogin googleLogin = new GoogleLogin();
        try {
            String accessToken = googleLogin.getToken(code);
            GoogleAccount googleAccount = googleLogin.getUserInfo(accessToken);
            AccountDAO accountDAO = new AccountDAO();

            Account account = accountDAO.getAccountByEmail(googleAccount.getEmail());
            if (account == null) {
                // T?i kho?n kh?ng t?n t?i, t?o m?i
                account = new Account();
                account.setUsername(googleAccount.getEmail().split("@")[0]);
                account.setEmail(googleAccount.getEmail());

                // T?o m?t kh?u ng?u nhi?n cho t?i kho?n Google
                String randomPassword = accountDAO.generateRandomPassword();
                account.setPassword(randomPassword);

                account.setRoleId(3);
                account.setStatus("active");
                accountDAO.addAccount(account);

                // L?y l?i th?ng tin account m?i th?m t? DB ?? c? ID ch?nh x?c
                account = (Account) accountDAO.getAccountByEmail(googleAccount.getEmail());
            }

            HttpSession session = request.getSession();
            session.setAttribute("account", account);

            // L?y vai tr? c?a t?i kho?n t? c? s? d? li?u v? l?u v?o session
            Role role = accountDAO.getRoleByAccountId(account.getAccountId());
            
            if (role == null) {
                // X? l? tr??ng h?p role kh?ng t?m th?y, tr?nh NullPointerException
                request.setAttribute("errorMessage", "Role not found for the account.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            session.setAttribute("role", role);

            // ?i?u h??ng d?a tr?n vai tr?
            if (role.getRoleName().equals("Admin")) {
                response.sendRedirect("admin/dashboard.jsp");
            } else if (role.getRoleName().equals("Seller")) {
                response.sendRedirect("seller/dashboard.jsp");
            } else if (role.getRoleName().equals("Customer")) {
                response.sendRedirect("./home.jsp");
            } else if (role.getRoleName().equals("Shipper")) {
                response.sendRedirect("shipper/dashboard.jsp");
            }
        } catch (IOException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to retrieve user information from Google.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    } else {
        response.sendRedirect("login.jsp");
    }
}


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException e) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        AccountDAO dao = new AccountDAO();
        Account account = dao.login(email, password);

        if (account != null) {
            HttpSession session = request.getSession();
            session.setAttribute("account", account);

            Role role = dao.getRoleByAccountId(account.getAccountId());
            session.setAttribute("role", role);

            // ?i?u h??ng d?a tr?n vai tr?
            if (role.getRoleName().equals("Admin")) {
                response.sendRedirect("admin/dashboard.jsp");
            } else if (role.getRoleName().equals("Seller")) {
                response.sendRedirect("seller/dashboard.jsp");
            } else if (role.getRoleName().equals("Customer")) {
                response.sendRedirect("./home.jsp");
            } else if (role.getRoleName().equals("Shipper")) {
                response.sendRedirect("shipper/dashboard.jsp");
            }
        } else {
            request.setAttribute("errorMessage", "Invalid email or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
