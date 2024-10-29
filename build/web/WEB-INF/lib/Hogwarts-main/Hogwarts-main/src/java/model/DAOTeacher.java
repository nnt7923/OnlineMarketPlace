package model;

import entity.Teacher;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOTeacher extends DBConnect {

    public int insertTeacher(Teacher teacher) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Teacher]\n"
                + "           ([TeacherID]\n"
                + "           ,[UserID]\n"
                + "           ,[Degree])\n"
                + "     VALUES(?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, teacher.getTeacherID());
            pre.setString(2, teacher.getUserID());
            pre.setString(3, teacher.getDegree());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int updateTeacher(Teacher teacher) {
        int n = 0;
        String sql = "UPDATE [dbo].[Teacher]\n"
                + "   SET [UserID] = ?\n"
                + "      ,[Degree] = ?\n"
                + " WHERE [TeacherID] = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, teacher.getUserID());
            pre.setString(2, teacher.getDegree());
            pre.setString(3, teacher.getTeacherID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int removeTeacher(String teacherID) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Teacher] WHERE [TeacherID] = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, teacherID);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOTeacher.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Teacher> getAllTeachers(String sql) {
        Vector<Teacher> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                String teacherID = rs.getString(1);
                String userID = rs.getString(2);
                String degree = rs.getString(3);
                Teacher teacher = new Teacher(teacherID, userID, degree);
                vector.add(teacher);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTeacher.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
        DAOTeacher dao = new DAOTeacher();
        int n = dao.insertTeacher(new Teacher("T001", "U001", "PhD"));
        if (n > 0) {
            System.out.println("Inserted");
        }
        Vector<Teacher> vector = dao.getAllTeachers("SELECT * FROM Teacher");
        for (Teacher teacher : vector) {
            System.out.println(teacher.getTeacherID() + " - " + teacher.getUserID() + " - " + teacher.getDegree());
        }
    }
}
