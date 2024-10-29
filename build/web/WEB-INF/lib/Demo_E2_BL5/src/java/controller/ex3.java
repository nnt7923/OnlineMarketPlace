package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@WebServlet(name = "ex3", urlPatterns = {"/ex3"})
public class ex3 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String numberAParam = request.getParameter("numbera");
        String numberBParam = request.getParameter("numberb");
        String[] operators = request.getParameterValues("operator");

        int numberA = 0;
        int numberB = 0;
        String result = "";

        try {
            numberA = Integer.parseInt(numberAParam);
            numberB = Integer.parseInt(numberBParam);
        } catch (NumberFormatException e) {
            result = "Invalid input. Please enter valid integers.";
        }

        if (result.isEmpty() && operators != null) {
            for (String operator : operators) {
                switch (operator) {
                    case "ADD":
                        result = "Sum: " + (numberA + numberB);
                        break;
                    case "Subtract":
                        result = "Difference: " + (numberA - numberB);
                        break;
                    case "Multiply":
                        result = "Product: " + (numberA * numberB);
                        break;
                    case "Divide":
                        if (numberB != 0) {
                            result = "Quotient: " + ((double) numberA / numberB);
                        } else {
                            result = "Cannot divide by zero.";
                        }
                        break;
                    case "UCLN":
                        result = "GCD: " + gcd(numberA, numberB);
                        break;
                    case "BCNN":
                        result = "LCM: " + lcm(numberA, numberB);
                        break;
                    default:
                        result = "Unknown operator.";
                        break;
                }
                // Break if result has been found
                if (!result.isEmpty()) {
                    break;
                }
            }
        }

        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            out.println("<html><body>");
            out.println("<h2>Result: " + result + "</h2>");
            out.println("</body></html>");
        }
    }

    private int gcd(int a, int b) {
        while (b != 0) {
            int temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }

    private int lcm(int a, int b) {
        return a * b / gcd(a, b);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet for performing arithmetic operations";
    }
}
