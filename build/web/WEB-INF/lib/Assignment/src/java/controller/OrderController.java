package controller;

import entity.Orders;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOOrders;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Vector;

@WebServlet(name = "OrderController", urlPatterns = {"/OrderControllerURL"})
public class OrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOOrders dao = new DAOOrders();

        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        switch (service) {
            case "addOrder":
                // Get data from request
                int accountId = Integer.parseInt(request.getParameter("accountId"));
                double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
                String note = request.getParameter("note");
                java.util.Date createDate = new java.util.Date(); // Assuming current date, adjust as needed
                int shippingId = Integer.parseInt(request.getParameter("shippingId"));
                
                Orders order = new Orders(accountId, totalPrice, note, createDate, shippingId);
                dao.addOrder(order);
                
                response.sendRedirect("OrderControllerURL?service=listAll");
                break;
                
            case "listAll":
                Vector<Orders> ordersList = dao.getAllOrders();
                request.setAttribute("data", ordersList);
                RequestDispatcher dispatcher = request.getRequestDispatcher("ManageOrders.jsp");
                dispatcher.forward(request, response);
                break;
                
            case "updateOrder":
                String submit = request.getParameter("submit");
                if (submit == null) {
                    try {
                        int id = Integer.parseInt(request.getParameter("id"));
                        Orders orderToUpdate = dao.getOrderById(id);
                        request.setAttribute("order", orderToUpdate);
                        RequestDispatcher updateDispatcher = request.getRequestDispatcher("ManageOrders.jsp?service=updateOrderForm");
                        updateDispatcher.forward(request, response);
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Order ID");
                    }
                } else {
                    try {
                        int id = Integer.parseInt(request.getParameter("id"));
                        accountId = Integer.parseInt(request.getParameter("accountId"));
                        totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
                        note = request.getParameter("note");
                        createDate = new java.util.Date(); // Update with correct date if needed
                        shippingId = Integer.parseInt(request.getParameter("shippingId"));
                        
                        Orders updatedOrder = new Orders(id, accountId, totalPrice, note, createDate, shippingId);
                        dao.updateOrder(updatedOrder);
                        
                        response.sendRedirect("OrderControllerURL?service=listAll");
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input format");
                    }
                }
                break;
                
            case "deleteOrder":
                try {
                    int orderId = Integer.parseInt(request.getParameter("id"));
                    dao.deleteOrder(orderId);
                    response.sendRedirect("OrderControllerURL?service=listAll");
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Order ID");
                }
                break;
                
            case "addOrderForm":
                RequestDispatcher addDispatcher = request.getRequestDispatcher("ManageOrders.jsp?service=addOrderForm");
                addDispatcher.forward(request, response);
                break;
                
            case "updateOrderForm":
                try {
                    int orderIdToUpdate = Integer.parseInt(request.getParameter("id"));
                    Orders orderToUpdateForm = dao.getOrderById(orderIdToUpdate);
                    request.setAttribute("order", orderToUpdateForm);
                    RequestDispatcher updateFormDispatcher = request.getRequestDispatcher("ManageOrders.jsp?service=updateOrderForm");
                    updateFormDispatcher.forward(request, response);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Order ID");
                }
                break;
                
            case "listOrdersByAccount":
                try {
                    int accountIdParam = Integer.parseInt(request.getParameter("accountId"));
                    Vector<Orders> ordersByAccount = dao.getOrdersByAccountId(accountIdParam);
                    request.setAttribute("data", ordersByAccount);
                    RequestDispatcher listByAccountDispatcher = request.getRequestDispatcher("ManageOrders.jsp?service=listOrdersByAccount");
                    listByAccountDispatcher.forward(request, response);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Account ID");
                }
                break;
                
            default:
                response.sendRedirect("OrderControllerURL?service=listAll");
                break;
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
        return "Order Controller Servlet";
    }
}
