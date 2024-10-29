package controller;

import entity.Category;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAOCategory;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Vector;

@WebServlet(name = "CategoryController", urlPatterns = {"/CategoryControllerURL"})
public class CategoryController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOCategory dao = new DAOCategory();

        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        switch (service) {
            case "addCategory":
                String cname = request.getParameter("cname");
                
                Category newCategory = new Category(cname);
                dao.addCategory(newCategory);
                
                response.sendRedirect("CategoryControllerURL?service=listAll");
                break;
                
            case "listAll":
                Vector<Category> categoryList = dao.getAllCategories();
                request.setAttribute("data", categoryList);
                RequestDispatcher listDispatcher = request.getRequestDispatcher("ManageCategory.jsp");
                listDispatcher.forward(request, response);
                break;
                
            case "updateCategory":
                String submit = request.getParameter("submit");
                if (submit == null) {
                    try {
                        int cid = Integer.parseInt(request.getParameter("cid"));
                        Category categoryToUpdate = dao.getCategoryById(cid);
                        request.setAttribute("category", categoryToUpdate);
                        RequestDispatcher updateDispatcher = request.getRequestDispatcher("ManageCategory.jsp?service=updateCategoryForm");
                        updateDispatcher.forward(request, response);
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Category ID");
                    }
                } else {
                    try {
                        int cid = Integer.parseInt(request.getParameter("cid"));
                        cname = request.getParameter("cname");
                        
                        Category updatedCategory = new Category(cid, cname);
                        dao.updateCategory(updatedCategory);
                        
                        response.sendRedirect("CategoryControllerURL?service=listAll");
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input format");
                    }
                }
                break;
                
            case "deleteCategory":
                try {
                    int cid = Integer.parseInt(request.getParameter("cid"));
                    dao.deleteCategory(cid);
                    response.sendRedirect("CategoryControllerURL?service=listAll");
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Category ID");
                }
                break;
                
            case "addCategoryForm":
                RequestDispatcher addDispatcher = request.getRequestDispatcher("ManageCategory.jsp?service=addCategoryForm");
                addDispatcher.forward(request, response);
                break;
                
            case "updateCategoryForm":
                try {
                    int cid = Integer.parseInt(request.getParameter("cid"));
                    Category categoryToUpdateForm = dao.getCategoryById(cid);
                    request.setAttribute("category", categoryToUpdateForm);
                    RequestDispatcher updateFormDispatcher = request.getRequestDispatcher("ManageCategory.jsp?service=updateCategoryForm");
                    updateFormDispatcher.forward(request, response);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Category ID");
                }
                break;
                
            default:
                response.sendRedirect("CategoryControllerURL?service=listAll");
                break;
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
        return "Category Controller Servlet";
    }
}
