package dao;

import context.DBContext;
import model.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.ProductDetails;

public class ProductDAO extends DBContext {

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
                       select top 3 * 
                       from Product
                       order by product_id desc
                       """;
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("product_id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("title"),
                        rs.getInt("cid"),
                        rs.getInt("brand_id"),
                        rs.getInt("seller_id"),
                        rs.getString("img")
                );
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    
        public List<ProductDetails> getProductDetailsByProductId(int productId) throws SQLException {
        List<ProductDetails> productDetailsList = new ArrayList<>();
        String sql = "SELECT pd.pd_id, pd.pdcolor, pd.pdprice_discount, pd.pdquantity, pd.pddescribe " +
                     "FROM ProductDetails pd " +
                     "WHERE pd.product_id = ?";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ProductDetails productDetails = new ProductDetails(
                    rs.getInt("pd_id"),
                    productId, 
                    rs.getString("pdcolor"), 
                    rs.getDouble("pdprice_discount"), 
                    rs.getInt("pdquantity"), 
                    rs.getString("pddescribe")
                );
                productDetailsList.add(productDetails);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
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
                         rs.getDouble("price"),  // price not provided in this query
                        null,  // title not provided in this query
                        0,  // cid
                        0,  // brandId
                        sellerId,
                        rs.getString("img")
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
        ps.setString(6, product.getImg());   // Cập nhật đường dẫn ảnh
        ps.setInt(7, product.getProductId()); // Điều kiện WHERE cho product_id
        ps.executeUpdate();
    }
}

    // Hàm thêm chi tiết sản phẩm vào ProductDetails
public void addProductDetails(ProductDetails productDetails) throws SQLException {
    String sql = "INSERT INTO ProductDetails (product_id, pdname, pdprice_discount, pdcolor, pdimg, pdcriteria, pdquantity, pddescribe, pdspecification) "
               + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

    // Join image paths array into a single comma-separated string
    String pdimgString = String.join(",", productDetails.getPdimg());

    try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, productDetails.getProductId());
        ps.setString(2, productDetails.getPdname()); // pdname should be set from the product name
        ps.setDouble(3, productDetails.getPdpriceDiscount());
        ps.setString(4, productDetails.getPdcolor());
        ps.setString(5, pdimgString);  // Use the concatenated string of image paths
        ps.setString(6, productDetails.getPdcriteria());
        ps.setInt(7, productDetails.getPdquantity());
        ps.setString(8, productDetails.getPddescribe());
        ps.setString(9, productDetails.getPdspecification());
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
            double pdpriceDiscount = rs.getDouble("pdprice_discount");
            String pdcolor = rs.getString("pdcolor");

            // Retrieve the image paths as a single string and split it into an array
            String pdimgString = rs.getString("pdimg");
            String[] pdimg = pdimgString != null ? pdimgString.split(",") : new String[0];

            String pdcriteria = rs.getString("pdcriteria");
            int pdquantity = rs.getInt("pdquantity");
            String pddescribe = rs.getString("pddescribe");
            String pdspecification = rs.getString("pdspecification");

            // Create ProductDetails object with image array
            ProductDetails productDetails = new ProductDetails(pd_id, productId, pdname, pdpriceDiscount, pdcolor, pdimg, pdcriteria, pdquantity, pddescribe, pdspecification);
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
    String sql = "UPDATE ProductDetails SET pdprice_discount = ?, pdcolor = ?, pdimg = ?, pdcriteria = ?, pdquantity = ?, pddescribe = ?, pdspecification = ? WHERE pd_id = ?";

    // Convert the array of image paths to a comma-separated string
    String pdimgString = String.join(",", productDetails.getPdimg());

    try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setDouble(1, productDetails.getPdpriceDiscount());
        ps.setString(2, productDetails.getPdcolor());
        ps.setString(3, pdimgString); // Set the concatenated image paths
        ps.setString(4, productDetails.getPdcriteria());
        ps.setInt(5, productDetails.getPdquantity());
        ps.setString(6, productDetails.getPddescribe());
        ps.setString(7, productDetails.getPdspecification());
        ps.setInt(8, productDetails.getPdId());
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
            double pdpriceDiscount = rs.getDouble("pdprice_discount");
            String pdcolor = rs.getString("pdcolor");

            // Retrieve pdimg as a comma-separated string and convert to array
            String pdimgString = rs.getString("pdimg");
            String[] pdimg = pdimgString != null ? pdimgString.split(",") : new String[0];

            String pdcriteria = rs.getString("pdcriteria");
            int pdquantity = rs.getInt("pdquantity");
            String pddescribe = rs.getString("pddescribe");
            String pdspecification = rs.getString("pdspecification");

            productDetails = new ProductDetails(pdId, productId, pdname, pdpriceDiscount, pdcolor, pdimg, pdcriteria, pdquantity, pddescribe, pdspecification);
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
            double pdpriceDiscount = rs.getDouble("pdprice_discount");
            String pdcolor = rs.getString("pdcolor");

            // Retrieve pdimg as a comma-separated string and convert to array
            String pdimgString = rs.getString("pdimg");
            String[] pdimg = pdimgString != null ? pdimgString.split(",") : new String[0];

            String pdcriteria = rs.getString("pdcriteria");
            int pdquantity = rs.getInt("pdquantity");
            String pddescribe = rs.getString("pddescribe");
            String pdspecification = rs.getString("pdspecification");

            ProductDetails productDetails = new ProductDetails(pdId, productId, pdname, pdpriceDiscount, pdcolor, pdimg, pdcriteria, pdquantity, pddescribe, pdspecification);
            productDetailsList.add(productDetails);
        }
    } catch (SQLException e) {
        e.printStackTrace();
        throw e;
    }

    return productDetailsList;
}


    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAO();
        List<Product> products = productDAO.newProduct();
        for (Product product : products) {
            System.out.println(product.getName());
        }
    }
}
