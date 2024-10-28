package controller;

import dao.AccountDAO;
import model.Account;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import validation.PasswordValidator;

@WebServlet(name = "AccountController", urlPatterns = {"/account"})

public class AccountController extends HttpServlet {

    private AccountDAO accountDAO;
    private static final Logger logger = Logger.getLogger(AccountController.class.getName());

    @Override
    public void init() {
        accountDAO = new AccountDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        try {
            switch (service) {
                case "listAll":
                    listAllAccounts(request, response);
                    break;
                case "addAccount":
                    addAccount(request, response);
                    break;
                case "updateAccount":
                    updateAccount(request, response);
                    break;
                case "deleteAccount":
                    deleteAccount(request, response);
                    break;
                case "searchAccount":
                    searchAccount(request, response);
                    break;
                case "addAccountForm":
                    showAddAccountForm(request, response);
                    break;
                case "updateAccountForm":
                    showUpdateAccountForm(request, response);
                    break;
                case "dashboard":
                    showDashboard(request, response);
                default:
                    response.sendRedirect("account?service=listAll");
                    break;
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error in processRequest: " + e.getMessage(), e);
            response.sendRedirect("errorPage.jsp"); // �?i�?u hướng tới trang báo lỗi
        }
    }

    private void listAllAccounts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Account> accounts = accountDAO.listAll();
        request.setAttribute("accounts", accounts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/manageAccount.jsp");
        dispatcher.forward(request, response);
    }

    private void addAccount(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            int roleID = Integer.parseInt(request.getParameter("roleID"));
            String status = request.getParameter("status");


            HttpSession session = request.getSession();

            if (!PasswordValidator.isValidPassword(password)) {
                session.setAttribute("errorMessage", "Mật khẩu không hợp lệ. Mật khẩu phải có ít nhất 8 ký tự, bao gồm ít nhất 1 chữ hoa, 1 chữ thư�?ng và 1 số");
                response.sendRedirect("addAccount.jsp");
                return;
            } 

            Account newAccount = new Account(0, username, password, email, phone, address, roleID, status, null);
            
            accountDAO.add(newAccount);

            response.sendRedirect("account?service=listAll");
            session.setAttribute("message", "Account added successful");
        } catch (NumberFormatException e) {
            logger.log(Level.SEVERE, "Error parsing roleID: " + e.getMessage(), e);
            response.sendRedirect("errorPage.jsp");
        }
    }

    private void updateAccount(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            int accountId = Integer.parseInt(request.getParameter("accountId"));
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            int roleId = Integer.parseInt(request.getParameter("roleId"));
            String status = request.getParameter("status");

            HttpSession session = request.getSession();
            
            Account updatedAccount = new Account(accountId, username, password, email, phone, address, roleId, status, null);
            accountDAO.update(updatedAccount);
            response.sendRedirect("account?service=listAll");
            session.setAttribute("successMessage","Updated succesfully");
        } catch (NumberFormatException e) {
            logger.log(Level.SEVERE, "Error parsing roleId or accountId: " + e.getMessage(), e);
            response.sendRedirect("errorPage.jsp");
        }
    }

    private void deleteAccount(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            int accountIdToDelete = Integer.parseInt(request.getParameter("accountId"));
            accountDAO.delete(accountIdToDelete);
            response.sendRedirect("account?service=listAll");
        } catch (NumberFormatException e) {
            logger.log(Level.SEVERE, "Error parsing accountId: " + e.getMessage(), e);
            response.sendRedirect("errorPage.jsp");
        }
    }

    private void searchAccount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<Account> searchedAccounts = accountDAO.search(keyword);
        request.setAttribute("accounts", searchedAccounts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/manageAccount.jsp");
        dispatcher.forward(request, response);
    }
    
    private void showDashboard(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("admin/dashboard.jsp").forward(request, response);
    }

    private void showAddAccountForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/addAccount.jsp");
        dispatcher.forward(request, response);
    }

    private void showUpdateAccountForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int accountIdToUpdate = Integer.parseInt(request.getParameter("accountId"));
            Account accountToUpdate = accountDAO.getAccountById(accountIdToUpdate);
            request.setAttribute("account", accountToUpdate);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/editAccount.jsp");
            dispatcher.forward(request, response);
        } catch (NumberFormatException e) {
            logger.log(Level.SEVERE, "Error parsing accountId: " + e.getMessage(), e);
            response.sendRedirect("errorPage.jsp");
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
        return "AccountController";
    }
}
