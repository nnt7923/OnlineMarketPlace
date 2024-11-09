package controller;

import dao.AccountDAO;
import model.Account;
import model.GoogleAccount;
import model.Role;
import controller.GoogleLogin;
import dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import model.Customer;

@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        String code = request.getParameter("code");
        String error = request.getParameter("error");
        String contextPath = request.getContextPath();

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
                    // Create a new account if it does not exist
                    account = new Account();
                    account.setUsername(googleAccount.getEmail().split("@")[0]);
                    account.setEmail(googleAccount.getEmail());

                    // Generate a random password for the Google account
                    String randomPassword = accountDAO.generateRandomPassword();
                    account.setPassword(randomPassword);

                    account.setRoleId(3); // Assuming 3 is the role for Customer
                    account.setStatus("active");
                    accountDAO.addAccount(account);

                    // Retrieve the newly added account to get accurate account ID
                    account = accountDAO.getAccountByEmail(googleAccount.getEmail());

                    // Now add the customer entry using the account ID
                    CustomerDAO customerDAO = new CustomerDAO();
                    Customer customer = new Customer();
                    customer.setAccountId(account.getAccountId());
                    customer.setCustomerName(googleAccount.getName());  
                    customerDAO.addCustomer(customer); // Add customer entry in the database
                } else if (account.getStatus().equals("inactive")) {
                    request.setAttribute("errorMessage", "Account has been locked.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    return;
                }

                HttpSession session = request.getSession();
                session.setAttribute("account", account);

                // Get the account role and store it in the session
                Role role = accountDAO.getRoleByAccountId(account.getAccountId());
                if (role == null) {
                    request.setAttribute("errorMessage", "Role not found for the account.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    return;
                }

                session.setAttribute("role", role);

                // Redirect based on role
                if (role.getRole_name().equals("Admin")) {
                    response.sendRedirect("account?service=dashboard");
                } else if (role.getRole_name().equals("Seller")) {
                    response.sendRedirect("seller/dashboard");
                } else if (role.getRole_name().equals("Customer")) {
                    response.sendRedirect(contextPath + "/home");
                } else if (role.getRole_name().equals("Shipper")) {
                    response.sendRedirect("shipper/dashboard");
                }
            } catch (IOException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Failed to retrieve user information from Google.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
        String contextPath = request.getContextPath();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        AccountDAO dao = new AccountDAO();
        Account account = dao.login(email, password);

        if (account != null) {
            if (account.getStatus().equals("inactive")) {
                request.setAttribute("errorMessage", "Account has been locked.");
                request.setAttribute("emailLogin", email);
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            HttpSession session = request.getSession();
            session.setAttribute("account_id", account.getAccountId());
            session.setAttribute("account", account);

            Role role = dao.getRoleByAccountId(account.getAccountId());
            session.setAttribute("role", role);

            // Redirect based on role
            if (role.getRole_name().equals("Admin")) {
                response.sendRedirect("account?service=dashboard");
            } else if (role.getRole_name().equals("Seller")) {
                session.setAttribute("seller_id", account.getAccountId());
                response.sendRedirect("seller/dashboard");
            } else if (role.getRole_name().equals("Customer")) {
                response.sendRedirect(contextPath + "/home");
            } else if (role.getRole_name().equals("Shipper")) {
                response.sendRedirect("shipper/dashboard");
            }
        } else {
            request.setAttribute("errorMessage", "Invalid email or password.");
            request.setAttribute("emailLogin", email);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
