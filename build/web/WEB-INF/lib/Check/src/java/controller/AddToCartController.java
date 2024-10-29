package controller;

import com.google.gson.JsonObject;
import dao.CartDAO;
import dao.ProductDetailsDAO;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Cart;
import model.CartDetail;
import model.ProductDetails;

public class AddToCartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        JsonObject jsonResponse = new JsonObject();

        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int productDetailId = Integer.parseInt(request.getParameter("productDetailId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            Account account = (Account) session.getAttribute("account");
            Cart cart = null;

            if (account == null) {
                cart = (Cart) session.getAttribute("cart");
                if (cart == null) {
                    cart = new Cart();
                    session.setAttribute("cart", cart);
                }
            } else {
                CartDAO cartDB = new CartDAO();
                cart = cartDB.getCartByAccountId(account.getAccountId());
                if (cart == null) {
                    cart = new Cart();
                    cart.setAccount(account);
                    cartDB.insertCart(cart);
                }
            }

            ProductDetailsDAO productDetailDB = new ProductDetailsDAO();
            ProductDetails pd = productDetailDB.getProductDetailById(productDetailId);

            if (pd == null) {
                jsonResponse.addProperty("status", "error");
                jsonResponse.addProperty("message", "Product not found.");
                out.print(jsonResponse.toString());
                out.flush();
                return;
            }

            CartDetail existingItem = cart.getItemByProductDetailId(productDetailId);

            if (quantity > 0) {
                if (existingItem == null || existingItem.getQuantity() + quantity <= pd.getQuantity()) {
                    if (existingItem != null) {
                        existingItem.setQuantity(existingItem.getQuantity() + quantity);
                        if (account != null) {
                            CartDAO cartDB = new CartDAO();
                            cartDB.updateCartDetail(existingItem, cart.getCartId());
                        }
                    } else {
                        CartDetail cartDetail = new CartDetail(0, quantity, pd);
                        cart.addItem(cartDetail);
                        if (account != null) {
                            CartDAO cartDB = new CartDAO();
                            cartDB.insertCartDetail(cartDetail, cart.getCartId());
                        }
                    }
                    jsonResponse.addProperty("status", "success");
                } else {
                    jsonResponse.addProperty("status", "error");
                    jsonResponse.addProperty("message", "Exceeded product quantity limit.");
                }
            } else {
                if (existingItem != null && existingItem.getQuantity() + quantity >= 1) {
                    existingItem.setQuantity(existingItem.getQuantity() + quantity);
                    if (account != null) {
                        CartDAO cartDB = new CartDAO();
                        cartDB.updateCartDetail(existingItem, cart.getCartId());
                    }
                    jsonResponse.addProperty("status", "success");
                } else {
                    jsonResponse.addProperty("status", "error");
                    jsonResponse.addProperty("message", "Cannot decrease quantity below 1.");
                }
            }

            // Set cart size in the session and return it in the JSON response
            session.setAttribute("cartSize", cart.getItems().size());
            jsonResponse.addProperty("cartSize", cart.getItems().size());
            jsonResponse.addProperty("message", "Item successfully added to cart.");
        } catch (NumberFormatException e) {
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "Invalid input.");
            e.printStackTrace();
        } catch (Exception e) {
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "An unexpected error occurred.");
            e.printStackTrace();
        }

        out.print(jsonResponse.toString());
        out.flush();
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
        return "AddToCartController handles adding products to the cart";
    }
}
