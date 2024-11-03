package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import dao.ProductDetailsDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Product;
import model.ProductDetails;
import util.Pagination;

/**
 *
 * @author phamd
 */

@WebServlet(name = "ShopPageController", urlPatterns = {"/shop"})
public class ShopPageController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        ProductDetailsDAO pd = new ProductDetailsDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        ProductDAO productDAO = new ProductDAO();

        

        // L?y danh s�ch danh m?c v?i s? l??ng s?n ph?m
        List<Category> categories = categoryDAO.getAllCategories();
        
//        // L?y categoryId t? request
        String cidParam = request.getParameter("cid");
        List<ProductDetails> products = pd.getAllProducts();

        if (cidParam != null) {
            
            int cid = Integer.parseInt(cidParam);
            List<Product> p = productDAO.getProductsByCategoryId(cid);
        } else {
            // N?u kh�ng c� categoryId, l?y t?t c? s?n ph?m
            products = pd.getAllProducts();
        }


        // L?y s? trang hi?n t?i t? request, n?u kh�ng c� th� m?c ??nh l� 1
        String pageParam = request.getParameter("page");
        int page = 1;
        if (pageParam != null) {
            try {
                page = Integer.parseInt(pageParam);
                if (page < 1) { // ??m b?o trang kh�ng nh? h?n 1
                    page = 1;
                }
            } catch (NumberFormatException e) {
                page = 1; // N?u kh�ng th? chuy?n ??i, m?c ??nh l� trang 1
            }
        }

        // S? s?n ph?m m?i trang 
        int itemsPerPage = 9;

        // L?y danh s�ch s?n ph?m ?� ph�n trang
        List<ProductDetails> paginatedProducts = Pagination.getPaginatedList(products, page, itemsPerPage);

        // T�nh t?ng s? trang
        int totalPages = Pagination.calculateTotalPages(products.size(), itemsPerPage);

        // Thi?t l?p v�o request
        request.setAttribute("products", paginatedProducts);
        request.setAttribute("categories", categories);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);

        request.getRequestDispatcher("shopPage.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
