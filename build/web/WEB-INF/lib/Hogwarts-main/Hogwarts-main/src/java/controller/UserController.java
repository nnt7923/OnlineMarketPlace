package controller;

import entity.User;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import model.DAOUser;

@WebServlet(name = "UserController", urlPatterns = {"/UserControllerURL"})
public class UserController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOUser dao = new DAOUser();
        HttpSession session = request.getSession(true);
        
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        if (service.equals("addUser")) {
            // Get data from request
            String UserID = request.getParameter("UserID");
            String FullName = request.getParameter("FullName");
            String Gender = request.getParameter("Gender");
            String Address = request.getParameter("Address");
            String Phone = request.getParameter("Phone");
            String Email = request.getParameter("Email");
            String Role = request.getParameter("Role");
            String Password = request.getParameter("Password");
            // Create User object
            User user = new User(UserID, FullName, Gender, Address, Phone, Email, Role, Password);
            // Insert User
            dao.insertUser(user);
            // Redirect to listAll
            response.sendRedirect("UserControllerURL?service=listAll");
        }

        if (service.equals("listAll")) {
            // Get all users
            Vector<User> vector = dao.getAllUsers("SELECT * FROM [User]");
            // Set data to request
            request.setAttribute("data", vector);
            // Forward to JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("UserList.jsp");
            dispatcher.forward(request, response);
        }

        if (service.equals("updateUser")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                // Show update form
                String userID = request.getParameter("UserID");
                User user = dao.getUserByID(userID);
                request.setAttribute("user", user);
                RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateUser.jsp");
                dispatcher.forward(request, response);
            } else {
                // Update user data
                String UserID = request.getParameter("UserID");
                String FullName = request.getParameter("FullName");
                String Gender = request.getParameter("Gender");
                String Address = request.getParameter("Address");
                String Phone = request.getParameter("Phone");
                String Email = request.getParameter("Email");
                String Role = request.getParameter("Role");
                String Password = request.getParameter("Password");
                User user = new User(UserID, FullName, Gender, Address, Phone, Email, Role, Password);
                dao.updateUser(user);
                response.sendRedirect("UserControllerURL?service=listAll");
            }
        }

        if (service.equals("deleteUser")) {
            String userID = request.getParameter("UserID");
            dao.deleteUser(userID);
            response.sendRedirect("UserControllerURL?service=listAll");
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
