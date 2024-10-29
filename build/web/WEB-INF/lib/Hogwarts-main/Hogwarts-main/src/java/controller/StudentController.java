package controller;

import entity.Student;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.Vector;
import model.DAOStudent;

@WebServlet(name = "StudentController", urlPatterns = {"/StudentControllerURL"})
public class StudentController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOStudent dao = new DAOStudent();
        HttpSession session = request.getSession(true);
        
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        if (service.equals("addStudent")) {
            System.out.println("Entering addStudent block...");
            String studentID = request.getParameter("StudentID");
            String fullName = request.getParameter("FullName");
            String dob = request.getParameter("DoB");
            int age = Integer.parseInt(request.getParameter("Age"));
            String gender = request.getParameter("Gender");
            String address = request.getParameter("Address");
            String userID = request.getParameter("UserID");
            Student student = new Student(studentID, fullName, dob, age, gender, address, userID);
            dao.insertStudent(student);
            response.sendRedirect("StudentControllerURL?service=listAll");
        }

        if (service.equals("listAll")) {
            Vector<Student> vector = dao.getAllStudents("SELECT * FROM Student");
            request.setAttribute("data", vector);
            RequestDispatcher dispatcher = request.getRequestDispatcher("StudentList.jsp");
            dispatcher.forward(request, response);
        }

        if (service.equals("update")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                String studentID = request.getParameter("StudentID");
                Vector<Student> vector = dao.getAllStudents("SELECT * FROM Student WHERE StudentID='" + studentID + "'");
                request.setAttribute("vector", vector);
                RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateStudent.jsp");
                dispatcher.forward(request, response);
            } else {
                String studentID = request.getParameter("StudentID");
                String fullName = request.getParameter("FullName");
                String dob = request.getParameter("DoB");
                int age = Integer.parseInt(request.getParameter("Age"));
                String gender = request.getParameter("Gender");
                String address = request.getParameter("Address");
                String userID = request.getParameter("UserID");
                Student student = new Student(studentID, fullName, dob, age, gender, address, userID);
                dao.updateStudent(student);
                response.sendRedirect("StudentControllerURL?service=listAll");
            }
        }

        if (service.equals("delete")) {
            String studentID = request.getParameter("StudentID");
            dao.removeStudent(studentID);
            response.sendRedirect("StudentControllerURL?service=listAll");
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
