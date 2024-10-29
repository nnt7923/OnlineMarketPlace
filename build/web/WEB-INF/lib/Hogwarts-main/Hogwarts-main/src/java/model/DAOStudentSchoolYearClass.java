// File: model/DAOStudentSchoolYearClass.java
package model;

import entity.StudentSchoolYearClass;
import java.sql.*;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOStudentSchoolYearClass extends DBConnect {

    public int insertStudentSchoolYearClass(StudentSchoolYearClass ssClass) {
        int n = 0;
        String sql = "INSERT INTO Student_SchoolYear_Class (StudentID, SyC_ID) VALUES (?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, ssClass.getStudentID());
            pre.setString(2, ssClass.getSyC_ID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOStudentSchoolYearClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateStudentSchoolYearClass(StudentSchoolYearClass ssClass) {
        int n = 0;
        String sql = "UPDATE Student_SchoolYear_Class SET SyC_ID = ? WHERE StudentID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, ssClass.getSyC_ID());
            pre.setString(2, ssClass.getStudentID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOStudentSchoolYearClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteStudentSchoolYearClass(String studentID, String syC_ID) {
        int n = 0;
        String sql = "DELETE FROM Student_SchoolYear_Class WHERE StudentID = ? AND SyC_ID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, studentID);
            pre.setString(2, syC_ID);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOStudentSchoolYearClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<StudentSchoolYearClass> getAllStudentSchoolYearClasses(String sql) {
        Vector<StudentSchoolYearClass> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                String studentID = rs.getString("StudentID");
                String syC_ID = rs.getString("SyC_ID");
                StudentSchoolYearClass ssClass = new StudentSchoolYearClass(studentID, syC_ID);
                vector.add(ssClass);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOStudentSchoolYearClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public StudentSchoolYearClass getStudentSchoolYearClassByID(String studentID, String syC_ID) {
        StudentSchoolYearClass ssClass = null;
        String sql = "SELECT * FROM Student_SchoolYear_Class WHERE StudentID = ? AND SyC_ID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, studentID);
            pre.setString(2, syC_ID);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                ssClass = new StudentSchoolYearClass(studentID, syC_ID);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOStudentSchoolYearClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ssClass;
    }
}
