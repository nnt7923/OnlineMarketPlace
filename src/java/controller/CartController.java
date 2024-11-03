package controller;

import dao.CartDAO;
import dao.ProductDetailsDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Cart;
import model.CartDetail;
import model.ProductDetails;

public class CartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        CartDAO cartdao = new CartDAO();
        ProductDetailsDAO pddao = new ProductDetailsDAO();
                
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("account");
        Cart cart = getCartForUser(user, session, cartdao);

        // Handle add item to cart
        String productIdParam = request.getParameter("productDetailId");
        if (productIdParam != null) {
            try {
                int productDetailId = Integer.parseInt(productIdParam);
                ProductDetails productDetail = pddao.getProductDetailById(productDetailId);
                if (productDetail != null) {
                    CartDetail existingItem = cart.getItemByProductDetailId(productDetailId);
                    if (existingItem != null) {
                        existingItem.setQuantity(existingItem.getQuantity() + 1);
                        cartdao.updateCartDetail(existingItem, cart.getCartId());
                    } else {
                        int cartId = cart.getCartId();
                        CartDetail newItem = new CartDetail(0, 1, productDetail); 
                        cart.addItem(newItem);
                        cartdao.insertCartDetail(newItem, cart.getCartId());
                    }
                }
            } catch (NumberFormatException e) {
                // Handle error
            }
        }

        // Handle remove item from cart
        handleRemoveItemFromCart(request, cart, user, cartdao);

        // Get items in cart and total money
        List<CartDetail> listItemsInCart = cart.getItems();
        double totalMoney = cart.getTotalMoney();

        // Update session attributes
        updateSessionAttributes(session, cart, listItemsInCart, totalMoney);

        // Set request attributes
        updateRequestAttributes(request, cart, listItemsInCart, totalMoney);

        // Forward to cart.jsp
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    private Cart getCartForUser(Account account, HttpSession session, CartDAO cartDB) {
        Cart cart = null;
        if (account != null) {
            cart = cartDB.getCartByAccountId(account.getAccountId());
            if (cart == null) {
                cart = new Cart();
                cart.setAccount(account);
                cartDB.insertCart(cart);
            } else {
                session.setAttribute("cart", cart);
            }
        } else {
            cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
        }
        return cart;
    }

    private void handleRemoveItemFromCart(HttpServletRequest request, Cart cart, Account account, CartDAO cartDB) {
        String tRid = request.getParameter("rid");
        if (tRid != null) {
            try {
                int rid = Integer.parseInt(tRid);
                cart.removeItem(rid);
                if (account != null) {
                    cartDB.deleteCartDetail(rid, cart.getCartId());
                }
            } catch (NumberFormatException e) {
                // Handle error
            }
        }
    }

    private void updateSessionAttributes(HttpSession session, Cart cart, List<CartDetail> listItemsInCart, double totalMoney) {
        session.setAttribute("cart", cart);
        session.setAttribute("listItemsInCart", listItemsInCart);
        session.setAttribute("cartSize", listItemsInCart.size());
        session.setAttribute("totalMoney", totalMoney);
    }

    private void updateRequestAttributes(HttpServletRequest request, Cart cart, List<CartDetail> listItemsInCart, double totalMoney) {
        request.setAttribute("cart", cart);
        request.setAttribute("listItemsInCart", listItemsInCart);
        request.setAttribute("cartSize", listItemsInCart.size());
        request.setAttribute("totalMoney", totalMoney);
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
        return "CartController handles displaying and updating the shopping cart";
    }
}
