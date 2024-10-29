package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ex2", urlPatterns = {"/ex2"})
public class ex2 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ex2</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ex2 at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                String numbera = request.getParameter("numbera");
                String numberb = request.getParameter("numberb");
                String operator = request.getParameter("operator");

                if (numbera == null || numberb == null || operator == null ||
                    numbera.isEmpty() || numberb.isEmpty() || operator.isEmpty()) {
                    out.println("<h2>Please provide valid inputs.</h2>");
                    return;
                }

                double a = Double.parseDouble(numbera);
                double b = Double.parseDouble(numberb);
                double result = 0;

                switch (operator) {
                    case "+":
                        result = a + b;
                        break;
                    case "-":
                        result = a - b;
                        break;
                    case "*":
                        result = a * b;
                        break;
                    case "/":
                        if (b != 0) {
                            result = a / b;
                        } else {
                            out.println("<h2>Division by zero is not allowed</h2>");
                            return;
                        }
                        break;
                    case "UCLN":
                        result = gcd((int) a, (int) b);
                        break;
                    case "BCNN":
                        result = lcm((int) a, (int) b);
                        break;
                    default:
                        out.println("<h2>Invalid operator</h2>");
                        return;
                }
                String formattedResult = String.format("%.2f", result);
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet Result</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Result: " + formattedResult + "</h1>");
                out.println("</body>");
                out.println("</html>");

            } catch (NumberFormatException e) {
                out.println("<h2>Invalid input. Please enter valid numbers.</h2>");
            }
        }
    }

    private int gcd(int a, int b) {
        while (b != 0) {
            int t = b;
            b = a % b;
            a = t;
        }
        return a;
    }

    private int lcm(int a, int b) {
        return a * (b / gcd(a, b));
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
