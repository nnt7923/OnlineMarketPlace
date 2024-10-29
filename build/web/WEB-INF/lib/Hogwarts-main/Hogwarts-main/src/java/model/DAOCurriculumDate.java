package model;

import entity.CurriculumDate;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOCurriculumDate extends DBConnect {

    public int insertCurriculumDate(CurriculumDate curriculumDate) {
        int n = 0;
        String sql = "INSERT INTO CurriculumDate (CurDateID, DateNumber, CurID) VALUES (?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, curriculumDate.getCurDateID());
            pre.setString(2, curriculumDate.getDateNumber());
            pre.setString(3, curriculumDate.getCurID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int updateCurriculumDate(CurriculumDate curriculumDate) {
        int n = 0;
        String sql = "UPDATE CurriculumDate SET DateNumber = ? WHERE CurDateID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, curriculumDate.getDateNumber());
            pre.setString(2, curriculumDate.getCurDateID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int removeCurriculumDate(String curDateID) {
        int n = 0;
        String sql = "DELETE FROM CurriculumDate WHERE CurDateID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, curDateID);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCurriculumDate.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<CurriculumDate> getAllCurriculumDates(String sql) {
        Vector<CurriculumDate> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                String curDateID = rs.getString(1);
                String dateNumber = rs.getString(2);
                String curID = rs.getString(3);
                CurriculumDate curriculumDate = new CurriculumDate(curDateID, dateNumber, curID);
                vector.add(curriculumDate);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCurriculumDate.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
}
