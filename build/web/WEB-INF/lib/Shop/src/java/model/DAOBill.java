package model;

import entity.Bill;
import java.sql.*;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOBill extends DBConnect {
    
    public int insertBill(Bill bill) {
        int n = 0;
        String sql = "INSERT INTO Bill (DateCreate, RecAddress, RecPhone, Note, TotalMoney, Status, Cid) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setDate(1, new java.sql.Date(bill.getDateCreate().getTime()));
            pre.setString(2, bill.getRecAddress());
            pre.setString(3, bill.getRecPhone());
            pre.setString(4, bill.getNote());
            pre.setDouble(5, bill.getTotalMoney());
            pre.setBoolean(6, bill.isStatus());
            pre.setInt(7, bill.getCid());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBill.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateBill(Bill bill) {
        int n = 0;
        String sql = "UPDATE Bill SET DateCreate = ?, RecAddress = ?, RecPhone = ?, Note = ?, TotalMoney = ?, Status = ?, Cid = ? WHERE Bid = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setDate(1, new java.sql.Date(bill.getDateCreate().getTime()));
            pre.setString(2, bill.getRecAddress());
            pre.setString(3, bill.getRecPhone());
            pre.setString(4, bill.getNote());
            pre.setDouble(5, bill.getTotalMoney());
            pre.setBoolean(6, bill.isStatus());
            pre.setInt(7, bill.getCid());
            pre.setInt(8, bill.getBid());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBill.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteBill(int bid) {
        int n = 0;
        String sql = "DELETE FROM Bill WHERE Bid = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, bid);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBill.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Bill getBillByID(int bid) {
        Bill bill = null;
        String sql = "SELECT * FROM Bill WHERE Bid = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, bid);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                Date dateCreate = rs.getDate("DateCreate");
                String recAddress = rs.getString("RecAddress");
                String recPhone = rs.getString("RecPhone");
                String note = rs.getString("Note");
                double totalMoney = rs.getDouble("TotalMoney");
                boolean status = rs.getBoolean("Status");
                int cid = rs.getInt("Cid");
                bill = new Bill(bid, dateCreate, recAddress, recPhone, note, totalMoney, status, cid);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBill.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bill;
    }

    public Vector<Bill> getAllBills(String sql) {
        Vector<Bill> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int bid = rs.getInt("Bid");
                Date dateCreate = rs.getDate("DateCreate");
                String recAddress = rs.getString("RecAddress");
                String recPhone = rs.getString("RecPhone");
                String note = rs.getString("Note");
                double totalMoney = rs.getDouble("TotalMoney");
                boolean status = rs.getBoolean("Status");
                int cid = rs.getInt("Cid");
                Bill bill = new Bill(bid, dateCreate, recAddress, recPhone, note, totalMoney, status, cid);
                vector.add(bill);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBill.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
}
