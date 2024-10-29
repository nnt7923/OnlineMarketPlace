package model;

import entity.Admin;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOAdmin extends DBConnect {

    // Thêm Admin mới
    public int insertAdmin(Admin admin) {
        int n = 0;
        String sql = "INSERT INTO Admin (admin, password) VALUES (?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, admin.getAdmin());
            pre.setString(2, admin.getPassword());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    // Cập nhật thông tin Admin
    public int updateAdmin(Admin admin) {
        int n = 0;
        String sql = "UPDATE Admin SET password = ? WHERE admin = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, admin.getPassword());
            pre.setString(2, admin.getAdmin());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    // Xóa Admin
    public int deleteAdmin(String admin) {
        int n = 0;
        String sql = "DELETE FROM Admin WHERE admin = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, admin);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    // Lấy thông tin Admin theo tên admin
    public Admin getAdmin(String admin) {
        Admin adminObj = null;
        String sql = "SELECT * FROM Admin WHERE admin = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, admin);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                String password = rs.getString("password");
                adminObj = new Admin(admin, password);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return adminObj;
    }

    // Xác thực Admin (dùng để kiểm tra đăng nhập)
    public boolean authenticateAdmin(String admin, String password) {
        String sql = "SELECT * FROM Admin WHERE admin = ? AND password = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, admin);
            pre.setString(2, password);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
