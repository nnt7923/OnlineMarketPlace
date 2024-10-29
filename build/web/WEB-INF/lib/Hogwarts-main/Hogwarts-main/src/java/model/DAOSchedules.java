// File: model/DAOSchedules.java
package model;

import entity.Schedules;
import java.sql.*;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOSchedules extends DBConnect {

    public int insertSchedules(Schedules schedule) {
        int n = 0;
        String sql = "INSERT INTO Schedules (SchedulesID, Date, CurDateID, SyC_ID) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, schedule.getSchedulesID());
            pre.setString(2, schedule.getDate());
            pre.setString(3, schedule.getCurDateID());
            pre.setString(4, schedule.getSyC_ID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOSchedules.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateSchedules(Schedules schedule) {
        int n = 0;
        String sql = "UPDATE Schedules SET Date = ?, CurDateID = ?, SyC_ID = ? WHERE SchedulesID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, schedule.getDate());
            pre.setString(2, schedule.getCurDateID());
            pre.setString(3, schedule.getSyC_ID());
            pre.setString(4, schedule.getSchedulesID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOSchedules.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteSchedules(String schedulesID) {
        int n = 0;
        String sql = "DELETE FROM Schedules WHERE SchedulesID = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, schedulesID);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOSchedules.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Schedules> getAllSchedules(String sql) {
        Vector<Schedules> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                String schedulesID = rs.getString("SchedulesID");
                String date = rs.getString("Date");
                String curDateID = rs.getString("CurDateID");
                String syC_ID = rs.getString("SyC_ID");
                Schedules schedule = new Schedules(schedulesID, date, curDateID, syC_ID);
                vector.add(schedule);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOSchedules.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    
}
