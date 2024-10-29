<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>View Student List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Xin chào, ${loggedInUser.username}!</h2>
        <h3 class="text-center mt-4">Student List</h3>
        <table class="table table-bordered table-hover mt-4">
            <thead class="thead-dark">
                <tr>
                    <th>Roll No</th>
                    <th>Name</th>
                    <th>Mark</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${studentList}">
                    <tr>
                        <td>${student.rollNo}</td>
                        <td>${student.name}</td>
                        <td>${student.mark}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="login.jsp" class="btn btn-primary">Logout</a>
    </div>
</body>
</html>
