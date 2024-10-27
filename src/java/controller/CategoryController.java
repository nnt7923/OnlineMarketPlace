package controller;

import dao.CategoryDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;

/**
 * Controller for handling category-related requests.
 */
@WebServlet(name = "CategoryController", urlPatterns = {"/categories"})
public class CategoryController extends HttpServlet {

    private CategoryDAO categoryDAO;

    @Override
    public void init() throws ServletException {
        categoryDAO = new CategoryDAO(); // Initialize CategoryDAO instance
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            listCategories(request, response);
        } else {
            switch (action) {
                case "addForm":
                    showAddForm(request, response);
                    break;
                case "updateForm":
                    showUpdateForm(request, response);
                    break;
                case "deleteCategory":
                    deleteCategory(request, response);
                    break;
                case "search":
                    searchCategory(request, response);
                    break;
                default:
                    listCategories(request, response);
                    break;
            }
        }
    }

    private void listCategories(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Category> categoryList = categoryDAO.listAll();
        request.setAttribute("categories", categoryList);
        request.getRequestDispatcher("/admin/manageCategory.jsp").forward(request, response);
    }

    private void searchCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<Category> categoryList = categoryDAO.search(keyword);
        request.setAttribute("categories", categoryList);
        request.getRequestDispatcher("/admin/manageCategory.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/admin/addCategoryForm.jsp").forward(request, response);
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid"));
        Category existingCategory = categoryDAO.getCategoryById(cid);
        request.setAttribute("category", existingCategory);
        request.getRequestDispatcher("/admin/updateCategoryForm.jsp").forward(request, response);
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid"));
        categoryDAO.deleteCategory(cid);
        response.sendRedirect("categories");
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
                    addCategory(request, response);
                    break;
                case "update":
                    updateCategory(request, response);
                    break;
                case "delete":
                    deleteCategory(request, response);
                default:
                    doGet(request, response);
                    break;
            }
        }
    }

    private void addCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cname = request.getParameter("cname");
        String cimg = request.getParameter("cimg");
        Category category = new Category();
        category.setCname(cname);
        category.setCimg(cimg);
        categoryDAO.addCategory(category);
        response.sendRedirect("categories");
    }

    private void updateCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid"));
        String cname = request.getParameter("cname");
        String cimg = request.getParameter("cimg");
        Category category = new Category(cid, cname, cimg);
        categoryDAO.update(category);
        response.sendRedirect("categories");
    }

    @Override
    public String getServletInfo() {
        return "Category Controller handles category management actions.";
    }
}