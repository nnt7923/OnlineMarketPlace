package controller;

import dao.ProductDetailsDAO;
import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.ProductDetails;
import model.Category;
import model.Product;

/**
 * Servlet for handling the home page and fetching products to display.
 */
@WebServlet(name = "HomePageController", urlPatterns = {"/home"})
public class HomePageController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ProductDetailsDAO pd = new ProductDetailsDAO();
        List<ProductDetails> products = pd.getAllProducts();
        request.setAttribute("products", products);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        CategoryDAO dao = new CategoryDAO();
        List<Category> list = dao.listAll();
        request.setAttribute("category", list);
        
        ProductDAO productDAO = new ProductDAO();
        List<Product> listProduct = productDAO.advertiseProduct();
        request.setAttribute("advertise", listProduct);
        
        ProductDetailsDAO pd = new ProductDetailsDAO();
        List<ProductDetails> products = pd.getAllProducts();
        request.setAttribute("products", products);
        
        List<Product> newProduct = productDAO.newProduct();
        request.setAttribute("newProduct", newProduct);
        
        request.getRequestDispatcher("home.jsp").forward(request, response);

    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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

    @Override
    public String getServletInfo() {
        return "Servlet to handle the homepage and display products";
    }
}
