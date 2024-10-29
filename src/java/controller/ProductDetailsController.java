package controller;

import com.google.gson.Gson;
import dao.FeedbackDAO;
import dao.ProductDetailsDAO;
import java.io.IOException;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Feedback;
import model.ProductDetails;

/**
 *
 * @author Admin
 */
public class ProductDetailsController extends HttpServlet {

    private FeedbackDAO feedbackDAO = new FeedbackDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        ProductDetails productDetailDTO = db.getProductDetailByColorAndCriteria(pid
                , color, criteria);

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
            throws ServletException, IOException {
        String pid = request.getParameter("pid");
        String pdcriteria = request.getParameter("pdcriteria");

        ProductDetailsDAO db = new ProductDetailsDAO();
        ProductDetails pd = db.getProductByPid(pid);

        List<ProductDetails> productDetails = db.getProductDetailsByPidAndCriteria(pid, pdcriteria);
        Set<String> allCriteria = db.getAllCriteriaByPid(pid);
        Set<String> uniqueCriteria = productDetails.stream()
                .map(dto -> dto.getCriteria())
                .collect(Collectors.toSet());
        List<Feedback> feedbacks = feedbackDAO.getFeedbackByProduct(pd.getProduct().getProductId());
        request.setAttribute("feedbacks", feedbacks);
        request.setAttribute("allCriteria", allCriteria);
        request.setAttribute("productDetail", pd);
        request.setAttribute("pid", pid);
        request.setAttribute("productDetails", productDetails);
        request.setAttribute("uniqueCriteria", uniqueCriteria);
        request.getRequestDispatcher("./productdetails.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
