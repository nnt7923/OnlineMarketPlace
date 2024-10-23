package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import dao.AccountDAO;
import model.Account;
import validation.PasswordValidator;

@WebServlet(name = "ChangePasswordController", urlPatterns = {"/change-password"})
public class ChangePasswordController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get user account from session
        HttpSession session = request.getSession(false);
        Account account = (Account) session.getAttribute("account");

        if (account == null) {
            // If user is not logged in, redirect to login page
            response.sendRedirect("login.jsp");
            return;
        }

        // Retrieve form data
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Check if current password matches the user's actual password
        if (!account.getPassword().equals(currentPassword)) {
            request.setAttribute("errorMessage", "Current password is incorrect!");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            return;
        }

        // Check if new password matches the confirm password
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "New password and confirm password do not match!");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            return;
        }

        // Validate the new password before updating
        if (!PasswordValidator.isValidPassword(newPassword)) {
            request.setAttribute("errorMessage", "It must be at least 8 characters long, and contain at least 1 uppercase letter, 1 lowercase letter, and 1 number.");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            return;
        }

        // If all checks pass, update the password in the database
        AccountDAO dao = new AccountDAO();
        int result = dao.updatePassword(newPassword, account.getEmail());

        if (result > 0) {
            // Update password in session if successful
            account.setPassword(newPassword);
            session.setAttribute("account", account);
            request.setAttribute("successMessage", "Password changed successfully!");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Error updating password. Please try again.");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
        }
    }
}
