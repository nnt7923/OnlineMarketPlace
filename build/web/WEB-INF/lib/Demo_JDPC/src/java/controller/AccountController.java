package controller;

import entity.Account;
import entity.Student;
import model.DAOAccount;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.DAOStudent;

@WebServlet(name = "AccountController", urlPatterns = {"/AccountController"})
public class AccountController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        DAOAccount dao = new DAOAccount();
        HttpSession session = request.getSession();
        
        
        if (action == null) {
            action = "list";
        }
        
        

        if (action.equals("list")) {
            List<Account> list = dao.getAll();
            session.setAttribute("accountList", list);
            response.sendRedirect("listAccount.jsp");
        } else if (action.equals("add")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            int role = Integer.parseInt(request.getParameter("role"));
            Account newAccount = new Account(username, password, role);
            boolean added = dao.add(newAccount);
            if (added) {
                session.setAttribute("message", "Account added successfully.");
            } else {
                session.setAttribute("error", "Failed to add account.");
            }
            response.sendRedirect("AccountController?action=list");
        } else if (action.equals("edit")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            int role = Integer.parseInt(request.getParameter("role"));
            Account updatedAccount = new Account(username, password, role);
            boolean updated = dao.update(updatedAccount);
            if (updated) {
                session.setAttribute("message", "Account updated successfully.");
            } else {
                session.setAttribute("error", "Failed to update account.");
            }
            response.sendRedirect("AccountController?action=list");
        } else if (action.equals("delete")) {
            String username = request.getParameter("username");
            boolean deleted = dao.delete(username);
            if (deleted) {
                session.setAttribute("message", "Account deleted successfully.");
            } else {
                session.setAttribute("error", "Failed to delete account.");
            }
            response.sendRedirect("AccountController?action=list");
        } else if (action.equals("login")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            Account account = dao.getByUsername(username);
            if (account != null && account.getPassword().equals(password)) {
                session.setAttribute("loggedInUser", account);
                session.setAttribute("message", "Welcome, " + account.getUsername() + "!");
                if (account.getRole() == 1) {
                    response.sendRedirect("StudentController");
                } else if (account.getRole() == 2) {
                    List<Student> studentList = new DAOStudent().getAll();
                    session.setAttribute("studentList", studentList);
                    response.sendRedirect("viewlistStudent.jsp");
                } else {
                    response.sendRedirect("home.jsp");
                }
            } else {
                session.setAttribute("error", "Invalid username or password.");
                response.sendRedirect("login.jsp");
            }
        } else if (action.equals("logout")) {
            session.invalidate();
            response.sendRedirect("login.jsp");
        } else if (action.equals("register")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            int role = Integer.parseInt(request.getParameter("role"));
            Account newAccount = new Account(username, password, role);
            boolean added = dao.add(newAccount);
            if (added) {
                session.setAttribute("message", "Registration successful! Please log in.");
                response.sendRedirect("login.jsp");
            } else {
                session.setAttribute("error", "Failed to register account.");
                response.sendRedirect("register.jsp");
            }
        } else {
            response.sendRedirect("AccountController?action=list");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Account Controller Servlet";
    }
}
