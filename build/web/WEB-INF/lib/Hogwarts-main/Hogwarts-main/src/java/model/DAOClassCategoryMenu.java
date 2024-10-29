package model;

import entity.ClassCategoryMenu;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOClassCategoryMenu extends DBConnect {

    public int insertClassCategoryMenu(ClassCategoryMenu classCategoryMenu) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[ClassCategory_Menu] (CateID, MenuID, Date, Meal) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, classCategoryMenu.getCateID());
            pre.setString(2, classCategoryMenu.getMenuID());
            pre.setString(3, classCategoryMenu.getDate());
            pre.setString(4, classCategoryMenu.getMeal());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int updateClassCategoryMenu(ClassCategoryMenu classCategoryMenu) {
        int n = 0;
        String sql = "UPDATE [dbo].[ClassCategory_Menu] SET Meal = ? WHERE CateID = ? AND MenuID = ? AND Date = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, classCategoryMenu.getMeal());
            pre.setString(2, classCategoryMenu.getCateID());
            pre.setString(3, classCategoryMenu.getMenuID());
            pre.setString(4, classCategoryMenu.getDate());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int removeClassCategoryMenu(String cateID, String menuID, java.sql.Date date, String meal) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[ClassCategory_Menu] WHERE CateID = ? AND MenuID = ? AND Date = ? AND Meal = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, cateID);
            pre.setString(2, menuID);
            pre.setDate(3, date);
            pre.setString(4, meal);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOClassCategoryMenu.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<ClassCategoryMenu> getAllClassCategoryMenus(String sql) {
        Vector<ClassCategoryMenu> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                String cateID = rs.getString(1);
                String menuID = rs.getString(2);
                String date = rs.getString(3);
                String meal = rs.getString(4);
                ClassCategoryMenu classCategoryMenu = new ClassCategoryMenu(cateID, menuID, date, meal);
                vector.add(classCategoryMenu);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOClassCategoryMenu.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
}
