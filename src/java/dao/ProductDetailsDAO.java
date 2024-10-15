/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import model.ProductDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author Admin
 */
public class ProductDetailsDAO extends DBContext {

    public List<ProductDetails> getProductDetailsByPidAndCriteria(String pdid, String criteria) {
        List<ProductDetails> list = new ArrayList<>();
        String sql = "SELECT pd.pd_id, pd.pdname, pd.pdimg, pd.pdcriteria, "
                + "pd.pdcolor, pd.pdquantity, pd.pdprice_discount, "
                + "p.description, p.name, p.price "
                + "FROM ProductDetails pd "
                + "JOIN Product p ON pd.pd_id = p.product_id "
                + "WHERE pd.pd_id = ? AND pd.pdcriteria = ?";

        try (PreparedStatement stm = new DBContext().conn.prepareStatement(sql)) {
            stm.setString(1, pdid);

            // Ki?m tra và x? lý criteria n?u nó là null ho?c r?ng
            if (criteria != null) {
                stm.setString(2, criteria.trim());
            } else {
                stm.setString(2, "");  // N?u criteria null ho?c r?ng thì set giá tr? r?ng
            }

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                int productDetailId = rs.getInt("pd_id");
                String productDetailName = rs.getString("pdname");
                String productImage = rs.getString("pdimg");
                String productCriteria = rs.getString("pdcriteria");
                String productColor = rs.getString("pdcolor");
                int productQuantity = rs.getInt("pdquantity");
                float discountPrice = rs.getFloat("pdprice_discount");
                String productDescription = rs.getString("description");
                String productName = rs.getString("name");
                float originalPrice = rs.getFloat("price");

                // X? lý hình ?nh
                String[] images = productImage.split(",");

                // T?o ??i t??ng Product
                Product product = new Product(0, productName, null, originalPrice, null, productDescription, 0, 0, 0);

                // T?o ??i t??ng ProductDetails
                ProductDetails productDetail = new ProductDetails(productDetailId, product, productDetailName, discountPrice, productColor, images, productCriteria, productQuantity);

                list.add(productDetail);
            }

            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailsDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return list;
    }

    public ProductDetails getProductDetailByColorAndCriteria(String pid, String color, String criteria) {
        ProductDetails productDetails = null;
        String sql = "SELECT pd.pd_id, pd.pdname, pd.pdimg, pd.pdcriteria, "
                + "pd.pdcolor, p.description, pd.pdquantity, pd.pdprice_discount, p.name, p.price "
                + "FROM ProductDetails pd "
                + "JOIN Product p ON pd.pd_id = p.product_id "
                + "WHERE pd.pd_id = ? AND pd.pdcolor LIKE ? AND pd.pdcriteria = ?";

        try (PreparedStatement stm = new DBContext().conn.prepareStatement(sql)) {
            stm.setString(1, pid);
            stm.setString(2, "%" + color.trim() + "%");
            stm.setString(3, criteria.trim());

            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                int productDetailId = rs.getInt("pd_id");
                String productDetailName = rs.getString("pdname");
                String productImage = rs.getString("pdimg");
                String productCriteria = rs.getString("pdcriteria");
                String productColor = rs.getString("pdcolor");
                String productDescription = rs.getString("description");
                int productQuantity = rs.getInt("pdquantity");
                float discountPrice = rs.getFloat("pdprice_discount");
                String productName = rs.getString("name");
                float originalPrice = rs.getFloat("price");

                // X? lý hình ?nh
                String[] images = productImage.split(",");

                // T?o ??i t??ng Product
                Product product = new Product(0, productName, null, originalPrice, null, productDescription, 0, 0, 0);

                // T?o ??i t??ng ProductDetails
                productDetails = new ProductDetails(productDetailId, product, productDetailName, discountPrice, productColor, images, productCriteria, productQuantity);
            }

            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailsDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return productDetails;
    }

