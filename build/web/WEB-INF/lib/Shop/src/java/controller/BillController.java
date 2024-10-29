package controller;

import entity.Bill;
import model.DAOBill;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.util.Vector;

@WebServlet(name = "BillController", urlPatterns = {"/BillController"})
public class BillController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        DAOBill dao = new DAOBill();

        switch (action) {
            case "list":
                listBills(request, response, dao);
                break;
            case "add":
                addBill(request, response, dao);
                break;
            case "update":
                updateBill(request, response, dao);
                break;
            case "delete":
                deleteBill(request, response, dao);
                break;
            case "detail":
                detailBill(request, response, dao);
                break;
            default:
                listBills(request, response, dao);
                break;
        }
    }

    private void listBills(HttpServletRequest request, HttpServletResponse response, DAOBill dao)
            throws ServletException, IOException {
        Vector<Bill> billList = dao.getAllBills("SELECT * FROM Bill");
        request.setAttribute("billList", billList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("BillList.jsp");
        dispatcher.forward(request, response);
    }

    private void addBill(HttpServletRequest request, HttpServletResponse response, DAOBill dao)
            throws ServletException, IOException {
        try {
            Date dateCreate = Date.valueOf(request.getParameter("dateCreate"));
            String recAddress = request.getParameter("recAddress");
            String recPhone = request.getParameter("recPhone");
            String note = request.getParameter("note");
            double totalMoney = Double.parseDouble(request.getParameter("totalMoney"));
            boolean status = Boolean.parseBoolean(request.getParameter("status"));
            int cid = Integer.parseInt(request.getParameter("cid"));

            Bill bill = new Bill(0,dateCreate, recAddress, recPhone, note, totalMoney, status, cid);
            int result = dao.insertBill(bill);
            request.setAttribute("message", result > 0 ? "Bill added successfully." : "Failed to add bill.");
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while adding the bill: " + e.getMessage());
        }

        listBills(request, response, dao);
    }

    private void updateBill(HttpServletRequest request, HttpServletResponse response, DAOBill dao)
            throws ServletException, IOException {
        try {
            int bid = Integer.parseInt(request.getParameter("bid"));
            Date dateCreate = Date.valueOf(request.getParameter("dateCreate"));
            String recAddress = request.getParameter("recAddress");
            String recPhone = request.getParameter("recPhone");
            String note = request.getParameter("note");
            double totalMoney = Double.parseDouble(request.getParameter("totalMoney"));
            boolean status = Boolean.parseBoolean(request.getParameter("status"));
            int cid = Integer.parseInt(request.getParameter("cid"));

            Bill bill = new Bill(bid, dateCreate, recAddress, recPhone, note, totalMoney, status, cid);
            int result = dao.updateBill(bill);
            request.setAttribute("message", result > 0 ? "Bill updated successfully." : "Failed to update bill.");
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while updating the bill: " + e.getMessage());
        }

        listBills(request, response, dao);
    }

    private void deleteBill(HttpServletRequest request, HttpServletResponse response, DAOBill dao)
            throws ServletException, IOException {
        try {
            int bid = Integer.parseInt(request.getParameter("bid"));
            int result = dao.deleteBill(bid);
            request.setAttribute("message", result > 0 ? "Bill deleted successfully." : "Failed to delete bill.");
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while deleting the bill: " + e.getMessage());
        }

        listBills(request, response, dao);
    }

    private void detailBill(HttpServletRequest request, HttpServletResponse response, DAOBill dao)
            throws ServletException, IOException {
        try {
            int bid = Integer.parseInt(request.getParameter("bid"));
            Bill bill = dao.getBillByID(bid);
            request.setAttribute("bill", bill);
            RequestDispatcher dispatcher = request.getRequestDispatcher("BillDetail.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while fetching bill details: " + e.getMessage());
            listBills(request, response, dao);
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
        return "Bill Controller";
    }
}
