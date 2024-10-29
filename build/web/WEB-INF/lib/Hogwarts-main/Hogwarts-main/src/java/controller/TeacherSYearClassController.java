// File: controller/TeacherSchoolYearClassController.java
package controller;

import entity.TeacherSchoolYearClass;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import model.DAOTeacherSchoolYearClass;

@WebServlet(name = "TeacherSYearClassController", urlPatterns = {"/TeacherSYearClassControllerURL"})
public class TeacherSYearClassController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOTeacherSchoolYearClass dao = new DAOTeacherSchoolYearClass();
        HttpSession session = request.getSession(true);
        
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        if (service.equals("addTeacherSchoolYearClass")) {
            // Get data from request
            String TeacherID = request.getParameter("TeacherID");
            String SyC_ID = request.getParameter("SyC_ID");
            // Create TeacherSchoolYearClass object
            TeacherSchoolYearClass tsClass = new TeacherSchoolYearClass(TeacherID, SyC_ID);
            // Insert TeacherSchoolYearClass
            dao.insertTeacherSchoolYearClass(tsClass);
            // Redirect to listAll
            response.sendRedirect("TeacherSchoolYearClassControllerURL?service=listAll");
        }

        if (service.equals("listAll")) {
            // Get all teacher school year classes
            Vector<TeacherSchoolYearClass> vector = dao.getAllTeacherSchoolYearClasses("SELECT * FROM Teacher_SchoolYear_Class");
            // Set data to request
            request.setAttribute("data", vector);
            // Forward to JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("TeacherSchoolYearClassList.jsp");
            dispatcher.forward(request, response);
        }

        if (service.equals("updateTeacherSchoolYearClass")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                // Show update form
                String teacherID = request.getParameter("TeacherID");
                String syC_ID = request.getParameter("SyC_ID");
                TeacherSchoolYearClass tsClass = dao.getTeacherSchoolYearClassByID(teacherID, syC_ID);
                request.setAttribute("tsClass", tsClass);
                RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateTeacherSchoolYearClass.jsp");
                dispatcher.forward(request, response);
            } else {
                // Update teacher school year class data
                String TeacherID = request.getParameter("TeacherID");
                String SyC_ID = request.getParameter("SyC_ID");
                TeacherSchoolYearClass tsClass = new TeacherSchoolYearClass(TeacherID, SyC_ID);
                dao.updateTeacherSchoolYearClass(tsClass);
                response.sendRedirect("TeacherSchoolYearClassControllerURL?service=listAll");
            }
        }

        if (service.equals("deleteTeacherSchoolYearClass")) {
            String teacherID = request.getParameter("TeacherID");
            String syC_ID = request.getParameter("SyC_ID");
            dao.deleteTeacherSchoolYearClass(teacherID, syC_ID);
            response.sendRedirect("TeacherSchoolYearClassControllerURL?service=listAll");
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
