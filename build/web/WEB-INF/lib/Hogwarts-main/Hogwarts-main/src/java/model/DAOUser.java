package model;

import entity.User;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOUser extends DBConnect {

    public int insertUser(User user) {
        int n = 0;
        String sql = "INSERT INTO [User] (UserID, FullName, Gender, Address, Phone, Email, Role, Password) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, user.getUserID());
            pre.setString(2, user.getFullName());
            pre.setString(3, user.getGender());
            pre.setString(4, user.getAddress());
            pre.setString(5, user.getPhone());
            pre.setString(6, user.getEmail());
            pre.setString(7, user.getRole());
            pre.setString(8, user.getPassword());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateUser(User user) {
        int n = 0;
        String sql = "UPDATE [User] SET FullName = ?, Gender = ?, Address = ?, Phone = ?, Email = ?, Role = ?, Password = ? WHERE UserID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, user.getFullName());
            pre.setString(2, user.getGender());
            pre.setString(3, user.getAddress());
            pre.setString(4, user.getPhone());
            pre.setString(5, user.getEmail());
            pre.setString(6, user.getRole());
            pre.setString(7, user.getPassword());
            pre.setString(8, user.getUserID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteUser(String userID) {
        int n = 0;
        String sql = "DELETE FROM [User] WHERE UserID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, userID);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<User> getAllUsers(String sql) {
    Vector<User> vector = new Vector<>();
    try {
        Statement state = (Statement) conn.createStatement(
                ResultSet.TYPE_SCROLL_SENSITIVE,
                ResultSet.CONCUR_UPDATABLE);
        ResultSet rs = state.executeQuery(sql);
        while (rs.next()) {
            String userID = rs.getString(1);
            String fullName = rs.getString(2);
            String gender = rs.getString(3);
            String address = rs.getString(4);
            String phone = rs.getString(5);
            String email = rs.getString(6);
            String role = rs.getString(7);
            String password = rs.getString(8);
            User user = new User(userID, fullName, gender, address, phone, email, role, password);
            vector.add(user);
        }
    } catch (SQLException ex) {
        Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
    }
    return vector;
}


    public User getUserByID(String userID) {
        User user = null;
        String sql = "SELECT * FROM [User] WHERE UserID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, userID);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                String fullName = rs.getString("FullName");
                String gender = rs.getString("Gender");
                String address = rs.getString("Address");
                String phone = rs.getString("Phone");
                String email = rs.getString("Email");
                String role = rs.getString("Role");
                String password = rs.getString("Password");
                user = new User(userID, fullName, gender, address, phone, email, role, password);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }
}
