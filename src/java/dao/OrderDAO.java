/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import model.Shipping;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.OrderDetail;
import model.Status;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;
import model.Seller;

/**
 *
 * @author Admin
 */
public class OrderDAO extends DBContext {

    Connection connection = new DBContext().conn;

    public int addOrder(Order order) throws SQLException {
        String sql = "INSERT INTO Orders (customer_id, shipping_id, totalPrice, note, create_date, status_id, payment_method, seller_id) VALUES (?, ?, ?, ?, NOW(), ?, ?, ?)";
        try (PreparedStatement ps = new DBContext().conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, order.getCustomer().getCustomerId());
            ps.setInt(2, order.getShipping().getShippingid());
            ps.setDouble(3, order.getTotalPrice());
            ps.setString(4, order.getNote());
            ps.setInt(5, order.getStatus().getId());
            ps.setString(6, order.getPayment());
            ps.setInt(7, order.getSeller().getSellerId());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    public void updateOrderStatus(int orderId, int statusId) throws SQLException {
        String sql = "UPDATE Orders SET status_id = ? WHERE order_id = ?";
        try (PreparedStatement ps = new DBContext().conn.prepareStatement(sql)) {
            ps.setInt(1, statusId);
            ps.setInt(2, orderId);

            ps.executeUpdate();
        }
    }

    public Status getDefaultStatus() {
        Status status = null;
        try {
            String sql = "SELECT * FROM Status WHERE status_name = 'Awaiting Confirmation'";
            PreparedStatement stm = new DBContext().conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                status = new Status();
                status.setId(rs.getInt("status_id"));
                status.setName(rs.getString("status_name"));
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return status;
    }

    public int insertOrder(Order order) {
        int orderId = -1;
        Status status = getDefaultStatus(); // L?y tr?ng thái m?c ??nh
        int shippingId = -1; // Bi?n l?u shipping_id

        try {
            connection.setAutoCommit(false); // B?t ??u transaction

            // B??c 1: Thêm thông tin vào b?ng Shipping tr??c
            String sqlShipping = "INSERT INTO Shipping (name, phone, address, status) VALUES (?, ?, ?, ?)";
            PreparedStatement stmShipping = connection.prepareStatement(sqlShipping, PreparedStatement.RETURN_GENERATED_KEYS);
            stmShipping.setString(1, order.getShipping().getName());
            stmShipping.setString(2, order.getShipping().getPhone());
            stmShipping.setString(3, order.getShipping().getAddress());
            stmShipping.setString(4, order.getShipping().getStatus());

            stmShipping.executeUpdate();

            ResultSet rsShipping = stmShipping.getGeneratedKeys();
            if (rsShipping.next()) {
                shippingId = rsShipping.getInt(1);
            }
            rsShipping.close();
            stmShipping.close();

            // N?u không có shipping_id, rollback và tr? v?
            if (shippingId == -1) {
                connection.rollback();
                throw new SQLException("Failed to insert shipping.");
            }

            // B??c 2: Thêm thông tin ??n hàng vào b?ng Orders
            String sqlOrder = "INSERT INTO Orders (customer_id, shipping_id, totalPrice, note, create_date, status_id, payment, seller_id) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmOrder = connection.prepareStatement(sqlOrder, PreparedStatement.RETURN_GENERATED_KEYS);
            stmOrder.setInt(1, order.getCustomer().getCustomerId());
            stmOrder.setInt(2, shippingId);
            stmOrder.setDouble(3, order.getTotalPrice());
            stmOrder.setString(4, order.getNote());
            stmOrder.setTimestamp(5, new Timestamp(order.getOrdertime().getTime()));
            stmOrder.setInt(6, status.getId());
            stmOrder.setString(7, order.getPayment());
            stmOrder.setInt(8, order.getSeller().getSellerId());
            
            stmOrder.executeUpdate();

            ResultSet rsOrder = stmOrder.getGeneratedKeys();
            if (rsOrder.next()) {
                orderId = rsOrder.getInt(1);
            }
            rsOrder.close();
            stmOrder.close();

            if (orderId != -1) {
                String sqlOrderDetails = "INSERT INTO OrderDetail (order_id, pd_id, productName, productPrice, quantity) "
                        + "VALUES (?, ?, ?, ?, ?)";
                PreparedStatement stmOrderDetails = connection.prepareStatement(sqlOrderDetails);

                for (OrderDetail detail : order.getOrderDetail()) {
                    stmOrderDetails.setInt(1, orderId);
                    stmOrderDetails.setInt(2, detail.getPdId());
                    stmOrderDetails.setString(3, detail.getProductName());
                    stmOrderDetails.setDouble(4, detail.getProductPrice());
                    stmOrderDetails.setInt(5, detail.getQuantity());
                    stmOrderDetails.addBatch();
                }
                stmOrderDetails.executeBatch();
                stmOrderDetails.close();
            }

            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException e) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
            }
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return orderId;
    }

    public ArrayList<Order> getOrderHistoryByAccountID(int aid) {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT o.order_id, o.totalPrice, o.note, o.create_date, o.shipping_id, o.status_id, o.payment, \n"
                    + "       c.customer_id, c.customer_name, c.customer_type, c.customer_dob, c.customer_gender, c.customer_images, \n"
                    + "       s.name AS shipping_name, s.phone AS shipping_phone, s.address AS shipping_address, \n"
                    + "       st.status_name, o.seller_id, \n"
                    + "       SUM(od.productPrice * od.quantity) AS total_order_amount\n"
                    + "FROM Orders o \n"
                    + "JOIN Customer c ON o.customer_id = c.customer_id \n"
                    + "JOIN Shipping s ON o.shipping_id = s.shipping_id \n"
                    + "JOIN Status st ON o.status_id = st.status_id\n"
                    + "JOIN OrderDetail od ON o.order_id = od.order_id\n"
                    + "WHERE c.account_id = ?\n"
                    + "GROUP BY o.order_id, o.totalPrice, o.note, o.create_date, o.shipping_id, o.status_id, o.payment, \n"
                    + "         c.customer_id, c.customer_name, c.customer_type, c.customer_dob, c.customer_gender, c.customer_images, \n"
                    + "         s.name, s.phone, s.address, st.status_name, o.seller_id\n"
                    +"ORDER BY o.order_id DESC";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, aid);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                // Kh?i t?o ??i t??ng Order
                Order order = new Order();
                order.setOrderId(rs.getInt("order_id"));
                order.setTotalPrice(rs.getDouble("total_order_amount"));
                order.setNote(rs.getString("note"));
                order.setOrdertime(rs.getDate("create_date"));
                order.setPayment(rs.getString("payment"));
                
                Seller seller = new Seller();
                seller.setSellerId(rs.getInt("seller_id"));
                
                // Thi?t l?p thông tin Customer
                Customer customer = new Customer();
                customer.setAccountId(rs.getInt("customer_id"));
                customer.setCustomerName(rs.getString("customer_name"));
                customer.setCustomerType(rs.getString("customer_type"));
                customer.setCustomerDob(rs.getDate("customer_dob"));
                customer.setCustomerGender(rs.getString("customer_gender"));
                customer.setCustomerImages(rs.getString("customer_images"));
                order.setCustomer(customer);

                // Thi?t l?p thông tin Shipping
                Shipping shipping = new Shipping();
                shipping.setShippingid(rs.getInt("shipping_id"));
                shipping.setName(rs.getString("shipping_name"));
                shipping.setAddress(rs.getString("shipping_address"));
                shipping.setPhone(rs.getString("shipping_phone"));
                order.setShipping(shipping);

                // Thi?t l?p thông tin Status
                Status status = new Status();
                status.setId(rs.getInt("status_id"));
                status.setName(rs.getString("status_name"));
                order.setStatus(status);

                // Thêm ??n hàng vào danh sách
                orders.add(order);
            }

            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public ArrayList<Status> getFirstSixStatuses() {
        ArrayList<Status> statuses = new ArrayList<>();
        try {
            String sql = "SELECT status_id, status_name FROM Status WHERE status_id BETWEEN 1 AND 6 ORDER BY status_id";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Status status = new Status();
                status.setId(rs.getInt("status_id"));
                status.setName(rs.getString("status_name"));
                statuses.add(status);
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return statuses;
    }

    public ArrayList<Order> getOrderHistoryByAccountIDAndStatus(int aid, int statusId) {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT o.order_id, o.totalPrice, o.note, o.create_date, o.shipping_id, o.status_id, o.payment, \n"
                    + "       c.customer_id, c.customer_name, c.customer_type, c.customer_dob, c.customer_gender, c.customer_images, \n"
                    + "       s.name AS shipping_name, s.phone AS shipping_phone, s.address AS shipping_address, \n"
                    + "       st.status_name, o.seller_id, \n"
                    + "       SUM(od.productPrice * od.quantity) AS total_order_amount\n"
                    + "FROM Orders o \n"
                    + "JOIN Customer c ON o.customer_id = c.customer_id \n"
                    + "JOIN Shipping s ON o.shipping_id = s.shipping_id \n"
                    + "JOIN Status st ON o.status_id = st.status_id\n"
                    + "JOIN OrderDetail od ON o.order_id = od.order_id\n"
                    + "WHERE c.account_id = ? AND o.status_id = ?\n"
                    + "GROUP BY o.order_id, o.totalPrice, o.note, o.create_date, o.shipping_id, o.status_id, o.payment, \n"
                    + "         c.customer_id, c.customer_name, c.customer_type, c.customer_dob, c.customer_gender, c.customer_images, \n"
                    + "         s.name, s.phone, s.address, st.status_name, o.seller_id\n"
                    + "ORDER BY o.order_id DESC";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, aid);
            stm.setInt(2, statusId);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("order_id"));
                order.setTotalPrice(rs.getDouble("total_order_amount"));
                order.setNote(rs.getString("note"));
                order.setOrdertime(rs.getDate("create_date"));
                order.setPayment(rs.getString("payment"));

