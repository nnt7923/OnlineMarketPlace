package model;

import entity.Orders;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.Vector;

public class DAOOrders extends DBConnect {

    // Lấy tất cả các bản ghi trong bảng Orders
    public Vector<Orders> getAllOrders() {
        Vector<Orders> ordersList = new Vector<>();
        String sql = "SELECT * FROM Orders";
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt("id");
                int accountId = rs.getInt("accountId");
                double totalPrice = rs.getDouble("totalPrice");
                String note = rs.getString("note");
                Date createDate = rs.getDate("createDate");
                int shippingId = rs.getInt("shippingId");
                Orders order = new Orders(id, accountId, totalPrice, note, createDate, shippingId);
                ordersList.add(order);
            }
            rs.close();
            state.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ordersList;
    }

    // Lấy một bản ghi theo id
    public Orders getOrderById(int id) {
        Orders order = null;
        String sql = "SELECT * FROM Orders WHERE id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                int accountId = rs.getInt("accountId");
                double totalPrice = rs.getDouble("totalPrice");
                String note = rs.getString("note");
                Date createDate = rs.getDate("createDate");
                int shippingId = rs.getInt("shippingId");
                order = new Orders(id, accountId, totalPrice, note, createDate, shippingId);
            }
            rs.close();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return order;
    }

    // Thêm một bản ghi mới vào bảng Orders
    public void addOrder(Orders order) {
        String sql = "INSERT INTO Orders (accountId, totalPrice, note, createDate, shippingId) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, order.getAccountId());
            pre.setDouble(2, order.getTotalPrice());
            pre.setString(3, order.getNote());
            pre.setDate(4, new java.sql.Date(order.getCreateDate().getTime())); // Chuyển đổi từ java.util.Date sang java.sql.Date
            pre.setInt(5, order.getShippingId());
            pre.executeUpdate();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Cập nhật một bản ghi trong bảng Orders
    public void updateOrder(Orders order) {
        String sql = "UPDATE Orders SET accountId = ?, totalPrice = ?, note = ?, createDate = ?, shippingId = ? WHERE id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, order.getAccountId());
            pre.setDouble(2, order.getTotalPrice());
            pre.setString(3, order.getNote());
            pre.setDate(4, new java.sql.Date(order.getCreateDate().getTime())); // Chuyển đổi từ java.util.Date sang java.sql.Date
            pre.setInt(5, order.getShippingId());
            pre.setInt(6, order.getId());
            pre.executeUpdate();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Xóa một bản ghi trong bảng Orders theo id
    public void deleteOrder(int id) {
        String sql = "DELETE FROM Orders WHERE id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Lấy tất cả các bản ghi theo accountId
    public Vector<Orders> getOrdersByAccountId(int accountId) {
        Vector<Orders> ordersList = new Vector<>();
        String sql = "SELECT * FROM Orders WHERE accountId = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, accountId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                double totalPrice = rs.getDouble("totalPrice");
                String note = rs.getString("note");
                Date createDate = rs.getDate("createDate");
                int shippingId = rs.getInt("shippingId");
                Orders order = new Orders(id, accountId, totalPrice, note, createDate, shippingId);
                ordersList.add(order);
            }
            rs.close();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ordersList;
    }
}
