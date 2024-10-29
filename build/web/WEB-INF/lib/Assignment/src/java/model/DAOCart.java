package model;

import entity.Cart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class DAOCart extends DBConnect {

    // Lấy tất cả các bản ghi trong bảng Cart
    public Vector<Cart> getAllCarts() {
        Vector<Cart> carts = new Vector<>();
        String sql = "SELECT * FROM Cart";
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int accountID = rs.getInt("accountID");
                int productID = rs.getInt("productID");
                int amount = rs.getInt("amount");
                Cart cart = new Cart(accountID, productID, amount);
                carts.add(cart);
            }
            rs.close();
            state.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return carts;
    }

    // Lấy các bản ghi trong bảng Cart theo accountID
    public Vector<Cart> getCartsByAccountId(int accountID) {
        Vector<Cart> carts = new Vector<>();
        String sql = "SELECT * FROM Cart WHERE accountID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, accountID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("productID");
                int amount = rs.getInt("amount");
                Cart cart = new Cart(accountID, productID, amount);
                carts.add(cart);
            }
            rs.close();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return carts;
    }

    // Thêm một bản ghi mới vào bảng Cart
    public void addCart(Cart cart) {
        String sql = "INSERT INTO Cart (accountID, productID, amount) VALUES (?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, cart.getAccountID());
            pre.setInt(2, cart.getProductID());
            pre.setInt(3, cart.getAmount());
            pre.executeUpdate();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Cập nhật một bản ghi trong bảng Cart
    public void updateCart(Cart cart) {
        String sql = "UPDATE Cart SET amount = ? WHERE accountID = ? AND productID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, cart.getAmount());
            pre.setInt(2, cart.getAccountID());
            pre.setInt(3, cart.getProductID());
            pre.executeUpdate();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Xóa một bản ghi trong bảng Cart theo accountID và productID
    public void deleteCart(int accountID, int productID) {
        String sql = "DELETE FROM Cart WHERE accountID = ? AND productID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, accountID);
            pre.setInt(2, productID);
            pre.executeUpdate();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
