package dao;

import context.DBContext;
import model.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends DBContext {


    public List<Product> advertiseProduct() {
        List<Product> list = new ArrayList<>();
        String query = """
            select pd.pdname, pd.pdimg, pd.product_id, SUM(od.quantity) as [advertise]
            from ProductDetails pd
            join OrderDetail od on od.pd_id = pd.pd_id
            join Orders o on o.order_id = od.order_id
            group by pd.pdname, pd.pdimg, pd.product_id
            having SUM(od.quantity) > 5
                       """;
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product products = new Product(
                        rs.getInt("product_id"),
                        rs.getString("name"),
                        rs.getString("img")
                );
                list.add(products);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Product> bestSeller(){
        List<Product> list = new ArrayList<>();
        String query = """
                       select top 3 * 
                       from Product
                       order by product_id desc
                       """;
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product products = new Product(
                        rs.getInt("product_id"),
                    rs.getString("name"),
                    rs.getString("img"),
                    rs.getDouble("price"),
                    rs.getString("title"),
                    rs.getInt("cateID"),
                    rs.getInt("seller_id"),
                    rs.getInt("brand_id")
                );
                list.add(products);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAO();
        List<Product> products = productDAO.bestSeller();
        for (Product product : products) {
            System.out.println(product.getName());
        }
    }
}
