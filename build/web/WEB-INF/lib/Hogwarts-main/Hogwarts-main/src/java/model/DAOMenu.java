package model;

import entity.Menu;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOMenu extends DBConnect {

    public int insertMenu(Menu menu) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Menu] (MenuID, Food) VALUES (?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, menu.getMenuID());
            pre.setString(2, menu.getFood());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int updateMenu(Menu menu) {
        int n = 0;
        String sql = "UPDATE [dbo].[Menu] SET Food = ? WHERE MenuID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, menu.getFood());
            pre.setString(2, menu.getMenuID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int removeMenu(String menuID) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Menu] WHERE MenuID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, menuID);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOMenu.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Menu> getAllMenus(String sql) {
        Vector<Menu> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                String menuID = rs.getString(1);
                String food = rs.getString(2);
                Menu menu = new Menu(menuID, food);
                vector.add(menu);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOMenu.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
        DAOMenu dao = new DAOMenu();
        int n = dao.insertMenu(new Menu("M001", "Pizza"));
        if (n > 0) {
            System.out.println("Inserted");
        }
        Vector<Menu> vector = dao.getAllMenus("SELECT * FROM Menu");
        for (Menu menu : vector) {
            System.out.println(menu.getMenuID() + " - " + menu.getFood());
        }
    }
}
