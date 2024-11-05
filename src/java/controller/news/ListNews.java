/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.news;


import dao.NewsDAO;
import model.News;
import model.NewsType;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
public class ListNews extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        handleRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        handleRequest(request, response);
    }

    private void handleRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);

        String searchQuery = request.getParameter("searchQuery");
        String btidParam = request.getParameter("btid");
        int btid = (btidParam == null || btidParam.isEmpty()) ? 0 : Integer.parseInt(btidParam);

        NewsDAO db = new NewsDAO();
        List<News> blogses;
        int count;

        // Kiểm tra xem searchQuery có phải là ngày hợp lệ không
        boolean isDate = false;
        if (searchQuery != null && !searchQuery.isEmpty()) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            sdf.setLenient(false);
            try {
                Date date = sdf.parse(searchQuery);
                isDate = true;
            } catch (ParseException e) {
                // Không phải là ngày, isDate vẫn là false
            }
        }

        // Tìm kiếm theo tiêu đ�? hoặc ngày
        if (searchQuery != null && !searchQuery.isEmpty()) {
            if (isDate) {
                blogses = db.getSearchByDate(searchQuery);
            } else {
                blogses = db.getSearchByTitle(searchQuery);
            }
            request.setAttribute("searchQuery", searchQuery);
        } else if (btid > 0) {
            blogses = db.filterByType(btid);
            request.setAttribute("btid", btid);
        } else {
            blogses = db.getAllBlogs();  // Phương thức lấy tất cả blogs
        }

        if (blogses != null) {
            count = blogses.size();
            int endPage = count / 10;
            if (count % 10 != 0) {
                endPage++;
            }

            int start = (index - 1) * 10;
            int end = Math.min(start + 10, count);
            List<News> paginatedBlogses = blogses.subList(start, end);

            List<NewsType> blogsTypes = db.getAllBlogsTypes();

            request.setAttribute("blogtype", blogsTypes);
            request.setAttribute("blog", paginatedBlogses);
            request.setAttribute("endP", endPage);
            request.setAttribute("tag", index);
        }
        request.getRequestDispatcher("./admin/view/listNews.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

