package controller;

import entity.SchoolYear;
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
import model.DAOSchoolYear;

@WebServlet(name = "SchoolYearController", urlPatterns = {"/SchoolYearControllerURL"})
public class SchoolYearController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOSchoolYear dao = new DAOSchoolYear();
        HttpSession session = request.getSession(true);
        
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        if (service.equals("addSchoolYear")) {
            String syID = request.getParameter("SyID");
            String syName = request.getParameter("SyName");
            String dateStart = request.getParameter("DateStart");
            String dateEnd = request.getParameter("DateEnd");
            SchoolYear schoolYear = new SchoolYear(syID, syName, dateStart, dateEnd);
            dao.insertSchoolYear(schoolYear);
            response.sendRedirect("SchoolYearControllerURL?service=listAll");
        }

        if (service.equals("listAll")) {
            Vector<SchoolYear> vector = dao.getAllSchoolYears("SELECT * FROM SchoolYear");
            request.setAttribute("data", vector);
            RequestDispatcher dispatcher = request.getRequestDispatcher("SchoolYearList.jsp");
            dispatcher.forward(request, response);
        }

        if (service.equals("update")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                String syID = request.getParameter("SyID");
                Vector<SchoolYear> vector = dao.getAllSchoolYears("SELECT * FROM SchoolYear WHERE SyID='" + syID + "'");
                request.setAttribute("vector", vector);
                RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateSchoolYear.jsp");
                dispatcher.forward(request, response);
            } else {
                String syID = request.getParameter("SyID");
                String syName = request.getParameter("SyName");
                String dateStart = request.getParameter("DateStart");
                String dateEnd = request.getParameter("DateEnd");
                SchoolYear schoolYear = new SchoolYear(syID, syName, dateStart, dateEnd);
                dao.updateSchoolYear(schoolYear);
                response.sendRedirect("SchoolYearControllerURL?service=listAll");
            }
        }

        if (service.equals("delete")) {
            String syID = request.getParameter("SyID");
            dao.removeSchoolYear(syID);
            response.sendRedirect("SchoolYearControllerURL?service=listAll");
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
