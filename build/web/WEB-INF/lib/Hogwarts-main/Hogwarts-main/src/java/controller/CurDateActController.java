// File: controller/CurDateActController.java
package controller;

import entity.CurDateAct;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import model.DAOCurDateAct;

@WebServlet(name = "CurDateActController", urlPatterns = {"/CurDateActControllerURL"})
public class CurDateActController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOCurDateAct dao = new DAOCurDateAct();
        HttpSession session = request.getSession(true);
        
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        if (service.equals("addCurDateAct")) {
            // Get data from request
            String CdtID = request.getParameter("CdtID");
            String Act = request.getParameter("Act");
            String TimeStart = request.getParameter("TimeStart");
            String TimeEnd = request.getParameter("TimeEnd");
            String CurDateID = request.getParameter("CurDateID");
            // Create CurDateAct object
            CurDateAct act = new CurDateAct(CdtID, Act, TimeStart, TimeEnd, CurDateID);
            // Insert CurDateAct
            dao.insertCurDateAct(act);
            // Redirect to listAll
            response.sendRedirect("CurDateActControllerURL?service=listAll");
        }

        if (service.equals("listAll")) {
            // Get all current date activities
            Vector<CurDateAct> vector = dao.getAllCurDateActs("SELECT * FROM CurDateAct");
            // Set data to request
            request.setAttribute("data", vector);
            // Forward to JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("CurDateActList.jsp");
            dispatcher.forward(request, response);
        }

        if (service.equals("updateCurDateAct")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                // Show update form
                String cdtID = request.getParameter("CdtID");
                CurDateAct act = dao.getCurDateActByID(cdtID);
                request.setAttribute("act", act);
                RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateCurDateAct.jsp");
                dispatcher.forward(request, response);
            } else {
                // Update current date activity data
                String CdtID = request.getParameter("CdtID");
                String Act = request.getParameter("Act");
                String TimeStart = request.getParameter("TimeStart");
                String TimeEnd = request.getParameter("TimeEnd");
                String CurDateID = request.getParameter("CurDateID");
                CurDateAct act = new CurDateAct(CdtID, Act, TimeStart, TimeEnd, CurDateID);
                dao.updateCurDateAct(act);
                response.sendRedirect("CurDateActControllerURL?service=listAll");
            }
        }

        if (service.equals("deleteCurDateAct")) {
            String cdtID = request.getParameter("CdtID");
            dao.deleteCurDateAct(cdtID);
            response.sendRedirect("CurDateActControllerURL?service=listAll");
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
