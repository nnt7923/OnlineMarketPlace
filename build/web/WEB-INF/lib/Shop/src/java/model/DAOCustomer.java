package model;

import entity.Customer;
import java.sql.*;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOCustomer extends DBConnect {

    public int insertCustomer(Customer customer) {
        int n = 0;
        String sql = "INSERT INTO Customer (cid, cname, username, password, address, phone, status, isAdmin) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, customer.getCid());
            pre.setString(2, customer.getCname());
            pre.setString(3, customer.getUsername());
            pre.setString(4, customer.getPassword());
            pre.setString(5, customer.getAddress());
            pre.setString(6, customer.getPhone());
            pre.setBoolean(7, customer.isStatus());
            pre.setBoolean(8, customer.isAdmin());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateCustomer(Customer customer) {
        int n = 0;
        String sql = "UPDATE Customer SET cname = ?, username = ?, password = ?, address = ?, phone = ?, status = ?, isAdmin = ? WHERE cid = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, customer.getCname());
            pre.setString(2, customer.getUsername());
            pre.setString(3, customer.getPassword());
            pre.setString(4, customer.getAddress());
            pre.setString(5, customer.getPhone());
            pre.setBoolean(6, customer.isStatus());
            pre.setBoolean(7, customer.isAdmin());
            pre.setInt(8, customer.getCid());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteCustomer(int cid) {
        int n = 0;
        String sql = "DELETE FROM Customer WHERE cid = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, cid);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Customer getCustomer(int cid) {
        Customer customer = null;
        String sql = "SELECT * FROM Customer WHERE cid = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, cid);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                String cname = rs.getString("cname");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                boolean status = rs.getBoolean("status");
                boolean isAdmin = rs.getBoolean("isAdmin");
                customer = new Customer(cid, cname, username, password, address, phone, status, isAdmin);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customer;
    }

    public Vector<Customer> getAllCustomers(String sql) {
        Vector<Customer> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int cid = rs.getInt("cid");
                String cname = rs.getString("cname");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                boolean status = rs.getBoolean("status");
                boolean isAdmin = rs.getBoolean("isAdmin");
                Customer customer = new Customer(cid, cname, username, password, address, phone, status, isAdmin);
                vector.add(customer);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

//    public void addCustomer(Customer customer) {
//        String query = "INSERT INTO Customers (cname, username, password, address, phone, status, isAdmin) VALUES (?, ?, ?, ?, ?, ?, ?)";
//        try (PreparedStatement ps = connection.prepareStatement(query)) {
//            ps.setString(1, customer.getCname());
//            ps.setString(2, customer.getUsername());
//            ps.setString(3, customer.getPassword());
//            ps.setString(4, customer.getAddress());
//            ps.setString(5, customer.getPhone());
//            ps.setBoolean(6, customer.isStatus());
//            ps.setBoolean(7, customer.isAdmin());
//            ps.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }
//
//    private Customer mapToCustomer(ResultSet rs) throws SQLException {
//        Customer customer = new Customer();
//        customer.setCid(rs.getInt("cid"));
//        customer.setCname(rs.getString("cname"));
//        customer.setUsername(rs.getString("username"));
//        customer.setPassword(rs.getString("password"));
//        customer.setAddress(rs.getString("address"));
//        customer.setPhone(rs.getString("phone"));
//        customer.setStatus(rs.getBoolean("status"));
//        customer.setAdmin(rs.getBoolean("isAdmin"));
//        return customer;
//    }
    public Customer getCustomerByUsername(String username) {
        Customer customer = null;
        String sql = "SELECT * FROM Customer WHERE username = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                int cid = rs.getInt("cid");
                String cname = rs.getString("cname");
                String password = rs.getString("password");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                boolean status = rs.getBoolean("status");
                boolean isAdmin = rs.getBoolean("isAdmin");
                customer = new Customer(cid, cname, username, password, address, phone, status, isAdmin);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customer;
    }
}
