package controller;

import dao.CartDAO;
import dao.OrderDAO;
import dao.ShippingDAO;
import dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Cart;
import model.CartDetail;
import model.Customer;
import model.Order;
import model.OrderDetail;
import model.Shipping;

@WebServlet("/order")
public class OrderController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("account");

        // L?y customer t? account_id
        CustomerDAO customerDAO = new CustomerDAO();
        Customer customer = customerDAO.getCustomerByAccountId(user.getAccountId());

        // L?y thông tin t? form
        String recipientName = request.getParameter("recipientName");
        String deliveryAddress = request.getParameter("deliveryAddress");
        String deliveryPhone = request.getParameter("deliveryPhone");
        String paymentMethod = request.getParameter("paymentMethod");
        String note = request.getParameter("note");

        Shipping shipping = new Shipping();
        shipping.setName(recipientName);
        shipping.setPhone(deliveryPhone);
        shipping.setAddress(deliveryAddress);
        shipping.setStatus("Awaiting Confirmation");

        Order order = new Order();
        order.setCustomer(customer);
        order.setShipping(shipping);
        order.setPayment(paymentMethod);
        order.setOrdertime(new Date());
        order.setNote(note);

        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null) {
            List<OrderDetail> orderDetails = new ArrayList<>();
            for (CartDetail cartDetail : cart.getItems()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setPdId(cartDetail.getPd().getId());
                orderDetail.setProductName(cartDetail.getPd().getName());
                orderDetail.setProductPrice(cartDetail.getPd().getPriceDiscount() > 0 ? cartDetail.getPd().getPriceDiscount() : cartDetail.getPd().getProduct().getPrice());
                orderDetail.setQuantity(cartDetail.getQuantity());
                orderDetails.add(orderDetail);
            }
            order.setOrderDetail(orderDetails);
        }

        OrderDAO orderDB = new OrderDAO();
        CartDAO cartDB = new CartDAO();

        float totalAmount = Float.parseFloat(request.getParameter("totalAmount"));
        order.setTotalPrice(totalAmount);
        int orderId = orderDB.insertOrder(order);

        if (orderId != -1) {

            // X? lý thanh toán COD
            if ("COD".equals(paymentMethod)) {
                // Xóa gi? hàng sau khi ??t hàng thành công
                cartDB.clearCart(user.getAccountId());
                session.removeAttribute("cart");

                // ??t các thu?c tính và chuy?n h??ng ??n trang success.jsp
                request.setAttribute("orderId", orderId);
                request.setAttribute("totalAmount", totalAmount);
                request.setAttribute("paymentMethod", paymentMethod);
                request.setAttribute("deliveryAddress", deliveryAddress);
                request.getRequestDispatcher("success.jsp").forward(request, response);
            } else if ("VNPAY".equals(paymentMethod)) {
                cartDB.clearCart(user.getAccountId());
                session.removeAttribute("cart");

                // Chuy?n h??ng ??n servlet VNPay ?? x? lý thanh toán tr?c tuy?n
                request.setAttribute("orderId", orderId);
                request.setAttribute("totalAmount", totalAmount);
                request.setAttribute("paymentMethod", paymentMethod);
                request.setAttribute("deliveryAddress", deliveryAddress);
                request.getRequestDispatcher("VNPay").forward(request, response);
            }
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to process order");
        }
    }

    @Override
    public String getServletInfo() {
        return "Order Controller";
    }
}
