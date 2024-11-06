/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.SellerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.OrderDetail;
import model.Seller;

/**
 *
 * @author Admin
 */
public class OrderPurchaseController extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("account");

        if (user != null) {
            SellerDAO sellerDAO = new SellerDAO();
            
            try {
                String orderIdParam = request.getParameter("orderId");
                String statusIdParam = request.getParameter("statusId");

                if (orderIdParam != null && statusIdParam != null) {
                    int orderId = Integer.parseInt(orderIdParam);
                    int statusId = Integer.parseInt(statusIdParam);

                    boolean isUpdated = sellerDAO.updateOrderStatus(orderId, statusId);

                    // Ki?m tra k?t qu? c?p nh?t
                    if (isUpdated) {
                        System.out.println("Order status updated successfully.");
                        request.setAttribute("updateMessage", "Order status updated successfully.");
                    } else {
                        System.out.println("Failed to update order status.");
                        request.setAttribute("updateMessage", "Failed to update order status.");
                    }
                }

                int orderId = Integer.parseInt(request.getParameter("orderId"));

                List<OrderDetail> orderDetails = sellerDAO.getOrderDetailById(orderId);
                List<OrderDetail> productDetails = sellerDAO.getProductDetailsByOrderId(orderId);

                // Calculate total price
                double totalPrice = 0.0;
                for (OrderDetail detail : orderDetails) {
                    totalPrice += detail.getProductPrice() * detail.getQuantity();
                }

                // Calculate total money (assuming free shipping means no additional cost)
                double totalMoney = totalPrice;

                String orderStatus = orderDetails.get(0).getOrder().getStatus().getName();
                // ??t danh sách vào request ?? s? d?ng trong JSP
                request.setAttribute("orderDetails", orderDetails);
                request.setAttribute("productDetails", productDetails);
                request.setAttribute("orderStatus", orderStatus);
                request.setAttribute("totalMoney", totalMoney);
                request.getRequestDispatcher("orderpurchase.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Error fetching order data: " + e.getMessage());
            }
        } else {
            // N?u ng??i dùng ch?a ??ng nh?p, chuy?n h??ng ??n trang ??ng nh?p
            response.sendRedirect("../login.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(OrderPurchaseController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(OrderPurchaseController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
