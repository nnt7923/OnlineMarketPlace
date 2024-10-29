package model;

import entity.OrderDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class DAOOrderDetail extends DBConnect {

    // Lấy tất cả các bản ghi trong bảng OrderDetail
    public Vector<OrderDetail> getAllOrderDetails() {
        Vector<OrderDetail> orderDetails = new Vector<>();
        String sql = "SELECT * FROM OrderDetail";
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt("id");
                int orderId = rs.getInt("orderId");
                String productName = rs.getString("productName");
                String productImage = rs.getString("productImage");
                double productPrice = rs.getDouble("productPrice");
                int quantity = rs.getInt("quantity");
                OrderDetail orderDetail = new OrderDetail(id, orderId, productName, productImage, productPrice, quantity);
                orderDetails.add(orderDetail);
            }
            rs.close();
            state.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return orderDetails;
    }

    // Lấy một bản ghi theo id
    public OrderDetail getOrderDetailById(int id) {
        OrderDetail orderDetail = null;
        String sql = "SELECT * FROM OrderDetail WHERE id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                int orderId = rs.getInt("orderId");
                String productName = rs.getString("productName");
                String productImage = rs.getString("productImage");
                double productPrice = rs.getDouble("productPrice");
                int quantity = rs.getInt("quantity");
                orderDetail = new OrderDetail(id, orderId, productName, productImage, productPrice, quantity);
            }
            rs.close();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return orderDetail;
    }

    // Thêm một bản ghi mới vào bảng OrderDetail
    public void addOrderDetail(OrderDetail orderDetail) {
        String sql = "INSERT INTO OrderDetail (orderId, productName, productImage, productPrice, quantity) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, orderDetail.getOrderId());
            pre.setString(2, orderDetail.getProductName());
            pre.setString(3, orderDetail.getProductImage());
            pre.setDouble(4, orderDetail.getProductPrice());
            pre.setInt(5, orderDetail.getQuantity());
            pre.executeUpdate();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Cập nhật một bản ghi trong bảng OrderDetail
    public void updateOrderDetail(OrderDetail orderDetail) {
        String sql = "UPDATE OrderDetail SET orderId = ?, productName = ?, productImage = ?, productPrice = ?, quantity = ? WHERE id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, orderDetail.getOrderId());
            pre.setString(2, orderDetail.getProductName());
            pre.setString(3, orderDetail.getProductImage());
            pre.setDouble(4, orderDetail.getProductPrice());
            pre.setInt(5, orderDetail.getQuantity());
            pre.setInt(6, orderDetail.getId());
            pre.executeUpdate();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Xóa một bản ghi trong bảng OrderDetail theo id
    public void deleteOrderDetail(int id) {
        String sql = "DELETE FROM OrderDetail WHERE id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Lấy tất cả các bản ghi theo orderId
    public Vector<OrderDetail> getOrderDetailsByOrderId(int orderId) {
        Vector<OrderDetail> orderDetails = new Vector<>();
        String sql = "SELECT * FROM OrderDetail WHERE orderId = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, orderId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String productName = rs.getString("productName");
                String productImage = rs.getString("productImage");
                double productPrice = rs.getDouble("productPrice");
                int quantity = rs.getInt("quantity");
                OrderDetail orderDetail = new OrderDetail(id, orderId, productName, productImage, productPrice, quantity);
                orderDetails.add(orderDetail);
            }
            rs.close();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return orderDetails;
    }
}
