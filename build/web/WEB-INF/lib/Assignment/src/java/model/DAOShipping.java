package model;

import entity.Shipping;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class DAOShipping extends DBConnect {

    // Lấy tất cả các thông tin giao hàng từ bảng Shipping
    public Vector<Shipping> getAllShippings() {
        Vector<Shipping> shippingList = new Vector<>();
        String sql = "SELECT * FROM Shipping";
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                Shipping shipping = new Shipping(id, name, phone, address);
                shippingList.add(shipping);
            }
            rs.close();
            state.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return shippingList;
    }

    // Lấy thông tin giao hàng theo id
    public Shipping getShippingById(int id) {
        Shipping shipping = null;
        String sql = "SELECT * FROM Shipping WHERE id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                shipping = new Shipping(id, name, phone, address);
            }
            rs.close();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return shipping;
    }

    // Thêm một thông tin giao hàng mới vào bảng Shipping
    public void addShipping(Shipping shipping) {
        String sql = "INSERT INTO Shipping (name, phone, address) VALUES (?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, shipping.getName());
            pre.setString(2, shipping.getPhone());
            pre.setString(3, shipping.getAddress());
            pre.executeUpdate();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Cập nhật thông tin giao hàng trong bảng Shipping
    public void updateShipping(Shipping shipping) {
        String sql = "UPDATE Shipping SET name = ?, phone = ?, address = ? WHERE id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, shipping.getName());
            pre.setString(2, shipping.getPhone());
            pre.setString(3, shipping.getAddress());
            pre.setInt(4, shipping.getId());
            pre.executeUpdate();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Xóa một thông tin giao hàng trong bảng Shipping theo id
    public void deleteShipping(int id) {
        String sql = "DELETE FROM Shipping WHERE id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
