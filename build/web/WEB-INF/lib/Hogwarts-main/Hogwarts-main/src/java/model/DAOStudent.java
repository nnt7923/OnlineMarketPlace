package model;

import entity.Student;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOStudent extends DBConnect {

    public int insertStudent(Student student) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Student]\n"
                + "           ([StudentID]\n"
                + "           ,[FullName]\n"
                + "           ,[DoB]\n"
                + "           ,[Age]\n"
                + "           ,[Gender]\n"
                + "           ,[Address]\n"
                + "           ,[UserID])\n"
                + "     VALUES(?,?,?,?,?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, student.getStudentID());
            pre.setString(2, student.getFullName());
            pre.setString(3, student.getDob());
            pre.setInt(4, student.getAge());
            pre.setString(5, student.getGender());
            pre.setString(6, student.getAddress());
            pre.setString(7, student.getUserID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int updateStudent(Student student) {
        int n = 0;
        String sql = "UPDATE [dbo].[Student]\n"
                + "   SET [FullName] = ?\n"
                + "      ,[DoB] = ?\n"
                + "      ,[Age] = ?\n"
                + "      ,[Gender] = ?\n"
                + "      ,[Address] = ?\n"
                + "      ,[UserID] = ?\n"
                + " WHERE [StudentID] = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, student.getFullName());
            pre.setString(2, student.getDob());
            pre.setInt(3, student.getAge());
            pre.setString(4, student.getGender());
            pre.setString(5, student.getAddress());
            pre.setString(6, student.getUserID());
            pre.setString(7, student.getStudentID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int removeStudent(String studentID) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Student] WHERE [StudentID] = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, studentID);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOStudent.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Student> getAllStudents(String sql) {
        Vector<Student> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                String studentID = rs.getString(1);
                String fullName = rs.getString(2);
                String dob = rs.getString(3);
                int age = rs.getInt(4);
                String gender = rs.getString(5);
                String address = rs.getString(6);
                String userID = rs.getString(7);
                Student student = new Student(studentID, fullName, dob, age, gender, address, userID);
                vector.add(student);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOStudent.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
        
    }
}
