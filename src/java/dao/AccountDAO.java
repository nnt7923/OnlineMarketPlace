package dao;

import context.DBContext;
import model.Account;
import model.GoogleAccount;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;
import model.Role;

public class AccountDAO extends DBContext {

    public Account login(String email, String password) {
        String query = "SELECT * FROM Account WHERE email = ? AND password = ?";
        try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Account(rs.getInt("account_id"), rs.getString("username"), rs.getString("password"),
                            rs.getString("email"), rs.getString("phone"), rs.getString("address"),
                            rs.getInt("role_id"), rs.getString("status"), null);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Role getRoleByAccountId(int accountId) {
        String query = "SELECT Role.role_id, Role.role_name FROM Role "
                + "JOIN Account ON Role.role_id = Account.role_id WHERE Account.account_id = ?";
        try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, accountId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Role(rs.getInt("role_id"), rs.getString("role_name"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Th?m ng??i d?ng m?i v?o c? s? d? li?u
    public void addAccount(Account account) throws SQLException {
        String query = "INSERT INTO Account (username, email, password, role_id, status) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, account.getUsername());
            ps.setString(2, account.getEmail());
            ps.setString(3, account.getPassword());
            ps.setInt(4, account.getRoleId());
            ps.setString(5, account.getStatus());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // T?o m?t kh?u ng?u nhi?n
    public String generateRandomPassword() {
        int length = 10;
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder password = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            password.append(chars.charAt(random.nextInt(chars.length())));
        }
        return password.toString();
    }

    // X? l? ??ng nh?p Google
    public void handleGoogleLogin(GoogleAccount googleAccount) throws SQLException {
        AccountDAO accountDAO = new AccountDAO();
        Account existingAccount = accountDAO.getAccountByEmail(googleAccount.getEmail());

        if (existingAccount != null) {
            // Ng??i d?ng ?? c? trong h? th?ng
            System.out.println("User already exists: " + existingAccount.getEmail());
        } else {
            System.out.println("New Google user, creating account: " + googleAccount.getEmail());
            Account newAccount = new Account();
            newAccount.setUsername(googleAccount.getEmail().split("@")[0]);
            newAccount.setEmail(googleAccount.getEmail());
            newAccount.setPassword("");
            newAccount.setRoleId(3);
            newAccount.setStatus("active");

            accountDAO.addAccount(newAccount);
            System.out.println("New Google account added to database.");
        }
    }

    // L?y t?i kho?n theo email
    public Account getAccountByEmail(String email) throws SQLException {
        String query = "SELECT * FROM Account WHERE email = ?";
        try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Account account = new Account();
                    account.setAccountId(rs.getInt("account_id"));
                    account.setUsername(rs.getString("username"));
                    account.setEmail(rs.getString("email"));
                    account.setRoleId(rs.getInt("role_id"));
                    account.setStatus(rs.getString("status"));
                    return account;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Account getUserById(int id) {
        String sql = "SELECT a.*, c.customer_id, c.customer_name, c.customer_type, c.customer_dob, c.customer_gender, c.customer_images "
                + "FROM Account a "
                + "LEFT JOIN Customer c ON a.account_id = c.account_id "
                + "WHERE a.account_id = ?";
        try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Account account = new Account();
                    account.setAccountId(rs.getInt("account_id"));
                    account.setUsername(rs.getString("username"));
                    account.setPassword(rs.getString("password"));
                    account.setEmail(rs.getString("email"));
                    account.setPhone(rs.getString("phone"));
                    account.setAddress(rs.getString("address"));
                    account.setRoleId(rs.getInt("role_id"));
                    account.setStatus(rs.getString("status"));

                    int customerId = rs.getInt("customer_id");
                    if (customerId != 0) {
                        Customer customer = new Customer();
                        customer.setCustomerId(customerId);
                        customer.setCustomerName(rs.getString("customer_name"));
                        customer.setCustomerType(rs.getString("customer_type"));
                        customer.setCustomerDob(rs.getDate("customer_dob"));
                        customer.setCustomerGender(rs.getString("customer_gender"));
                        customer.setCustomerImages(rs.getString("customer_images"));

                        // G?n ??i t??ng customer v?o account
                        account.setCustomer(customer);
                    }
                    return account;
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return null;
    }

    public int resetPassword(String newPassword, String email) {

        String sql = "update Account set password = ?\n"
                + "  where email = ?";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, newPassword);
            pre.setString(2, email);

            return pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return -1;
    }

    // Li?t k? t?t c? t?i kho?n
    public List<Account> listAll() {
        List<Account> accounts = new ArrayList<>();
        String query = "SELECT * FROM Account";
        try (PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Account account = new Account(
                        rs.getInt("account_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getInt("role_id"),
                        rs.getString("status"), null);
                accounts.add(account);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return accounts;
    }

    // Th?m t?i kho?n m?i
    public boolean add(Account account) {
        String query = "INSERT INTO Account (username, password, email, phone, address, role_id, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, account.getUsername());
            ps.setString(2, account.getPassword());
            ps.setString(3, account.getEmail());
            ps.setString(4, account.getPhone());
            ps.setString(5, account.getAddress());
            ps.setInt(6, account.getRoleId());
            ps.setString(7, account.getStatus());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // X?a t?i kho?n theo id
    public boolean delete(int id) {
        String query = "DELETE FROM Account WHERE account_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // C?p nh?t t?i kho?n
    public boolean update(Account account) {
        String query = "UPDATE Account SET username = ?, password = ?, email = ?, phone = ?, address = ?, role_id = ?, status = ? WHERE account_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, account.getUsername());
            ps.setString(2, account.getPassword());
            ps.setString(3, account.getEmail());
            ps.setString(4, account.getPhone());
            ps.setString(5, account.getAddress());
            ps.setInt(6, account.getRoleId());
            ps.setString(7, account.getStatus());
            ps.setInt(8, account.getAccountId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // T?m ki?m t?i kho?n theo t?n ng??i d?ng
    public List<Account> search(String keyword) {
        List<Account> accounts = new ArrayList<>();
        String query = "SELECT * FROM Account WHERE username LIKE ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account account = new Account(
                        rs.getInt("account_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getInt("role_id"),
                        rs.getString("status"), null);
                accounts.add(account);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return accounts;
    }

    // L?y t?i kho?n theo id
    public Account getAccountById(int id) {
        String query = "SELECT * FROM Account WHERE account_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(
                        rs.getInt("account_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getInt("role_id"),
                        rs.getString("status"), null);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int updatePassword(String newPassword, String email) {
        String sql = "UPDATE Account SET password = ? WHERE email = ?";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, newPassword);
            pre.setString(2, email);

            return pre.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }

    public void updateAccountByAid(Account account, int id) {
        try {
            String sql = "UPDATE [dbo].[Account]\n"
                    + "   SET [username] = ?\n"
                    + "      ,[email] = ?\n"
                    + "      ,[phone] = ?\n"
                    + "      ,[address] = ?\n"
                    + " WHERE account_id = ?";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, account.getUsername());
            stm.setString(2, account.getEmail());
            stm.setString(3, account.getAddress());
            stm.setString(4, account.getPhone());
            stm.setInt(5, id);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public String getEmailByAccountID(int uid) {
        try {
            String sql = "SELECT email FROM Account\n"
                    + "WHERE account_id = ?";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, uid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String email;
                email = rs.getString("email");
                return email;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getPhoneByAccountID(int uid) {
        try {
            String sql = "SELECT phone FROM Account\n"
                    + "WHERE account_id = ?";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, uid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String phone;
                phone = rs.getString("phone");
                return phone;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<String> getEmails() {
        ArrayList<String> emails = new ArrayList<>();
        try {
            String sql = "SELECT email FROM Account";
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                String e = rs.getString("email");
                emails.add(e);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return emails;
    }

    public ArrayList<String> getPhones() {
        ArrayList<String> phones = new ArrayList<>();
        try {
            String sql = "SELECT phone FROM Account";
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                String e = rs.getString("phone");
                phones.add(e);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return phones;
    }

    public boolean updateAccount(Account account) {
        String sql = "UPDATE Account SET username = ?, email = ?, phone = ?, address = ? WHERE account_id = ?";
        try (Connection conn = new DBContext().conn; PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, account.getUsername());
            ps.setString(2, account.getEmail());
            ps.setString(3, account.getPhone());
            ps.setString(4, account.getAddress());
            ps.setInt(5, account.getAccountId()); // Thi?t l?p gi? tr? cho account_id

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Tr? v? true n?u c? d?ng n?o b? ?nh h??ng
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        AccountDAO db = new AccountDAO();
        Account accDAO = db.getUserById(10);
        System.out.println(accDAO);

    }
}