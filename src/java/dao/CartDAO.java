/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Cart;
import model.CartDetail;
import model.Product;
import model.ProductDetails;

/**
 *
 * @author Admin
 */
public class CartDAO extends DBContext {

    public boolean isAccountExist(int accountId) {
        String sql = "SELECT account_id FROM Account WHERE account_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", e);
            return false;
        }
    }

    public ProductDetails getProductDetailById(int productDetailId) {
        try {
            String sql = "SELECT pd.pd_id, pd.pdname, pd.pdimg, pd.pdcriteria, pd.pdcolor, pd.pdquantity, pd.pdprice_discount, p.name, p.product_id, p.img \n"
                    + "FROM ProductDetails pd \n"
                    + "JOIN Product p ON pd.product_id = p.product_id \n"
                    + "WHERE pd.pd_id = ?";
            PreparedStatement stm = new DBContext().conn.prepareStatement(sql);
            stm.setInt(1, productDetailId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int pdid = rs.getInt("pd_id");
                String pdname = rs.getString("pdname");
                String pdimg = rs.getString("pdimg");
                String pdcriteria = rs.getString("pdcriteria");
                String pdcolor = rs.getString("pdcolor");
                int pdquantity = rs.getInt("pdquantity");
                float pdprice = rs.getFloat("pdprice_discount");

                int pid = rs.getInt("product_id");
                String pname = rs.getString("name");
                String pimg = rs.getString("img");

                String[] images = pdimg.split(",");

                Product product = new Product(pid, pname, pimg, 0, null, 0, 0, 0);

                return new ProductDetails(pdid, product, pdname, pdprice, pdcolor, images, pdcriteria, pdquantity, null, null);
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }
        return null;
    }

    public Cart getCartByAccountId(int accountId) {
        Cart cart = null;
        try {
            String checkCartSql = "SELECT cart_id FROM Cart WHERE account_id = ?";
            PreparedStatement checkCartPs = new DBContext().conn.prepareStatement(checkCartSql);
            checkCartPs.setInt(1, accountId);
            ResultSet checkCartRs = checkCartPs.executeQuery();

            int cartId = -1;
            if (checkCartRs.next()) {
                cartId = checkCartRs.getInt("cart_id");
            }
            checkCartRs.close();
            checkCartPs.close();

            if (cartId == -1) {
                cart = new Cart();
                Account account = new Account();
                account.setAccountId(accountId);
                cart.setAccount(account);
                insertCart(cart);
                cartId = cart.getCartId();
            }

            String sql = "SELECT c.cart_id, c.account_id, cd.pd_id, cd.quantity \n"
                    + "FROM Cart c \n"
                    + "LEFT JOIN CartDetails cd ON c.cart_id = cd.cart_id \n"
                    + "WHERE c.account_id = ?";
            PreparedStatement ps = new DBContext().conn.prepareStatement(sql);
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();

            Account account = new Account();
            account.setAccountId(accountId);

            while (rs.next()) {
                if (cart == null) {
                    cart = new Cart();
                    cart.setCartId(rs.getInt("cart_id"));
                    cart.setAccount(account);
                    cart.setItems(new ArrayList<>());
                }

                if (rs.getInt("pd_id") != 0) {
                    CartDetail cartDetail = new CartDetail();
                    cartDetail.setId(rs.getInt("pd_id"));
                    cartDetail.setQuantity(rs.getInt("quantity"));

                    ProductDetails productDetail = getProductDetailById(rs.getInt("pd_id"));
                    cartDetail.setPd(productDetail);

                    cart.getItems().add(cartDetail);
                }
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", e);
        }
        return cart;
    }

    public void deleteCartDetail(int productDetailId, int cartId) {
        try {
            String sql = "DELETE FROM CartDetails WHERE cart_id = ? AND pd_id = ?";
            PreparedStatement ps = new DBContext().conn.prepareStatement(sql);
            ps.setInt(1, cartId);
            ps.setInt(2, productDetailId);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", e);
        }
    }

    public Integer getCartIdByAccountId(String accountId) {
        int cartId = -1;
        String sql = "SELECT cu.customer_id "
                + "FROM Customer cu "
                + "JOIN Account ac ON cu.account_id = ac.account_id "
                + "WHERE ac.account_id = ?";

        try (PreparedStatement stm = new DBContext().conn.prepareStatement(sql);) {

            stm.setString(1, accountId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                cartId = rs.getInt("customer_id");
            }

            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cartId;
    }

    public void insertCart(Cart cart) {
        try {
            String sql = "INSERT INTO Cart (aid) VALUES (?)";
            PreparedStatement ps = new DBContext().conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setInt(1, cart.getAccount().getAccountId());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                cart.setCartId(rs.getInt(1));
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", e);
        }
    }

    public void insertCartDetail(CartDetail cartDetail, int cartId) {
        try {
            String checkCartSql = "SELECT cart_id FROM Cart WHERE cart_id = ?";
            PreparedStatement checkCartPs = new DBContext().conn.prepareStatement(checkCartSql);
            checkCartPs.setInt(1, cartId);
            ResultSet checkCartRs = checkCartPs.executeQuery();

            if (!checkCartRs.next()) {
                throw new SQLException("cart_id không t?n t?i.");
            }

            String sql = "INSERT INTO CartDetails (cart_id, pd_id, quantity) VALUES (?, ?, ?)";
            PreparedStatement ps = new DBContext().conn.prepareStatement(sql);
            ps.setInt(1, cartId);
            ps.setInt(2, cartDetail.getPd().getId());
            ps.setInt(3, cartDetail.getQuantity());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", e);
        }
    }

    public void updateCartDetail(CartDetail cartDetail, int cartId) {
        try {
            String sql = "UPDATE CartDetails SET quantity = ? WHERE cart_id = ? AND pd_id = ?";
            PreparedStatement ps = new DBContext().conn.prepareStatement(sql);
            ps.setInt(1, cartDetail.getQuantity());
            ps.setInt(2, cartId);
            ps.setInt(3, cartDetail.getPd().getId());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", e);
        }
    }
    
    public void clearCart(int aid) {
        try {
            String sql = "DELETE FROM CartDetails WHERE cart_id = (SELECT cart_id FROM Cart WHERE account_id = ?)";
            PreparedStatement stm = new DBContext().conn.prepareStatement(sql);
            stm.setInt(1, aid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        CartDAO pd = new CartDAO();
        Cart cart = pd.getCartByAccountId(17);
        System.out.println(cart);

    }

}
