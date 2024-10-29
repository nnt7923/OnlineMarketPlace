package controller;

import dal.AcountDBContext;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

@WebServlet(name = "ManagerAccountController", urlPatterns = {"/managerAccount"})
public class ManagerAccountController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("acc") != null && request.getSession().getAttribute("role_admin") != null) {
            
            AcountDBContext acountDBContext = new AcountDBContext();
            
            // Kiểm tra nếu có yêu cầu xóa
            String deleteId = request.getParameter("deleteId");
            if (deleteId != null) {
                try {
                    int uid = Integer.parseInt(deleteId);
                    acountDBContext.deleteAccount(uid);
                    request.setAttribute("message", "Account deleted successfully!");
                } catch (NumberFormatException e) {
                    request.setAttribute("message", "Invalid account ID!");
                }
                response.sendRedirect("managerAccount?message=Account deleted successfully");
                return;
            }   
            
            // Pagination
            final int PAGE_SIZE = 10;
            int page = 1;
            String pageStr = request.getParameter("page");
            if (pageStr != null) {
                page = Integer.parseInt(pageStr);
            }
            if (page < 1) {
                page = 1;
            }
            
            // Lấy số lượng account
            int totalAccount = acountDBContext.getTotalAccount();
            int totalPage = totalAccount / PAGE_SIZE;
            if (totalAccount % PAGE_SIZE != 0) {
                totalPage += 1;
            }
            if (page > totalPage) {
                page = totalPage;
            }
            request.setAttribute("page", page);
            request.setAttribute("totalPage", totalPage);
            
            // Lấy danh sách account
            List<Account> accounts = acountDBContext.getAllAccountByPage(page, PAGE_SIZE);
            request.setAttribute("accounts", accounts);
            request.getRequestDispatcher("ManagerCustomer.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // You can handle form submissions here if needed
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
