package model;

import entity.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class DAOProduct extends DBConnect {

    // Lấy tất cả các sản phẩm từ bảng Product
    public Vector<Product> getAllProducts() {
        Vector<Product> productList = new Vector<>();
        String sql = "SELECT * FROM Product";
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int pID = rs.getInt("pID");
                String pName = rs.getString("pName");
                String pImage = rs.getString("pImage");
                double price = rs.getDouble("price");
                String title = rs.getString("title");
                String description = rs.getString("description");
                int cateID = rs.getInt("cateID");
                int sell_ID = rs.getInt("sell_ID");
                Product product = new Product(pID, pName, pImage, price, title, description, cateID, sell_ID);
                productList.add(product);
            }
            rs.close();
            state.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return productList;
    }

    // Lấy một sản phẩm theo pID
    public Product getProductById(int pID) {
        Product product = null;
        String sql = "SELECT * FROM Product WHERE pID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, pID);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                String pName = rs.getString("pName");
                String pImage = rs.getString("pImage");
                double price = rs.getDouble("price");
                String title = rs.getString("title");
                String description = rs.getString("description");
                int cateID = rs.getInt("cateID");
                int sell_ID = rs.getInt("sell_ID");
                product = new Product(pID, pName, pImage, price, title, description, cateID, sell_ID);
            }
            rs.close();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return product;
    }

    // Thêm một sản phẩm mới vào bảng Product
    public void addProduct(Product product) {
        String sql = "INSERT INTO Product (pName, pImage, price, title, description, cateID, sell_ID) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, product.getPName());
            pre.setString(2, product.getPImage());
            pre.setDouble(3, product.getPrice());
            pre.setString(4, product.getTitle());
            pre.setString(5, product.getDescription());
            pre.setInt(6, product.getCateID());
            pre.setInt(7, product.getSellID());
            pre.executeUpdate();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Cập nhật một sản phẩm trong bảng Product
    public void updateProduct(Product product) {
        String sql = "UPDATE Product SET pName = ?, pImage = ?, price = ?, title = ?, description = ?, cateID = ?, sell_ID = ? WHERE pID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, product.getPName());
            pre.setString(2, product.getPImage());
            pre.setDouble(3, product.getPrice());
            pre.setString(4, product.getTitle());
            pre.setString(5, product.getDescription());
            pre.setInt(6, product.getCateID());
            pre.setInt(7, product.getSellID());
            pre.setInt(8, product.getPID());
            pre.executeUpdate();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Xóa một sản phẩm trong bảng Product theo pID
    public void deleteProduct(int pID) {
        String sql = "DELETE FROM Product WHERE pID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, pID);
            pre.executeUpdate();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
