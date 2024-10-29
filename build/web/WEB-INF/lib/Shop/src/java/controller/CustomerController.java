package controller;

import entity.Customer;
import model.DAOCustomer;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Vector;

@WebServlet(name = "CustomerController", urlPatterns = {"/CustomerController"})
public class CustomerController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        DAOCustomer dao = new DAOCustomer();

        switch (action) {
            case "list":
                listCustomers(request, response, dao);
                break;
            case "add":
                addCustomer(request, response, dao);
                break;
            case "update":
                updateCustomer(request, response, dao);
                break;
            case "delete":
                deleteCustomer(request, response, dao);
                break;
            case "detail":
                detailCustomer(request, response, dao);
                break;
            default:
                listCustomers(request, response, dao);
                break;
        }
    }

    private void listCustomers(HttpServletRequest request, HttpServletResponse response, DAOCustomer dao)
            throws ServletException, IOException {
        Vector<Customer> customerList = dao.getAllCustomers("SELECT * FROM Customer");
        request.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("CustomerList.jsp");
        dispatcher.forward(request, response);
    }

    private void addCustomer(HttpServletRequest request, HttpServletResponse response, DAOCustomer dao)
            throws ServletException, IOException {
        try {
            String cname = request.getParameter("cname");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            boolean status = Boolean.parseBoolean(request.getParameter("status"));
            boolean isAdmin = Boolean.parseBoolean(request.getParameter("isAdmin"));

            // Create new Customer object
            Customer customer = new Customer(0,cname, username, password, address, phone, status, isAdmin);

            // Add customer to the database
            int result = dao.insertCustomer(customer);
            request.setAttribute("message", result > 0 ? "Customer added successfully." : "Failed to add customer.");
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while adding the customer: " + e.getMessage());
        }

        listCustomers(request, response, dao);
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response, DAOCustomer dao)
            throws ServletException, IOException {
        try {
            int cid = Integer.parseInt(request.getParameter("cid"));
            String cname = request.getParameter("cname");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            boolean status = Boolean.parseBoolean(request.getParameter("status"));
            boolean isAdmin = Boolean.parseBoolean(request.getParameter("isAdmin"));

            Customer customer = new Customer(cid, cname, username, password, address, phone, status, isAdmin);
            int result = dao.updateCustomer(customer);
            request.setAttribute("message", result > 0 ? "Customer updated successfully." : "Failed to update customer.");
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while updating the customer: " + e.getMessage());
        }

        listCustomers(request, response, dao);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response, DAOCustomer dao)
            throws ServletException, IOException {
        try {
            int cid = Integer.parseInt(request.getParameter("cid"));
            int result = dao.deleteCustomer(cid);
            request.setAttribute("message", result > 0 ? "Customer deleted successfully." : "Failed to delete customer.");
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while deleting the customer: " + e.getMessage());
        }

        listCustomers(request, response, dao);
    }

    private void detailCustomer(HttpServletRequest request, HttpServletResponse response, DAOCustomer dao)
            throws ServletException, IOException {
        try {
            int cid = Integer.parseInt(request.getParameter("cid"));
            Customer customer = dao.getCustomer(cid);
            request.setAttribute("customer", customer);
            RequestDispatcher dispatcher = request.getRequestDispatcher("CustomerDetail.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while fetching customer details: " + e.getMessage());
            listCustomers(request, response, dao);
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
        return "Customer Controller";
    }
}
