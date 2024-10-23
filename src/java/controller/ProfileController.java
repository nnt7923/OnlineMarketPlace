package controller;

import dao.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Account;

@WebServlet(name = "ProfileController", urlPatterns = {"/profile", "/editprofile", "/updateprofile"})
public class ProfileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Account account = null;
        if (session != null) {
            account = (Account) session.getAttribute("account");
        }
        if (account == null) {
            response.sendRedirect("login.jsp");
        } else {
            String action = request.getServletPath();
            if ("/editprofile".equals(action)) {
                request.setAttribute("account", account);
                request.getRequestDispatcher("editprofile.jsp").forward(request, response);
            } else {
                request.setAttribute("account", account);
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        if ("/updateprofile".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                Account account = (Account) session.getAttribute("account");
                if (account != null) {
                    // Cập nhật thông tin người dùng từ form
                    String username = request.getParameter("username");
                    String email = request.getParameter("email");
                    String phone = request.getParameter("phone");
                    String address = request.getParameter("address");

                    // Gọi DAO để cập nhật thông tin
                    AccountDAO dao = new AccountDAO();
                    dao.updateAccountInfo(account.getAccountId(), username, email, phone, address);

                    // Cập nhật lại session
                    account.setUsername(username);
                    account.setEmail(email);
                    account.setPhone(phone);
                    account.setAddress(address);
                    session.setAttribute("account", account);

                    // Chuyển hướng về trang profile với thông báo thành công
                    request.setAttribute("successMessage", "Profile updated successfully!");
                    request.getRequestDispatcher("profile.jsp").forward(request, response);
                }
            }
        }
    }
}