package model;

import entity.SchoolYearClass;
import java.sql.*;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOSchoolYearClass extends DBConnect {

    public int insertSchoolYearClass(SchoolYearClass syClass) {
        int n = 0;
        String sql = "INSERT INTO SchoolYearClass (SyC_ID, SyID, ClassID, CurID) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, syClass.getSyC_ID());
            pre.setString(2, syClass.getSyID());
            pre.setString(3, syClass.getClassID());
            pre.setString(4, syClass.getCurID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOSchoolYearClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateSchoolYearClass(SchoolYearClass syClass) {
        int n = 0;
        String sql = "UPDATE SchoolYearClass SET SyID = ?, ClassID = ?, CurID = ? WHERE SyC_ID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, syClass.getSyID());
            pre.setString(2, syClass.getClassID());
            pre.setString(3, syClass.getCurID());
            pre.setString(4, syClass.getSyC_ID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOSchoolYearClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteSchoolYearClass(String syC_ID) {
        int n = 0;
        String sql = "DELETE FROM SchoolYearClass WHERE SyC_ID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, syC_ID);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOSchoolYearClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<SchoolYearClass> getAllSchoolYearClasses(String sql) {
        Vector<SchoolYearClass> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                String syC_ID = rs.getString("SyC_ID");
                String syID = rs.getString("SyID");
                String classID = rs.getString("ClassID");
                String curID = rs.getString("CurID");
                SchoolYearClass syClass = new SchoolYearClass(syC_ID, syID, classID, curID);
                vector.add(syClass);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOSchoolYearClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public SchoolYearClass getSchoolYearClassByID(String syC_ID) {
        SchoolYearClass syClass = null;
        String sql = "SELECT * FROM SchoolYearClass WHERE SyC_ID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, syC_ID);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                String syID = rs.getString("SyID");
                String classID = rs.getString("ClassID");
                String curID = rs.getString("CurID");
                syClass = new SchoolYearClass(syC_ID, syID, classID, curID);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOSchoolYearClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return syClass;
    }
}
