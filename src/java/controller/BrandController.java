package controller;

import dao.BrandDAO;
import model.Brand;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
        request.getRequestDispatcher("/admin/manageBrand.jsp").forward(request, response);
    }

    // Search brands by keyword
    private void searchBrand(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<Brand> brandList = brandDAO.search(keyword);
        request.setAttribute("brands", brandList);
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
                case "delete":
                    deleteBrand(request, response);
                default:
                    doGet(request, response);
                    break;
            }
        }
    }

    // Add a new brand
    private void addBrand(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String brandName = request.getParameter("brandName");
        Brand brand = new Brand();
        brand.setBrandName(brandName);
        brandDAO.addBrand(brand);
        response.sendRedirect("brands");
    }

    // Update an existing brand
    private void updateBrand(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int brandId = Integer.parseInt(request.getParameter("brand_id"));
        String brandName = request.getParameter("brandName");
        Brand brand = new Brand(brandId, brandName);
        brandDAO.updateBrand(brand);
        response.sendRedirect("brands");
    }

    @Override
    public String getServletInfo() {
        return "Brand Controller handles brand management actions.";
    }
}
