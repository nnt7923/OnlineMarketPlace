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
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Role;

public class SellerDAO extends DBContext {

    // C?p nh?t t�i kho?n
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
    
        // Lấy seller_id từ account_id
    public int getSellerIdByAccountId(int accountId) throws SQLException {
        String sql = "SELECT seller_id FROM Seller WHERE account_id = ?";
        
        try (Connection conn = new DBContext().conn;
             PreparedStatement ps = conn.prepareStatement(sql)) {
             
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
        return -1; // Nếu không tìm thấy seller_id
    }
}
