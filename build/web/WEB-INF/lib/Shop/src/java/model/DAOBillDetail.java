package model;

import entity.BillDetail;
import java.sql.*;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOBillDetail extends DBConnect {
    
    public int insertBillDetail(BillDetail billDetail) {
        int n = 0;
        String sql = "INSERT INTO BillDetail (Bid, Pid, BuyQuantity, BuyPrice, Subtotal) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, billDetail.getBid());
            pre.setInt(2, billDetail.getPid());
            pre.setInt(3, billDetail.getBuyQuantity());
            pre.setDouble(4, billDetail.getBuyPrice());
            pre.setDouble(5, billDetail.getSubtotal());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBillDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateBillDetail(BillDetail billDetail) {
        int n = 0;
        String sql = "UPDATE BillDetail SET BuyQuantity = ?, BuyPrice = ?, Subtotal = ? WHERE Bid = ? AND Pid = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, billDetail.getBuyQuantity());
            pre.setDouble(2, billDetail.getBuyPrice());
            pre.setDouble(3, billDetail.getSubtotal());
            pre.setInt(4, billDetail.getBid());
            pre.setInt(5, billDetail.getPid());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBillDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteBillDetail(int bid, int pid) {
        int n = 0;
        String sql = "DELETE FROM BillDetail WHERE Bid = ? AND Pid = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, bid);
            pre.setInt(2, pid);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBillDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public BillDetail getBillDetail(int bid, int pid) {
        BillDetail billDetail = null;
        String sql = "SELECT * FROM BillDetail WHERE Bid = ? AND Pid = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, bid);
            pre.setInt(2, pid);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                int buyQuantity = rs.getInt("BuyQuantity");
                double buyPrice = rs.getDouble("BuyPrice");
                double subtotal = rs.getDouble("Subtotal");
                billDetail = new BillDetail(bid, pid, buyQuantity, buyPrice, subtotal);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBillDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return billDetail;
    }

    public Vector<BillDetail> getAllBillDetails(String sql) {
        Vector<BillDetail> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int bid = rs.getInt("Bid");
                int pid = rs.getInt("Pid");
                int buyQuantity = rs.getInt("BuyQuantity");
                double buyPrice = rs.getDouble("BuyPrice");
                double subtotal = rs.getDouble("Subtotal");
                BillDetail billDetail = new BillDetail(bid, pid, buyQuantity, buyPrice, subtotal);
                vector.add(billDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBillDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
}
