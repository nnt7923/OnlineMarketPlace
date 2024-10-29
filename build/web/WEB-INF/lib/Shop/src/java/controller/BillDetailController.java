package controller;

import entity.BillDetail;
import model.DAOBillDetail;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Vector;

@WebServlet(name = "BillDetailController", urlPatterns = {"/BillDetailController"})
public class BillDetailController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        DAOBillDetail dao = new DAOBillDetail();

        switch (action) {
            case "list":
                listBillDetails(request, response, dao);
                break;
            case "add":
                addBillDetail(request, response, dao);
                break;
            case "update":
                updateBillDetail(request, response, dao);
                break;
            case "delete":
                deleteBillDetail(request, response, dao);
                break;
            case "detail":
                detailBillDetail(request, response, dao);
                break;
            default:
                listBillDetails(request, response, dao);
                break;
        }
    }

    private void listBillDetails(HttpServletRequest request, HttpServletResponse response, DAOBillDetail dao)
            throws ServletException, IOException {
        Vector<BillDetail> billDetailList = dao.getAllBillDetails("SELECT * FROM BillDetail");
        request.setAttribute("billDetailList", billDetailList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("BillDetailList.jsp");
        dispatcher.forward(request, response);
    }

    private void addBillDetail(HttpServletRequest request, HttpServletResponse response, DAOBillDetail dao)
            throws ServletException, IOException {
        try {
            int bid = Integer.parseInt(request.getParameter("bid"));
            int pid = Integer.parseInt(request.getParameter("pid"));
            int buyQuantity = Integer.parseInt(request.getParameter("buyQuantity"));
            double buyPrice = Double.parseDouble(request.getParameter("buyPrice"));
            double subtotal = Double.parseDouble(request.getParameter("subtotal"));

            BillDetail billDetail = new BillDetail(bid, pid, buyQuantity, buyPrice, subtotal);
            int result = dao.insertBillDetail(billDetail);
            request.setAttribute("message", result > 0 ? "Bill detail added successfully." : "Failed to add bill detail.");
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while adding the bill detail: " + e.getMessage());
        }

        listBillDetails(request, response, dao);
    }

    private void updateBillDetail(HttpServletRequest request, HttpServletResponse response, DAOBillDetail dao)
            throws ServletException, IOException {
        try {
            int bid = Integer.parseInt(request.getParameter("bid"));
            int pid = Integer.parseInt(request.getParameter("pid"));
            int buyQuantity = Integer.parseInt(request.getParameter("buyQuantity"));
            double buyPrice = Double.parseDouble(request.getParameter("buyPrice"));
            double subtotal = Double.parseDouble(request.getParameter("subtotal"));

            BillDetail billDetail = new BillDetail(bid, pid, buyQuantity, buyPrice, subtotal);
            int result = dao.updateBillDetail(billDetail);
            request.setAttribute("message", result > 0 ? "Bill detail updated successfully." : "Failed to update bill detail.");
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while updating the bill detail: " + e.getMessage());
        }

        listBillDetails(request, response, dao);
    }

    private void deleteBillDetail(HttpServletRequest request, HttpServletResponse response, DAOBillDetail dao)
            throws ServletException, IOException {
        try {
            int bid = Integer.parseInt(request.getParameter("bid"));
            int pid = Integer.parseInt(request.getParameter("pid"));
            int result = dao.deleteBillDetail(bid, pid);
            request.setAttribute("message", result > 0 ? "Bill detail deleted successfully." : "Failed to delete bill detail.");
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while deleting the bill detail: " + e.getMessage());
        }

        listBillDetails(request, response, dao);
    }

    private void detailBillDetail(HttpServletRequest request, HttpServletResponse response, DAOBillDetail dao)
            throws ServletException, IOException {
        try {
            int bid = Integer.parseInt(request.getParameter("bid"));
            int pid = Integer.parseInt(request.getParameter("pid"));
            BillDetail billDetail = dao.getBillDetail(bid, pid);
            request.setAttribute("billDetail", billDetail);
            RequestDispatcher dispatcher = request.getRequestDispatcher("BillDetail.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while fetching bill detail: " + e.getMessage());
            listBillDetails(request, response, dao);
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
        return "Bill Detail Controller";
    }
}
