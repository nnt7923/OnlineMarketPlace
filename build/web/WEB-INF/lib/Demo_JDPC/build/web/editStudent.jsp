<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Student</title>
    </head>
    <body>
        <h1>Edit Student</h1>
        
        <form action="StudentController" method="get">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="rollNo" value="${param.rollNo}">           
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="${param.name}" required><br>           
            <label for="mark">Mark:</label>
            <input type="text" id="mark" name="mark" value="${param.mark}" required><br>            
            <input type="submit" value="Update Student">
        </form>
        
        <a href="listStudent.jsp">Back to List</a>
    </body>
</html>
