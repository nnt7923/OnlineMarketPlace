package controller;

import com.google.gson.Gson;
import dao.FeedbackDAO;
import dao.FeedbackReplyDAO;
import dao.ProductDetailsDAO;
import dao.SellerDAO;
import java.io.IOException;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Feedback;
import model.FeedbackReply;
import model.Product;
import model.ProductDetails;
import model.Seller;

/**
 * Handles product details requests and updates seller last online status.
 */
public class ProductDetailsController extends HttpServlet {

    private final FeedbackDAO feedbackDAO = new FeedbackDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        String color = request.getParameter("color");
        String criteria = request.getParameter("criteria");

        if (color != null && criteria != null) {
            handleAjaxRequest(request, response);
        } else if (criteria != null) {
            handleCriteriaRequest(request, response);
        } else {
            handlePageRequest(request, response);
        }
    }

    private void handleAjaxRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pid = request.getParameter("pid");
        String color = request.getParameter("color");
        String criteria = request.getParameter("criteria");

        ProductDetailsDAO db = new ProductDetailsDAO();
        ProductDetails productDetailDTO = db.getProductDetailByColorAndCriteria(pid, color, criteria);

        if (productDetailDTO != null) {
            String json = new Gson().toJson(productDetailDTO);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } else {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            response.getWriter().write("{\"error\":\"Product not found\"}");
        }
    }

    private void handleCriteriaRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pid = request.getParameter("pid");
        String criteria = request.getParameter("criteria");

        ProductDetailsDAO db = new ProductDetailsDAO();
        List<ProductDetails> productDetails = db.getProductDetailsByPidAndCriteria(pid, criteria);

        String json = new Gson().toJson(productDetails);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    private void handlePageRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("account");

        if (user != null && user.getRoleId() == 2) { // Assuming 2 is the role ID for "seller"
            SellerDAO sellerDAO = new SellerDAO();
            sellerDAO.updateLastOnline(user.getAccountId());
        }
        String pid = request.getParameter("pid");
        String pdcriteria = request.getParameter("pdcriteria");

        ProductDetailsDAO db = new ProductDetailsDAO();
        ProductDetails pd = db.getProductByPid(pid);

        List<ProductDetails> productDetails = db.getProductDetailsByPidAndCriteria(pid, pdcriteria);
        Set<String> allCriteria = db.getAllCriteriaByPid(pid);
        Set<String> uniqueCriteria = productDetails.stream()
                .map(ProductDetails::getCriteria)
                .collect(Collectors.toSet());
            
    FeedbackReplyDAO feedbackReplyDAO = new FeedbackReplyDAO();
    List<Feedback> feedbacks = feedbackDAO.getFeedbackByProduct(pd.getProduct().getProductId());
    for (Feedback feedback : feedbacks) {
        List<FeedbackReply> replies = feedbackReplyDAO.getRepliesByFeedbackId(feedback.getFeedback_id());
        feedback.setReplies(replies); // Assuming Feedback class has setReplies method
    }

        SellerDAO sl = new SellerDAO();
        int sellerId = pd.getProduct().getSellerId();
        Seller seller = sl.getSellerBySellerId(sellerId);
        int totalProducts = sl.getTotalProductsBySellerId(sellerId);

        // Format the last online date
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
        String formattedDate;
        if (seller.getLastOnline() != null) {
            // Format the date if it's not null
            formattedDate = dateFormat.format(seller.getLastOnline());
        } else {
            // Use the current date as the default if lastOnline is null
            formattedDate = dateFormat.format(new Date());
        }
        request.setAttribute("feedbacks", feedbacks);
        request.setAttribute("allCriteria", allCriteria);
        request.setAttribute("productDetail", pd);
        request.setAttribute("pid", pid);
        request.setAttribute("productDetails", productDetails);
        request.setAttribute("uniqueCriteria", uniqueCriteria);
        request.setAttribute("seller", seller);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("sellerLastOnline", formattedDate);
        request.getRequestDispatcher("./productdetails.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailsController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetailsController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
