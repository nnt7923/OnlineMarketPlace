package controller;

import entity.Menu;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import model.DAOMenu;

@WebServlet(name = "MenuController", urlPatterns = {"/MenuControllerURL"})
public class MenuController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOMenu dao = new DAOMenu();
        HttpSession session = request.getSession(true);
        
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        if (service.equals("addMenu")) {
            String menuID = request.getParameter("MenuID");
            String food = request.getParameter("Food");
            Menu menu = new Menu(menuID, food);
            dao.insertMenu(menu);
            response.sendRedirect("MenuControllerURL?service=listAll");
        }

        if (service.equals("listAll")) {
            Vector<Menu> vector = dao.getAllMenus("SELECT * FROM Menu");
            request.setAttribute("data", vector);
            RequestDispatcher dispatcher = request.getRequestDispatcher("MenuList.jsp");
            dispatcher.forward(request, response);
        }

        if (service.equals("update")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                String menuID = request.getParameter("MenuID");
                Vector<Menu> vector = dao.getAllMenus("SELECT * FROM Menu WHERE MenuID='" + menuID + "'");
                request.setAttribute("vector", vector);
                RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateMenu.jsp");
                dispatcher.forward(request, response);
            } else {
                String menuID = request.getParameter("MenuID");
                String food = request.getParameter("Food");
                Menu menu = new Menu(menuID, food);
                dao.updateMenu(menu);
                response.sendRedirect("MenuControllerURL?service=listAll");
            }
        }

        if (service.equals("delete")) {
            String menuID = request.getParameter("MenuID");
            dao.removeMenu(menuID);
            response.sendRedirect("MenuControllerURL?service=listAll");
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
        return "Menu Controller";
    }
}
