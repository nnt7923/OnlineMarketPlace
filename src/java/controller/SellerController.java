package controller;

import dao.AccountDAO;
import dao.ProductDetailsDAO;
import dao.SellerDAO;
import model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.OrderDetail;
import model.ProductDetails;
import model.Seller;
import model.Status;

@WebServlet({
    "/seller/dashboard",
    "/seller/profile",
    "/seller/edit",
    "/seller/update",
    "/seller/logout",
    "/seller/orderstatus",
    "/seller/ordermanagement",
    "/seller/orderpurchase"

})
public class SellerController extends HttpServlet {

    private AccountDAO accountDAO;
    private static final Logger logger = Logger.getLogger(SellerController.class.getName());

    @Override
    public void init() throws ServletException {
        super.init();
        accountDAO = new AccountDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        switch (path) {
            case "/seller/dashboard": {
                try {
                    showDashboard(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(SellerController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            break;

            case "/seller/profile":
                showProfile(request, response);
                break;
            case "/seller/edit":
                editProfile(request, response);
                break;
            case "/seller/update":
                updateProfile(request, response);
                break;
            case "/seller/logout":  // Fixed typo in logout path
                logout(request, response);
                break;
            case "/seller/orderstatus":
                showOrderStatus(request, response);
                break;
            case "/seller/ordermanagement":
                showOrderManagement(request, response);
                break;
            case "/seller/orderpurchase":
                showPurchaseOrder(request, response);
                break;
            default:
                response.sendRedirect("./dashboard.jsp");
        }
    }

    private void showDashboard(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("account");

        SellerDAO sellerDAO = new SellerDAO();
        Seller seller = sellerDAO.getSellerByAccountId(user.getAccountId());
        user.setSeller(seller);
        int sellerId = user.getSeller().getSellerId();
        seller = sellerDAO.getSellerBySellerId(sellerId);
        request.setAttribute("seller", seller);
        request.getRequestDispatcher("./dashboard.jsp").forward(request, response);
    }

    private void showOrderStatus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("account");

        if (user != null) {
            SellerDAO sellerDAO = new SellerDAO();
            Seller seller = sellerDAO.getSellerByAccountId(user.getAccountId());
            user.setSeller(seller);

            int sellerId = user.getSeller().getSellerId();

            // Default to the first page if "page" parameter is missing or invalid
            int pageIndex = 1;
            String pageParam = request.getParameter("page");
            if (pageParam != null) {
                try {
                    pageIndex = Integer.parseInt(pageParam);
                } catch (NumberFormatException e) {
                    // If parsing fails, pageIndex will remain 1
                    e.printStackTrace();
                }
            }

            try {
                // Fetch total products, orders, and out-of-stock count
                int totalProducts = sellerDAO.getTotalProductsBySellerId(sellerId);
                int totalOrders = sellerDAO.getTotalOrdersBySellerId(sellerId);
                int outOfStockCount = sellerDAO.getOutOfStockProductsCountBySellerId(sellerId, 4);

                // Fetch paginated list of orders for the current page
                List<Order> orderList = sellerDAO.pagingOrders(sellerId, pageIndex);

                // Calculate the total number of pages
                int pageSize = 5; // Number of orders per page
                int totalPages = (int) Math.ceil((double) totalOrders / pageSize);

                // Set attributes in the request to pass data to JSP
                request.setAttribute("totalProducts", totalProducts);
                request.setAttribute("totalOrders", totalOrders);
                request.setAttribute("outOfStockCount", outOfStockCount);
                request.setAttribute("orderList", orderList);
                request.setAttribute("currentPage", pageIndex);
                request.setAttribute("totalPages", totalPages);

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Error fetching order status data: " + e.getMessage());
            }
        } else {
            // Redirect to login or an error page if user is not logged in
            request.setAttribute("errorMessage", "User is not logged in.");
        }

        // Forward the request and response to orderstatus.jsp
        request.getRequestDispatcher("orderstatus.jsp").forward(request, response);
    }

    private void showOrderManagement(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("account");

        if (user != null) {
            SellerDAO sellerDAO = new SellerDAO();
            Seller seller = sellerDAO.getSellerByAccountId(user.getAccountId());
            user.setSeller(seller);

            int sellerId = user.getSeller().getSellerId();

            int pageIndex = 1;
            String pageParam = request.getParameter("page");
            if (pageParam != null) {
                try {
                    pageIndex = Integer.parseInt(pageParam);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
            }

            try {
                String orderIdParam = request.getParameter("orderId");
                String statusIdParam = request.getParameter("statusId");

                // N?u các tham s? không null, ti?n hành c?p nh?t
                if (orderIdParam != null && statusIdParam != null) {
                    int orderId = Integer.parseInt(orderIdParam);
                    int statusId = Integer.parseInt(statusIdParam);

                    boolean isUpdated = sellerDAO.updateOrderStatus(orderId, statusId);

                    // Ki?m tra k?t qu? c?p nh?t
                    if (isUpdated) {
                        System.out.println("Order status updated successfully.");
                        request.setAttribute("updateMessage", "Order status updated successfully.");
                    } else {
                        System.out.println("Failed to update order status.");
                        request.setAttribute("updateMessage", "Failed to update order status.");
                    }
                }
                int statusId = (statusIdParam != null && !statusIdParam.isEmpty()) ? Integer.parseInt(statusIdParam) : 0;

                List<Status> status = sellerDAO.getAllStatuses();
                String searchQuery = request.getParameter("searchQuery");
                List<Order> orderList;
                if (statusId == 0) {
                    orderList = sellerDAO.pagingOrders(sellerId, pageIndex); // Get all orders
                } else {
                    orderList = sellerDAO.getFilterByStatus(statusId); // Get orders filtered by statusId
                }

                int totalOrders;
                // N?u có tìm ki?m
                if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                    orderList = sellerDAO.searchOrdersByStatus(searchQuery,statusId);
                    totalOrders = orderList.size();
                } else {
                    // N?u không có tìm ki?m
                    if (statusId == 0) {
                        orderList = sellerDAO.pagingOrders(sellerId, pageIndex);
                        totalOrders = sellerDAO.getTotalOrdersBySellerId(sellerId);
                    } else {
                        orderList = sellerDAO.pagingOrdersByStatus(sellerId, statusId, pageIndex);
                        totalOrders = sellerDAO.getTotalOrdersBySellerIdAndStatus(sellerId, statusId);
                    }
                }

                int pageSize = 5;
                int totalPages = (int) Math.ceil((double) totalOrders / pageSize);

                // L?u tr? các thu?c tính vào request ?? hi?n th?
                request.setAttribute("orderList", orderList);
                request.setAttribute("currentPage", pageIndex);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("status", status);
                request.setAttribute("selectedStatusId", statusId);
                request.setAttribute("searchQuery", searchQuery);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Error fetching order data: " + e.getMessage());
            }

            request.getRequestDispatcher("ordermanagement.jsp").forward(request, response);
        } else {
            response.sendRedirect("../login.jsp");
        }
    }

    private void showPurchaseOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("account");

        if (user != null) {
            SellerDAO sellerDAO = new SellerDAO();
            try {
                String orderIdParam = request.getParameter("orderId");
                String statusIdParam = request.getParameter("statusId");

                if (orderIdParam != null && statusIdParam != null) {
                    int orderId = Integer.parseInt(orderIdParam);
                    int statusId = Integer.parseInt(statusIdParam);

                    boolean isUpdated = sellerDAO.updateOrderStatus(orderId, statusId);

                    // Ki?m tra k?t qu? c?p nh?t
                    if (isUpdated) {
                        System.out.println("Order status updated successfully.");
                        request.setAttribute("updateMessage", "Order status updated successfully.");
                    } else {
                        System.out.println("Failed to update order status.");
                        request.setAttribute("updateMessage", "Failed to update order status.");
                    }
                }

                int orderId = Integer.parseInt(request.getParameter("orderId"));

                List<OrderDetail> orderDetails = sellerDAO.getOrderDetailById(orderId);
                List<OrderDetail> productDetails = sellerDAO.getProductDetailsByOrderId(orderId);

                // Calculate total price
                double totalPrice = 0.0;
                for (OrderDetail detail : orderDetails) {
                    totalPrice += detail.getProductPrice() * detail.getQuantity();
                }

                // Calculate total money (assuming free shipping means no additional cost)
                double totalMoney = totalPrice;

                String orderStatus = orderDetails.get(0).getOrder().getStatus().getName();
                // ??t danh sách vào request ?? s? d?ng trong JSP
                request.setAttribute("orderDetails", orderDetails);
                request.setAttribute("productDetails", productDetails);
                request.setAttribute("orderStatus", orderStatus);
                request.setAttribute("totalMoney", totalMoney);
                request.getRequestDispatcher("orderpurchase.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Error fetching order data: " + e.getMessage());
            }
        } else {
            // N?u ng??i dùng ch?a ??ng nh?p, chuy?n h??ng ??n trang ??ng nh?p
            response.sendRedirect("../login.jsp");
        }
    }

    private void showProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Account account = null;

        if (session != null) {
            account = (Account) session.getAttribute("account");
        }

        if (account == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        } else {
            request.setAttribute("account", account);
            request.getRequestDispatcher("./profile.jsp").forward(request, response);
        }
    }

    private void editProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Account account = null;

        if (session != null) {
            account = (Account) session.getAttribute("account");
        }

        if (account == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        } else {
            request.setAttribute("account", account);
            request.getRequestDispatcher("editProfile.jsp").forward(request, response);
        }
    }

    private void updateProfile(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");

            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");

            if (account != null) {
                account.setUsername(username);
                account.setEmail(email);
                account.setPhone(phone);
                account.setAddress(address);

                accountDAO.update(account);
                response.sendRedirect("profile?service=showProfile");
            } else {
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error updating profile: " + e.getMessage(), e);
            response.sendRedirect("profile.jsp");
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession(false);  // Get existing session without creating a new one
        if (session != null) {
            session.invalidate();  // Invalidate the session to log the user out
        }
        response.sendRedirect(request.getContextPath() + "/logout");  // Redirect to the login page
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        PrintWriter out = response.getWriter();
        out.println(path); // B?n có th? b? dòng này khi không c?n ghi log

        switch (path) {
            case "/seller/update":
                updateProfile(request, response);
                break;

            case "/seller/ordermanagement":
                showOrderManagement(request, response);
                break;
            default:
                response.sendRedirect("./dashboard.jsp");
                break;
        }
    }

}
