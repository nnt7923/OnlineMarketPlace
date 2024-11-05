package dao;

import context.DBContext;
import model.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.ProductDetails;

public class ProductDAO extends DBContext {
    
   

    public List<Product> getProductsByCategoryId(int cid) {
        List<Product> products = new ArrayList<>();

        String query = "SELECT product_id, name, img, price, title, cid FROM Product WHERE cid = ?";

        try (PreparedStatement ps = conn.prepareStatement(query)) {
            // G�n categoryId v�o c�u truy v?n SQL
            ps.setInt(1, cid);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("product_id");
                String productName = rs.getString("name");
                String productImage = rs.getString("img");
                double productPrice = rs.getDouble("price");
                String productTitle = rs.getString("title");

                // Ch? t?o ??i t??ng Product m� kh�ng c?n th�ng tin chi ti?t
                Product product = new Product(productId, productName, productImage, productPrice, productTitle, cid, 0, 0);
                products.add(product);
            }

            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }

    public List<Product> getHighestPrice() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product ORDER BY price DESC";

        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("product_id"),
                        rs.getString("pdname"),
                        rs.getString("pdimg"));
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> advertiseProduct() {
        List<Product> list = new ArrayList<>();
        String query = """
                       select pd.pdname, pd.pdimg, pd.product_id, SUM(od.quantity) as [hot product]
                                              from ProductDetails pd
                                              join OrderDetail od on od.pd_id = pd.pd_id
                                              join Orders o on o.order_id = od.order_id
                                              group by pd.pdname, pd.pdimg, pd.product_id
                                              having SUM(od.quantity) > 5
                       """;
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("product_id"),
                        rs.getString("pdname"),
                        rs.getString("pdimg"));
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Method to get best-selling products (latest 3 products)
    public List<Product> newProduct() {
        List<Product> list = new ArrayList<>();
        String query = """
                       select top 4 * 
                       from Product
                       order by product_id desc
                       """;
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("product_id"),
                        rs.getString("name"),
                        rs.getString("img"),
                        rs.getDouble("price"),
                        rs.getString("title"),
                        rs.getInt("cid"),
                        rs.getInt("brand_id"),
                        rs.getInt("seller_id")
                );
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<ProductDetails> getProductDetailsByProductId(int productId) {
        List<ProductDetails> productDetailsList = new ArrayList<>();
        String sql = "SELECT pd.pd_id, pd.pdcolor, pd.pdprice_discount, pd.pdquantity, pd.pddescribe "
                + "FROM ProductDetails pd "
                + "WHERE pd.product_id = ?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
//                Product product = new Product(productId, null, null);
                Product product = new Product();
                product.setProductId(productId);
                ProductDetails productDetails = new ProductDetails(
                        rs.getInt("pd_id"),
                        product,
                        null,
                        rs.getFloat("pdprice_discount"),
                        rs.getString("pdcolor"),
                        null,
                        null,
                        rs.getInt("pdquantity"),
                        rs.getString("pddescribe"),
                        null
                );
                productDetailsList.add(productDetails);
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }
        return productDetailsList;
    }

    public void addProductFromForm(Product product, int accountId) throws SQLException {
        String sql = "INSERT INTO Product (name, price, title, cid, brand_id, seller_id, img) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, product.getName());
            ps.setDouble(2, product.getPrice());
            ps.setString(3, product.getTitle());
            ps.setInt(4, product.getCid());
            ps.setInt(5, product.getBrandId());
            ps.setInt(6, product.getSellerId());
            ps.setString(7, product.getImg());  // Insert the image path
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public Product getProductById(int productId) throws SQLException {
        String query = "SELECT * FROM Product WHERE product_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Product(
                        rs.getInt("product_id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("title"),
                        rs.getString("img")
                );
            }
        }
        return null;
    }

    public void deleteProduct(int productId) throws SQLException {
        String query = "DELETE FROM Product WHERE product_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, productId);
            ps.executeUpdate();
        }
    }

    // Method to get product name based on product_id
    public String getProductNameByProductId(int productId) throws SQLException {
        String sql = "SELECT name FROM Product WHERE product_id = ?";
        String productName = null;
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                productName = rs.getString("name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        return productName;
    }

    // Method to get products by seller_id
    public List<Product> getProductsBySellerId(int sellerId) throws SQLException {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT product_id, name, img,price FROM Product WHERE seller_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, sellerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("product_id"),
                        rs.getString("name"),
                        rs.getString("img"),
                        rs.getDouble("price"),
                        null,
                        0,
                        0,
                        sellerId
                );
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        return productList;
    }
