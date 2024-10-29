package controller;

import entity.Curriculum;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import model.DAOCurriculum;

@WebServlet(name = "CurriculumController", urlPatterns = {"/CurriculumControllerURL"})
public class CurriculumController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOCurriculum dao = new DAOCurriculum();
        HttpSession session = request.getSession(true);

        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        if (service.equals("addCurriculum")) {
            String curID = request.getParameter("CurID");
            String curName = request.getParameter("CurName");
            String cateID = request.getParameter("CateID");
            Curriculum curriculum = new Curriculum(curID, curName, cateID);
            dao.insertCurriculum(curriculum);
            response.sendRedirect("CurriculumControllerURL?service=listAll");
        }

        if (service.equals("listAll")) {
            Vector<Curriculum> vector = dao.getAllCurriculums("SELECT * FROM Curriculum");
            request.setAttribute("data", vector);
            RequestDispatcher dispatcher = request.getRequestDispatcher("CurriculumList.jsp");
            dispatcher.forward(request, response);
        }

        if (service.equals("update")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                String curID = request.getParameter("CurID");
                Vector<Curriculum> vector = dao.getAllCurriculums("SELECT * FROM Curriculum WHERE CurID='" + curID + "'");
                request.setAttribute("vector", vector);
                RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateCurriculum.jsp");
                dispatcher.forward(request, response);
            } else {
                String curID = request.getParameter("CurID");
                String curName = request.getParameter("CurName");
                String cateID = request.getParameter("CateID");
                Curriculum curriculum = new Curriculum(curID, curName, cateID);
                dao.updateCurriculum(curriculum);
                response.sendRedirect("CurriculumControllerURL?service=listAll");
            }
        }

        if (service.equals("delete")) {
            String curID = request.getParameter("CurID");
            dao.removeCurriculum(curID);
            response.sendRedirect("CurriculumControllerURL?service=listAll");
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
        return "Curriculum Controller";
    }
}
