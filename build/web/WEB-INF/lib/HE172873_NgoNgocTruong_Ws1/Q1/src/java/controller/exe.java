/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.Comparator;

/**
 *
 * @author nntru
 */
@WebServlet(name = "exe", urlPatterns = {"/exe"})
public class exe extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String array = request.getParameter("array");
        String option = request.getParameter("option");
        
        if (array == null || array.isEmpty() || option == null || option.isEmpty()) {
            response.getWriter().write("Please enter a valid array and choose an option.");
            return;
        }
        
        String[] arrayStr = array.split(" ");
        int[] arr = new int[arrayStr.length];
        
        try {
            for (int i = 0; i < arrayStr.length; i++) {
                int num = Integer.parseInt(arrayStr[i]);
                if (num < 0) {
                    throw new NumberFormatException();
                }
                arr[i] = num;
            }
        } catch (NumberFormatException e) {
            response.getWriter().write("You must input an integer array.");
            return;
        }
        
        if ("max".equals(option)) {
            response.getWriter().write(getSecondLargestPosition(arr));
        } else if ("prime".equals(option)) {
            response.getWriter().write(getPrimeNumbers(arr));
        } else {
            response.getWriter().write("Invalid option.");
        }
    }
    
    private String getSecondLargestPosition(int[] arr) {
    if (arr.length < 2) {
        return "Array does not have enough elements.";
    }
    Integer firstLargest = null;
    Integer secondLargest = null;
    
    for (int num : arr) {
        if (firstLargest == null || num > firstLargest) {
            secondLargest = firstLargest;
            firstLargest = num;
        } else if (num != firstLargest && (secondLargest == null || num > secondLargest)) {
            secondLargest = num;
        }
    }

    if (secondLargest == null) {
        return "Second largest element not found.";
    }

    for (int i = 0; i < arr.length; i++) {
        if (arr[i] == secondLargest) {
            return String.valueOf(i+1);
        }
    }

    return "Second largest element not found.";
}


    private String getPrimeNumbers(int[] arr) {
        StringBuilder primes = new StringBuilder();
        for (int num : arr) {
            if (isPrime(num)) {
                primes.append(num).append(" ");
            }
        }
        return primes.toString().trim();
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

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
