package controller;

import entity.Category;
import model.DAOCategory;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Vector;

@WebServlet(name = "CategoryController", urlPatterns = {"/CategoryController"})
public class CategoryController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        DAOCategory dao = new DAOCategory();

        switch (action) {
            case "list":
                listCategories(request, response, dao);
                break;
            case "add":
                addCategory(request, response, dao);
                break;
            case "update":
                updateCategory(request, response, dao);
                break;
            case "delete":
                deleteCategory(request, response, dao);
                break;
            case "detail":
                detailCategory(request, response, dao);
                break;
            default:
                listCategories(request, response, dao);
                break;
        }
    }

    private void listCategories(HttpServletRequest request, HttpServletResponse response, DAOCategory dao)
            throws ServletException, IOException {
        Vector<Category> categoryList = dao.getAllCategories("SELECT * FROM Category");
        request.setAttribute("categoryList", categoryList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("CategoryList.jsp");
        dispatcher.forward(request, response);
    }

    private void addCategory(HttpServletRequest request, HttpServletResponse response, DAOCategory dao)
            throws ServletException, IOException {
        try {
            String cateName = request.getParameter("cateName");
            boolean status = Boolean.parseBoolean(request.getParameter("status"));

            // Create new Category object
            Category category = new Category(0,cateName, status);

            // Add category to the database
            int result = dao.insertCategory(category);
            request.setAttribute("message", result > 0 ? "Category added successfully." : "Failed to add category.");
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while adding the category: " + e.getMessage());
        }

        listCategories(request, response, dao);
    }

    private void updateCategory(HttpServletRequest request, HttpServletResponse response, DAOCategory dao)
            throws ServletException, IOException {
        try {
            int cateID = Integer.parseInt(request.getParameter("cateID"));
            String cateName = request.getParameter("cateName");
            boolean status = Boolean.parseBoolean(request.getParameter("status"));

            Category category = new Category(cateID, cateName, status);
            int result = dao.updateCategory(category);
            request.setAttribute("message", result > 0 ? "Category updated successfully." : "Failed to update category.");
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while updating the category: " + e.getMessage());
        }

        listCategories(request, response, dao);
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response, DAOCategory dao)
            throws ServletException, IOException {
        try {
            int cateID = Integer.parseInt(request.getParameter("cateID"));
            int result = dao.deleteCategory(cateID);
            request.setAttribute("message", result > 0 ? "Category deleted successfully." : "Failed to delete category.");
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while deleting the category: " + e.getMessage());
        }

        listCategories(request, response, dao);
    }

    private void detailCategory(HttpServletRequest request, HttpServletResponse response, DAOCategory dao)
            throws ServletException, IOException {
        try {
            int cateID = Integer.parseInt(request.getParameter("cateID"));
            Category category = dao.getCategory(cateID);
            request.setAttribute("category", category);
            RequestDispatcher dispatcher = request.getRequestDispatcher("CategoryDetail.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while fetching category details: " + e.getMessage());
            listCategories(request, response, dao);
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
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Category Controller";
    }
}
