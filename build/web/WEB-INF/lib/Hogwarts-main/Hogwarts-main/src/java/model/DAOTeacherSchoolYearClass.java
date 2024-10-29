// File: model/DAOTeacherSchoolYearClass.java
package model;

import entity.TeacherSchoolYearClass;
import java.sql.*;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOTeacherSchoolYearClass extends DBConnect {

    public int insertTeacherSchoolYearClass(TeacherSchoolYearClass tsClass) {
        int n = 0;
        String sql = "INSERT INTO Teacher_SchoolYear_Class (TeacherID, SyC_ID) VALUES (?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, tsClass.getTeacherID());
            pre.setString(2, tsClass.getSyC_ID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOTeacherSchoolYearClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateTeacherSchoolYearClass(TeacherSchoolYearClass tsClass) {
        int n = 0;
        String sql = "UPDATE Teacher_SchoolYear_Class SET SyC_ID = ? WHERE TeacherID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, tsClass.getSyC_ID());
            pre.setString(2, tsClass.getTeacherID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOTeacherSchoolYearClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteTeacherSchoolYearClass(String teacherID, String syC_ID) {
        int n = 0;
        String sql = "DELETE FROM Teacher_SchoolYear_Class WHERE TeacherID = ? AND SyC_ID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, teacherID);
            pre.setString(2, syC_ID);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOTeacherSchoolYearClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<TeacherSchoolYearClass> getAllTeacherSchoolYearClasses(String sql) {
        Vector<TeacherSchoolYearClass> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                String teacherID = rs.getString("TeacherID");
                String syC_ID = rs.getString("SyC_ID");
                TeacherSchoolYearClass tsClass = new TeacherSchoolYearClass(teacherID, syC_ID);
                vector.add(tsClass);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTeacherSchoolYearClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public TeacherSchoolYearClass getTeacherSchoolYearClassByID(String teacherID, String syC_ID) {
        TeacherSchoolYearClass tsClass = null;
        String sql = "SELECT * FROM Teacher_SchoolYear_Class WHERE TeacherID = ? AND SyC_ID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, teacherID);
            pre.setString(2, syC_ID);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                tsClass = new TeacherSchoolYearClass(teacherID, syC_ID);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTeacherSchoolYearClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tsClass;
    }
}
