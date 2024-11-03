/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author phamd
 */
import context.DBContext;
import model.Account;
import model.GoogleAccount;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.OrderDetail;
import model.Product;
import model.ProductDetails;
import model.Role;
import model.Seller;
import model.Shipping;
import model.Status;

public class SellerDAO extends DBContext {

    public Seller getSellerByProductId(int id) {
        Seller seller = null;
        String sql = "SELECT s.seller_id FROM Seller s \n"
                + "JOIN Product p ON s.seller_id = p.seller_id \n"
                + "WHERE p.product_id = ?";
        try (PreparedStatement ps = new DBContext().conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                seller = new Seller();
                seller.setSellerId(rs.getInt("seller_id"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return seller;
    }

    // C?p nh?t tï¿½i kho?n
    public boolean updateProfile(Account account) {
        String query = "UPDATE Account SET username = ?, email = ?, phone = ?, address = ? WHERE email = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, account.getUsername());

            ps.setString(3, account.getEmail());
            ps.setString(4, account.getPhone());
            ps.setString(5, account.getAddress());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Láº¥y seller_id tá»« account_id
    public int getSellerIdByAccountId(int accountId) throws SQLException {
        String sql = "SELECT seller_id FROM Seller WHERE account_id = ?";

        try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, accountId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("seller_id");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        return -1; // Náº¿u khÃ´ng tÃ¬m tháº¥y seller_id
    }

    public Seller getSellerBySellerId(int sellerId) throws SQLException {
        String sql = "SELECT * FROM Seller WHERE seller_id = ?";

        try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, sellerId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Seller seller = new Seller();
                    seller.setSellerId(rs.getInt("seller_id"));
                    seller.setAccountId(rs.getInt("account_id"));
                    seller.setStoreName(rs.getString("store_name"));
                    seller.setRating(rs.getFloat("rating"));
                    seller.setJoinDate(rs.getDate("join_date"));
                    seller.setImage(rs.getString("seller_image"));
                    return seller;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        return null; // N?u không tìm th?y seller theo seller_id
    }

    public Seller getSellerInfoByProductId(int productId) throws SQLException {
        String sql = "SELECT s.seller_id, s.account_id, s.store_name, s.rating, s.join_date "
                + "FROM Seller s "
                + "JOIN Product p ON s.seller_id = p.seller_id "
                + "WHERE p.product_id = ?";

        try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Seller seller = new Seller();
                    seller.setSellerId(rs.getInt("seller_id"));
                    seller.setAccountId(rs.getInt("account_id"));
                    seller.setStoreName(rs.getString("store_name"));
                    seller.setRating(rs.getFloat("rating"));
                    seller.setJoinDate(rs.getDate("join_date"));
                    return seller;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        return null; // N?u không tìm th?y seller
    }

    public int getTotalProductsBySellerId(int sellerId) {
        String sql = "SELECT COUNT(*) AS total FROM Product WHERE seller_id = ?";
        int total = 0;

        try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, sellerId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    total = rs.getInt("total");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return total;
    }

    public void updateLastOnline(int sellerId) throws SQLException {
        String sql = "UPDATE Seller SET last_online = GETDATE() WHERE seller_id = ?";

        try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, sellerId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public int getTotalOrdersBySellerId(int sellerId) throws SQLException {
        String sql = "SELECT COUNT(*) AS total FROM Orders WHERE seller_id = ?";
        int totalOrders = 0;

        try (PreparedStatement stm = new DBContext().conn.prepareStatement(sql)) {
            stm.setInt(1, sellerId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                totalOrders = rs.getInt("total");
            }
        }

        return totalOrders;
    }

    public int getOutOfStockProductsCountBySellerId(int sellerId, int threshold) throws SQLException {
        String sql = "SELECT COUNT(*) AS total FROM Product p "
                + "JOIN ProductDetails pd ON p.product_id = pd.product_id "
                + "WHERE p.seller_id = ? AND pd.pdquantity < ?";
        int outOfStockCount = 0;

        try (PreparedStatement stm = new DBContext().conn.prepareStatement(sql)) {
            stm.setInt(1, sellerId);
            stm.setInt(2, threshold);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                outOfStockCount = rs.getInt("total");
            }
        }

        return outOfStockCount;
    }

    public Seller getSellerByAccountId(int accountId) {
        Seller seller = null;
        String sql = "SELECT * FROM Seller WHERE account_id = ?";

        try (PreparedStatement stmt = new DBContext().conn.prepareStatement(sql)) {
            stmt.setInt(1, accountId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                seller = new Seller();
                seller.setSellerId(rs.getInt("seller_id"));
                seller.setStoreName(rs.getString("store_name"));
                seller.setImage(rs.getString("seller_image"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return seller;
    }

    public List<Order> pagingOrders(int sellerId, int index) {
        List<Order> orderList = new ArrayList<>();
        try {
            String sql = "SELECT o.order_id, o.totalPrice, o.create_date, sh.name AS shipping_name,st.status_id, st.status_name, s.seller_id\n"
                    + "FROM Orders o\n"
                    + "JOIN Seller s ON o.seller_id = s.seller_id\n"
                    + "JOIN Status st ON st.status_id = o.status_id\n"
                    + "JOIN Shipping sh ON sh.shipping_id = o.shipping_id\n"
                    + "WHERE s.seller_id = ?\n"
                    + "ORDER BY o.order_id\n"
                    + "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";

            PreparedStatement stm = new DBContext().conn.prepareStatement(sql);
            stm.setInt(1, sellerId);
            stm.setInt(2, (index - 1) * 5);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                // Retrieve values from ResultSet
                int orderId = rs.getInt("order_id");
                float orderTotalPrice = rs.getFloat("totalPrice");
                Date orderDate = rs.getDate("create_date");
                String shippingName = rs.getString("shipping_name");
                int statusId = rs.getInt("status_id");
                String statusName = rs.getString("status_name");

                // Create and populate the Order object
                Order order = new Order();
                order.setOrderId(orderId);
                order.setTotalPrice(orderTotalPrice);
                order.setOrdertime(orderDate);

                // Create and set Seller, Status, and Shipping objects
                Seller seller = new Seller();
                seller.setSellerId(sellerId);
                order.setSeller(seller);

                Status status = new Status();
                status.setId(statusId);
                status.setName(statusName);
                order.setStatus(status);

                Shipping shipping = new Shipping();
                shipping.setName(shippingName);
                order.setShipping(shipping);

                // Add the order to the list
                orderList.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return orderList;
    }

    public List<Status> getAllStatuses() {
        List<Status> listStatus = new ArrayList<>();
        try {
            String sql = "SELECT status_id, status_name FROM status";

            PreparedStatement stm = new DBContext().conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                int statusId = rs.getInt("status_id");
                String statusName = rs.getString("status_name");

                Status status = new Status();
                status.setId(statusId);
                status.setName(statusName);

                listStatus.add(status);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return listStatus;
    }

    public List<Order> getFilterByStatus(int statusid) {
        List<Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT o.order_id, o.totalPrice, o.create_date, sh.name AS shipping_name, st.status_name, s.seller_id\n"
                    + "FROM Orders o\n"
                    + "JOIN Seller s ON o.seller_id = s.seller_id\n"
                    + "JOIN Status st ON st.status_id = o.status_id\n"
                    + "JOIN Shipping sh ON sh.shipping_id = o.shipping_id\n"
                    + "WHERE st.status_id = ?"
                    + "ORDER BY create_date DESC OFFSET 1 ROWS FETCH NEXT 5 ROWS ONLY";

            PreparedStatement stm = new DBContext().conn.prepareStatement(sql);
            stm.setInt(1, statusid);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                // L?y giá tr? t? ResultSet
                int orderId = rs.getInt("order_id");
                float orderTotalPrice = rs.getFloat("totalPrice");
                Date orderDate = rs.getDate("create_date");
                String shippingName = rs.getString("shipping_name");
                String statusName = rs.getString("status_name");
                int sellerId = rs.getInt("seller_id");

                // T?o ??i t??ng Order và thi?t l?p các thu?c tính
                Order order = new Order();
                order.setOrderId(orderId);
                order.setTotalPrice(orderTotalPrice);
                order.setOrdertime(orderDate);

                // T?o và thi?t l?p ??i t??ng Seller
                Seller seller = new Seller();
                seller.setSellerId(sellerId); // Gi? s? Seller có ph??ng th?c setSellerId
                order.setSeller(seller);

                // T?o và thi?t l?p ??i t??ng Status
                Status status = new Status();
                status.setId(statusid);
                status.setName(statusName);
                order.setStatus(status);

                // T?o và thi?t l?p ??i t??ng Shipping
                Shipping shipping = new Shipping();
                shipping.setName(shippingName);
                order.setShipping(shipping);

                // Thêm Order vào danh sách
                orders.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return orders;
    }

    public boolean updateOrderStatus(int orderId, int statusId) {
        String sql = "UPDATE orders SET status_id = ? WHERE order_id = ?";
        try (PreparedStatement stmt = new DBContext().conn.prepareStatement(sql)) {
            stmt.setInt(1, statusId);
            stmt.setInt(2, orderId);
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Order> pagingOrdersByStatus(int sellerId, int statusId, int pageIndex) {
        List<Order> orders = new ArrayList<>();
        int pageSize = 5; // S? ??n hàng trên m?i trang
        int offset = (pageIndex - 1) * pageSize;

        String sql = "SELECT o.order_id, o.totalPrice, o.create_date, sh.name AS shipping_name, st.status_name, s.seller_id "
                + "FROM Orders o "
                + "JOIN Seller s ON o.seller_id = s.seller_id "
                + "JOIN Status st ON st.status_id = o.status_id "
                + "JOIN Shipping sh ON sh.shipping_id = o.shipping_id "
                + "WHERE s.seller_id = ? AND st.status_id = ? "
                + "ORDER BY o.create_date DESC "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement stm = new DBContext().conn.prepareStatement(sql)) {
            stm.setInt(1, sellerId);
            stm.setInt(2, statusId);
            stm.setInt(3, offset);
            stm.setInt(4, pageSize);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("order_id"));
                order.setTotalPrice(rs.getFloat("totalPrice"));
                order.setOrdertime(rs.getDate("create_date"));

                Shipping shipping = new Shipping();
                shipping.setName(rs.getString("shipping_name"));
                order.setShipping(shipping);

                Status status = new Status();
                status.setName(rs.getString("status_name"));
                order.setStatus(status);

                orders.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, "Error fetching paginated orders by status", ex);
        }

        return orders;
    }

    public int getTotalOrdersBySellerIdAndStatus(int sellerId, int statusId) {
        int totalOrders = 0;

        String sql = "SELECT COUNT(*) AS totalOrders "
                + "FROM Orders o "
                + "JOIN Seller s ON o.seller_id = s.seller_id "
                + "JOIN Status st ON st.status_id = o.status_id "
                + "WHERE s.seller_id = ? AND st.status_id = ?";

        try (PreparedStatement stm = new DBContext().conn.prepareStatement(sql)) {
            stm.setInt(1, sellerId);
            stm.setInt(2, statusId);

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                totalOrders = rs.getInt("totalOrders");
            }
        } catch (SQLException ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, "Error fetching total orders by status", ex);
        }

        return totalOrders;
    }

    public List<Order> searchOrders(String searchQuery) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT o.order_id, o.totalPrice, o.create_date, sh.name AS shipping_name, st.status_name, s.seller_id "
                + "FROM Orders o "
                + "JOIN Seller s ON o.seller_id = s.seller_id "
                + "JOIN Status st ON st.status_id = o.status_id "
                + "JOIN Shipping sh ON sh.shipping_id = o.shipping_id "
                + "WHERE (o.order_id LIKE ? OR sh.name LIKE ? OR o.create_date LIKE ?)";

        try (PreparedStatement stm = new DBContext().conn.prepareStatement(sql)) {
            String searchPattern = "%" + searchQuery + "%";
            stm.setString(1, searchPattern); // Tìm theo ID
            stm.setString(2, searchPattern); // Tìm theo customer name
            stm.setString(3, searchPattern); // Tìm theo date

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                // L?y giá tr? t? ResultSet
                int orderId = rs.getInt("order_id");
                float orderTotalPrice = rs.getFloat("totalPrice");
                Date orderDate = rs.getDate("create_date");
                String shippingName = rs.getString("shipping_name");
                String statusName = rs.getString("status_name");
                int sellerId = rs.getInt("seller_id");

                // T?o ??i t??ng Order và thi?t l?p các thu?c tính
                Order order = new Order();
                order.setOrderId(orderId);
                order.setTotalPrice(orderTotalPrice);
                order.setOrdertime(orderDate);

                // T?o và thi?t l?p ??i t??ng Seller
                Seller seller = new Seller();
                seller.setSellerId(sellerId); // G?i s? Seller có ph??ng th?c setSellerId
                order.setSeller(seller);

                // T?o và thi?t l?p ??i t??ng Status
                Status status = new Status();
                status.setName(statusName);
                order.setStatus(status);

                // T?o và thi?t l?p ??i t??ng Shipping
                Shipping shipping = new Shipping();
                shipping.setName(shippingName);
                order.setShipping(shipping);

                // T?o OrderDetail cho s? l??ng s?n ph?m
                OrderDetail orderDetail = new OrderDetail();

                // Thêm OrderDetail vào Order n?u OrderDetail không null
                if (order.getOrderDetail() == null) {
                    order.setOrderDetail(new ArrayList<>());
                }
                order.getOrderDetail().add(orderDetail);

                // Thêm Order vào danh sách
                orders.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return orders;
    }

    public List<Order> searchOrdersByStatus(String searchQuery, int statusId) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT o.order_id, o.totalPrice, o.create_date, sh.name AS shipping_name, st.status_name, s.seller_id "
                + "FROM Orders o "
                + "JOIN Seller s ON o.seller_id = s.seller_id "
                + "JOIN Status st ON st.status_id = o.status_id "
                + "JOIN Shipping sh ON sh.shipping_id = o.shipping_id "
                + "WHERE (o.order_id LIKE ? OR sh.name LIKE ?) AND st.status_id = ?";

        try (PreparedStatement stm = new DBContext().conn.prepareStatement(sql)) {
            String searchPattern = "%" + searchQuery + "%"; // Thêm d?u % ?? tìm ki?m không chính xác
            stm.setString(1, searchPattern); // Tìm theo ID
            stm.setString(2, searchPattern); // Tìm theo customer name
            stm.setInt(3, statusId); // L?c theo statusId

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                // L?y giá tr? t? ResultSet
                int orderId = rs.getInt("order_id");
                float orderTotalPrice = rs.getFloat("totalPrice");
                Date orderDate = rs.getDate("create_date");
                String shippingName = rs.getString("shipping_name");
                String statusName = rs.getString("status_name");
                int sellerId = rs.getInt("seller_id");

                // T?o ??i t??ng Order và thi?t l?p các thu?c tính
                Order order = new Order();
                order.setOrderId(orderId);
                order.setTotalPrice(orderTotalPrice);
                order.setOrdertime(orderDate);

                // T?o và thi?t l?p ??i t??ng Seller
                Seller seller = new Seller();
                seller.setSellerId(sellerId); // Gi? s? Seller có ph??ng th?c setSellerId
                order.setSeller(seller);

                // T?o và thi?t l?p ??i t??ng Status
                Status status = new Status();
                status.setName(statusName);
                order.setStatus(status);

                // T?o và thi?t l?p ??i t??ng Shipping
                Shipping shipping = new Shipping();
                shipping.setName(shippingName);
                order.setShipping(shipping);

                // Thêm Order vào danh sách
                orders.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return orders;
    }

    public List<OrderDetail> getOrderDetailById(int orderId) {
        List<OrderDetail> orderDetails = new ArrayList<>();

        String sql = "SELECT o.order_id, o.totalPrice, o.create_date, sh.name AS shipping_name, sh.phone AS shipping_phone, o.note, "
                + "sh.address AS shipping_address, st.status_id, st.status_name, s.seller_id, s.store_name AS seller_name, "
                + "pd.product_id, pd.pdname, pd.pdprice_discount, od.quantity, od.productName, od.productPrice, s.seller_image, o.payment, pd.pd_id "
                + "FROM OrderDetail od "
                + "JOIN Orders o ON od.order_id = o.order_id "
                + "JOIN Shipping sh ON o.shipping_id = sh.shipping_id "
                + "JOIN Status st ON st.status_id = o.status_id "
                + "JOIN Seller s ON o.seller_id = s.seller_id "
                + "JOIN ProductDetails pd ON od.pd_id = pd.pd_id "
                + "WHERE od.order_id = ?";

        try (PreparedStatement ps = new DBContext().conn.prepareStatement(sql)) {
            ps.setInt(1, orderId);  // Set the order ID parameter
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                // T?o ??i t??ng Order ?? ánh x? vào OrderDetail
                Order order = new Order();
                order.setOrderId(rs.getInt("order_id"));
                order.setTotalPrice(rs.getDouble("totalPrice"));
                order.setOrdertime(rs.getDate("create_date"));
                order.setPayment(rs.getString("payment"));
                order.setNote(rs.getString("note"));

                // Thi?t l?p thông tin giao hàng
                Shipping shipping = new Shipping();
                shipping.setName(rs.getString("shipping_name"));
                shipping.setPhone(rs.getString("shipping_phone"));
                shipping.setAddress(rs.getString("shipping_address"));
                order.setShipping(shipping);

                // Thi?t l?p thông tin tr?ng thái ??n hàng
                Status status = new Status();
                status.setId(rs.getInt("status_id"));
                status.setName(rs.getString("status_name"));
                order.setStatus(status);

                // Thi?t l?p thông tin ng??i bán hàng
                Seller seller = new Seller();
                seller.setSellerId(rs.getInt("seller_id"));
                seller.setStoreName(rs.getString("seller_name"));
                seller.setImage(rs.getString("seller_image"));
                order.setSeller(seller);

                // T?o m?t ??i t??ng OrderDetail cho m?i s?n ph?m
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrderId(rs.getInt("order_id"));
                orderDetail.setPdId(rs.getInt("pd_id"));
                orderDetail.setProductName(rs.getString("productName"));
                orderDetail.setProductPrice(rs.getDouble("productPrice"));
                orderDetail.setQuantity(rs.getInt("quantity"));

                orderDetail.setOrder(order);

                orderDetails.add(orderDetail);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetails;
    }

    public List<OrderDetail> getProductDetailsByOrderId(int orderId) {
        List<OrderDetail> orderDetails = new ArrayList<>();

        String sql = "SELECT od.order_id, pd.pd_id, pd.pdname, pd.pdprice_discount, od.quantity, "
                + "pd.pdcolor, pd.pdcriteria, pd.pdimg, p.price, p.product_id "
                + "FROM OrderDetail od "
                + "JOIN ProductDetails pd ON od.pd_id = pd.pd_id "
                + "JOIN Product p ON p.product_id = pd.product_id "
                + "WHERE od.order_id = ?";

        try (PreparedStatement ps = new DBContext().conn.prepareStatement(sql)) {
            ps.setInt(1, orderId);  // Set the order ID parameter
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("product_id"));
                product.setPrice(rs.getFloat("price"));
                
                // T?o ??i t??ng ProductDetails ?? ánh x? d? li?u t? ResultSet
                ProductDetails productDetail = new ProductDetails();
                productDetail.setId(rs.getInt("pd_id"));
                productDetail.setName(rs.getString("pdname"));
                productDetail.setPriceDiscount(rs.getFloat("pdprice_discount"));
                productDetail.setColor(rs.getString("pdcolor"));
                productDetail.setCriteria(rs.getString("pdcriteria"));
                productDetail.setImage(rs.getString("pdimg").split(","));
                productDetail.setProduct(product);
                // T?o ??i t??ng OrderDetail ?? ánh x? d? li?u t? ResultSet
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrderId(rs.getInt("order_id"));
                orderDetail.setPdId(rs.getInt("pd_id"));
                orderDetail.setQuantity(rs.getInt("quantity"));
                orderDetail.setProductdetail(productDetail);

                orderDetails.add(orderDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetails;
    }

    public static void main(String[] args) {
        SellerDAO sl = new SellerDAO();
        List<Status> lists = sl.getAllStatuses();
        Seller seller = sl.getSellerByProductId(9);
        List<OrderDetail> order = sl.getOrderDetailById(34);
        for (OrderDetail orderDetail : order) {
            System.out.println(orderDetail);
        }

    }
}
