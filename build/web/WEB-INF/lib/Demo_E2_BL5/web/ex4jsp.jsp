<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ex4jspServlet" method="POST">
            <h1>M2.BL5.PRJ301</h1>
            <h2>Họ và Tên</h2>
            Họ tên <input type="text" name="name" required=""><br>
            Giới tính: 
            nam <input type="radio" name="gender" value="male" required="">
            nữ <input type="radio" name="gender" value="female" required=""><br>
            Điểm <input type="text" name="number" id="number" required=""><br>
            Môn học <select name="cour">
                <option>Prj301</option>
                <option>Pro</option>
                <option>Prf</option>
            </select><br>
            <input type="submit" value="submit">
        </form>
        <% if (request.getAttribute("mess") != null) { %>
            <h2><%= request.getAttribute("mess") %></h2>
        <% } %>

    </body>
</html>
