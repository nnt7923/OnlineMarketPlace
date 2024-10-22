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
                       select p.[name], p.img, p.product_id, SUM(od.quantity) as [best seller]
                       from Product p
                       join OrderDetail od on od.productid = p.product_id
                       join Orders o on o.order_id = od.order_id
                       group by p.[name], p.img, p.product_id
                       having SUM(od.quantity) > 5
                       """;
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("product_id"),
                        rs.getString("name"),
                        0,  // No price provided in this query
                        null,  // No title provided in this query
                        0,  // No cid
                        0,  // No brandId
                        0,  // No sellerId
                        rs.getString("img")
                );
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Method to get best-selling products (latest 3 products)
    public List<Product> bestSeller() {
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
        String sql = "SELECT product_id, name, img FROM Product WHERE seller_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, sellerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("product_id"),
                        rs.getString("name"),
                        0,  // price not provided in this query
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

    // Hàm thêm chi tiết sản phẩm vào ProductDetails
public void addProductDetails(ProductDetails productDetails) throws SQLException {
    String sql = "INSERT INTO ProductDetails (product_id, pdname, pdprice_discount, pdcolor, pdimg, pdcriteria, pdquantity, pddescribe, pdspecification) "
               + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

    // Lấy tên sản phẩm từ bảng Product dựa vào product_id
    String pdname = getProductNameByProductId(productDetails.getProductId());

    try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, productDetails.getProductId());
        ps.setString(2, pdname); // pdname tự động lấy từ bảng Product
        ps.setDouble(3, productDetails.getPdpriceDiscount());
        ps.setString(4, productDetails.getPdcolor());
        ps.setString(5, productDetails.getPdimg());  // Chuỗi đường dẫn ảnh
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
                String pdimg = rs.getString("pdimg");
                String pdcriteria = rs.getString("pdcriteria");
                int pdquantity = rs.getInt("pdquantity");
                String pddescribe = rs.getString("pddescribe");
                String pdspecification = rs.getString("pdspecification");

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
        String sql = "UPDATE ProductDetails SET pdname = ?, pdprice_discount = ?, pdcolor = ?, pdimg = ?, pdcriteria = ?, pdquantity = ?, pddescribe = ?, pdspecification = ? WHERE pd_id = ?";

        try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, productDetails.getPdname());
            ps.setDouble(2, productDetails.getPdpriceDiscount());
            ps.setString(3, productDetails.getPdcolor());
            ps.setString(4, productDetails.getPdimg());
            ps.setString(5, productDetails.getPdcriteria());
            ps.setInt(6, productDetails.getPdquantity());
            ps.setString(7, productDetails.getPddescribe());
            ps.setString(8, productDetails.getPdspecification());
            ps.setInt(9, productDetails.getPdId());
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
                String pdimg = rs.getString("pdimg");
                String pdcriteria = rs.getString("pdcriteria");
                int pdquantity = rs.getInt("pdquantity");
                String pddescribe = rs.getString("pddescribe");
                String pdspecification = rs.getString("pdspecification");

                // Tạo đối tượng ProductDetails với dữ liệu từ cơ sở dữ liệu
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
            ps.setInt(1, sellerId);  // Truyền sellerId vào câu truy vấn
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int pdId = rs.getInt("pd_id");
                int productId = rs.getInt("product_id");
                String pdname = rs.getString("pdname");
                double pdpriceDiscount = rs.getDouble("pdprice_discount");
                String pdcolor = rs.getString("pdcolor");
                String pdimg = rs.getString("pdimg");
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
        List<Product> products = productDAO.bestSeller();
        for (Product product : products) {
            System.out.println(product.getName());
        }
    }
}
