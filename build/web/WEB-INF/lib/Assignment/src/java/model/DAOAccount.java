package model;

import entity.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class DAOAccount extends DBConnect {

    // Lấy tất cả tài khoản từ cơ sở dữ liệu
    public Vector<Account> getAllAccounts() {
        Vector<Account> accounts = new Vector<>();
        String sql = "SELECT * FROM Account";
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int uID = rs.getInt("uID");
                String user = rs.getString("user");
                String pass = rs.getString("pass");
                int isSell = rs.getInt("isSell");
                int isAdmin = rs.getInt("isAdmin");
                boolean active = rs.getBoolean("active");
                Account account = new Account(uID, user, pass, isSell, isAdmin, active);
                accounts.add(account);
            }
            rs.close();
            state.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return accounts;
    }

    // Lấy một tài khoản theo ID
    public Account getAccountById(int uID) {
        Account account = null;
        String sql = "SELECT * FROM Account WHERE uID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, uID);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                String user = rs.getString("user");
                String pass = rs.getString("pass");
                int isSell = rs.getInt("isSell");
                int isAdmin = rs.getInt("isAdmin");
                boolean active = rs.getBoolean("active");
                account = new Account(uID, user, pass, isSell, isAdmin, active);
            }
            rs.close();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return account;
    }

    // Thêm một tài khoản mới vào cơ sở dữ liệu
    public void addAccount(Account account) {
        String sql = "INSERT INTO Account (user, pass, isSell, isAdmin, active) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, account.getUser());
            pre.setString(2, account.getPass());
            pre.setInt(3, account.getIsSell());
            pre.setInt(4, account.getIsAdmin());
            pre.setBoolean(5, account.isActive());
            pre.executeUpdate();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Cập nhật thông tin tài khoản
    public void updateAccount(Account account) {
        String sql = "UPDATE Account SET user = ?, pass = ?, isSell = ?, isAdmin = ?, active = ? WHERE uID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, account.getUser());
            pre.setString(2, account.getPass());
            pre.setInt(3, account.getIsSell());
            pre.setInt(4, account.getIsAdmin());
            pre.setBoolean(5, account.isActive());
            pre.setInt(6, account.getUID());
            pre.executeUpdate();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Xóa một tài khoản theo ID
    public void deleteAccount(int uID) {
        String sql = "DELETE FROM Account WHERE uID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, uID);
            pre.executeUpdate();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Thay đổi mật khẩu tài khoản dựa trên email (hoặc tên người dùng)
    public boolean changePassword(String username, String oldPassword, String newPassword) {
        String sql = "UPDATE Account SET pass = ? WHERE user = ? AND pass = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, newPassword);
            pre.setString(2, username);
            pre.setString(3, oldPassword);
            int rowsUpdated = pre.executeUpdate();
            pre.close();
            return rowsUpdated > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    // Lấy một tài khoản theo tên người dùng
    public Account getAccountByUsername(String username) {
        Account account = null;
        String sql = "SELECT * FROM Account WHERE user = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                int uID = rs.getInt("uID");
                String user = rs.getString("user");
                String pass = rs.getString("pass");
                int isSell = rs.getInt("isSell");
                int isAdmin = rs.getInt("isAdmin");
                boolean active = rs.getBoolean("active");
                account = new Account(uID, user, pass, isSell, isAdmin, active);
            }
            rs.close();
            pre.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return account;
    }

    // Lấy tất cả tài khoản đang hoạt động
    public Vector<Account> getActiveAccounts() {
        Vector<Account> accounts = new Vector<>();
        String sql = "SELECT * FROM Account WHERE active = true";
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int uID = rs.getInt("uID");
                String user = rs.getString("user");
                String pass = rs.getString("pass");
                int isSell = rs.getInt("isSell");
                int isAdmin = rs.getInt("isAdmin");
                boolean active = rs.getBoolean("active");
                Account account = new Account(uID, user, pass, isSell, isAdmin, active);
                accounts.add(account);
            }
            rs.close();
            state.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return accounts;
    }

    // Lấy tất cả tài khoản không hoạt động
    public Vector<Account> getInactiveAccounts() {
        Vector<Account> accounts = new Vector<>();
        String sql = "SELECT * FROM Account WHERE active = false";
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                int uID = rs.getInt("uID");
                String user = rs.getString("user");
                String pass = rs.getString("pass");
                int isSell = rs.getInt("isSell");
                int isAdmin = rs.getInt("isAdmin");
                boolean active = rs.getBoolean("active");
                Account account = new Account(uID, user, pass, isSell, isAdmin, active);
                accounts.add(account);
            }
            rs.close();
            state.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return accounts;
    }
}