// Cập nhật sản phẩm

    public void updateProduct(Product product) throws SQLException {
        String query = "UPDATE Product SET name = ?, price = ?, title = ?, cid = ?, brand_id = ?, img = ? WHERE product_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, product.getName());
            ps.setDouble(2, product.getPrice());
            ps.setString(3, product.getTitle());
            ps.setInt(4, product.getCid());  // Cập nhật danh mục
            ps.setInt(5, product.getBrandId());  // Cập nhật thương hiệu
            ps.setString(6, product.getImg());   // Cập nhật đư�?ng dẫn ảnh
            ps.setInt(7, product.getProductId()); // �?i�?u kiện WHERE cho product_id
            ps.executeUpdate();
        }
    }

    // Hàm thêm chi tiết sản phẩm vào ProductDetails
    public void addProductDetails(ProductDetails productDetails) throws SQLException {
        String sql = "INSERT INTO ProductDetails (product_id, pdname, pdprice_discount, pdcolor, pdimg, pdcriteria, pdquantity, pddescribe, pdspecification) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        // Join image paths array into a single comma-separated string
        String pdimgString = String.join(",", productDetails.getImage());

        try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productDetails.getProduct().getProductId());
            ps.setString(2, productDetails.getName()); // pdname should be set from the product name
            ps.setDouble(3, productDetails.getPriceDiscount());
            ps.setString(4, productDetails.getColor());
            ps.setString(5, pdimgString);  // Use the concatenated string of image paths
            ps.setString(6, productDetails.getCriteria());
            ps.setInt(7, productDetails.getQuantity());
            ps.setString(8, productDetails.getDescribe());
            ps.setString(9, productDetails.getSpecification());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    // Hàm lấy tất cả các chi tiết sản phẩm từ ProductDetails
    public List<ProductDetails> getAllProductDetails() throws SQLException {
        List<ProductDetails> productDetailsList = new ArrayList<>();
        String sql = "SELECT * FROM ProductDetails";

        try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int pd_id = rs.getInt("pd_id");
                int productId = rs.getInt("product_id");
                String pdname = rs.getString("pdname");
                float pdpriceDiscount = rs.getFloat("pdprice_discount");
                String pdcolor = rs.getString("pdcolor");

                // Retrieve the image paths as a single string and split it into an array
                String pdimgString = rs.getString("pdimg");
                String[] pdimg = pdimgString != null ? pdimgString.split(",") : new String[0];

                String pdcriteria = rs.getString("pdcriteria");
                int pdquantity = rs.getInt("pdquantity");
                String pddescribe = rs.getString("pddescribe");
                String pdspecification = rs.getString("pdspecification");
                Product product = new Product(productId, null, null);
                // Create ProductDetails object with image array
                ProductDetails productDetails = new ProductDetails(pd_id, product, pdname, pdpriceDiscount, pdcolor, pdimg, pdcriteria, pdquantity, pddescribe, pdspecification);
                productDetailsList.add(productDetails);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }

        return productDetailsList;
    }

    // Hàm xóa ProductDetails dựa vào pd_id
    public void deleteProductDetails(int pd_id) throws SQLException {
        String sql = "DELETE FROM ProductDetails WHERE pd_id = ?";

        try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, pd_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    // Hàm cập nhật ProductDetails
    public void updateProductDetails(ProductDetails productDetails) throws SQLException {
        String sql;
        boolean hasNewImages = productDetails.getImage() != null && productDetails.getImage().length > 0;

        if (hasNewImages) {
            // Query includes pdimg if new images are provided
            sql = "UPDATE ProductDetails SET pdprice_discount = ?, pdcolor = ?, pdimg = ?, pdcriteria = ?, pdquantity = ?, pddescribe = ?, pdspecification = ? WHERE pd_id = ?";
        } else {
            // Query excludes pdimg if no new images are provided
            sql = "UPDATE ProductDetails SET pdprice_discount = ?, pdcolor = ?, pdcriteria = ?, pdquantity = ?, pddescribe = ?, pdspecification = ? WHERE pd_id = ?";
        }

        try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setDouble(1, productDetails.getPriceDiscount());
            ps.setString(2, productDetails.getColor());

            if (hasNewImages) {
                // Convert image paths to a comma-separated string and set it
                String pdimgString = String.join(",", productDetails.getImage());
                ps.setString(3, pdimgString);
                ps.setString(4, productDetails.getCriteria());
                ps.setInt(5, productDetails.getQuantity());
                ps.setString(6, productDetails.getDescribe());
                ps.setString(7, productDetails.getSpecification());
                ps.setInt(8, productDetails.getId());
            } else {
                // Skip pdimg and adjust indices for remaining parameters
                ps.setString(3, productDetails.getCriteria());
                ps.setInt(4, productDetails.getQuantity());
                ps.setString(5, productDetails.getDescribe());
                ps.setString(6, productDetails.getSpecification());
                ps.setInt(7, productDetails.getId());
            }

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public ProductDetails getProductDetailsById(int pdId) throws SQLException {
        ProductDetails productDetails = null;
        String sql = "SELECT * FROM ProductDetails WHERE pd_id = ?";

        try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, pdId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int productId = rs.getInt("product_id");
                String pdname = rs.getString("pdname");
                float pdpriceDiscount = rs.getFloat("pdprice_discount");
                String pdcolor = rs.getString("pdcolor");

                // Retrieve pdimg as a comma-separated string and convert to array
                String pdimgString = rs.getString("pdimg");
                String[] pdimg = pdimgString != null ? pdimgString.split(",") : new String[0];

                String pdcriteria = rs.getString("pdcriteria");
                int pdquantity = rs.getInt("pdquantity");
                String pddescribe = rs.getString("pddescribe");
                String pdspecification = rs.getString("pdspecification");

                Product product = new Product(productId, null, null);
                productDetails = new ProductDetails(pdId, product, pdname, pdpriceDiscount, pdcolor, pdimg, pdcriteria, pdquantity, pddescribe, pdspecification);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }

        return productDetails;
    }

    public List<ProductDetails> getProductDetailsBySellerId(int sellerId) throws SQLException {
        List<ProductDetails> productDetailsList = new ArrayList<>();
        String sql = "SELECT pd.* FROM ProductDetails pd "
                + "JOIN Product p ON pd.product_id = p.product_id "
                + "WHERE p.seller_id = ?";

        try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, sellerId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int pdId = rs.getInt("pd_id");
                int productId = rs.getInt("product_id");
                String pdname = rs.getString("pdname");
                float pdpriceDiscount = rs.getFloat("pdprice_discount");
                String pdcolor = rs.getString("pdcolor");

                // Retrieve pdimg as a comma-separated string and convert to array
                String pdimgString = rs.getString("pdimg");
                String[] pdimg = pdimgString != null ? pdimgString.split(",") : new String[0];

                String pdcriteria = rs.getString("pdcriteria");
                int pdquantity = rs.getInt("pdquantity");
                String pddescribe = rs.getString("pddescribe");
                String pdspecification = rs.getString("pdspecification");

                Product product = new Product(productId, null, null);
                ProductDetails productDetails = new ProductDetails(pdId, product, pdname, pdpriceDiscount, pdcolor, pdimg, pdcriteria, pdquantity, pddescribe, pdspecification);
                productDetailsList.add(productDetails);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }

        return productDetailsList;
    }
    

    public List<Product> getProductByCategory(int cid) {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT product_id, name, img, price, title, cid, brand_id, seller_id "
                + "FROM Product "
                + "WHERE cid = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, cid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("product_id"),
                        rs.getString("name"),
                        rs.getString("img"),
                        rs.getDouble("price"),
                        rs.getString("title"),
                        rs.getInt("cid"),
                        rs.getInt("brand_id"),
                        rs.getInt("seller_id")
                );
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }

    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAO();
        List<ProductDetails> products = productDAO.getProductDetailsByProductId(4);
        for (ProductDetails p : products) {
            System.out.println(p.getProduct().getProductId());
        }

    }
}
