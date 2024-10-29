package dao;

import context.DBContext;
import model.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO extends DBContext {

    // Add new Category
    public boolean addCategory(Category category) {
        String query = "INSERT INTO Category (cname,cimg) VALUES (?,?)";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, category.getCname());
            ps.setString(2, category.getCimg());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Category by ID
    public Category getCategoryById(int id) {
        String query = "SELECT * FROM Category WHERE cid = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Category(rs.getInt("cid"), rs.getString("cname"), rs.getString("cimg"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // List all Categories
    public List<Category> listAll() {
        List<Category> categories = new ArrayList<>();
        String query = "SELECT * FROM Category";

        try (PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Category category = new Category(
                        rs.getInt("cid"), // Getting the 'cid' field from the result set
                        rs.getString("cname"), // Getting the 'cname' field from the result set
                        rs.getString("cimg")
                );
                categories.add(category);  // Adding the Category object to the list
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;  // Returning the list of categories
    }

    public List<Category> listAllNoImg() {
        List<Category> categories = new ArrayList<>();
        String query = "SELECT * FROM Category";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category(
                        rs.getInt("cid"), // Lấy mã danh mục
                        rs.getString("cname"), // Lấy tên danh mục
                        null // Không lấy cimg vì không cần thiết
                );
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories; 
    }

    // Update Category
    public boolean update(Category category) {
        String query = "UPDATE Category SET cname = ? , cimg = ? WHERE cid = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, category.getCname());
            ps.setString(2, category.getCimg());
            ps.setInt(3, category.getCid());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Category
    public boolean deleteCategory(int id) {
        String query = "DELETE FROM Category WHERE cid = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Category> search(String keyword) {
        List<Category> categories = new ArrayList<>();
        String query = "SELECT * FROM Category WHERE cname LIKE ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, "%" + keyword + "%");  // Use wildcard for partial matching
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category(
                        rs.getInt("cid"),
                        rs.getString("cname"),
                        rs.getString("cimg")
                );
                categories.add(category);  // Add category to the list
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;  // Return the list of matching categories
    }

    // Check for Duplicate Category by Name
    public boolean isDuplicateCategory(String cname) {
        String query = "SELECT COUNT(*) FROM Category WHERE cname = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, cname);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;  // If count is greater than 0, then a duplicate exists
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> categories = categoryDAO.listAll();
        System.out.println(categories);
    }
}
