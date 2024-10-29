package controller;

import dal.StudentDBContext;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Student;

@WebServlet(name = "show", urlPatterns = {"/show"})
public class showServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StudentDBContext studentDB = new StudentDBContext();

        // Fetch and set the list of student IDs
        List<String> studentIDs = studentDB.getStudentIDs();
        request.setAttribute("studentIDs", studentIDs);

        // Fetch and set the details of the selected student
        String studentID = request.getParameter("id");
        if (studentID != null && !studentID.isEmpty()) {
            Student student = studentDB.getStudentById(studentID);
            if (student != null) {
                request.setAttribute("student", student);

                // Get major name and find other students with the same major
                String majorID = student.getMajorID();
                request.setAttribute("majorID", majorID );

                // Fetch students with the same major only if 'choose' button is clicked
                if (request.getParameter("action") != null && request.getParameter("action").equals("choose")) {
                    List<Student> studentsWithSameMajor = studentDB.getStudentsByMajor(majorID);
                    request.setAttribute("studentsWithSameMajor", studentsWithSameMajor);
                }
            } else {
                request.setAttribute("error", "Student not found");
            }
        } else {
            request.setAttribute("error", "Invalid student ID");
        }

        request.getRequestDispatcher("showinfor.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet that shows student information";
    }
}
