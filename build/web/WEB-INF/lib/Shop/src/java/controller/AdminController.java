package controller;

import entity.Admin;
import model.DAOAdmin;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AdminController", urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        DAOAdmin dao = new DAOAdmin();

        switch (action) {
            case "list":
                listAdmins(request, response, dao);
                break;
            case "add":
                addAdmin(request, response, dao);
                break;
            case "update":
                updateAdmin(request, response, dao);
                break;
            case "delete":
                deleteAdmin(request, response, dao);
                break;
            case "authenticate":
                authenticateAdmin(request, response, dao);
                break;
            default:
                listAdmins(request, response, dao);
                break;
        }
    }

    private void listAdmins(HttpServletRequest request, HttpServletResponse response, DAOAdmin dao)
            throws ServletException, IOException {
        // Hiện tại, phương thức này chỉ là placeholder, vì không có phương thức liệt kê tất cả admin trong DAOAdmin.
        // Bạn có thể cần thêm một phương thức để liệt kê tất cả admin nếu cần.
        RequestDispatcher dispatcher = request.getRequestDispatcher("AdminList.jsp");
        dispatcher.forward(request, response);
    }

    private void addAdmin(HttpServletRequest request, HttpServletResponse response, DAOAdmin dao)
            throws ServletException, IOException {
        try {
            String admin = request.getParameter("admin");
            String password = request.getParameter("password");

            Admin adminObj = new Admin(admin, password);
            int result = dao.insertAdmin(adminObj);
            request.setAttribute("message", result > 0 ? "Admin added successfully." : "Failed to add admin.");
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while adding the admin: " + e.getMessage());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("AdminList.jsp");
        dispatcher.forward(request, response);
    }

    private void updateAdmin(HttpServletRequest request, HttpServletResponse response, DAOAdmin dao)
            throws ServletException, IOException {
        try {
            String admin = request.getParameter("admin");
            String password = request.getParameter("password");

            Admin adminObj = new Admin(admin, password);
            int result = dao.updateAdmin(adminObj);
            request.setAttribute("message", result > 0 ? "Admin updated successfully." : "Failed to update admin.");
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while updating the admin: " + e.getMessage());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("AdminList.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteAdmin(HttpServletRequest request, HttpServletResponse response, DAOAdmin dao)
            throws ServletException, IOException {
        try {
            String admin = request.getParameter("admin");
            int result = dao.deleteAdmin(admin);
            request.setAttribute("message", result > 0 ? "Admin deleted successfully." : "Failed to delete admin.");
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while deleting the admin: " + e.getMessage());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("AdminList.jsp");
        dispatcher.forward(request, response);
    }

    private void authenticateAdmin(HttpServletRequest request, HttpServletResponse response, DAOAdmin dao)
            throws ServletException, IOException {
        try {
            String admin = request.getParameter("admin");
            String password = request.getParameter("password");
            boolean isAuthenticated = dao.authenticateAdmin(admin, password);

            if (isAuthenticated) {
                request.getSession().setAttribute("admin", admin);
                response.sendRedirect("AdminDashboard.jsp");
            } else {
                request.setAttribute("error", "Invalid admin credentials.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("AdminLogin.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while authenticating: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("AdminLogin.jsp");
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
        return "Admin Controller";
    }
}
