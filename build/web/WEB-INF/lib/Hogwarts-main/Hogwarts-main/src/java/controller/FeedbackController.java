package controller;

import entity.Feedback;
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
import model.DAOFeedback;

@WebServlet(name = "FeedbackController", urlPatterns = {"/FeedbackControllerURL"})
public class FeedbackController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOFeedback dao = new DAOFeedback();
        HttpSession session = request.getSession(true);
        
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        if (service.equals("addFeedback")) {
            System.out.println("Entering addFeedback block...");
            String feedbackID = request.getParameter("FeedbackID");
            String date = request.getParameter("Date");
            String content = request.getParameter("Content");
            String studentID = request.getParameter("StudentID");
            Feedback feedback = new Feedback(feedbackID, date, content, studentID);
            dao.insertFeedback(feedback);
            response.sendRedirect("FeedbackControllerURL?service=listAll");
        }

        if (service.equals("listAll")) {
            Vector<Feedback> vector = dao.getAllFeedbacks("SELECT * FROM Feedback");
            request.setAttribute("data", vector);
            RequestDispatcher dispatcher = request.getRequestDispatcher("FeedbackList.jsp");
            dispatcher.forward(request, response);
        }

        if (service.equals("update")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                String feedbackID = request.getParameter("FeedbackID");
                Vector<Feedback> vector = dao.getAllFeedbacks("SELECT * FROM Feedback WHERE FeedbackID='" + feedbackID + "'");
                request.setAttribute("vector", vector);
                RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateFeedback.jsp");
                dispatcher.forward(request, response);
            } else {
                String feedbackID = request.getParameter("FeedbackID");
                String date = request.getParameter("Date");
                String content = request.getParameter("Content");
                String studentID = request.getParameter("StudentID");
                Feedback feedback = new Feedback(feedbackID, date, content, studentID);
                dao.updateFeedback(feedback);
                response.sendRedirect("FeedbackControllerURL?service=listAll");
            }
        }

        if (service.equals("delete")) {
            String feedbackID = request.getParameter("FeedbackID");
            dao.removeFeedback(feedbackID);
            response.sendRedirect("FeedbackControllerURL?service=listAll");
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
