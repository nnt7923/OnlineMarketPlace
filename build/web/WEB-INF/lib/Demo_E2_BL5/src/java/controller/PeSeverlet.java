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

/**
 *
 * @author nntru
 */
@WebServlet(name = "PeSeverlet", urlPatterns = {"/sum"})
public class PeSeverlet extends HttpServlet {

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
        String arrayParam = request.getParameter("array");
        String option = request.getParameter("option");

        String[] stringNumbers = arrayParam.split(",");
        int sum = 0;

        try {
            for (String num : stringNumbers) {
                int number = Integer.parseInt(num.trim());
                if ("odd".equals(option) && number % 2 != 0) {
                    sum += number;
                } else if ("even".equals(option) && number % 2 == 0) {
                    sum += number;
                }
            }
        } catch (NumberFormatException e) {
            sum = -1; // Indicate an error
        }

        try (PrintWriter out = response.getWriter()) {
            out.println("<html><body>");
            if (sum == -1) {
                out.println("<h2>Invalid input. Please enter a valid integer array.</h2>");
            } else {
                out.println("<h2>Sum: " + sum + "</h2>");
            }
            out.println("</body></html>");
        }

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
