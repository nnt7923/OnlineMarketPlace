package controller;

import entity.Class;
import java.io.IOException;
import java.util.Vector;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.DAOClass;

@WebServlet(name = "ClassController", urlPatterns = {"/ClassControllerURL"})
public class ClassController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOClass dao = new DAOClass();
        HttpSession session = request.getSession(true);

        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        if (service.equals("addClass")) {
            String classID = request.getParameter("ClassID");
            String className = request.getParameter("ClassName");
            String cateID = request.getParameter("CateID");
            Class classObj = new Class(classID, className, cateID);
            dao.insertClass(classObj);
            response.sendRedirect("ClassControllerURL?service=listAll");
        }

        if (service.equals("listAll")) {
            Vector<Class> vector = dao.getAllClasses("SELECT * FROM Class");
            request.setAttribute("data", vector);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ClassList.jsp");
            dispatcher.forward(request, response);
        }

        // Add other CRUD operations as needed
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
        return "Class Controller";
    }
}
