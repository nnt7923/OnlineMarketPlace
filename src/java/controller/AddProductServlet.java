package controller;

import dao.ProductDAO;
import dao.SellerDAO;
import model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.SQLException;

@WebServlet(name = "AddProductServlet", urlPatterns = {"/addProduct", "/seller/addProduct"})

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class AddProductServlet extends HttpServlet {

    private ProductDAO productDAO;
    private SellerDAO sellerDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
        sellerDAO = new SellerDAO();
    }

protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Gọi hàm xử lý thêm sản phẩm
    processAddProduct(request, response);
}

private void processAddProduct(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    if (request.getMethod().equalsIgnoreCase("POST")) {
        try {
            // Truyền dữ liệu trực tiếp vào servlet
            String name = "Tên sản phẩm"; // Ví dụ: truyền trực tiếp
            double price = 100.0; // Ví dụ: giá sản phẩm
            String title = "Tiêu đề sản phẩm"; // Ví dụ: tiêu đề sản phẩm
            int cateID = 1; // Ví dụ: ID danh mục
            int brandId = 1; // Ví dụ: ID thương hiệu
            
            // Xử lý hình ảnh (nếu cần)
            String imgPath = "uploads/default_image.png"; // Ví dụ: đường dẫn hình ảnh mặc định
            
            // Lấy sellerId từ session
            HttpSession session = request.getSession(false);
            if (session == null) {
                request.setAttribute("errorMessage", "Please log in again.");
                response.sendRedirect("login.jsp");
                return;
            }
            Integer accountId = (Integer) session.getAttribute("account_id");
            if (accountId == null) {
                request.setAttribute("errorMessage", "Please log in again.");
                response.sendRedirect("login.jsp");
                return;
            }
            int sellerId = sellerDAO.getSellerIdByAccountId(accountId);

            // Tạo đối tượng Product
            Product product = new Product(0, name, price, title, cateID, brandId, sellerId, imgPath);
            productDAO.addProductFromForm(product, accountId);

            // Thông báo thành công
            request.setAttribute("successMessage", "Product added successfully.");
            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Database error. Please try again.");
            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
        }
    } else {
        request.getRequestDispatcher("addProduct.jsp").forward(request, response);
    }
}


}
