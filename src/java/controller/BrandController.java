package controller;

import dao.BrandDAO;
import model.Brand;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Controller for handling brand-related requests.
 */
@WebServlet(name = "BrandController", urlPatterns = {"/brands"})
public class BrandController extends HttpServlet {

    private BrandDAO brandDAO;

    @Override
    public void init() throws ServletException {
        brandDAO = new BrandDAO(); // Initialize BrandDAO instance
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            listBrands(request, response);
        } else {
            switch (action) {
                case "addForm":
                    showAddForm(request, response);
                    break;
                case "updateForm":
                    showUpdateForm(request, response);
                    break;
                case "deleteBrand":
                    deleteBrand(request, response);
                    break;
                case "search":
                    searchBrand(request, response);
                    break;
                default:
                    listBrands(request, response);
                    break;
            }
        }
    }

    // List all brands
    private void listBrands(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Brand> brandList = brandDAO.listAll();
        request.setAttribute("brands", brandList);
        // Pass success or error message if any
        String successMessage = (String) request.getAttribute("success");
        String errorMessage = (String) request.getAttribute("error");
        request.setAttribute("message", successMessage != null ? successMessage : errorMessage);
        request.setAttribute("messageType", successMessage != null ? "success" : errorMessage != null ? "error" : null);
        request.getRequestDispatcher("/admin/manageBrand.jsp").forward(request, response);
    }

    // Search brands by keyword
    private void searchBrand(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<Brand> brandList = brandDAO.search(keyword);
        request.setAttribute("brands", brandList);
        // Pass success or error message if any
        String successMessage = (String) request.getAttribute("success");
        String errorMessage = (String) request.getAttribute("error");
        request.setAttribute("message", successMessage != null ? successMessage : errorMessage);
        request.setAttribute("messageType", successMessage != null ? "success" : errorMessage != null ? "error" : null);
        request.getRequestDispatcher("/admin/manageBrand.jsp").forward(request, response);
    }

    // Show form to add a new brand
    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/admin/addBrand.jsp").forward(request, response);
    }

    // Show form to update an existing brand
    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int brandId = Integer.parseInt(request.getParameter("brand_id"));
        Brand existingBrand = brandDAO.getBrandById(brandId);
        request.setAttribute("brand", existingBrand);
        request.getRequestDispatcher("/admin/editBrand.jsp").forward(request, response);
    }

    // Delete a brand
    private void deleteBrand(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int brandId = Integer.parseInt(request.getParameter("brand_id"));
        brandDAO.deleteBrand(brandId);
        request.setAttribute("success", "Brand deleted successfully.");
        response.sendRedirect("brands");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            doGet(request, response);
        } else {
            switch (action) {
                case "add":
                    addBrand(request, response);
                    break;
                case "update":
                    updateBrand(request, response);
                    break;
                default:
                    doGet(request, response);
                    break;
            }
        }
    }

    // Add a new brand with duplicate check
    private void addBrand(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String brandName = request.getParameter("brandName");
        
        HttpSession session = request.getSession();

        // Check if brand already exists
        if (brandDAO.checkDuplicate(brandName)) {
            // If duplicate, send back to add form with an error message
            request.setAttribute("error", "Brand name already exists.");
            request.getRequestDispatcher("/admin/addBrand.jsp").forward(request, response);
        } else {
            // If no duplicate, proceed to add
            Brand brand = new Brand();
            brand.setBrandName(brandName);
            brandDAO.addBrand(brand);
            session.setAttribute("success", "Brand added successful");
            response.sendRedirect("brands");
        }
    }

    // Update an existing brand with duplicate check
    private void updateBrand(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int brandId = Integer.parseInt(request.getParameter("brand_id"));
        String brandName = request.getParameter("brandName");

        HttpSession session = request.getSession();
        
        // Check if brand name already exists, and is not the current brand being updated
        Brand existingBrand = brandDAO.getBrandById(brandId);
        if (existingBrand != null && !existingBrand.getBrandName().equals(brandName) && brandDAO.checkDuplicate(brandName)) {
            // If duplicate, send back to update form with an error message
            request.setAttribute("error", "Brand name already exists.");
            request.setAttribute("brand", existingBrand);
            request.getRequestDispatcher("/admin/editBrand.jsp").forward(request, response);
        } else {
            // If no duplicate, proceed to update
            Brand brand = new Brand(brandId, brandName);
            brandDAO.updateBrand(brand);
            session.setAttribute("success", "Brand updated successful");
            response.sendRedirect("brands");
        }
    }

    @Override
    public String getServletInfo() {
        return "Brand Controller handles brand management actions.";
    }
}
