package controller;

import entity.Student;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.DAOStudent;

@WebServlet(name="StudentController", urlPatterns={"/StudentController"})
public class StudentController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getParameter("action");
        DAOStudent dao = new DAOStudent();
        HttpSession session = request.getSession();

        if (action == null || action.equals("list")) {
            // Default action or explicitly listing all students
            List<Student> list = dao.getAll();
            session.setAttribute("data", list);
            response.sendRedirect("listStudent.jsp");
        } 
        else if (action.equals("add")) {
            // Adding a new student
            String rollNo = request.getParameter("rollNo");
            String name = request.getParameter("name");
            float mark = Float.parseFloat(request.getParameter("mark"));
            Student newStudent = new Student(rollNo, name, mark);
            dao.add(newStudent);
            response.sendRedirect("StudentController?action=list");
        } 
        else if (action.equals("edit")) {
            // Editing an existing student
            String rollNo = request.getParameter("rollNo");
            String name = request.getParameter("name");
            float mark = Float.parseFloat(request.getParameter("mark"));
            Student editedStudent = new Student(rollNo, name, mark);
            dao.edit(editedStudent);
            response.sendRedirect("StudentController?action=list");
        } 
        else if (action.equals("delete")) {
            // Deleting a student
            String rollNo = request.getParameter("rollNo");
            dao.delete(rollNo);
            response.sendRedirect("StudentController?action=list");
        } 
        else {
            // If the action is not recognized, redirect to the list
            response.sendRedirect("StudentController?action=list");
        }
    }

    @Override
    public String getServletInfo() {
        return "Student Controller Servlet";
    }
}
