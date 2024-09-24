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

@WebServlet(name = "LoginController", urlPatterns = {"/Login"})
public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        AccountDAO dao = new AccountDAO();
        Account acc = dao.login(email, password);

        if (acc == null) {
            request.setAttribute("mess", "Invalid login credentials!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("account", acc);
            session.setMaxInactiveInterval(1200); // Set session timeout

            // Role-based redirection
            int roleID = acc.getRoleId();
            switch (roleID) {
                case 1:
                    response.sendRedirect("admin/dashboard.jsp");
                    break;
                case 2:
                    response.sendRedirect("seller/dashboard.jsp");
                    break;
                case 3:
                    response.sendRedirect("customer/homeCustomer.jsp");
                    break;
                case 4:
                    response.sendRedirect("shipper/dashboard.jsp");
                    break;
                default:
                    request.setAttribute("mess", "Invalid role!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    break;
            }
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
        return "Short description";
    }
}
