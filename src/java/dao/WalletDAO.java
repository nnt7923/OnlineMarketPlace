/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Customer;
import model.Wallet;

/**
 *
 * @author Admin
 */
public class WalletDAO {

    public Wallet getWalletByCustomerId(int customerId) {
        try {
            String sql = "SELECT w.wallet_id, w.wallet_balance, w.customer_id, "
                    + "c.customer_name FROM Wallet w "
                    + "JOIN Customer c ON w.customer_id = c.customer_id "
                    + "WHERE w.customer_id = ?";
            PreparedStatement st = new DBContext().conn.prepareStatement(sql);
            st.setInt(1, customerId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                int walletId = rs.getInt("wallet_id");
                float walletBalance = rs.getFloat("wallet_balance");

                // Assuming Customer has a constructor like Customer(int id, String name, String email)
                Customer customer = new Customer();
                customer.setCustomerId(rs.getInt("customer_id"));
                customer.setCustomerName(rs.getString("customer_name"));
                Wallet wallet = new Wallet();
                wallet.setId(walletId);
                wallet.setBalance(walletBalance);
                wallet.setCustomer(customer);

                return wallet;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        WalletDAO w = new WalletDAO();
        Wallet wallet = w.getWalletByCustomerId(9);
        // System.out.println(product.get);

        System.out.println(wallet);
    }
}
