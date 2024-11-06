package controller;

import dao.AccountDAO;
import dao.OrderDAO;
import dao.ProductDetailsDAO;
import dao.SellerDAO;
import dao.ShippingDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Cart;
import model.CartDetail;
import model.Order;
import model.OrderDetail;
import model.ProductDetails;
import model.Seller;
import model.Shipping;
import model.Status;

@WebServlet(name = "CheckOutController", urlPatterns = {"/checkout"})
public class CheckOutController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();

        // L?y thông tin gi? hàng t? session
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect("cart");
            return;
        }

        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            response.sendRedirect("login");
            return;
        }

        // L?y danh sách các s?n ph?m có gi?m giá t? c? s? d? li?u
        ProductDetailsDAO productDetailsDAO = new ProductDetailsDAO();
        List<ProductDetails> listDC = productDetailsDAO.getDiscountedProducts();

        // Tính t?ng ti?n sau khi áp d?ng giá gi?m
        double totalMoney = cart.getTotallMoney(listDC);
        session.setAttribute("listDC", listDC);
        session.setAttribute("cart", cart);
        session.setAttribute("totalMoney", totalMoney);
        session.setAttribute("listItemsInCart", cart.getItems());

        request.setAttribute("listDC", listDC);
        request.setAttribute("cart", cart);
        request.setAttribute("totalMoney", totalMoney);
        request.setAttribute("listItemsInCart", cart.getItems());

        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CheckOutController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processOrder(request, response);
    }

    public void processOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        if (account == null) {
            response.sendRedirect("login");
            return;
        }

        // L?y thông tin ??n hàng t? form
        String recipientName = request.getParameter("recipientName");
        String deliveryAddress = request.getParameter("deliveryAddress");
        String deliveryPhone = request.getParameter("deliveryPhone");
        String paymentMethod = request.getParameter("paymentMethod");
        double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));

        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect("cart");
            return;
        }

        // Kh?i t?o Order
        Order order = new Order();
        order.setCustomer(account.getCustomer());
        order.setTotalPrice(totalAmount);
        order.setPayment(paymentMethod);
        order.setOrdertime(new Date());

        Shipping shipping = new Shipping();
        shipping.setName(recipientName);
        shipping.setPhone(deliveryPhone);
        shipping.setAddress(deliveryAddress);
        shipping.setStatus("Pending");
        order.setShipping(shipping);

        // L?y Seller t? s?n ph?m trong gi? hàng
        SellerDAO sellerDAO = new SellerDAO();

        for (CartDetail cartDetail : cart.getItems()) {
            // L?y seller d?a trên product_id c?a s?n ph?m trong CartDetail
            Seller seller = sellerDAO.getSellerByProductId(cartDetail.getPd().getProduct().getProductId());
            if (seller != null) {
                order.setSeller(seller); // Gán Seller cho Order
                break; // D?ng l?i khi tìm th?y Seller
            }
        }
        // Gán các chi ti?t ??n hàng
        List<OrderDetail> orderDetails = new ArrayList<>();
        for (CartDetail cartDetail : cart.getItems()) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setPdId(cartDetail.getPd().getId());
            orderDetail.setProductName(cartDetail.getPd().getName());
            orderDetail.setProductPrice(cartDetail.getPd().getPriceDiscount());
            orderDetail.setQuantity(cartDetail.getQuantity());
            orderDetails.add(orderDetail);
        }
        order.setOrderDetail(orderDetails);

        // G?i ph??ng th?c insertOrder ?? l?u ??n hàng vào c? s? d? li?u
        OrderDAO orderDAO = new OrderDAO();
        int orderId = orderDAO.insertOrder(order);

        if (orderId != -1) {
            cart.clear();
            session.setAttribute("cart", cart);
            session.setAttribute("cartSize", 0);

            // Chuy?n h??ng ??n trang success.jsp
            request.setAttribute("orderId", orderId);
            request.setAttribute("totalAmount", totalAmount);
            request.setAttribute("deliveryAddress", deliveryAddress);
            request.setAttribute("paymentMethod", paymentMethod);
            request.getRequestDispatcher("success.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to process order");
        }
    }

    @Override
    public String getServletInfo() {
        return "Checkout Controller";
    }
}
