package controller;

import entity.Teacher;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import model.DAOTeacher;

@WebServlet(name = "TeacherController", urlPatterns = {"/TeacherControllerURL"})
public class TeacherController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOTeacher dao = new DAOTeacher();
        HttpSession session = request.getSession(true);
        
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        if (service.equals("addTeacher")) {
            System.out.println("Entering addTeacher block...");
            String teacherID = request.getParameter("TeacherID");
            String userID = request.getParameter("UserID");
            String degree = request.getParameter("Degree");
            Teacher teacher = new Teacher(teacherID, userID, degree);
            dao.insertTeacher(teacher);
            response.sendRedirect("TeacherControllerURL?service=listAll");
        }

        if (service.equals("listAll")) {
            Vector<Teacher> vector = dao.getAllTeachers("SELECT * FROM Teacher");
            request.setAttribute("data", vector);
            RequestDispatcher dispatcher = request.getRequestDispatcher("TeacherList.jsp");
            dispatcher.forward(request, response);
        }

        if (service.equals("update")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                String teacherID = request.getParameter("TeacherID");
                Vector<Teacher> vector = dao.getAllTeachers("SELECT * FROM Teacher WHERE TeacherID='" + teacherID + "'");
                request.setAttribute("vector", vector);
                RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateTeacher.jsp");
                dispatcher.forward(request, response);
            } else {
                String teacherID = request.getParameter("TeacherID");
                String userID = request.getParameter("UserID");
                String degree = request.getParameter("Degree");
                Teacher teacher = new Teacher(teacherID, userID, degree);
                dao.updateTeacher(teacher);
                response.sendRedirect("TeacherControllerURL?service=listAll");
            }
        }

        if (service.equals("delete")) {
            String teacherID = request.getParameter("TeacherID");
            dao.removeTeacher(teacherID);
            response.sendRedirect("TeacherControllerURL?service=listAll");
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
