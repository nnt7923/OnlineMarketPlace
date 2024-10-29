// File: model/DAOCurDateAct.java
package model;

import entity.CurDateAct;
import java.sql.*;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOCurDateAct extends DBConnect {

    public int insertCurDateAct(CurDateAct act) {
        int n = 0;
        String sql = "INSERT INTO CurDateAct (CdtID, Act, TimeStart, TimeEnd, CurDateID) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, act.getCdtID());
            pre.setString(2, act.getAct());
            pre.setString(3, act.getTimeStart());
            pre.setString(4, act.getTimeEnd());
            pre.setString(5, act.getCurDateID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCurDateAct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateCurDateAct(CurDateAct act) {
        int n = 0;
        String sql = "UPDATE CurDateAct SET Act = ?, TimeStart = ?, TimeEnd = ?, CurDateID = ? WHERE CdtID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, act.getAct());
            pre.setString(2, act.getTimeStart());
            pre.setString(3, act.getTimeEnd());
            pre.setString(4, act.getCurDateID());
            pre.setString(5, act.getCdtID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCurDateAct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteCurDateAct(String cdtID) {
        int n = 0;
        String sql = "DELETE FROM CurDateAct WHERE CdtID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, cdtID);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCurDateAct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<CurDateAct> getAllCurDateActs(String sql) {
        Vector<CurDateAct> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                String cdtID = rs.getString("CdtID");
                String act = rs.getString("Act");
                String timeStart = rs.getString("TimeStart");
                String timeEnd = rs.getString("TimeEnd");
                String curDateID = rs.getString("CurDateID");
                CurDateAct actObj = new CurDateAct(cdtID, act, timeStart, timeEnd, curDateID);
                vector.add(actObj);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCurDateAct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public CurDateAct getCurDateActByID(String cdtID) {
        CurDateAct act = null;
        String sql = "SELECT * FROM CurDateAct WHERE CdtID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, cdtID);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                String actStr = rs.getString("Act");
                String timeStart = rs.getString("TimeStart");
                String timeEnd = rs.getString("TimeEnd");
                String curDateID = rs.getString("CurDateID");
                act = new CurDateAct(cdtID, actStr, timeStart, timeEnd, curDateID);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCurDateAct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return act;
    }
}
