package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SumURL")
public class Sum extends HttpServlet {
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get parameters from the form
        String numberAParam = request.getParameter("numbera");
        String numberBParam = request.getParameter("numberb");
        String operator = request.getParameter("operator");

        // Initialize variables
        int numberA = 0;
        int numberB = 0;
        String result = "";

        try {
            numberA = Integer.parseInt(numberAParam);
            numberB = Integer.parseInt(numberBParam);
        } catch (NumberFormatException e) {
            result = "Invalid input. Please enter valid integers.";
        }

        if (result.isEmpty()) {
            switch (operator) {
                case "a+b":
                    result = String.valueOf(numberA + numberB);
                    break;
                case "a-b":
                    result = String.valueOf(numberA - numberB);
                    break;
                case "a*b":
                    result = String.valueOf(numberA * numberB);
                    break;
                case "a/b":
                    if (numberB != 0) {
                        result = String.valueOf((double) numberA / numberB);
                    } else {
                        result = "Cannot divide by zero.";
                    }
                    break;
                case "UCLN":
                    result = String.valueOf(gcd(numberA, numberB));
                    break;
                case "BCNN":
                    result = String.valueOf(lcm(numberA, numberB));
                    break;
                case "PrimeNumber":
                    result = findPrimesInRange(numberA, numberB);
                    break;
                case "PerfectNumber":
                    result = findPerfectNumbersInRange(numberA, numberB);
                    break;
                case "SquareNumber":
                    result = findSquareNumbersInRange(numberA, numberB);
                    break;
                default:
                    result = "Unknown operator.";
                    break;
            }
        }

        // Send response
        response.setContentType("text/html");
        response.getWriter().println("<html><body>");
        response.getWriter().println("<h2>Result: " + result + "</h2>");
        response.getWriter().println("</body></html>");
    }

    // Helper method to calculate GCD (UCLN)
    private int gcd(int a, int b) {
        while (b != 0) {
            int temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }

    // Helper method to calculate LCM (BCNN)
    private int lcm(int a, int b) {
        return a * b / gcd(a, b);
    }

    // Helper method to find prime numbers in range
    private String findPrimesInRange(int start, int end) {
        StringBuilder result = new StringBuilder("Prime numbers: ");
        for (int i = Math.min(start, end); i <= Math.max(start, end); i++) {
            if (isPrime(i)) {
                result.append(i).append(" ");
            }
        }
        return result.toString();
    }

    // Helper method to find perfect numbers in range
    private String findPerfectNumbersInRange(int start, int end) {
        StringBuilder result = new StringBuilder("Perfect numbers: ");
        for (int i = Math.min(start, end); i <= Math.max(start, end); i++) {
            if (isPerfect(i)) {
                result.append(i).append(" ");
            }
        }
        return result.toString();
    }

    // Helper method to find square numbers in range
    private String findSquareNumbersInRange(int start, int end) {
        StringBuilder result = new StringBuilder("Square numbers: ");
        for (int i = Math.min(start, end); i <= Math.max(start, end); i++) {
            if (isSquare(i)) {
                result.append(i).append(" ");
            }
        }
        return result.toString();
    }

    // Helper method to check if a number is prime
    private boolean isPrime(int num) {
        if (num <= 1) return false;
        for (int i = 2; i <= Math.sqrt(num); i++) {
            if (num % i == 0) return false;
        }
        return true;
    }

    // Helper method to check if a number is perfect
    private boolean isPerfect(int num) {
        int sum = 1;
        for (int i = 2; i <= Math.sqrt(num); i++) {
            if (num % i == 0) {
                sum += i;
                if (i != num / i) sum += num / i;
            }
        }
        return num > 1 && sum == num;
    }

    // Helper method to check if a number is a square number
    private boolean isSquare(int num) {
        int sqrt = (int) Math.sqrt(num);
        return sqrt * sqrt == num;
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
