package controller;

import dao.ProductDAO;
import model.ProductDetails;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductDetailServlet", urlPatterns = {"/productDetail","/seller/productDetail"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
        maxFileSize = 1024 * 1024 * 10,       // 10MB per file
        maxRequestSize = 1024 * 1024 * 50     // 50MB overall
)
public class ProductDetailServlet extends HttpServlet {

    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equalsIgnoreCase(action)) {
            try {
                addProductDetail(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Error adding product details: " + e.getMessage());
                request.getRequestDispatcher("/seller/errorPage.jsp").forward(request, response);
            }
        }
    }

    private void addProductDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        try {
            // Retrieve form data
            String productIdStr = request.getParameter("product_id");
            String pdname = request.getParameter("pdname");
            String pdpriceDiscountStr = request.getParameter("pdprice_discount");
            String pdcolor = request.getParameter("pdcolor");
            String pdcriteria = request.getParameter("pdcriteria");
            String pdquantityStr = request.getParameter("pdquantity");
            String pddescribe = request.getParameter("pddescribe");
            String pdspecification = request.getParameter("pdspecification");

            // Parse numerical inputs
            int productId = Integer.parseInt(productIdStr);
            double pdpriceDiscount = Double.parseDouble(pdpriceDiscountStr);
            int pdquantity = Integer.parseInt(pdquantityStr);

            // Initialize a list to store image paths
            List<String> imgPaths = new ArrayList<>();

            // Define the upload path for images
            String uploadPath = getServletContext().getRealPath("/uploads");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            // Process each uploaded image
            for (Part filePart : request.getParts()) {
                if ("pdimg".equals(filePart.getName()) && filePart.getSize() > 0) {
                    String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
                    filePart.write(uploadPath + File.separator + fileName);
                    imgPaths.add("uploads/" + fileName);
                }
            }

            // Convert the list of image paths to an array
            String[] imgPathsArray = imgPaths.toArray(new String[0]);

            // Create ProductDetails object with the array of image paths
            ProductDetails productDetails = new ProductDetails(
                0,  // New record, so ID is 0
                productId,
                pdcolor,
                pdpriceDiscount,
                imgPathsArray,  // Array of image paths
                pdcriteria,
                pdquantity,
                pddescribe,
                pdspecification
            );

            // Call DAO to add product details to the database
            productDAO.addProductDetails(productDetails);

            // Redirect or forward to a success page
            response.sendRedirect("product?service=listProductDetails");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error while adding product details: " + e.getMessage());
            request.getRequestDispatcher("/seller/errorPage.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/productDetailForm.jsp").forward(request, response);
    }
}
