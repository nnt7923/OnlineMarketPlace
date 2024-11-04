package dao;

import context.DBContext;
import model.FeedbackReply;
import model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackReplyDAO extends DBContext {

    // Thêm ph?n h?i m?i cho m?t feedback
    public void addReply(FeedbackReply reply) {
        String sql = "INSERT INTO FeedbackReply (feedback_id, seller_id, reply_content) VALUES (?, ?, ?)";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, reply.getFeedbackId());
            ps.setInt(2, reply.getSellerId());
            ps.setString(3, reply.getReplyContent());
            
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // L?y danh sách ph?n h?i cho m?t feedback 
public List<FeedbackReply> getRepliesByFeedbackId(int feedbackId) {
    List<FeedbackReply> replies = new ArrayList<>();
    String query = "SELECT * FROM FeedbackReply WHERE feedback_id = ?";
    try (PreparedStatement ps = conn.prepareStatement(query)) {
        ps.setInt(1, feedbackId);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            FeedbackReply reply = new FeedbackReply();
            reply.setReplyId(rs.getInt("reply_id"));
            reply.setFeedbackId(rs.getInt("feedback_id"));
            reply.setSellerId(rs.getInt("seller_id"));
            reply.setReplyContent(rs.getString("reply_content"));
            reply.setReplyDate(rs.getDate("reply_date"));
            replies.add(reply);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return replies;
}

    
    // Ph??ng th?c update m?t ph?n h?i
    public boolean updateReply(FeedbackReply reply) {
        String sql = "UPDATE FeedbackReply SET reply_content = ? WHERE reply_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, reply.getReplyContent());
            ps.setInt(2, reply.getReplyId());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Ph??ng th?c delete m?t ph?n h?i theo reply_id
    public boolean deleteReply(int replyId) {
        String sql = "DELETE FROM FeedbackReply WHERE reply_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, replyId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Ph??ng th?c view m?t ph?n h?i c? th? theo reply_id
    public FeedbackReply getReplyById(int replyId) {
        String query = """
            SELECT fr.reply_id, fr.feedback_id, fr.seller_id, fr.reply_content, fr.reply_date,
                   p.product_id, p.name AS product_name, p.price, p.img
            FROM FeedbackReply fr
            JOIN Feedback f ON fr.feedback_id = f.feedback_id
            JOIN Product p ON f.product_id = p.product_id
            WHERE fr.reply_id = ?
        """;
        
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, replyId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                FeedbackReply reply = new FeedbackReply();
                reply.setReplyId(rs.getInt("reply_id"));
                reply.setFeedbackId(rs.getInt("feedback_id"));
                reply.setSellerId(rs.getInt("seller_id"));
                reply.setReplyContent(rs.getString("reply_content"));
                reply.setReplyDate(rs.getDate("reply_date"));
                
                // Thông tin s?n ph?m
                Product product = new Product();
                product.setProductId(rs.getInt("product_id"));
                product.setName(rs.getString("product_name"));
                product.setPrice(rs.getDouble("price"));
                product.setImg(rs.getString("img"));
                

                
                return reply;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    public static void main(String[] args) {
        FeedbackReplyDAO dao = new FeedbackReplyDAO();
        
        // Ki?m tra l?y thông tin ph?n h?i
        FeedbackReply reply = dao.getReplyById(1);
        if (reply != null) {
            System.out.println("Reply Content: " + reply.getReplyContent());

        }
        
        // Ki?m tra update ph?n h?i
        reply.setReplyContent("Updated reply content");
        boolean updated = dao.updateReply(reply);
        System.out.println("Update status: " + updated);
        
        // Ki?m tra delete ph?n h?i
        boolean deleted = dao.deleteReply(1);
        System.out.println("Delete status: " + deleted);
    }
}
