package controller;

import entity.Cart;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOCart;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Vector;

@WebServlet(name = "CartController", urlPatterns = {"/CartControllerURL"})
public class CartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOCart dao = new DAOCart();

        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        switch (service) {
            case "addCart":
                // Get data from request
                int accountID = Integer.parseInt(request.getParameter("accountID"));
                int productID = Integer.parseInt(request.getParameter("productID"));
                int amount = Integer.parseInt(request.getParameter("amount"));
                
                Cart cart = new Cart(accountID, productID, amount);
                dao.addCart(cart);
                
                response.sendRedirect("CartControllerURL?service=listCartsByAccountId&accountID=" + accountID);
                break;
                
            case "listAll":
                Vector<Cart> allCarts = dao.getAllCarts();
                request.setAttribute("data", allCarts);
                RequestDispatcher allCartsDispatcher = request.getRequestDispatcher("ManageCart.jsp");
                allCartsDispatcher.forward(request, response);
                break;
                
            case "listCartsByAccountId":
                try {
                    accountID = Integer.parseInt(request.getParameter("accountID"));
                    Vector<Cart> cartsByAccount = dao.getCartsByAccountId(accountID);
                    request.setAttribute("data", cartsByAccount);
                    RequestDispatcher listByAccountDispatcher = request.getRequestDispatcher("ManageCart.jsp?service=listCartsByAccountId");
                    listByAccountDispatcher.forward(request, response);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Account ID");
                }
                break;
                
            case "updateCart":
                String submit = request.getParameter("submit");
                if (submit == null) {
                    try {
                        accountID = Integer.parseInt(request.getParameter("accountID"));
                        productID = Integer.parseInt(request.getParameter("productID"));
                        Cart cartToUpdate = new Cart(accountID, productID, 0); // Placeholder amount, real value will be set in the next block
                        request.setAttribute("cart", cartToUpdate);
                        RequestDispatcher updateDispatcher = request.getRequestDispatcher("ManageCart.jsp?service=updateCartForm");
                        updateDispatcher.forward(request, response);
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Account ID or Product ID");
                    }
                } else {
                    try {
                        accountID = Integer.parseInt(request.getParameter("accountID"));
                        productID = Integer.parseInt(request.getParameter("productID"));
                        amount = Integer.parseInt(request.getParameter("amount"));
                        
                        Cart updatedCart = new Cart(accountID, productID, amount);
                        dao.updateCart(updatedCart);
                        
                        response.sendRedirect("CartControllerURL?service=listCartsByAccountId&accountID=" + accountID);
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input format");
                    }
                }
                break;
                
            case "deleteCart":
                try {
                    accountID = Integer.parseInt(request.getParameter("accountID"));
                    productID = Integer.parseInt(request.getParameter("productID"));
                    dao.deleteCart(accountID, productID);
                    response.sendRedirect("CartControllerURL?service=listCartsByAccountId&accountID=" + accountID);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Account ID or Product ID");
                }
                break;
                
            case "addCartForm":
                RequestDispatcher addDispatcher = request.getRequestDispatcher("ManageCart.jsp?service=addCartForm");
                addDispatcher.forward(request, response);
                break;
                
            case "updateCartForm":
                try {
                    accountID = Integer.parseInt(request.getParameter("accountID"));
                    productID = Integer.parseInt(request.getParameter("productID"));
                    Cart cartToUpdateForm = new Cart(accountID, productID, 0); // Placeholder amount
                    request.setAttribute("cart", cartToUpdateForm);
                    RequestDispatcher updateFormDispatcher = request.getRequestDispatcher("ManageCart.jsp?service=updateCartForm");
                    updateFormDispatcher.forward(request, response);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Account ID or Product ID");
                }
                break;
                
            default:
                response.sendRedirect("CartControllerURL?service=listAll");
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
        return "Cart Controller Servlet";
    }
}