    public ProductDetails getProductDetailByPid(String pdid) {
        ProductDetails productDetails = null;

        String sql = "SELECT TOP 1 p.product_id, p.name AS product_name, p.img AS product_image, p.price AS product_price, "
                + "p.title AS product_title, p.description AS product_description, pd.pd_id, pd.pdname, pd.pdprice_discount, "
                + "pd.pdcolor, pd.pdimg AS product_detail_image, pd.pdcriteria, pd.pdquantity "
                + "FROM Product p "
                + "JOIN ProductDetails pd ON p.product_id = pd.product_id "
                + "WHERE pd.pd_id = ?";

        try (Connection conn = new DBContext().conn; PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, pdid);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                // L?y thông tin c?a s?n ph?m t? b?ng Product
                int ProductId = rs.getInt("product_id");
                String productName = rs.getString("product_name");
                String productImage = rs.getString("product_image");
                double productPrice = rs.getDouble("product_price");
                String productTitle = rs.getString("product_title");
                String productDescription = rs.getString("product_description");
                Product product = new Product(ProductId, productName, productImage, productPrice, productTitle, productDescription, 0, 0, 0);

                // L?y thông tin chi ti?t c?a s?n ph?m t? b?ng ProductDetails
                int productDetailIdInt = rs.getInt("pd_id");
                String productDetailName = rs.getString("pdname");
                float priceDiscount = rs.getFloat("pdprice_discount");
                String productColor = rs.getString("pdcolor");
                String productDetailImage = rs.getString("product_detail_image");
                String productCriteria = rs.getString("pdcriteria");
                int productQuantity = rs.getInt("pdquantity");

                // Tách chu?i hình ?nh n?u có nhi?u hình ?nh
                String[] images = productDetailImage.split(",");

                // T?o ??i t??ng ProductDetails
                productDetails = new ProductDetails(productDetailIdInt, product, productDetailName, priceDiscount, productColor, images, productCriteria, productQuantity);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productDetails;
    }

    public List<ProductDetails> getAllProducts() {
        List<ProductDetails> productDetailsList = new ArrayList<>();

        String sql = "WITH CTE AS (\n"
                + "SELECT p.product_id, p.name, p.img, p.price, p.title, p.description, \n"
                + "p.cateID, pd.pdprice_discount,pd.pd_id,pd.pdcolor, pd.pdcriteria,\n"
                + "ROW_NUMBER() OVER (PARTITION BY p.product_id ORDER BY p.product_id) AS row_num\n"
                + "FROM Product p\n"
                + "LEFT JOIN ProductDetails pd ON p.product_id = pd.product_id\n"
                + ")\n"
                + "SELECT *\n"
                + "FROM CTE \n"
                + "WHERE row_num = 1";

        try (Connection conn = new DBContext().conn; PreparedStatement stmt = conn.prepareStatement(sql)) {

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                // Fetch Product information
                int productId = rs.getInt("product_id");
                String productName = rs.getString("name");
                String productImage = rs.getString("img");
                double productPrice = rs.getDouble("price");
                String productTitle = rs.getString("title");
                String productDescription = rs.getString("description");
                int cateID = rs.getInt("cateID");

                Product product = new Product(productId, productName, productImage, productPrice, productTitle, productDescription, cateID, 0, 0);

                int productDetailId = rs.getInt("pd_id");
                float priceDiscount = rs.getFloat("pdprice_discount");
                String productDetailCriteria = rs.getString("pdcriteria");
                String productDetailColor = rs.getString("pdcolor");
                ProductDetails productDetails = new ProductDetails(productDetailId, product, null, priceDiscount, productDetailColor, null, productDetailCriteria, 0);
                productDetailsList.add(productDetails);
            }

            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productDetailsList;
    }

    public Set<String> getAllCriteriaByPid(String pid) {
        Set<String> criteriaSet = new HashSet<>();
        String sql = "SELECT DISTINCT pdcriteria FROM ProductDetails WHERE pd_id = ?";

        try (PreparedStatement stm = new DBContext().conn.prepareStatement(sql)) {
            stm.setString(1, pid);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                String criteria = rs.getString("pdcriteria");
                criteriaSet.add(criteria);
            }

            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailsDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return criteriaSet;
    }

    public static void main(String[] args) {
        ProductDetailsDAO pd = new ProductDetailsDAO();
        ProductDetails product = pd.getProductDetailByPid("2");
        System.out.println(product);

        List<ProductDetails> list = pd.getAllProducts();
        for (ProductDetails pr : list) {
            System.out.println(pr);
        }
    }
}
