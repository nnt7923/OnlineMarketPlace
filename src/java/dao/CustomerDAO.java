/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import model.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import model.Customer;
import java.sql.ResultSet;

/**
 *
 * @author Admin
 */
public class CustomerDAO extends DBContext {

    public boolean updateCustomer(Customer customer) {
        String sql = "UPDATE Customer SET customer_name = ?, customer_type = ?, customer_dob = ?, customer_gender = ?, customer_images = ? WHERE customer_id = ?";
        try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, customer.getCustomerName());
            ps.setString(2, customer.getCustomerType());
            ps.setDate(3, (java.sql.Date) (Date) customer.getCustomerDob());
            ps.setString(4, customer.getCustomerGender());
            ps.setString(5, customer.getCustomerImages());
            ps.setInt(6, customer.getCustomerId());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public boolean insertCustomer(Customer customer) {
        String sql = "INSERT INTO Customer (customer_name, customer_type, account_id, customer_dob, customer_gender, customer_images) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, customer.getCustomerName());
            ps.setString(2, customer.getCustomerType());
            ps.setInt(3, customer.getAccountId());

            if (customer.getCustomerDob() != null) {
                ps.setDate(4, new java.sql.Date(customer.getCustomerDob().getTime()));
            } else {
                ps.setNull(4, java.sql.Types.DATE);
            }

            ps.setString(5, customer.getCustomerGender());
            ps.setString(6, customer.getCustomerImages());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public Customer getCustomerByAccountId(int accountId) {
        Customer customer = null;
        String sql = "SELECT * FROM Customer WHERE account_id = ?";

        try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, accountId); 
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                customer = new Customer();
                customer.setCustomerId(rs.getInt("customer_id"));
                customer.setCustomerName(rs.getString("customer_name"));
                customer.setCustomerType(rs.getString("customer_type"));
                customer.setAccountId(rs.getInt("account_id"));
                customer.setCustomerDob(rs.getDate("customer_dob"));
                customer.setCustomerGender(rs.getString("customer_gender"));
                customer.setCustomerImages(rs.getString("customer_images"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    
}
