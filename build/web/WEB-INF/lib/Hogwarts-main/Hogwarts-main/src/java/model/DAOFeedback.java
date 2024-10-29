package model;

import entity.Feedback;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOFeedback extends DBConnect {

    public int insertFeedback(Feedback feedback) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Feedback]\n"
                + "           ([FeedbackID]\n"
                + "           ,[Date]\n"
                + "           ,[Content]\n"
                + "           ,[StudentID])\n"
                + "     VALUES(?,?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, feedback.getFeedbackID());
            pre.setString(2, feedback.getDate());
            pre.setString(3, feedback.getContent());
            pre.setString(4, feedback.getStudentID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int updateFeedback(Feedback feedback) {
        int n = 0;
        String sql = "UPDATE [dbo].[Feedback]\n"
                + "   SET [Date] = ?\n"
                + "      ,[Content] = ?\n"
                + "      ,[StudentID] = ?\n"
                + " WHERE [FeedbackID] = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, feedback.getDate());
            pre.setString(2, feedback.getContent());
            pre.setString(3, feedback.getStudentID());
            pre.setString(4, feedback.getFeedbackID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int removeFeedback(String feedbackID) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Feedback] WHERE [FeedbackID] = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, feedbackID);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOFeedback.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<Feedback> getAllFeedbacks(String sql) {
        Vector<Feedback> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                String feedbackID = rs.getString(1);
                String date = rs.getString(2);
                String content = rs.getString(3);
                String studentID = rs.getString(4);
                Feedback feedback = new Feedback(feedbackID, date, content, studentID);
                vector.add(feedback);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFeedback.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
        DAOFeedback dao = new DAOFeedback();
        int n = dao.insertFeedback(new Feedback("F001", "2024-01-01", "Great course!", "S001"));
        if (n > 0) {
            System.out.println("Inserted");
        }
        Vector<Feedback> vector = dao.getAllFeedbacks("SELECT * FROM Feedback");
        for (Feedback feedback : vector) {
            System.out.println(feedback.getFeedbackID() + " - " + feedback.getDate() + " - " + feedback.getContent() + " - " + feedback.getStudentID());
        }
    }
}
