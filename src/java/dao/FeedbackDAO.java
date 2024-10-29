package dao;

import context.DBContext;
import model.Feedback;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.ProductDetails;

public class FeedbackDAO extends DBContext {

    public void addFeedback(Feedback feedback) {
        String sql = "INSERT INTO Feedback (product_id, rating, feedback_content, account_id, customer_id) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, feedback.getProduct_id());
            ps.setInt(2, feedback.getRating());
            ps.setString(3, feedback.getFeedback_content());
            ps.setObject(4, feedback.getAccount_id()); // s? d?ng setObject ?? cho phép null
            ps.setObject(5, feedback.getCustomer_id()); // s? d?ng setObject ?? cho phép null

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Feedback> getFeedbackByProduct(int productId) {
        List<Feedback> feedbacks = new ArrayList<>();
        String query = "SELECT * FROM Feedback WHERE product_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setFeedback_id(rs.getInt("feedback_id"));
                feedback.setAccount_id(rs.getObject("account_id") != null ? rs.getInt("account_id") : null); // cho phép null
                feedback.setProduct_id(rs.getInt("product_id"));
                feedback.setRating(rs.getInt("rating"));
                feedback.setFeedback_content(rs.getString("feedback_content"));
                feedback.setCustomer_id(rs.getObject("customer_id") != null ? rs.getInt("customer_id") : null); // cho phép null
                feedbacks.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feedbacks;
    }
    
    public static void main(String[] args) {
        FeedbackDAO dao = new FeedbackDAO();
        
        List<Feedback> list = dao.getFeedbackByProduct(8);
        
        for (Feedback feedback : list) {
            
            System.out.println(feedback.getCustomer_id());
        }

        
    }
}
    