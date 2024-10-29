package controller;

import model.DAOCustomer;
import entity.Customer;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/loginRegister")
public class LoginRegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            // Lấy dữ liệu từ form
            String cname = request.getParameter("cname");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");

            // Xử lý đăng ký
            DAOCustomer daoCustomer = new DAOCustomer();
            Customer customer = new Customer();
            customer.setCname(cname);
            customer.setUsername(username);
            customer.setPassword(password);
            customer.setAddress(address);
            customer.setPhone(phone);
            customer.setStatus(true); // Mặc định là active
            customer.setAdmin(false); // Mặc định không phải admin

            int result = daoCustomer.insertCustomer(customer);

            if (result > 0) {
                request.setAttribute("message", "Registration successful!");
            } else {
                request.setAttribute("error", "Registration failed. Please try again.");
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
        }
    }
}
