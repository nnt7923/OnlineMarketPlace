<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Student</title>
    </head>
    <body>
        <h1>Add New Student</h1>
        
        <form action="StudentController" method="get">
            <input type="hidden" name="action" value="add">
            <label for="rollNo">Roll No:</label>
            <input type="text" id="rollNo" name="rollNo" required><br>
            
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br>
            
            <label for="mark">Mark:</label>
            <input type="number" id="mark" name="mark" required><br>
            
            <input type="submit" value="Add Student">
        </form>
        
        <a href="listStudent.jsp">Back to List</a>
    </body>
</html>
