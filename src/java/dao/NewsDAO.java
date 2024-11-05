/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import model.News;
import model.NewsType;
import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class NewsDAO extends DBContext {

    public void insertBlog(News blog) {
        try {
            String sql = "INSERT INTO [dbo].[News]\n"
                    + "           ([title]\n"
                    + "           ,[nimage]\n"
                    + "           ,[ntid]\n"
                    + "           ,[contents]\n"
                    + "           ,[status]\n"
                    + "           ,[createdate])\n"
                    + "     VALUES(?, ?, ?, ?, ?, GETDATE())";
            PreparedStatement stm = new DBContext().conn.prepareStatement(sql);
            stm.setString(1, blog.getTitle());
            stm.setString(2, blog.getImage());
            stm.setInt(3, blog.getNewsType().getId());
            stm.setString(4, blog.getContent());
            stm.setBoolean(5, blog.isStatus());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int getNewsCount() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM [News]";
        try (
             PreparedStatement pre = conn.prepareStatement(sql);
             ResultSet rs = pre.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return count;
    }

    public News selectBlog(int blogId) {
        News blog = null;
        try {
            String sql = "SELECT b.[ntid], bt.nttype, [newid], [title] ,[contents],[createdate], [nimage] \n"
                    + ",[status] FROM [dbo].News b\n"
                    + "INNER JOIN [News_Type] bt on b.ntid = bt.ntid\n"
                    + "WHERE [newid] = ?";
            PreparedStatement stm = new DBContext().conn.prepareStatement(sql);
            stm.setInt(1, blogId);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                News b = new News();
                NewsType bt = new NewsType();
                bt.setId(rs.getInt("ntid"));
                bt.setType(rs.getString("nttype"));
                b.setNewsType(bt);

                b.setId(rs.getInt("newid"));
                b.setImage(rs.getString("nimage"));
                b.setTitle(rs.getString("title"));
                b.setCreatedDate(rs.getDate("createdate"));
                b.setContent(rs.getString("contents"));
                b.setStatus(rs.getBoolean("status"));
                return b;
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blog;
    }

    public List<News> getAllBlogs() {
        List<News> blogs = new ArrayList<>();
        try {
            // Th�m c�u l?nh ORDER BY ?? s?p x?p theo ng�y t?o gi?m d?n
            String sql = "SELECT [newid], [nimage], bt.[ntid], bt.[nttype], [title], [contents], [createdate], [status] "
                    + "FROM [dbo].News b "
                    + "JOIN [News_Type] bt ON b.ntid = bt.ntid "
                    + "ORDER BY [createdate] DESC"; // S?p x?p theo ng�y t?o gi?m d?n

            PreparedStatement stm = new DBContext().conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                News b = new News();
                NewsType bt = new NewsType();
                bt.setId(rs.getInt("ntid"));
                bt.setType(rs.getString("nttype"));
                b.setNewsType(bt);
                b.setId(rs.getInt("newid"));
                b.setImage(rs.getString("nimage"));
                b.setTitle(rs.getString("title"));
                b.setContent(rs.getString("contents"));
                b.setCreatedDate(rs.getDate("createdate"));
                b.setStatus(rs.getBoolean("status"));
                blogs.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blogs;
    }

    public void updateBlog(News blog) throws SQLException {
        try {
            String sql = "UPDATE [dbo].[News]\n"
                    + "   SET [title] = ?\n"
                    + "      ,[nimage] = ?\n"
                    + "      ,[contents] = ?\n"
                    + "      ,[ntid] = ?\n"
                    + "      ,[createdate] = GETDATE()\n"
                    + "      ,[status] = ?\n"
                    + " WHERE [newid] = ?";
            PreparedStatement stm = new DBContext().conn.prepareStatement(sql);
            stm.setString(1, blog.getTitle());
            stm.setString(2, blog.getImage());
            stm.setString(3, blog.getContent());
            stm.setInt(4, blog.getNewsType().getId());
            stm.setBoolean(5, blog.isStatus());
            stm.setInt(6, blog.getId());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteBlog(News entity) {
        try {
            String sql = "DELETE FROM [dbo].[News]\n"
                    + "      WHERE newid = ?";
            PreparedStatement stm = new DBContext().conn.prepareStatement(sql);
            stm.setInt(1, entity.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //lấy tất cả data News Type
    public List<NewsType> getAllBlogsTypes() {
        List<NewsType> blogsTypes = new ArrayList<>();
        try {
            String sql = "SELECT [ntid],[nttype] FROM [News_Type]";
            PreparedStatement stm = new DBContext().conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                NewsType bt = new NewsType();
                bt.setId(rs.getInt("ntid"));
                bt.setType(rs.getString("nttype"));

                blogsTypes.add(bt);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blogsTypes;
    }

    //lấy id News Type
    public NewsType getNewsTypeById(int id) {
        try {
            String sql = "SELECT [ntid]\n"
                    + "      ,[nttype]\n"
                    + "  FROM [dbo].[News_Type] WHERE [ntid] = ?";
            PreparedStatement stm = new DBContext().conn.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                NewsType bt = new NewsType();
                bt.setId(rs.getInt("ntid"));
                bt.setType(rs.getString("nttype"));
                return bt;
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int getTotalNews() {
        try {
            String sql = "select count(*) from News";
            PreparedStatement stm = new DBContext().conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);

            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<News> pagingNews(int index) {
        List<News> listproList = new ArrayList<>();
        try {
            String sql = "select * from News\n"
                    + "order by newid\n"
                    + "OFFSET ? ROWS\n"
                    + "FETCH FIRST 10 ROW ONLY;";
            PreparedStatement stm = new DBContext().conn.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 10);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                News b = new News();
                b.setNewsType(new NewsDAO().getNewsTypeById(rs.getInt("ntid")));
                b.setId(rs.getInt("newid"));
                b.setImage(rs.getString("nimage"));
                b.setTitle(rs.getString("title"));
                b.setContent(rs.getString("contents"));
                b.setCreatedDate(rs.getDate("createdate"));
                b.setStatus(rs.getBoolean("status"));
                listproList.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listproList;
    }

    public List<News> getSearchByTitle(String title) {
        List<News> blogs = new ArrayList<>();
        try {
            String sql = "SELECT [newid], [nimage], bt.[ntid], bt.[nttype], [title], [contents], [createdate], [status] \n"
                    + "FROM [dbo].[News] b \n"
                    + "JOIN [News_Type] bt on b.ntid = bt.ntid WHERE b.title LIKE ?";
            PreparedStatement stm = new DBContext().conn.prepareStatement(sql);
            stm.setString(1, "%" + title + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                News b = new News();
                NewsType bt = new NewsType();
                bt.setId(rs.getInt("ntid"));
                bt.setType(rs.getString("nttype"));
                b.setNewsType(bt);
                b.setId(rs.getInt("newid"));
                b.setImage(rs.getString("nimage"));
                b.setTitle(rs.getString("title"));
                b.setContent(rs.getString("contents"));
                b.setCreatedDate(rs.getDate("createdate"));
                b.setStatus(rs.getBoolean("status"));
                blogs.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blogs;
    }

    public List<News> getSearchByDate(String date) {
        List<News> blogs = new ArrayList<>();
        try {
            // S? d?ng LIKE ?? t�m ki?m theo t?ng ph?n c?a ng�y, th�ng ho?c n?m
            String sql = "SELECT [newid], [nimage], bt.[ntid], bt.[nttype], [title], [contents], [createdate], [status] \n"
                    + "FROM [dbo].[News] b \n"
                    + "JOIN [News_Type] bt on b.ntid = bt.ntid WHERE CAST(b.createdate AS VARCHAR) LIKE ?";
            PreparedStatement stm = new DBContext().conn.prepareStatement(sql);

            stm.setString(1, "%" + date + "%");

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                News b = new News();
                NewsType bt = new NewsType();
                bt.setId(rs.getInt("ntid"));
                bt.setType(rs.getString("nttype"));
                b.setNewsType(bt);
                b.setId(rs.getInt("newid"));
                b.setImage(rs.getString("nimage"));
                b.setTitle(rs.getString("title"));
                b.setContent(rs.getString("contents"));
                b.setCreatedDate(rs.getDate("createdate"));
                b.setStatus(rs.getBoolean("status"));
                blogs.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blogs;
    }

    public List<News> top10Blogses() {
        List<News> blogs = new ArrayList<>();
        try {
            String sql = "SELECT TOP 10 ntid, newid, nimage, title, contents, createdate, status\n"
                    + "FROM News\n"
                    + "WHERE status = 1\n"
                    + "ORDER BY createdate DESC;";
            PreparedStatement stm = new DBContext().conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                News b = new News();
                b.setNewsType(new NewsDAO().getNewsTypeById(rs.getInt("ntid")));
                b.setId(rs.getInt("newid"));
                b.setImage(rs.getString("nimage"));
                b.setTitle(rs.getString("title"));
                b.setContent(rs.getString("contents"));
                b.setCreatedDate(rs.getDate("createdate"));
                b.setStatus(rs.getBoolean("status"));
                blogs.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }
        return blogs;
    }

    public int getTotalBlogs() {
        try {
            String sql = "select count(*) from News";
            PreparedStatement stm = new DBContext().conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);

            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }
        return 0;
    }

    public List<News> getNewsByCategory(int categoryId) {
        List<News> blogs = new ArrayList<>();
        try {
            String sql = "SELECT [newid], [nimage], bt.[ntid], bt.[nttype], [title], [contents], [createdate], [status] \n"
                    + "FROM [dbo].News b \n"
                    + "JOIN [News_Type] bt on b.ntid = bt.ntid \n"
                    + "WHERE bt.ntid = ?";
            PreparedStatement stm = new DBContext().conn.prepareStatement(sql);
            stm.setInt(1, categoryId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                News b = new News();
                NewsType bt = new NewsType();
                bt.setId(rs.getInt("ntid"));
                bt.setType(rs.getString("nttype"));
                b.setNewsType(bt);
                b.setId(rs.getInt("newid"));
                b.setImage(rs.getString("nimage"));
                b.setTitle(rs.getString("title"));
                b.setContent(rs.getString("contents"));
                b.setCreatedDate(rs.getDate("createdate"));
                b.setStatus(rs.getBoolean("status"));
                blogs.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blogs;
    }

    public List<News> filterByType(int categoryId) {
        List<News> blogs = new ArrayList<>();
        try {
            String sql = "SELECT [newid], [nimage], bt.[ntid], bt.[nttype], [title], [contents], [createdate], [status] \n"
                    + "FROM [dbo].[News] b \n"
                    + "JOIN [News_Type] bt on b.ntid = bt.ntid ";
            if (categoryId > 0) {
                sql += "WHERE bt.ntid = ?";
            }

            PreparedStatement stm = new DBContext().conn.prepareStatement(sql);
            if (categoryId > 0) {
                stm.setInt(1, categoryId);
            }

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                News b = new News();
                NewsType bt = new NewsType();
                bt.setId(rs.getInt("ntid"));
                bt.setType(rs.getString("nttype"));
                b.setNewsType(bt);
                b.setId(rs.getInt("newid"));
                b.setImage(rs.getString("nimage"));
                b.setTitle(rs.getString("title"));
                b.setContent(rs.getString("contents"));
                b.setCreatedDate(rs.getDate("createdate"));
                b.setStatus(rs.getBoolean("status"));
                blogs.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blogs;
    }

    public NewsType getCategoryByNews(int newsId) {
        NewsType newsType = null;
        try {
            String sql = "SELECT nt.ntid, nt.nttype FROM News_Type nt\n"
                    + "JOIN News n ON nt.ntid = n.ntid\n"
                    + "WHERE n.newid = ?";

            PreparedStatement stm = new DBContext().conn.prepareStatement(sql);
            stm.setInt(1, newsId);

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int ntid = rs.getInt("ntid");
                String nttype = rs.getString("nttype");

                newsType = new NewsType();
                newsType.setId(ntid);
                newsType.setType(nttype);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return newsType;
    }

    public List<News> top3Blogs() {
        List<News> blogs = new ArrayList<>();
        try {
            String sql = "SELECT TOP 3 ntid, newid, nimage, title, contents, createdate, status "
                    + "FROM News "
                    + "WHERE status = 1 "
                    + "ORDER BY createdate DESC;";
            PreparedStatement stm = new DBContext().conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                News b = new News();
                b.setNewsType(new NewsDAO().getNewsTypeById(rs.getInt("ntid")));
                b.setId(rs.getInt("newid"));
                b.setImage(rs.getString("nimage"));
                b.setTitle(rs.getString("title"));
                b.setContent(rs.getString("contents"));
                b.setCreatedDate(rs.getDate("createdate"));
                b.setStatus(rs.getBoolean("status"));
                blogs.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, "SQL exception occurred", ex);
        }
        return blogs;
    }

    public static void main(String[] args) {
        NewsDAO db = new NewsDAO();
//        List<News> b = db.top10Blogses();
//        for (News blogs : b) {
//            System.out.println(blogs);
//        }

        NewsType nt = db.getCategoryByNews(1);
        System.out.println(nt);
    }

//    public static void main(String[] args) {
//        BlogDBContext db = new BlogDBContext();
//        Blogs blog = new Blogs();
//
//        // Set the blog data
//        blog.setId(1); // ID of the blog you want to update
//        blog.setTitle("Updated Blog Title");
//        blog.setContent("This is the updated content of the blog.");
//        blog.setStatus(true); // Set status to true (active)
//
//        try {
//            db.updateBlog(blog);
//            System.out.println("Blog updated successfully.");
//        } catch (SQLException ex) {
//            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
}
