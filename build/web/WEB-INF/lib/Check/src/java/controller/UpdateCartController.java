package controller;

import com.google.gson.JsonObject;
import dao.CartDAO;
import dao.ProductDetailsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.CartDetail;
import model.ProductDetails;

public class UpdateCartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        String productIdParam = request.getParameter("productId");
        String oldProductDetailIdParam = request.getParameter("oldProductDetailId");
        String newProductDetailIdParam = request.getParameter("newProductDetailId");
        String newColor = request.getParameter("newColor");
        String newCriteria = request.getParameter("newCriteria");

        int productId = Integer.parseInt(productIdParam);
        int oldProductDetailId = Integer.parseInt(oldProductDetailIdParam);
        int newProductDetailId = Integer.parseInt(newProductDetailIdParam);

        // Get the cart from session
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        // Get the new product detail from the database
        ProductDetailsDAO productDetailDB = new ProductDetailsDAO();
        ProductDetails newProductDetail = productDetailDB.getProductDetailById(newProductDetailId);

        JsonObject jsonResponse = new JsonObject();

        try {
            // Replace the old product with the new one in the cart
            if (newProductDetail != null) {
                CartDetail oldCartDetail = cart.getItemByProductDetailId(oldProductDetailId);
                if (oldCartDetail != null) {
                    // Remove the old item
                    cart.removeItem(oldProductDetailId);
                    // Add the new item with the old item's quantity
                    CartDetail newCartDetail = new CartDetail(0, oldCartDetail.getQuantity(), newProductDetail);
                    cart.addItem(newCartDetail);
                    if (session.getAttribute("account") != null) {
                        // Update the database if the user is logged in
                        CartDAO cartDB = new CartDAO();
                        cartDB.deleteCartDetail(oldProductDetailId, cart.getCartId());
                        cartDB.insertCartDetail(newCartDetail, cart.getCartId());
                    }
                    jsonResponse.addProperty("status", "success");
                } else {
                    jsonResponse.addProperty("status", "error");
                    jsonResponse.addProperty("message", "S?n ph?m c? kh�ng t?n t?i trong gi? h�ng.");
                }
            } else {
                jsonResponse.addProperty("status", "error");
                jsonResponse.addProperty("message", "Kh�ng t�m th?y s?n ph?m m?i.");
            }
        } catch (Exception e) {
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "?� x?y ra l?i kh�ng mong mu?n!");
            e.printStackTrace();
        }

        // Update cart size in session
        session.setAttribute("cartSize", cart.getItems().size());
        out.print(jsonResponse.toString());
        out.flush();
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
