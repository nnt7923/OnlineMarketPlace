/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Student;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author nntru
 */
public class DAOStudent extends DBConnect{
    
    public List<Student> getAll() {
        List<Student> list = new ArrayList<>();
        String sql = "Select * from Student";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {                
                Student sv = new Student(rs.getString("RollNo"), rs.getString("name"), rs.getFloat("mark"));
                list.add(sv);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public boolean add(Student student) {
        String sql = "INSERT INTO Student (RollNo, name, mark) VALUES (?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, student.getRollNo());
            pre.setString(2, student.getName());
            pre.setFloat(3, student.getMark());
            int result = pre.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    // Edit an existing student's information in the database
    public boolean edit(Student student) {
        String sql = "UPDATE Student SET name = ?, mark = ? WHERE RollNo = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, student.getName());
            pre.setFloat(2, student.getMark());
            pre.setString(3, student.getRollNo());
            int result = pre.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
    
    public boolean delete(String rollNo) {
        String sql = "DELETE FROM Student WHERE RollNo = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, rollNo);
            return pre.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
}

    
    

