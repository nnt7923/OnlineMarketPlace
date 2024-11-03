package controller;

import dao.AccountDAO;
import model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet({
    "/seller/dashboard",
    "/seller/profile",
    "/seller/edit",
    "/seller/update",
    "/seller/logout"  // Corrected path to include "/seller/logout"
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
                editProfile(request, response);
                break;
            case "/seller/update":
                updateProfile(request, response);
                break;
            case "/seller/logout":  // Fixed typo in logout path
                logout(request, response);
                break;
            default:
                response.sendRedirect("./dashboard.jsp");
        }
    }

    private void showDashboard(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("./dashboard.jsp").forward(request, response);
    }

    private void showProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);  
        Account account = null;

        if (session != null) {  
            account = (Account) session.getAttribute("account");
        }

        if (account == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        } else {
            request.setAttribute("account", account);
            request.getRequestDispatcher("./profile.jsp").forward(request, response);
        }
    }

    private void editProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);  
        Account account = null;

        if (session != null) {  
            account = (Account) session.getAttribute("account");
        }

        if (account == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        } else {
            request.setAttribute("account", account);
            request.getRequestDispatcher("editProfile.jsp").forward(request, response); 
        }
    }

    private void updateProfile(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");

            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");

            if (account != null) {
                account.setUsername(username);
                account.setEmail(email);
                account.setPhone(phone);
                account.setAddress(address);

                accountDAO.update(account);
                response.sendRedirect("profile?service=showProfile");
            } else {
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error updating profile: " + e.getMessage(), e);
            response.sendRedirect("profile.jsp");
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession(false);  // Get existing session without creating a new one
        if (session != null) {
            session.invalidate();  // Invalidate the session to log the user out
        }
        response.sendRedirect(request.getContextPath() + "/logout");  // Redirect to the login page
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        PrintWriter out = response.getWriter();
        out.println(path);
        switch (path) {
            case "/seller/update":
                updateProfile(request, response);
                break;
            default:
                response.sendRedirect("./dashboard.jsp");
        }
    }
}
