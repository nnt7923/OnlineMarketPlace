<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>List of Students</title>
        <style>
            table, th, td {
                border: 1px solid;
            }
        </style>
    </head>
    <body>
        <h2 class="text-center">Xin chào, ${loggedInUser.username}!</h2>
        <h1>List of Students</h1>
        <a href="addStudent.jsp">Add New Student</a><br><br>
        <table>
            <tr>
                <th>Roll No</th>
                <th>Name</th>
                <th>Mark</th>
                <th>Action</th>
            </tr>
            <c:forEach var="student" items="${sessionScope.data}">
                <tr>
                    <td>${student.getRollNo()}</td>
                    <td>${student.getName()}</td>
                    <td>${student.getMark()}</td>
                    <td>
                        <a href="editStudent.jsp?rollNo=${student.getRollNo()}&name=${student.getName()}&mark=${student.getMark()}">Edit</a> | 
                        <a href="StudentController?action=delete&rollNo=${student.getRollNo()}" onclick="return confirm('Are you sure you want to delete this student?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
         <a href="AccountController?action=logout" class="btn btn-primary">Logout</a>
    </body>
</html>
