package controller;

import entity.ClassCategory;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import model.DAOClassCategory;

@WebServlet(name = "ClassCategoryController", urlPatterns = {"/ClassCategoryControllerURL"})
public class ClassCategoryController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOClassCategory dao = new DAOClassCategory();
        HttpSession session = request.getSession(true);
        
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        if (service.equals("addClassCategory")) {
            String cateID = request.getParameter("CateID");
            String cateName = request.getParameter("CateName");
            ClassCategory classCategory = new ClassCategory(cateID, cateName);
            dao.insertClassCategory(classCategory);
            response.sendRedirect("ClassCategoryControllerURL?service=listAll");
        }

        if (service.equals("listAll")) {
            Vector<ClassCategory> vector = dao.getAllClassCategories("SELECT * FROM ClassCategory");
            request.setAttribute("data", vector);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ClassCategoryList.jsp");
            dispatcher.forward(request, response);
        }

        if (service.equals("update")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                String cateID = request.getParameter("CateID");
                Vector<ClassCategory> vector = dao.getAllClassCategories("SELECT * FROM ClassCategory WHERE CateID='" + cateID + "'");
                request.setAttribute("vector", vector);
                RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateClassCategory.jsp");
                dispatcher.forward(request, response);
            } else {
                String cateID = request.getParameter("CateID");
                String cateName = request.getParameter("CateName");
                ClassCategory classCategory = new ClassCategory(cateID, cateName);
                dao.updateClassCategory(classCategory);
                response.sendRedirect("ClassCategoryControllerURL?service=listAll");
            }
        }

        if (service.equals("delete")) {
            String cateID = request.getParameter("CateID");
            dao.removeClassCategory(cateID);
            response.sendRedirect("ClassCategoryControllerURL?service=listAll");
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
        return "Short description";
    }
}
