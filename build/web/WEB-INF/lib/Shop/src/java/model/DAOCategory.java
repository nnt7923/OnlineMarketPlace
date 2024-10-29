package model;

import entity.Category;
import java.sql.*;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOCategory extends DBConnect {

    public int insertCategory(Category category) {
        int n = 0;
        String sql = "INSERT INTO Category (cateID, cateName, status) VALUES (?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, category.getCateID());
            pre.setString(2, category.getCateName());
            pre.setBoolean(3, category.isStatus());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateCategory(Category category) {
        int n = 0;
        String sql = "UPDATE Category SET cateName = ?, status = ? WHERE cateID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, category.getCateName());
            pre.setBoolean(2, category.isStatus());
            pre.setInt(3, category.getCateID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteCategory(int cateID) {
        int n = 0;
        String sql = "DELETE FROM Category WHERE cateID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, cateID);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Category getCategory(int cateID) {
        Category category = null;
        String sql = "SELECT * FROM Category WHERE cateID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, cateID);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                String cateName = rs.getString("cateName");
                boolean status = rs.getBoolean("status");
                category = new Category(cateID, cateName, status);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return category;
    }

    public Vector<Category> getAllCategories(String sql) {
        Vector<Category> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int cateID = rs.getInt("cateID");
                String cateName = rs.getString("cateName");
                boolean status = rs.getBoolean("status");
                Category category = new Category(cateID, cateName, status);
                vector.add(category);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
}
