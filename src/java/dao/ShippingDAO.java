/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Shipping;

/**
 *
 * @author Admin
 */
public class ShippingDAO {
//
//    public int addShipping(Shipping shipping) throws SQLException {
//        String sql = "INSERT INTO Shipping (name, phone, address, status) VALUES (?, ?, ?, ?)";
//        int shippingId = -1;
//
//        try (PreparedStatement ps = new DBContext().conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
//
//            ps.setString(1, shipping.getName());
//            ps.setString(2, shipping.getPhone());
//            ps.setString(3, shipping.getAddress());
//            ps.setString(4, shipping.getStatus());
//            ps.executeUpdate();
//
//            ResultSet rs = ps.getGeneratedKeys();
//            if (rs.next()) {
//                shippingId = rs.getInt(1);
//            }
//        }
//        return shippingId;
//    }

}
