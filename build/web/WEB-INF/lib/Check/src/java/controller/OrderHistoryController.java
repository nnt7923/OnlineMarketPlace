package controller;

import dao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Customer;
import model.Order;
import model.OrderDetail;
import model.Shipping;
import model.Status;

public class OrderHistoryController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("account");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // L?y giá tr? status_id t? request
        String statusIdParam = request.getParameter("status_id");
        int statusId = -1; // M?c ??nh không l?c theo status_id
        if (statusIdParam != null && !statusIdParam.isEmpty()) {
            statusId = Integer.parseInt(statusIdParam);
        }

        // L?y danh sách tr?ng thái
        OrderDAO db = new OrderDAO();
        ArrayList<Status> statuses = db.getFirstSixStatuses();
        request.setAttribute("statuses", statuses);

        request.setAttribute("statusId", statusId);

        ArrayList<Order> orders;
        if (statusId > 0) {
            orders = db.getOrderHistoryByAccountIDAndStatus(user.getAccountId(), statusId);
        } else {
            orders = db.getOrderHistoryByAccountID(user.getAccountId());
        }

        for (Order order : orders) {
            List<OrderDetail> orderDetails = db.getOrderDetailsByOrderId(order.getOrderId());
            order.setOrderDetail(orderDetails);
        }

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("orderhistory.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        OrderDAO orderDB = new OrderDAO();
        boolean success = false;

        try {
            if ("update".equals(action)) {
                int orderId = Integer.parseInt(request.getParameter("orderId"));
                String recipientName = request.getParameter("recipientName");
                String deliveryAddress = request.getParameter("deliveryAddress");
                String deliveryPhone = request.getParameter("deliveryPhone");

                Order order = new Order();
                order.setOrderId(orderId);

                Shipping shipping = new Shipping();
                shipping.setName(recipientName);
                shipping.setAddress(deliveryAddress);
                shipping.setPhone(deliveryPhone);

                order.setShipping(shipping);

                success = orderDB.updateShippingByOrderId(orderId, shipping);

            } else if ("cancel".equals(action)) {
                int orderId = Integer.parseInt(request.getParameter("orderId"));

                success = orderDB.updateCancelledOrderStatus(orderId, 6);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (success) {
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
