package model;

import entity.ClassCategory;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOClassCategory extends DBConnect {

    public int insertClassCategory(ClassCategory classCategory) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[ClassCategory]\n"
                + "           ([CateID]\n"
                + "           ,[CateName])\n"
                + "     VALUES(?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, classCategory.getCateID());
            pre.setString(2, classCategory.getCateName());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int updateClassCategory(ClassCategory classCategory) {
        int n = 0;
        String sql = "UPDATE [dbo].[ClassCategory]\n"
                + "   SET [CateName] = ?\n"
                + " WHERE [CateID] = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, classCategory.getCateName());
            pre.setString(2, classCategory.getCateID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int removeClassCategory(String cateID) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[ClassCategory] WHERE [CateID] = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, cateID);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOClassCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<ClassCategory> getAllClassCategories(String sql) {
        Vector<ClassCategory> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                String cateID = rs.getString(1);
                String cateName = rs.getString(2);
                ClassCategory classCategory = new ClassCategory(cateID, cateName);
                vector.add(classCategory);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOClassCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
        DAOClassCategory dao = new DAOClassCategory();
        int n = dao.insertClassCategory(new ClassCategory("CC001", "Mathematics"));
        if (n > 0) {
            System.out.println("Inserted");
        }
        Vector<ClassCategory> vector = dao.getAllClassCategories("SELECT * FROM ClassCategory");
        for (ClassCategory classCategory : vector) {
            System.out.println(classCategory.getCateID() + " - " + classCategory.getCateName());
        }
    }
}
