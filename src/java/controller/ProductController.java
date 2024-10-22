package controller;

import dao.BrandDAO;
import dao.CategoryDAO;
import dao.ProductDAO;
import dao.SellerDAO;
import model.Product;
import jakarta.servlet.RequestDispatcher;
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
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Brand;
import model.Category;
import model.ProductDetails;

@WebServlet(name = "ProductController", urlPatterns = {"/product", "/seller/product"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class ProductController extends HttpServlet {

    private ProductDAO productDAO;
    private SellerDAO sellerDAO;
    private static final Logger logger = Logger.getLogger(ProductController.class.getName());

    @Override
    public void init() {
        productDAO = new ProductDAO();
        sellerDAO = new SellerDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        try {
            switch (service) {
                case "listAll":
//                    listAllProducts(request, response);
                    break;
                case "addProduct":
                    addProduct(request, response);
                    break;
//                case "updateProduct":
//                    updateProduct(request, response);
//                    break;
//                case "deleteProduct":
//                    deleteProduct(request, response);
//                    break;
//                case "searchProduct":
//                    searchProduct(request, response);
//                    break;
                case "addProductForm":
                    showAddProductForm(request, response);
                    break;
                case "addProductDetailForm":
                    showAddProductDetailForm(request, response); // Hiển thị form thêm chi tiết sản phẩm
                    break;
                case "addProductDetail":
                    addProductDetail(request, response); // Xử lý thêm chi tiết sản phẩm
                    break;
                case "delete":
                    deleteProductDetail(request, response);
                    break;
                case "editForm":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateProductDetail(request, response);
                    break;
                case "list":
                    listProductDetails(request, response);
                    break;
//                case "updateProductForm":
//                    showUpdateProductForm(request, response);
//                    break;
                default:
                    response.sendRedirect("product?service=listAll");
                    break;
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error in processRequest: " + e.getMessage(), e);
            e.printStackTrace(); // In ra toàn bộ thông tin lỗi để dễ debug hơn
            response.sendRedirect("errorPage.jsp");
        }

    }

//    private void listAllProducts(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        List<Product> products = productDAO.listAll();
//        request.setAttribute("products", products);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/seller/manageProduct.jsp");
//        dispatcher.forward(request, response);
//    }
private void addProduct(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    if (request.getMethod().equalsIgnoreCase("POST")) {
        try {
            // Lấy các tham số từ form
            String name = request.getParameter("name");
            String priceStr = request.getParameter("price");
            String title = request.getParameter("title");
            String cateIDStr = request.getParameter("cateID");
            String brandIdStr = request.getParameter("brand_id");

            // Kiểm tra hình ảnh
            Part filePart = request.getPart("img");
            if (filePart == null || filePart.getSize() == 0) {
                request.setAttribute("errorMessage", "Please select an image.");
                showAddProductForm(request, response);
                return;
            }

            // Xử lý hình ảnh
            String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
            String uploadPath = getServletContext().getRealPath("/") + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            filePart.write(uploadPath + File.separator + fileName);
            String imgPath = "uploads/" + fileName;

            // Kiểm tra dữ liệu đầu vào
            if (name == null || name.trim().isEmpty() || priceStr == null || priceStr.trim().isEmpty() ||
                title == null || title.trim().isEmpty() || cateIDStr == null || cateIDStr.trim().isEmpty() ||
                brandIdStr == null || brandIdStr.trim().isEmpty()) {
                request.setAttribute("errorMessage", "Please fill in all fields.");
                showAddProductForm(request, response);
                return;
            }

            // Chuyển đổi dữ liệu đầu vào
            double price = Double.parseDouble(priceStr);
            int cateID = Integer.parseInt(cateIDStr);
            int brandId = Integer.parseInt(brandIdStr);

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
            showAddProductForm(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid number format. Please check your input.");
            showAddProductForm(request, response);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Database error . Please try again.");
            showAddProductForm(request, response);
        }
    } else {
        showAddProductForm(request, response);
    }
}

//    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
//            throws IOException {
//        try {
//            int productId = Integer.parseInt(request.getParameter("productId"));
//            String name = request.getParameter("name");
//            String priceStr = request.getParameter("price");
//            String title = request.getParameter("title");
//            String cateIDStr = request.getParameter("cateID");
//            String brandIdStr = request.getParameter("brand_id");
//
//            double price = Double.parseDouble(priceStr);
//            int cateID = Integer.parseInt(cateIDStr);
//            int brandId = Integer.parseInt(brandIdStr);
//
//            Product updatedProduct = new Product(productId, name, price, title, cateID, brandId, 0); 
//            productDAO.updateProduct(updatedProduct);
//            response.sendRedirect("product?service=listAll");
//        } catch (NumberFormatException e) {
//            logger.log(Level.SEVERE, "Error parsing product ID: " + e.getMessage(), e);
//            response.sendRedirect("errorPage.jsp");
//        }
//    }
//    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
//            throws IOException {
//        try {
//            int productIdToDelete = Integer.parseInt(request.getParameter("productId"));
//            productDAO.deleteProduct(productIdToDelete);
//            response.sendRedirect("product?service=listAll");
//        } catch (NumberFormatException e) {
//            logger.log(Level.SEVERE, "Error parsing productId: " + e.getMessage(), e);
//            response.sendRedirect("errorPage.jsp");
//        }
//    }
//    private void searchProduct(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String keyword = request.getParameter("keyword");
//        List<Product> searchedProducts = productDAO.searchProducts(keyword);
//        request.setAttribute("products", searchedProducts);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/seller/manageProduct.jsp");
//        dispatcher.forward(request, response);
//    }
    private void showAddProductForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy danh sách danh mục và thương hiệu
        CategoryDAO categoryDAO = new CategoryDAO();
        BrandDAO brandDAO = new BrandDAO();
        List<Category> categories = categoryDAO.listAllNoImg();
        List<Brand> brands = brandDAO.listAll();
        // Đặt dữ liệu vào request attribute để truyền đến JSP
        request.setAttribute("categories", categories);
        request.setAttribute("brands", brands);
        // Chuyển tiếp tới trang addProduct.jsp

                      
        RequestDispatcher dispatcher = request.getRequestDispatcher("/seller/addProduct.jsp");
        dispatcher.forward(request, response);
    }

//    private void showUpdateProductForm(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        try {
//            int productIdToUpdate = Integer.parseInt(request.getParameter("productId"));
//            Product productToUpdate = productDAO.getProductById(productIdToUpdate);
//            request.setAttribute("product", productToUpdate);
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/seller/editProduct.jsp");
//            dispatcher.forward(request, response);
//        } catch (NumberFormatException e) {
//            logger.log(Level.SEVERE, "Error parsing productId: " + e.getMessage(), e);
//            response.sendRedirect("errorPage.jsp");
//        }
//    }
    // Hiển thị form thêm chi tiết sản phẩm
    private void showAddProductDetailForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer accountId = (Integer) session.getAttribute("account_id");

        if (accountId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Lấy seller_id từ accountId
            int sellerId = sellerDAO.getSellerIdByAccountId(accountId);

            // Lấy danh sách sản phẩm của seller
            List<Product> products = productDAO.getProductsBySellerId(sellerId);

            // Kiểm tra xem có sản phẩm nào không
            if (products.isEmpty()) {
                request.setAttribute("errorMessage", "Không có sản phẩm nào được tìm thấy.");
            } else {
                request.setAttribute("products", products);
            }

            // Chuyển tiếp tới trang thêm chi tiết sản phẩm
            RequestDispatcher dispatcher = request.getRequestDispatcher("/seller/addProductDetail.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi cơ sở dữ liệu.");
            response.sendRedirect("errorPage.jsp");
        }
    }

    // Xử lý thêm chi tiết sản phẩm
    private void addProductDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        if (request.getMethod().equalsIgnoreCase("POST")) {
            try {
                String productIdStr = request.getParameter("product_id");
                String pdpriceDiscountStr = request.getParameter("pdprice_discount");
                String pdcolor = request.getParameter("pdcolor");
                String pdimg = request.getParameter("pdimg");
                String pdcriteria = request.getParameter("pdcriteria");
                String pdquantityStr = request.getParameter("pdquantity");
                String pddescribe = request.getParameter("pddescribe");
                String pdspecification = request.getParameter("pdspecification");

                // Kiểm tra giá trị đầu vào
                if (productIdStr == null || pdpriceDiscountStr == null || pdquantityStr == null) {
                    request.setAttribute("errorMessage", "Vui lòng nhập đầy đủ thông tin.");
                    showAddProductDetailForm(request, response);
                    return;
                }

                // Chuyển đổi giá trị nhập vào
                int productId = Integer.parseInt(productIdStr);
                double pdpriceDiscount = Double.parseDouble(pdpriceDiscountStr);
                int pdquantity = Integer.parseInt(pdquantityStr);

                // Tạo đối tượng ProductDetails và thêm vào cơ sở dữ liệu
                ProductDetails productDetails = new ProductDetails(productId, productId, pdimg, pdpriceDiscount, pdcolor, pdimg, pdcriteria, pdquantity, pddescribe, pdspecification);
                productDAO.addProductDetails(productDetails);

                request.setAttribute("successMessage", "Thêm chi tiết sản phẩm thành công.");
                showAddProductDetailForm(request, response);
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Lỗi: " + e.getMessage());
                showAddProductDetailForm(request, response);
            }
        } else {
            showAddProductDetailForm(request, response);
        }
    }
protected void listProductDetails(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, ServletException, IOException {
    HttpSession session = request.getSession();
    Integer accountId = (Integer) session.getAttribute("account_id");

    if (accountId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    try {
        // Lấy seller_id từ accountId
        int sellerId = sellerDAO.getSellerIdByAccountId(accountId);

        // Lấy danh sách chi tiết sản phẩm của seller dựa vào sellerId
        List<ProductDetails> productDetailsList = productDAO.getProductDetailsBySellerId(sellerId);

        // Đặt danh sách sản phẩm chi tiết vào request attribute để truyền đến JSP
        request.setAttribute("productDetailsList", productDetailsList);

        // Chuyển tiếp đến trang JSP hiển thị danh sách chi tiết sản phẩm
        RequestDispatcher dispatcher = request.getRequestDispatcher("/seller/productDetailList.jsp");
        dispatcher.forward(request, response);
    } catch (SQLException e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "Lỗi khi lấy dữ liệu sản phẩm.");
        response.sendRedirect("errorPage.jsp");
    }
}


    private void deleteProductDetail(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int pdId = Integer.parseInt(request.getParameter("pd_id"));
        productDAO.deleteProductDetails(pdId);
        response.sendRedirect("product?action=list");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int pdId = Integer.parseInt(request.getParameter("pd_id"));
        ProductDetails existingProductDetail = productDAO.getProductDetailsById(pdId);  // Thêm phương thức này vào DAO
        request.setAttribute("productDetail", existingProductDetail);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/seller/productDetailEdit.jsp");
        dispatcher.forward(request, response);
    }

    private void updateProductDetail(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int pdId = Integer.parseInt(request.getParameter("pd_id"));
        String pdname = request.getParameter("pdname");
        double pdpriceDiscount = Double.parseDouble(request.getParameter("pdprice_discount"));
        String pdcolor = request.getParameter("pdcolor");
        String pdimg = request.getParameter("pdimg");
        String pdcriteria = request.getParameter("pdcriteria");
        int pdquantity = Integer.parseInt(request.getParameter("pdquantity"));
        String pddescribe = request.getParameter("pddescribe");
        String pdspecification = request.getParameter("pdspecification");

        ProductDetails productDetails = new ProductDetails(pdId, pdId, pdname, pdpriceDiscount, pdcolor, pdimg, pdcriteria, pdquantity, pddescribe, pdspecification);
        productDAO.updateProductDetails(productDetails);
        response.sendRedirect("productDetails?action=list");
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
        return "ProductController";
    }
}
