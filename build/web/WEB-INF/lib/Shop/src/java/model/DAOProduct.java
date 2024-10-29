package model;

import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOProduct extends DBConnect {

    public int insertProduct(Product product) {
        int n = 0;
        String sql = "INSERT INTO Product (pname, quantity, price, description, status, cateId, image) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, product.getPname());
            pre.setInt(2, product.getQuantity());
            pre.setDouble(3, product.getPrice());
            pre.setString(4, product.getDescription());
            pre.setBoolean(5, product.isStatus());
            pre.setInt(6, product.getCateId());
            pre.setString(7, product.getImage());
            n = pre.executeUpdate();
            System.out.println("Insert successful, rows affected: " + n);
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateProduct(Product product) {
        int n = 0;
        String sql = "UPDATE Product SET pname = ?, quantity = ?, price = ?, description = ?, status = ?, cateId = ?, image = ? WHERE pid = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, product.getPname());
            pre.setInt(2, product.getQuantity());
            pre.setDouble(3, product.getPrice());
            pre.setString(4, product.getDescription());
            pre.setBoolean(5, product.isStatus());
            pre.setInt(6, product.getCateId());
            pre.setString(7, product.getImage());
            pre.setInt(8, product.getPid());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteProduct(int pid) {
        int n = 0;
        String sql = "DELETE FROM Product WHERE pid = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, pid);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Product getProductByID(int pid) {
        Product product = null;
        String sql = "SELECT * FROM Product WHERE pid = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, pid);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                String pname = rs.getString("pname");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                String description = rs.getString("description");
                boolean status = rs.getBoolean("status");
                int cateId = rs.getInt("cateId");
                String image = rs.getString("image");
                product = new Product(pid, pname, quantity, price, description, status, cateId, image);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }

    public Vector<Product> getAllProducts() {
        Vector<Product> vector = new Vector<>();
        String sql = "SELECT * FROM Product";
        try {
            Statement state = conn.createStatement();
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int pid = rs.getInt("pid");
                String pname = rs.getString("pname");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                String description = rs.getString("description");
                boolean status = rs.getBoolean("status");
                int cateId = rs.getInt("cateId");
                String image = rs.getString("image");
                Product product = new Product(pid, pname, quantity, price, description, status, cateId, image);
                vector.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

}
