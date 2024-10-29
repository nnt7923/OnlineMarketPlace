package model;

import entity.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class DAOCategory extends DBConnect {

    // Lấy tất cả các bản ghi trong bảng Category
    public Vector<Category> getAllCategories() {
        Vector<Category> categories = new Vector<>();
        String sql = "SELECT * FROM Category";
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int cid = rs.getInt("cid");
                String cname = rs.getString("cname");
                Category category = new Category(cid, cname);
                categories.add(category);
            }
            rs.close();
            state.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return categories;
    }

    // Lấy một bản ghi theo cid
    public Category getCategoryById(int cid) {
        Category category = null;
        String sql = "SELECT * FROM Category WHERE cid = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, cid);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                String cname = rs.getString("cname");
                category = new Category(cid, cname);
            }
            rs.close();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return category;
    }

    // Thêm một bản ghi mới vào bảng Category
    public void addCategory(Category category) {
        String sql = "INSERT INTO Category (cname) VALUES (?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, category.getCname());
            pre.executeUpdate();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Cập nhật một bản ghi trong bảng Category
    public void updateCategory(Category category) {
        String sql = "UPDATE Category SET cname = ? WHERE cid = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, category.getCname());
            pre.setInt(2, category.getCid());
            pre.executeUpdate();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Xóa một bản ghi trong bảng Category theo cid
    public void deleteCategory(int cid) {
        String sql = "DELETE FROM Category WHERE cid = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, cid);
            pre.executeUpdate();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
