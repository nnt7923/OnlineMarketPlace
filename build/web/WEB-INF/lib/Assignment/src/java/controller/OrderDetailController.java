package controller;

import entity.OrderDetail;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOOrderDetail;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Vector;

@WebServlet(name = "OrderDetailController", urlPatterns = {"/OrderDetailControllerURL"})
public class OrderDetailController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOOrderDetail dao = new DAOOrderDetail();

        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        switch (service) {
            case "addOrderDetail":
                int orderId = Integer.parseInt(request.getParameter("orderId"));
                String productName = request.getParameter("productName");
                String productImage = request.getParameter("productImage");
                double productPrice = Double.parseDouble(request.getParameter("productPrice"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                
                OrderDetail newOrderDetail = new OrderDetail(orderId, productName, productImage, productPrice, quantity);
                dao.addOrderDetail(newOrderDetail);
                
                response.sendRedirect("OrderDetailControllerURL?service=listAll");
                break;
                
            case "listAll":
                Vector<OrderDetail> orderDetailList = dao.getAllOrderDetails();
                request.setAttribute("data", orderDetailList);
                RequestDispatcher listDispatcher = request.getRequestDispatcher("ManageOrderDetail.jsp");
                listDispatcher.forward(request, response);
                break;
                
            case "updateOrderDetail":
                String submit = request.getParameter("submit");
                if (submit == null) {
                    try {
                        int id = Integer.parseInt(request.getParameter("id"));
                        OrderDetail orderDetailToUpdate = dao.getOrderDetailById(id);
                        request.setAttribute("orderDetail", orderDetailToUpdate);
                        RequestDispatcher updateDispatcher = request.getRequestDispatcher("ManageOrderDetail.jsp?service=updateOrderDetailForm");
                        updateDispatcher.forward(request, response);
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid OrderDetail ID");
                    }
                } else {
                    try {
                        int id = Integer.parseInt(request.getParameter("id"));
                        orderId = Integer.parseInt(request.getParameter("orderId"));
                        productName = request.getParameter("productName");
                        productImage = request.getParameter("productImage");
                        productPrice = Double.parseDouble(request.getParameter("productPrice"));
                        quantity = Integer.parseInt(request.getParameter("quantity"));
                        
                        OrderDetail updatedOrderDetail = new OrderDetail(id, orderId, productName, productImage, productPrice, quantity);
                        dao.updateOrderDetail(updatedOrderDetail);
                        
                        response.sendRedirect("OrderDetailControllerURL?service=listAll");
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input format");
                    }
                }
                break;
                
            case "deleteOrderDetail":
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    dao.deleteOrderDetail(id);
                    response.sendRedirect("OrderDetailControllerURL?service=listAll");
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid OrderDetail ID");
                }
                break;
                
            case "addOrderDetailForm":
                RequestDispatcher addDispatcher = request.getRequestDispatcher("ManageOrderDetail.jsp?service=addOrderDetailForm");
                addDispatcher.forward(request, response);
                break;
                
            case "updateOrderDetailForm":
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    OrderDetail orderDetailToUpdateForm = dao.getOrderDetailById(id);
                    request.setAttribute("orderDetail", orderDetailToUpdateForm);
                    RequestDispatcher updateFormDispatcher = request.getRequestDispatcher("ManageOrderDetail.jsp?service=updateOrderDetailForm");
                    updateFormDispatcher.forward(request, response);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid OrderDetail ID");
                }
                break;
                
            default:
                response.sendRedirect("OrderDetailControllerURL?service=listAll");
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
        return "OrderDetail Controller Servlet";
    }
}
