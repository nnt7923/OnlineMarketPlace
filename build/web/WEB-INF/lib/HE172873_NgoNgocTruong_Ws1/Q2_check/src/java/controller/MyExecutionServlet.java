package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Execution;

@WebServlet(name = "MyExecutionServlet", urlPatterns = {"/MyExecutionServlet"})
public class MyExecutionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<Execution> executionList = (List<Execution>) session.getAttribute("executionList");

        if (executionList == null) {
            executionList = new ArrayList<>();
        }

        String action = request.getParameter("action");
        String idStr = request.getParameter("id");

        if ("delete".equals(action) && idStr != null && !idStr.isEmpty()) {
            int id = Integer.parseInt(idStr);
            executionList.removeIf(exec -> exec.getId() == id);
            session.setAttribute("executionList", executionList);
            response.sendRedirect("MyExecution.jsp");
            return;
        }

        if ("edit".equals(action) && idStr != null && !idStr.isEmpty()) {
            int id = Integer.parseInt(idStr);
            Execution executionToEdit = null;
            for (Execution exec : executionList) {
                if (exec.getId() == id) {
                    executionToEdit = exec;
                    break;
                }
            }
            if (executionToEdit != null) {
                request.setAttribute("editExecution", executionToEdit);
            } else {
                request.setAttribute("errorMsg", "Execution not found.");
            }
            request.setAttribute("executionList", executionList);
            request.getRequestDispatcher("MyExecution.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<Execution> executionList = (List<Execution>) session.getAttribute("executionList");

        if (executionList == null) {
            executionList = new ArrayList<>();
        }

        String action = request.getParameter("action");
        String idStr = request.getParameter("id");
        String arrayStr = request.getParameter("array");
        String option = request.getParameter("option");

        if ("delete".equals(action) && idStr != null && !idStr.isEmpty()) {
            int id = Integer.parseInt(idStr);
            executionList.removeIf(exec -> exec.getId() == id);
            session.setAttribute("executionList", executionList);
            response.sendRedirect("MyExecution.jsp");
            return;
        }

        if ("edit".equals(action) && idStr != null && !idStr.isEmpty()) {
            int id = Integer.parseInt(idStr);
            Execution executionToEdit = null;
            for (Execution exec : executionList) {
                if (exec.getId() == id) {
                    executionToEdit = exec;
                    break;
                }
            }
            if (executionToEdit != null) {
                if (arrayStr != null && !arrayStr.isEmpty()) {
                    String[] numbers = arrayStr.split("\\s+");
                    List<Integer> validNumbers = new ArrayList<>();
                    try {
                        for (String numStr : numbers) {
                            int num = Integer.parseInt(numStr.trim());
                            if (num < 0) {
                                throw new NumberFormatException();
                            }
                            validNumbers.add(num);
                        }
                    } catch (NumberFormatException e) {
                        request.setAttribute("errorMsg", "You must input a valid integer array.");
                        request.setAttribute("executionList", executionList);
                        request.getRequestDispatcher("MyExecution.jsp").forward(request, response);
                        return;
                    }

                    String result;
                    if ("perfects".equals(option)) {
                        result = getPerfectNumbers(validNumbers);
                    } else if ("primes".equals(option)) {
                        result = getPrimeNumbers(validNumbers);
                    } else {
                        request.setAttribute("errorMsg", "Invalid option.");
                        request.setAttribute("executionList", executionList);
                        request.getRequestDispatcher("MyExecution.jsp").forward(request, response);
                        return;
                    }

                    executionToEdit.setArray(arrayStr);
                    executionToEdit.setOption(option);
                    executionToEdit.setResult(result);

                    session.setAttribute("executionList", executionList);
                    request.setAttribute("executionList", executionList);
                    request.getRequestDispatcher("MyExecution.jsp").forward(request, response);
                    return;
                } else {
                    request.setAttribute("errorMsg", "Array cannot be empty for editing.");
                    request.setAttribute("executionList", executionList);
                    request.getRequestDispatcher("MyExecution.jsp").forward(request, response);
                    return;
                }
            } else {
                request.setAttribute("errorMsg", "Execution not found.");
                request.setAttribute("executionList", executionList);
                request.getRequestDispatcher("MyExecution.jsp").forward(request, response);
                return;
            }
        }

        if ("add".equals(action)) {
            for (Execution exec : executionList) {
                if (exec.getArray().equals(arrayStr) && exec.getOption().equals(option)) {
                    request.setAttribute("errorMsg", "Execution existed!");
                    request.setAttribute("executionList", executionList);
                    request.getRequestDispatcher("MyExecution.jsp").forward(request, response);
                    return;
                }
            }

            String[] numbers = arrayStr.split("\\s+");
            List<Integer> validNumbers = new ArrayList<>();

            try {
                for (String numStr : numbers) {
                    int num = Integer.parseInt(numStr.trim());
                    if (num < 0) {
                        throw new NumberFormatException();
                    }
                    validNumbers.add(num);
                }
            } catch (NumberFormatException e) {
                request.setAttribute("errorMsg", "You must input a valid integer array.");
                request.setAttribute("executionList", executionList);
                request.getRequestDispatcher("MyExecution.jsp").forward(request, response);
                return;
            }

            String result;
            if ("perfects".equals(option)) {
                result = getPerfectNumbers(validNumbers);
            } else if ("primes".equals(option)) {
                result = getPrimeNumbers(validNumbers);
            } else {
                request.setAttribute("errorMsg", "Invalid option.");
                request.setAttribute("executionList", executionList);
                request.getRequestDispatcher("MyExecution.jsp").forward(request, response);
                return;
            }

            executionList.add(new Execution(arrayStr, option, result));
            session.setAttribute("executionList", executionList);

            request.setAttribute("executionList", executionList);
            request.getRequestDispatcher("MyExecution.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMsg", "Invalid action.");
            request.setAttribute("executionList", executionList);
            request.getRequestDispatcher("MyExecution.jsp").forward(request, response);
        }
    }

    private String getPerfectNumbers(List<Integer> array) {
        StringBuilder perfects = new StringBuilder();
        for (int num : array) {
            if (isPerfect(num)) {
                if (perfects.length() > 0) {
                    perfects.append(",");
                }
                perfects.append(num);
            }
        }
        return perfects.toString();
    }

    private String getPrimeNumbers(List<Integer> array) {
        StringBuilder primes = new StringBuilder();
        for (int num : array) {
            if (isPrime(num)) {
                if (primes.length() > 0) {
                    primes.append(",");
                }
                primes.append(num);
            }
        }
        return primes.toString();
    }

    private boolean isPerfect(int num) {
        if (num <= 1) {
            return false;
        }
        int sum = 1;
        for (int i = 2; i <= Math.sqrt(num); i++) {
            if (num % i == 0) {
                sum += i;
                if (i != num / i) {
                    sum += num / i;
                }
            }
        }
        return sum == num;
    }

    private boolean isPrime(int num) {
        if (num <= 1) {
            return false;
        }
        for (int i = 2; i <= Math.sqrt(num); i++) {
            if (num % i == 0) {
                return false;
            }
        }
        return true;
    }
}
