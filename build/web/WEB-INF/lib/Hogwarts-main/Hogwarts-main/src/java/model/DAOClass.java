package model;

import entity.Class;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOClass extends DBConnect {

    public int insertClass(Class classObj) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Class] (ClassID, ClassName, CateID) VALUES (?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, classObj.getClassID());
            pre.setString(2, classObj.getClassName());
            pre.setString(3, classObj.getCateID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int updateClass(Class classObj) {
        int n = 0;
        String sql = "UPDATE [dbo].[Class] SET ClassName = ?, CateID = ? WHERE ClassID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, classObj.getClassName());
            pre.setString(2, classObj.getCateID());
            pre.setString(3, classObj.getClassID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int removeClass(String classID) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Class] WHERE ClassID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, classID);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Class> getAllClasses(String sql) {
        Vector<Class> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                String classID = rs.getString(1);
                String className = rs.getString(2);
                String cateID = rs.getString(3);
                Class classObj = new Class(classID, className, cateID);
                vector.add(classObj);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
        DAOClass dao = new DAOClass();
        int n = dao.insertClass(new Class("C001", "Class A", "CC001"));
        if (n > 0) {
            System.out.println("Inserted");
        }
        Vector<Class> vector = dao.getAllClasses("SELECT * FROM Class");
        for (Class classObj : vector) {
            System.out.println(classObj.getClassID() + " - " + classObj.getClassName() + " - " + classObj.getCateID());
        }
    }
}
