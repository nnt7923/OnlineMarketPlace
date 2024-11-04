package controller;

import dao.FeedbackDAO;
import dao.FeedbackReplyDAO;
import dao.ProductDAO;
import dao.SellerDAO;
import model.Feedback;
import model.FeedbackReply;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

@WebServlet("/feedbackReply")

public class FeedbackReplyController extends HttpServlet {

    private FeedbackDAO feedbackDAO;
    private FeedbackReplyDAO feedbackReplyDAO;
    private SellerDAO sellerDAO;
    private ProductDAO productDAO;

    @Override
    public void init() {
        feedbackDAO = new FeedbackDAO();
        feedbackReplyDAO = new FeedbackReplyDAO();
        sellerDAO = new SellerDAO();
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null || action.equals("listProducts")) {
            listProductsBySeller(request, response);
        } else if (action.equals("viewFeedback")) {
            try {
                viewFeedbackByProduct(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(FeedbackReplyController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private void listProductsBySeller(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer accountId = (Integer) session.getAttribute("account_id");

        if (accountId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            int sellerId = sellerDAO.getSellerIdByAccountId(accountId);
            List<Product> products = productDAO.getProductsBySellerId(sellerId);
            request.setAttribute("products", products);
            request.getRequestDispatcher("/seller/feedbacks_product_list.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving product data.");
            response.sendRedirect("errorPage.jsp");
        }
    }

private void viewFeedbackByProduct(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException, SQLException {
    int productId = Integer.parseInt(request.getParameter("product_id"));

    // Fetch feedback list for the product
    List<Feedback> feedbackList = feedbackDAO.getFeedbackByProduct(productId);

    // Attach replies for each feedback
    for (Feedback feedback : feedbackList) {
        List<FeedbackReply> replies = feedbackReplyDAO.getRepliesByFeedbackId(feedback.getFeedback_id());
        feedback.setReplies(replies); // Set replies, ensuring non-null list
    }

    // Fetch product details
    Product product = productDAO.getProductById(productId); // Assuming this method exists in productDAO

    // Set attributes for feedback list and product details
    request.setAttribute("feedbackList", feedbackList);
    request.setAttribute("selectedProductId", productId);
    request.setAttribute("productName", product.getName());  // Assuming Product has getName() method
    request.setAttribute("productImage", product.getImg());  // Assuming Product has getImageUrl() method
    request.setAttribute("productPrice", product.getPrice());  // Assuming Product has getPrice() method

    // Forward to JSP
    request.getRequestDispatcher("/seller/feedback_detail.jsp").forward(request, response);
}




    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer accountId = (Integer) session.getAttribute("account_id");

        if (accountId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            int sellerId = sellerDAO.getSellerIdByAccountId(accountId);
            String action = request.getParameter("action");

            switch (action) {
                case "add" -> {
                    // Thêm reply m?i
                    int feedbackId = Integer.parseInt(request.getParameter("feedback_id"));
                    String replyContent = request.getParameter("reply_content");

                    FeedbackReply reply = new FeedbackReply();
                    reply.setFeedbackId(feedbackId);
                    reply.setSellerId(sellerId);
                    reply.setReplyContent(replyContent);

                    feedbackReplyDAO.addReply(reply);
                }
                case "update" -> {
                    // C?p nh?t reply
                    int replyId = Integer.parseInt(request.getParameter("reply_id"));
                    String replyContent = request.getParameter("reply_content");

                    FeedbackReply reply = feedbackReplyDAO.getReplyById(replyId);
                    if (reply != null && reply.getSellerId() == sellerId) { // Ki?m tra quy?n s?a
                        reply.setReplyContent(replyContent);
                        feedbackReplyDAO.updateReply(reply);
                    }
                }
                case "delete" -> {
                    // Xóa reply
                    int replyId = Integer.parseInt(request.getParameter("reply_id"));

                    FeedbackReply reply = feedbackReplyDAO.getReplyById(replyId);
                    if (reply != null && reply.getSellerId() == sellerId) { // Ki?m tra quy?n xóa
                        feedbackReplyDAO.deleteReply(replyId);
                    }
                }
                default -> {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
                    return;
                }
            }

            // Sau khi x? lý, quay l?i trang danh sách feedback
            response.sendRedirect("feedbackReply");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }
}
