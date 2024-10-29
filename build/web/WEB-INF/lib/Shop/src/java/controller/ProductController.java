package controller;

import entity.Product;
import model.DAOProduct;
import java.io.IOException;
import java.util.Vector;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductController", urlPatterns = {"/ProductController"})
public class ProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        DAOProduct dao = new DAOProduct();

        switch (service) {
            case "listAll":
                listAllProducts(request, response, dao);
                break;
            case "updateProduct":
                updateProduct(request, response, dao);
                break;
            case "addProduct":
                addProduct(request, response);
                break;
            case "deleteProduct":
                deleteProduct(request, response, dao);
                break;
            case "detailProduct":
                detailProduct(request, response, dao);
                break;
            default:
                listAllProducts(request, response, dao);
                break;
        }
    }

    private void listAllProducts(HttpServletRequest request, HttpServletResponse response, DAOProduct dao)
            throws ServletException, IOException {
        Vector<Product> productList = dao.getAllProducts();
        request.setAttribute("productList", productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ProductList.jsp");
        dispatcher.forward(request, response);
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response, DAOProduct dao)
            throws ServletException, IOException {
        String submit = request.getParameter("submit");
        if (submit == null) {
            int pid = Integer.parseInt(request.getParameter("pid"));
            Product product = dao.getProductByID(pid);
            request.setAttribute("product", product);
            RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateProduct.jsp");
            dispatcher.forward(request, response);
        } else {
            try {
                int pid = Integer.parseInt(request.getParameter("pid"));
                String pname = request.getParameter("pname");
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                double price = Double.parseDouble(request.getParameter("price"));
                String description = request.getParameter("description");
                boolean status = Boolean.parseBoolean(request.getParameter("status"));
                int cateId = Integer.parseInt(request.getParameter("cateId"));
                String image = request.getParameter("image");

                Product product = new Product(pid, pname, quantity, price, description, status, cateId, image);
                int result = dao.updateProduct(product);
                request.setAttribute("message", result > 0 ? "Product updated successfully." : "Failed to update product.");
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid number format. Please check your inputs.");
            } catch (Exception e) {
                request.setAttribute("error", "An unexpected error occurred: " + e.getMessage());
            }

            listAllProducts(request, response, dao);
        }
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ form
        String pname = request.getParameter("pname");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        int cateId = Integer.parseInt(request.getParameter("cateId"));
        String image = request.getParameter("image");

        // Tạo đối tượng Product
        Product product = new Product(0, pname, quantity, price, description, status, cateId, image);

        // Thực hiện thêm sản phẩm vào cơ sở dữ liệu
        DAOProduct daoProduct = new DAOProduct();
        int result = daoProduct.insertProduct(product);

        // Thiết lập thông báo
        String message = (result > 0) ? "Product added successfully!" : "Failed to add product.";
        request.setAttribute("message", message);

        // Chuyển hướng về trang danh sách sản phẩm hoặc trang nào đó
        request.getRequestDispatcher("ProductList.jsp").forward(request, response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response, DAOProduct dao)
            throws ServletException, IOException {
        try {
            int pid = Integer.parseInt(request.getParameter("pid"));
            int result = dao.deleteProduct(pid);
            request.setAttribute("message", result > 0 ? "Product deleted successfully." : "Failed to delete product.");
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid product ID format.");
        } catch (Exception e) {
            request.setAttribute("error", "An unexpected error occurred: " + e.getMessage());
        }

        listAllProducts(request, response, dao);
    }

    private void detailProduct(HttpServletRequest request, HttpServletResponse response, DAOProduct dao)
            throws ServletException, IOException {
        try {
            int pid = Integer.parseInt(request.getParameter("pid"));
            Product product = dao.getProductByID(pid);
            request.setAttribute("product", product);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ProductDetail.jsp");
            dispatcher.forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid product ID format.");
            listAllProducts(request, response, dao);
        } catch (Exception e) {
            request.setAttribute("error", "An unexpected error occurred: " + e.getMessage());
            listAllProducts(request, response, dao);
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
        return "Product Controller";
    }
}
