package dao;

import context.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Voucher;

public class VoucherDAO extends DBContext{
   

    // Phương thức thêm voucher
    public void addVoucher(Voucher voucher) throws SQLException {
        String sql = "INSERT INTO Voucher (code, description, discountAmount, minOrderValue, status, expiryDate) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, voucher.getCode());
            pstmt.setString(2, voucher.getDescription());
            pstmt.setDouble(3, voucher.getDiscountAmount());
            pstmt.setDouble(4, voucher.getMinOrderValue());
            pstmt.setString(5, voucher.getStatus());
            pstmt.setDate(6, new java.sql.Date(voucher.getExpiryDate().getTime()));
            pstmt.executeUpdate();
        }
    }

    // Phương thức lấy danh sách tất cả voucher
    public List<Voucher> getAllVouchers() throws SQLException {
        List<Voucher> vouchers = new ArrayList<>();
        String sql = "SELECT * FROM Voucher";
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Voucher voucher = new Voucher(
                        rs.getInt("id"),
                        rs.getString("code"),
                        rs.getString("description"),
                        rs.getDouble("discountAmount"),
                        rs.getDouble("minOrderValue"),
                        rs.getString("status"),
                        rs.getDate("expiryDate")
                );
                vouchers.add(voucher);
            }
        }
        return vouchers;
    }

    // Phương thức cập nhật voucher
    public void updateVoucher(Voucher voucher) throws SQLException {
        String sql = "UPDATE Voucher SET code = ?, description = ?, discountAmount = ?, minOrderValue = ?, status = ?, expiryDate = ? WHERE id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, voucher.getCode());
            pstmt.setString(2, voucher.getDescription());
            pstmt.setDouble(3, voucher.getDiscountAmount());
            pstmt.setDouble(4, voucher.getMinOrderValue());
            pstmt.setString(5, voucher.getStatus());
            pstmt.setDate(6, new java.sql.Date(voucher.getExpiryDate().getTime()));
            pstmt.setInt(7, voucher.getId());
            pstmt.executeUpdate();
        }
    }

    // Phương thức xóa voucher
    public void deleteVoucher(int id) throws SQLException {
        String sql = "DELETE FROM Voucher WHERE id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }
    
    public List<Voucher> listAll() {
        List<Voucher> vouchers = new ArrayList<>();
        String query = "SELECT * FROM Voucher"; 
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();  
            while (rs.next()) {
                
                Voucher voucher = new Voucher(
                        rs.getInt("voucher_id"),
                        rs.getString("code"),
                        rs.getString("description"),
                        rs.getDouble("discountAmount"),
                        rs.getDouble("minOrderValue"),
                        rs.getString("status"),
                        rs.getDate("expiryDate")
                );
                vouchers.add(voucher);  
            }
        } catch (SQLException e) {
            e.printStackTrace();  
        }
        return vouchers;  
    }
    
    public static void main(String[] args) {
        VoucherDAO voucherDAO = new VoucherDAO();
        List<Voucher> vouchers = voucherDAO.listAll();
        System.out.println(vouchers);
    }
}
