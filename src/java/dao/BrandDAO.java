package dao;

import context.DBContext;
import model.Brand;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BrandDAO extends DBContext {

    // Add new Brand
    public boolean addBrand(Brand brand) {
        String query = "INSERT INTO Brand (brandName) VALUES (?)";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, brand.getBrandName());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public int getBrandCount() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM [Brand]";
        try (
             PreparedStatement pre = conn.prepareStatement(sql);
             ResultSet rs = pre.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return count;
    }

    // Get Brand by ID
    public Brand getBrandById(int id) {
        String query = "SELECT * FROM Brand WHERE brand_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Brand(rs.getInt("brand_id"), rs.getString("brandName"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // List all Brands
    public List<Brand> listAll() {
        List<Brand> brands = new ArrayList<>();
        String query = "SELECT * FROM Brand";

        try (PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Brand brand = new Brand(
                        rs.getInt("brand_id"), // Getting the 'brandId' field
                        rs.getString("brandName") // Getting the 'brandName' field
                );
                brands.add(brand);  // Adding the Brand object to the list
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return brands;  // Returning the list of brands
    }

    // Update Brand
    public boolean updateBrand(Brand brand) {
        String query = "UPDATE Brand SET brandName = ? WHERE brand_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, brand.getBrandName());
            ps.setInt(2, brand.getBrandId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Brand
    public boolean deleteBrand(int id) {
        String query = "DELETE FROM Brand WHERE brand_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Search Brands by Name
    public List<Brand> search(String keyword) {
        List<Brand> brands = new ArrayList<>();
        String query = "SELECT * FROM Brand WHERE brandName LIKE ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, "%" + keyword + "%");  // Use wildcard for partial matching
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand(
                        rs.getInt("brand_id"),
                        rs.getString("brandName")
                );
                brands.add(brand);  // Add brand to the list
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return brands;  // Return the list of matching brands
    }

    // Check if a brand name already exists in the database
    public boolean checkDuplicate(String brandName) {
        String query = "SELECT COUNT(*) AS count FROM Brand WHERE brandName = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, brandName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("count") > 0; // If count > 0, duplicate exists
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // No duplicate found
    }

    public static void main(String[] args) {
        BrandDAO brandDAO = new BrandDAO();
        List<Brand> brands = brandDAO.listAll();
        System.out.println(brands);
    }
}
