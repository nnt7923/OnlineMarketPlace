package controller;

import entity.Product;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOProduct;
import java.util.Vector;
import java.sql.SQLException;

@WebServlet(name = "ProductController", urlPatterns = {"/ProductControllerURL"})
public class ProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOProduct dao = new DAOProduct();

        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        switch (service) {
            case "addProduct":
                String pName = request.getParameter("pName");
                String pImage = request.getParameter("pImage");
                double price = Double.parseDouble(request.getParameter("price"));
                String title = request.getParameter("title");
                String description = request.getParameter("description");
                int cateID = Integer.parseInt(request.getParameter("cateID"));
                int sell_ID = Integer.parseInt(request.getParameter("sell_ID"));
                
                Product product = new Product(pName, pImage, price, title, description, cateID, sell_ID);
                dao.addProduct(product);
                
                response.sendRedirect("ProductControllerURL?service=listAll");
                break;
                
            case "listAll":
                Vector<Product> productList = dao.getAllProducts();
                request.setAttribute("data", productList);
                RequestDispatcher dispatcher = request.getRequestDispatcher("ManageProduct.jsp");
                dispatcher.forward(request, response);
                break;
                
            case "updateProduct":
                String submit = request.getParameter("submit");
                if (submit == null) {
                    try {
                        int pID = Integer.parseInt(request.getParameter("pID"));
                        Product productToUpdate = dao.getProductById(pID);
                        request.setAttribute("product", productToUpdate);
                        RequestDispatcher updateDispatcher = request.getRequestDispatcher("ManageProduct.jsp?service=updateProductForm");
                        updateDispatcher.forward(request, response);
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Product ID");
                    }
                } else {
                    try {
                        int pID = Integer.parseInt(request.getParameter("pID"));
                        pName = request.getParameter("pName");
                        pImage = request.getParameter("pImage");
                        price = Double.parseDouble(request.getParameter("price"));
                        title = request.getParameter("title");
                        description = request.getParameter("description");
                        cateID = Integer.parseInt(request.getParameter("cateID"));
                        sell_ID = Integer.parseInt(request.getParameter("sell_ID"));
                        
                        Product updatedProduct = new Product(pID, pName, pImage, price, title, description, cateID, sell_ID);
                        dao.updateProduct(updatedProduct);
                        
                        response.sendRedirect("ProductControllerURL?service=listAll");
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input format");
                    }
                }
                break;
                
            case "deleteProduct":
                try {
                    int productID = Integer.parseInt(request.getParameter("pID"));
                    dao.deleteProduct(productID);
                    response.sendRedirect("ProductControllerURL?service=listAll");
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Product ID");
                }
                break;
                
            case "addProductForm":
                RequestDispatcher addDispatcher = request.getRequestDispatcher("ManageProduct.jsp?service=addProductForm");
                addDispatcher.forward(request, response);
                break;
                
            case "updateProductForm":
                try {
                    int productIDToUpdate = Integer.parseInt(request.getParameter("pID"));
                    Product productToUpdateForm = dao.getProductById(productIDToUpdate);
                    request.setAttribute("product", productToUpdateForm);
                    RequestDispatcher updateFormDispatcher = request.getRequestDispatcher("ManageProduct.jsp?service=updateProductForm");
                    updateFormDispatcher.forward(request, response);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Product ID");
                }
                break;
                
            default:
                response.sendRedirect("ProductControllerURL?service=listAll");
                break;
        }
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
        return "Product Controller Servlet";
    }
}
