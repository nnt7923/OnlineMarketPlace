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

    public List<ProductDetails> getProductDetailsByPidAndCriteria(String pid, String criteria) {
        List<ProductDetails> list = new ArrayList<>();
        String sql = "SELECT pd.pd_id, pd.pdname, pd.pdimg, pd.pdcriteria, "
                + "pd.pdcolor, pd.pdquantity, pd.pdprice_discount,  "
                + "p.name, p.seller_id, p.price, p.product_id, pd.pddescribe, pd.pdspecification "
                + "FROM ProductDetails pd "
                + "JOIN Product p ON pd.product_id = p.product_id "
                + "WHERE pd.product_id = ? AND pd.pdcriteria = ?";
        try (PreparedStatement stm = new DBContext().conn.prepareStatement(sql)) {
            stm.setString(1, pid);

            // Ki?m tra và x? lý criteria n?u nó là null
            if (criteria != null) {
                stm.setString(2, criteria.trim());
            } else {
                stm.setString(2, "");
            }
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                int sellerId = rs.getInt("seller_id");

                int productDetailId = rs.getInt("pd_id");
                String productDetailName = rs.getString("pdname");
                String productImage = rs.getString("pdimg");
                String productCriteria = rs.getString("pdcriteria");
                String productColor = rs.getString("pdcolor");
                int productQuantity = rs.getInt("pdquantity");
                float discountPrice = rs.getFloat("pdprice_discount");
                String productName = rs.getString("name");
                float originalPrice = rs.getFloat("price");
                String productDescribe = rs.getString("pddescribe");
                String productSpecification = rs.getString("pdspecification");

                String[] images = productImage.split(",");

                // T?o ??i t??ng Product
                Product product = new Product(Integer.parseInt(pid), productName, null, originalPrice, null, 0, sellerId, 0);

                // T?o ??i t??ng ProductDetails
                ProductDetails productDetail = new ProductDetails(productDetailId, product, productDetailName, discountPrice, productColor, images, productCriteria, productQuantity, productDescribe, productSpecification);

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
        String sql = "SELECT pd.pd_id, pd.pdname, pd.pdimg, pd.pdcriteria, p.product_id ,"
                + "pd.pdcolor, pd.pdquantity, pd.pdprice_discount, p.name, p.price, p.seller_id, pd.pddescribe, pd.pdspecification "
                + "FROM ProductDetails pd "
                + "JOIN Product p ON pd.product_id = p.product_id "
                + "WHERE pd.product_id = ? AND pd.pdcolor LIKE N'%' +? + '%' AND pd.pdcriteria = ?";

        try (PreparedStatement stm = new DBContext().conn.prepareStatement(sql)) {
            stm.setString(1, pid);
            stm.setString(2, color.trim());
            stm.setString(3, criteria.trim());

            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                int productDetailId = rs.getInt("pd_id");
                int sellerId = rs.getInt("seller_id");
                String productDetailName = rs.getString("pdname");
                String productImage = rs.getString("pdimg");
                String productCriteria = rs.getString("pdcriteria");
                String productColor = rs.getString("pdcolor");
                int productQuantity = rs.getInt("pdquantity");
                float discountPrice = rs.getFloat("pdprice_discount");
                String productName = rs.getString("name");
                float originalPrice = rs.getFloat("price");
                String productDescribe = rs.getString("pddescribe");
                String productSpecification = rs.getString("pdspecification");

                String[] images = productImage.split(",");

                // T?o ??i t??ng Product
                Product product = new Product(Integer.parseInt(pid), productName, null, originalPrice, null, 0, sellerId, 0);

                // T?o ??i t??ng ProductDetails
                productDetails = new ProductDetails(productDetailId, product, productDetailName, discountPrice, productColor, images, productCriteria, productQuantity, productDescribe, productSpecification);
            }

            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailsDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return productDetails;
    }

    public ProductDetails getProductDetailById(int productDetailId) {
        ProductDetails productDetails = null;

        String sql = "SELECT p.product_id, p.name AS product_name, p.img AS product_image, p.price AS product_price, \n"
                + "p.title AS product_title, pd.pddescribe, pd.pdspecification, pd.pd_id, pd.pdname, pd.pdprice_discount, \n"
                + "pd.pdcolor, pd.pdimg AS product_detail_image, pd.pdcriteria, pd.pdquantity \n"
                + "FROM Product p \n"
                + "JOIN ProductDetails pd ON p.product_id = pd.product_id \n"
                + "WHERE pd.pd_id = ?";

        try (PreparedStatement stmt = new DBContext().conn.prepareStatement(sql)) {
            stmt.setInt(1, productDetailId);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // L?y thông tin s?n ph?m
                int productId = rs.getInt("product_id");
                String productName = rs.getString("product_name");
                String productImage = rs.getString("product_image");
                float productPrice = rs.getFloat("product_price");
                String productTitle = rs.getString("product_title");

                // T?o ??i t??ng Product
                Product product = new Product(productId, productName, productImage, productPrice, productTitle, 0, 0, 0);

                // L?y chi ti?t s?n ph?m
                String productDetailName = rs.getString("pdname");
                float priceDiscount = rs.getFloat("pdprice_discount");
                String productColor = rs.getString("pdcolor");
                String productDetailImage = rs.getString("product_detail_image");
                String productCriteria = rs.getString("pdcriteria");
                int productQuantity = rs.getInt("pdquantity");
                String productDescribe = rs.getString("pddescribe");
                String productSpecification = rs.getString("pdspecification");

                String[] images = productDetailImage.split(",");

                // T?o ??i t??ng ProductDetails
                productDetails = new ProductDetails(productDetailId, product, productDetailName, priceDiscount, productColor, images, productCriteria, productQuantity, productDescribe, productSpecification);
            }

            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailsDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return productDetails;
    }

    public ProductDetails getProductDetailByPid(String pdid) {
        ProductDetails productDetails = null;

        String sql = "SELECT p.product_id, p.name AS product_name, p.img AS product_image, p.price AS product_price, \n"
                + "p.title AS product_title, pd.pddescribe, pd.pdspecification, pd.pd_id, pd.pdname, pd.pdprice_discount, \n"
                + "pd.pdcolor, pd.pdimg AS product_detail_image, pd.pdcriteria, pd.pdquantity \n"
                + "FROM ProductDetails pd \n"
                + "JOIN Product p ON p.product_id = pd.product_id \n"
                + "WHERE pd.pd_id = ?";

        try (PreparedStatement stmt = new DBContext().conn.prepareStatement(sql)) {
            stmt.setString(1, pdid);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // L?y thông tin s?n ph?m
                int productId = rs.getInt("product_id");
                String productName = rs.getString("product_name");
                String productImage = rs.getString("product_image");
                float productPrice = rs.getFloat("product_price");
                String productTitle = rs.getString("product_title");

                // T?o ??i t??ng Product
                Product product = new Product(productId, productName, productImage, productPrice, productTitle, 0, 0, 0);

                // L?y chi ti?t s?n ph?m
                int productDetailId = rs.getInt("pd_id");
                String productDetailName = rs.getString("pdname");
                float priceDiscount = rs.getFloat("pdprice_discount");
                String productColor = rs.getString("pdcolor");
                String productDetailImage = rs.getString("product_detail_image");
                String productCriteria = rs.getString("pdcriteria");
                int productQuantity = rs.getInt("pdquantity");
                String productDescribe = rs.getString("pddescribe");
                String productSpecification = rs.getString("pdspecification");

                String[] images = (productDetailImage != null && !productDetailImage.isEmpty()) ? productDetailImage.split(",") : new String[0];

                // T?o ??i t??ng ProductDetails
                productDetails = new ProductDetails(productDetailId, product, productDetailName, priceDiscount, productColor, images, productCriteria, productQuantity, productDescribe, productSpecification);
            }

            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailsDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return productDetails;
    }

    public ProductDetails getProductByPid(String pid) {

        String sql = "SELECT p.product_id, p.name AS product_name, p.img AS product_image, p.price AS product_price,  "
                + "p.title AS product_title, pd.pddescribe, pd.pdspecification, pd.pd_id, pd.pdname, pd.pdprice_discount, "
                + "pd.pdcolor, pd.pdimg AS product_detail_image, pd.pdcriteria, pd.pdquantity "
                + "FROM Product p "
                + "JOIN ProductDetails pd ON p.product_id = pd.product_id "
                + "WHERE p.product_id = ?";

        try (PreparedStatement stmt = new DBContext().conn.prepareStatement(sql)) {
            stmt.setString(1, pid);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int productId = rs.getInt("product_id");
                String productName = rs.getString("product_name");
                String productImage = rs.getString("product_image");
                float productPrice = rs.getFloat("product_price");
                String productTitle = rs.getString("product_title");

                // T?o ??i t??ng Product
                Product product = new Product(productId, productName, productImage, productPrice, productTitle, 0, 0, 0);

                // L?y chi ti?t s?n ph?m
                int productDetailId = rs.getInt("pd_id");
                String productDetailName = rs.getString("pdname");
                float priceDiscount = rs.getFloat("pdprice_discount");
                String productColor = rs.getString("pdcolor");
                String productDetailImage = rs.getString("product_detail_image");
                String productCriteria = rs.getString("pdcriteria");
                int productQuantity = rs.getInt("pdquantity");
                String productDescribe = rs.getString("pddescribe");
                String productSpecification = rs.getString("pdspecification");

                // Tách chu?i hình ?nh n?u có nhi?u hình ?nh
                String[] images = productDetailImage.split(",");

                // T?o ??i t??ng ProductDetails
                ProductDetails productdetails = new ProductDetails(productDetailId, product, productDetailName, priceDiscount, productColor, images, productCriteria, productQuantity, productDescribe, productSpecification);
                return productdetails;
            }

            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailsDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return null;
    }

    public List<ProductDetails> getAllProducts() {
        List<ProductDetails> productDetailsList = new ArrayList<>();

        String sql = "WITH CTE AS (\n"
                + "SELECT p.product_id, p.name, p.img, p.price, p.title, pd.pddescribe, pd.pdspecification, \n"
                + "p.cid, pd.pdprice_discount,pd.pd_id,pd.pdcolor, pd.pdcriteria,\n"
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
                int cid = rs.getInt("cid");

                Product product = new Product(productId, productName, productImage, productPrice, productTitle, cid, 0, 0);

                int productDetailId = rs.getInt("pd_id");
                float priceDiscount = rs.getFloat("pdprice_discount");
                String productDetailCriteria = rs.getString("pdcriteria");
                String productDetailColor = rs.getString("pdcolor");
                String productDescribe = rs.getString("pddescribe");
                String productSpecification = rs.getString("pdspecification");

                ProductDetails productDetails = new ProductDetails(productDetailId, product, null, priceDiscount, productDetailColor, null, productDetailCriteria, 0, productDescribe, productSpecification);
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
        String sql = "SELECT DISTINCT pdcriteria FROM ProductDetails WHERE product_id = ?";

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

    public List<ProductDetails> getDiscountedProducts() throws SQLException {
        List<ProductDetails> discountedProducts = new ArrayList<>();
        String sql = "SELECT pd_id, pdname, pdprice_discount, pdcriteria, pdquantity FROM ProductDetails WHERE pdprice_discount > 0";

        try (PreparedStatement ps = new DBContext().conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ProductDetails pd = new ProductDetails();
                pd.setId(rs.getInt("pd_id"));
                pd.setName(rs.getString("pdname"));
                pd.setPriceDiscount(rs.getFloat("pdprice_discount"));
                pd.setCriteria(rs.getString("pdcriteria"));
                pd.setQuantity(rs.getInt("pdquantity"));
                discountedProducts.add(pd);
            }
        }
        return discountedProducts;
    }

    public List<ProductDetails> getProductDetailsByCategory(int cid) {
        List<ProductDetails> list = new ArrayList<>();
        String sql = "SELECT pd.pd_id, pd.pdname, pd.pdimg, pd.pdcriteria, "
                + "pd.pdcolor, pd.pdquantity, pd.pdprice_discount,  "
                + "p.name, p.price, p.product_id, p.img, pd.pddescribe, pd.pdspecification "
                + "FROM ProductDetails pd "
                + "JOIN Product p ON pd.product_id = p.product_id "
                + "JOIN Category c ON p.cid = c.cid "
                + "WHERE c.cid = ?";
        try (PreparedStatement stm = new DBContext().conn.prepareStatement(sql)) {
            stm.setInt(1, cid);

            // Ki?m tra và x? lý criteria n?u nó là null
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {

                int productId = rs.getInt("product_id");
                int productDetailId = rs.getInt("pd_id");
                String productDetailName = rs.getString("pdname");
                String productImage = rs.getString("pdimg");
                String productCriteria = rs.getString("pdcriteria");
                String productColor = rs.getString("pdcolor");
                int productQuantity = rs.getInt("pdquantity");
                float discountPrice = rs.getFloat("pdprice_discount");
                String productName = rs.getString("name");
                float originalPrice = rs.getFloat("price");
                String productImg = rs.getString("img");
                String productDescribe = rs.getString("pddescribe");
                String productSpecification = rs.getString("pdspecification");

                String[] images = productImage.split(",");

                // T?o ??i t??ng Product
                Product product = new Product(productId, productName, productImg, originalPrice, null, 0, 0, 0);

                // T?o ??i t??ng ProductDetails
                ProductDetails productDetail = new ProductDetails(productDetailId, product, productDetailName, discountPrice, productColor, images, productCriteria, productQuantity, productDescribe, productSpecification);

                list.add(productDetail);
            }

            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailsDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return list;
    }

    public List<ProductDetails> getAllProductsSortedByPriceDescending() {
        List<ProductDetails> list = new ArrayList<>();
        String sql = "SELECT pd.pd_id, pd.pdname, pd.pdimg, pd.pdcriteria, "
                + "pd.pdcolor, pd.pdquantity, pd.pdprice_discount, "
                + "p.name, p.price, p.product_id,p.img, pd.pddescribe, pd.pdspecification "
                + "FROM ProductDetails pd "
                + "JOIN Product p ON pd.product_id = p.product_id "
                + "ORDER BY pd.pdprice_discount DESC"; // S?p x?p gi?m d?n theo giá t? ProductDetails

        try (PreparedStatement stm = new DBContext().conn.prepareStatement(sql)) {
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                int productDetailId = rs.getInt("pd_id");
                String productDetailName = rs.getString("pdname");
                String productImage = rs.getString("pdimg");
                String productCriteria = rs.getString("pdcriteria");
                String productColor = rs.getString("pdcolor");
                int productQuantity = rs.getInt("pdquantity");
                float discountPrice = rs.getFloat("pdprice_discount");
                String productName = rs.getString("name");
                float originalPrice = rs.getFloat("price");
                String productImg = rs.getString("img");
                String productDescribe = rs.getString("pddescribe");
                String productSpecification = rs.getString("pdspecification");

                String[] images = productImage.split(",");

                // T?o ??i t??ng ProductDetails
                Product product = new Product(productId, productName, productImg, originalPrice, null, 0, 0, 0);

                // T?o ??i t??ng ProductDetails
                ProductDetails productDetail = new ProductDetails(productDetailId, product, productDetailName, discountPrice, productColor, images, productCriteria, productQuantity, productDescribe, productSpecification);

                list.add(productDetail);
            }

            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailsDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return list;
    }

    public List<ProductDetails> getAllProductsSortedByPriceAscending() {
        List<ProductDetails> list = new ArrayList<>();
        String sql = "SELECT pd.pd_id, pd.pdname, pd.pdimg, pd.pdcriteria, "
                + "pd.pdcolor, pd.pdquantity, pd.pdprice_discount, "
                + "p.name, p.price, p.product_id,p.img, pd.pddescribe, pd.pdspecification "
                + "FROM ProductDetails pd "
                + "JOIN Product p ON pd.product_id = p.product_id "
                + "ORDER BY pd.pdprice_discount ASC"; // S?p x?p gi?m d?n theo giá t? ProductDetails

        try (PreparedStatement stm = new DBContext().conn.prepareStatement(sql)) {
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                int productDetailId = rs.getInt("pd_id");
                String productDetailName = rs.getString("pdname");
                String productImage = rs.getString("pdimg");
                String productCriteria = rs.getString("pdcriteria");
                String productColor = rs.getString("pdcolor");
                int productQuantity = rs.getInt("pdquantity");
                float discountPrice = rs.getFloat("pdprice_discount");
                String productName = rs.getString("name");
                float originalPrice = rs.getFloat("price");
                String productImg = rs.getString("img");
                String productDescribe = rs.getString("pddescribe");
                String productSpecification = rs.getString("pdspecification");

                String[] images = productImage.split(",");

                // T?o ??i t??ng ProductDetails
                Product product = new Product(productId, productName, productImg, originalPrice, null, 0, 0, 0);

                // T?o ??i t??ng ProductDetails
                ProductDetails productDetail = new ProductDetails(productDetailId, product, productDetailName, discountPrice, productColor, images, productCriteria, productQuantity, productDescribe, productSpecification);

                list.add(productDetail);
            }

            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailsDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return list;
    }

    public List<ProductDetails> getProductDetailsByCategorySortedByPriceDescending(int cid) {
        List<ProductDetails> list = new ArrayList<>();
        String sql = "SELECT pd.pd_id, pd.pdname, pd.pdimg, pd.pdcriteria, "
                + "pd.pdcolor, pd.pdquantity, pd.pdprice_discount, "
                + "p.name, p.price, p.product_id, p.img, pd.pddescribe, pd.pdspecification "
                + "FROM ProductDetails pd "
                + "JOIN Product p ON pd.product_id = p.product_id "
                + "JOIN Category c ON p.cid = c.cid "
                + "WHERE c.cid = ? "
                + "ORDER BY p.price DESC"; // S?p x?p gi?m d?n theo giá

        try (PreparedStatement stm = new DBContext().conn.prepareStatement(sql)) {
            stm.setInt(1, cid);

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                int productDetailId = rs.getInt("pd_id");
                String productDetailName = rs.getString("pdname");
                String productImage = rs.getString("pdimg");
                String productCriteria = rs.getString("pdcriteria");
                String productColor = rs.getString("pdcolor");
                int productQuantity = rs.getInt("pdquantity");
                float discountPrice = rs.getFloat("pdprice_discount");
                String productName = rs.getString("name");
                float originalPrice = rs.getFloat("price");
                String productImg = rs.getString("img");
                String productDescribe = rs.getString("pddescribe");
                String productSpecification = rs.getString("pdspecification");

                String[] images = productImage.split(",");

                // T?o ??i t??ng Product
                Product product = new Product(productId, productName, productImg, originalPrice, null, 0, 0, 0);

                // T?o ??i t??ng ProductDetails
                ProductDetails productDetail = new ProductDetails(productDetailId, product, productDetailName, discountPrice, productColor, images, productCriteria, productQuantity, productDescribe, productSpecification);

                list.add(productDetail);
            }

            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailsDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return list;
    }

    public List<ProductDetails> getProductDetailsByCategorySortedByPriceAscending(int cid) {
        List<ProductDetails> list = new ArrayList<>();
        String sql = "SELECT pd.pd_id, pd.pdname, pd.pdimg, pd.pdcriteria, "
                + "pd.pdcolor, pd.pdquantity, pd.pdprice_discount, "
                + "p.name, p.price, p.product_id,p.img, pd.pddescribe, pd.pdspecification "
                + "FROM ProductDetails pd "
                + "JOIN Product p ON pd.product_id = p.product_id "
                + "JOIN Category c ON p.cid = c.cid "
                + "WHERE c.cid = ? "
                + "ORDER BY p.price ASC"; // S?p x?p gi?m d?n theo giá

        try (PreparedStatement stm = new DBContext().conn.prepareStatement(sql)) {
            stm.setInt(1, cid);

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                int productDetailId = rs.getInt("pd_id");
                String productDetailName = rs.getString("pdname");
                String productImage = rs.getString("pdimg");
                String productCriteria = rs.getString("pdcriteria");
                String productColor = rs.getString("pdcolor");
                int productQuantity = rs.getInt("pdquantity");
                float discountPrice = rs.getFloat("pdprice_discount");
                String productName = rs.getString("name");
                float originalPrice = rs.getFloat("price");
                String productImg = rs.getString("img");
                String productDescribe = rs.getString("pddescribe");
                String productSpecification = rs.getString("pdspecification");

                String[] images = productImage.split(",");

                // T?o ??i t??ng Product
                Product product = new Product(productId, productName, productImg, originalPrice, null, 0, 0, 0);

                // T?o ??i t??ng ProductDetails
                ProductDetails productDetail = new ProductDetails(productDetailId, product, productDetailName, discountPrice, productColor, images, productCriteria, productQuantity, productDescribe, productSpecification);

                list.add(productDetail);
            }

            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailsDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return list;
    }

    public List<ProductDetails> search(String keyword) {
        List<ProductDetails> list = new ArrayList<>();
        String sql = "SELECT pd.pd_id, pd.pdname, pd.pdimg, pd.pdcriteria, "
                + "pd.pdcolor, pd.pdquantity, pd.pdprice_discount, "
                + "p.name, p.price, p.product_id, p.img, pd.pddescribe, pd.pdspecification "
                + "FROM ProductDetails pd "
                + "JOIN Product p ON pd.product_id = p.product_id "
                + "WHERE pd.pdname LIKE ? OR p.name LIKE ?";

        try (PreparedStatement stm = new DBContext().conn.prepareStatement(sql)) {
            stm.setString(1, "%" + keyword + "%");
            stm.setString(2, "%" + keyword + "%");

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                int productDetailId = rs.getInt("pd_id");
                String productDetailName = rs.getString("pdname");
                String productImage = rs.getString("pdimg");
                String productCriteria = rs.getString("pdcriteria");
                String productColor = rs.getString("pdcolor");
                int productQuantity = rs.getInt("pdquantity");
                float discountPrice = rs.getFloat("pdprice_discount");
                String productName = rs.getString("name");
                float originalPrice = rs.getFloat("price");
                String productImg = rs.getString("img");
                String productDescribe = rs.getString("pddescribe");
                String productSpecification = rs.getString("pdspecification");

                String[] images = productImage.split(",");

                // T?o ??i t??ng Product
                Product product = new Product(productId, productName, productImg, originalPrice, null, 0, 0, 0);

                // T?o ??i t??ng ProductDetails
                ProductDetails productDetail = new ProductDetails(productDetailId, product, productDetailName, discountPrice, productColor, images, productCriteria, productQuantity, productDescribe, productSpecification);

                list.add(productDetail);
            }

            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailsDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }

        return list;
    }

    public static void main(String[] args) {
        ProductDetailsDAO pd = new ProductDetailsDAO();
        ProductDetails product = pd.getProductByPid("1");
        // System.out.println(product.get);

        List<ProductDetails> list = pd.getProductDetailsByPidAndCriteria("1", "128GB");
        for (ProductDetails pr : list) {
            System.out.println(pr);
        }
    }

}
