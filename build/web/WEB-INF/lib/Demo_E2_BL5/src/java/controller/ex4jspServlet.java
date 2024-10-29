package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name="ex4jspServlet", urlPatterns={"/ex4jspServlet"})
public class ex4jspServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String score = request.getParameter("number");
        String cour = request.getParameter("cour");

        try {
            double diem = Double.parseDouble(score);

            String message;
            if (diem < 0 || diem > 10) {
                message = "Điểm phải trong khoảng từ 0-10";
            } else if (diem < 5) {
                message = name + " đã thất bại trong môn " + cour;
            } else {
                message = name + " đã vượt qua môn " + cour;
            }
            request.setAttribute("mess", message);
        } catch (NumberFormatException e) {
            request.setAttribute("mess", "Điểm phải là một số hợp lệ");
        }

        request.getRequestDispatcher("ex4jsp.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
