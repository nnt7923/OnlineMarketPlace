package controller;

import entity.ClassCategoryMenu;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import model.DAOClassCategoryMenu;

@WebServlet(name = "ClassCategoryMenuController", urlPatterns = {"/ClassCategoryMenuControllerURL"})
public class ClassCategoryMenuController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOClassCategoryMenu dao = new DAOClassCategoryMenu();
        HttpSession session = request.getSession(true);
        
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        if (service.equals("addClassCategoryMenu")) {
            String cateID = request.getParameter("CateID");
            String menuID = request.getParameter("MenuID");
            String date = request.getParameter("Date");
            String meal = request.getParameter("Meal");
            ClassCategoryMenu classCategoryMenu = new ClassCategoryMenu(cateID, menuID, date, meal);
            dao.insertClassCategoryMenu(classCategoryMenu);
            response.sendRedirect("ClassCategoryMenuControllerURL?service=listAll");
        }

        if (service.equals("listAll")) {
            Vector<ClassCategoryMenu> vector = dao.getAllClassCategoryMenus("SELECT * FROM ClassCategory_Menu");
            request.setAttribute("data", vector);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ClassCategoryMenuList.jsp");
            dispatcher.forward(request, response);
        }

        if (service.equals("update")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                String cateID = request.getParameter("CateID");
                String menuID = request.getParameter("MenuID");
                String date = request.getParameter("Date");
                String meal = request.getParameter("Meal");
                Vector<ClassCategoryMenu> vector = dao.getAllClassCategoryMenus("SELECT * FROM ClassCategory_Menu WHERE CateID='" + cateID + "' AND MenuID='" + menuID + "' AND Date='" + date + "' AND Meal='" + meal + "'");
                request.setAttribute("vector", vector);
                RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateClassCategoryMenu.jsp");
                dispatcher.forward(request, response);
            } else {
                String cateID = request.getParameter("CateID");
                String menuID = request.getParameter("MenuID");
                String date = request.getParameter("Date");
                String meal = request.getParameter("Meal");
                ClassCategoryMenu classCategoryMenu = new ClassCategoryMenu(cateID, menuID, date, meal);
                dao.updateClassCategoryMenu(classCategoryMenu);
                response.sendRedirect("ClassCategoryMenuControllerURL?service=listAll");
            }
        }

        if (service.equals("delete")) {
            String cateID = request.getParameter("CateID");
            String menuID = request.getParameter("MenuID");
            String date = request.getParameter("Date");
            String meal = request.getParameter("Meal");
            dao.removeClassCategoryMenu(cateID, menuID, java.sql.Date.valueOf(date), meal);
            response.sendRedirect("ClassCategoryMenuControllerURL?service=listAll");
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
        return "ClassCategoryMenu Controller";
    }
}
