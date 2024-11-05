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
import model.Seller;

public class SellerDAO extends DBContext {
    
    
    public List<Seller> getSellerName() {
        List<Seller> list = new ArrayList<>();
        
        String sql = "SELLECT s.store_name FROM Seller s WHERE s.seller = s.seller_id = ?";
        
        try (PreparedStatement stm = new DBContext().conn.prepareStatement(sql)) {
            ResultSet rs = stm.executeQuery();
            
            while (rs.next()) {
                String storeName = rs.getString("store_name");
                
                Seller seller = new Seller(storeName);
                
                list.add(seller);
            }
            rs.close();
            
        } catch (SQLException e) {
            Logger.getLogger(ProductDetailsDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", e);
        }
        return list;
    }

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
