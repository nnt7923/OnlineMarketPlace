package controller;

import com.google.gson.Gson;
import dao.CustomerDAO;
import dao.FeedbackDAO;
import model.Feedback;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.Account;
import model.Customer;

@WebServlet("/feedback")
public class FeedbackController extends HttpServlet {

    private FeedbackDAO feedbackDAO = new FeedbackDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // L?y các tham s? t? yêu c?u
        String feedbackContent = request.getParameter("feedback_content");
        String ratingParam = request.getParameter("rating");
        String productIdParam = request.getParameter("product_id");
        String accountIdParam = request.getParameter("account_id");
        String customerIdParam = request.getParameter("customer_id");
        int productId = Integer.parseInt(productIdParam);

        // Ki?m tra n?u các tham s? c?n thi?t không có trong yêu c?u
        if (feedbackContent == null || ratingParam == null || productIdParam == null) {
            request.setAttribute("errorMessage", "Thi?u thông tin yêu c?u.");
            request.getRequestDispatcher("productdetails?pid=" + productId).forward(request, response);
            return;
        }

        int rating = Integer.parseInt(ratingParam);

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        CustomerDAO customerDAO = new CustomerDAO();
        Customer customer = customerDAO.getCustomerByAccountId(account.getAccountId());

        Feedback feedback = new Feedback();
        feedback.setAccount_id(account.getAccountId());
        feedback.setProduct_id(productId);
        feedback.setRating(rating);
        feedback.setFeedback_content(feedbackContent);
        feedback.setCustomer_id(customer.getCustomerId());

        feedbackDAO.addFeedback(feedback);

        request.getRequestDispatcher("productdetails?pid=" + productId).forward(request, response);

    }
}