                Seller seller = new Seller();
                seller.setSellerId(rs.getInt("seller_id"));
                // Thi?t l?p thông tin Customer
                Customer customer = new Customer();
                customer.setAccountId(rs.getInt("customer_id"));
                customer.setCustomerName(rs.getString("customer_name"));
                customer.setCustomerType(rs.getString("customer_type"));
                customer.setCustomerDob(rs.getDate("customer_dob"));
                customer.setCustomerGender(rs.getString("customer_gender"));
                customer.setCustomerImages(rs.getString("customer_images"));
                order.setCustomer(customer);

                // Thi?t l?p thông tin Shipping
                Shipping shipping = new Shipping();
                shipping.setShippingid(rs.getInt("shipping_id"));
                shipping.setName(rs.getString("shipping_name"));
                shipping.setAddress(rs.getString("shipping_address"));
                shipping.setPhone(rs.getString("shipping_phone"));
                order.setShipping(shipping);

                // Thi?t l?p thông tin Status
                Status status = new Status();
                status.setId(rs.getInt("status_id"));
                status.setName(rs.getString("status_name"));
                order.setStatus(status);

                orders.add(order);
            }

            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public List<OrderDetail> getOrderDetailsByOrderId(int orderId) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        try {
            String sql = "SELECT od.pd_id, od.productName, od.productPrice, od.quantity "
                    + "FROM OrderDetail od WHERE od.order_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderId);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                OrderDetail detail = new OrderDetail();
                detail.setPdId(rs.getInt("pd_id"));
                detail.setProductName(rs.getString("productName"));
                detail.setProductPrice(rs.getDouble("productPrice"));
                detail.setQuantity(rs.getInt("quantity"));

                orderDetails.add(detail);
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return orderDetails;
    }

    public boolean updateShippingByOrderId(int orderId, Shipping shipping) {
        boolean isUpdated = false;
        String sql = "UPDATE Shipping "
                + "SET name = ?, phone = ?, address = ?, status = ? "
                + "WHERE shipping_id = (SELECT shipping_id FROM Orders WHERE order_id = ?)";

        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, shipping.getName());
            stm.setString(2, shipping.getPhone());
            stm.setString(3, shipping.getAddress());
            stm.setString(4, shipping.getStatus());
            stm.setInt(5, orderId);

            int rowsAffected = stm.executeUpdate();
            if (rowsAffected > 0) {
                isUpdated = true; 
            }
        } catch (SQLException ex) {
            System.out.println("SQL error: " + ex.getMessage());
            ex.printStackTrace();
        }

        return isUpdated;
    }

    public boolean updateCancelledOrderStatus(int orderId, int statusId) {
        boolean isUpdated = false;
        try {
            String sql = "UPDATE Orders SET status_id = ? WHERE order_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, statusId);
            stm.setInt(2, orderId);
            int rowsAffected = stm.executeUpdate();
            stm.close();

            if (rowsAffected > 0) {
                isUpdated = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return isUpdated;
    }

    public static void main(String[] args) {
        OrderDAO pd = new OrderDAO();
        ArrayList<Status> list = pd.getFirstSixStatuses();
        for (Status pr : list) {
            System.out.println(pr);
        }
    }
}
