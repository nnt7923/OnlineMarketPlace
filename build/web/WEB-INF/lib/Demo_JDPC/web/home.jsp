<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
</head>
<body>
    <h1>Welcome to the Home Page</h1>

    <c:if test="${not empty sessionScope.loggedInUser}">
        <p>Hello, ${sessionScope.loggedInUser.username}!</p>
    </c:if>

    <p>This is your dashboard. From here, you can navigate to various sections of the application.</p>

    <ul>
        <li><a href="AccountController?action=list">Manage Accounts</a></li>
        <!-- Add other links as needed -->
    </ul>

    <a href="AccountController?action=logout">Logout</a>
</body>
</html>
