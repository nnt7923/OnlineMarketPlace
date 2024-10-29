package controller;

import entity.Shipping;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOShipping;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Vector;

@WebServlet(name = "ShippingController", urlPatterns = {"/ShippingController"})
public class ShippingController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOShipping dao = new DAOShipping();

        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        switch (service) {
            case "addShipping":
                String name = request.getParameter("name");
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                
                Shipping newShipping = new Shipping(0, name, phone, address); // ID is auto-incremented
                dao.addShipping(newShipping);
                
                response.sendRedirect("ShippingController?service=listAll");
                break;
                
            case "listAll":
                Vector<Shipping> shippingList = dao.getAllShippings();
                request.setAttribute("data", shippingList);
                RequestDispatcher listDispatcher = request.getRequestDispatcher("ManageShipping.jsp");
                listDispatcher.forward(request, response);
                break;
                
            case "updateShipping":
                String submit = request.getParameter("submit");
                if (submit == null) {
                    try {
                        int id = Integer.parseInt(request.getParameter("id"));
                        Shipping shippingToUpdate = dao.getShippingById(id);
                        request.setAttribute("shipping", shippingToUpdate);
                        RequestDispatcher updateDispatcher = request.getRequestDispatcher("ManageShipping.jsp?service=updateShippingForm");
                        updateDispatcher.forward(request, response);
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Shipping ID");
                    }
                } else {
                    try {
                        int id = Integer.parseInt(request.getParameter("id"));
                        name = request.getParameter("name");
                        phone = request.getParameter("phone");
                        address = request.getParameter("address");
                        
                        Shipping updatedShipping = new Shipping(id, name, phone, address);
                        dao.updateShipping(updatedShipping);
                        
                        response.sendRedirect("ShippingController?service=listAll");
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input format");
                    }
                }
                break;
                
            case "deleteShipping":
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    dao.deleteShipping(id);
                    response.sendRedirect("ShippingController?service=listAll");
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Shipping ID");
                }
                break;
                
            case "addShippingForm":
                RequestDispatcher addDispatcher = request.getRequestDispatcher("ManageShipping.jsp?service=addShippingForm");
                addDispatcher.forward(request, response);
                break;
                
            case "updateShippingForm":
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    Shipping shippingToUpdateForm = dao.getShippingById(id);
                    request.setAttribute("shipping", shippingToUpdateForm);
                    RequestDispatcher updateFormDispatcher = request.getRequestDispatcher("ManageShipping.jsp?service=updateShippingForm");
                    updateFormDispatcher.forward(request, response);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Shipping ID");
                }
                break;
                
            default:
                response.sendRedirect("ShippingController?service=listAll");
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
        return "Shipping Controller Servlet";
    }
}
