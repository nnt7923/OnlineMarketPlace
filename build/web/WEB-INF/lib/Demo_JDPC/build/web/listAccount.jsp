<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Accounts</title>
    <style>
        table, th, td {
                border: 1px solid;
            }
    </style>
</head>
<body>
    <h1>List of Accounts</h1>

    <!-- Display messages -->
    <c:if test="${not empty sessionScope.message}">
        <p style="color: green;">${sessionScope.message}</p>
    </c:if>
    <c:if test="${not empty sessionScope.error}">
        <p style="color: red;">${sessionScope.error}</p>
    </c:if>

    <table>
        <tr>
            <th>Username</th>
            <th>Role</th>
            <th>Action</th>
        </tr>
        <c:forEach var="account" items="${sessionScope.accountList}">
            <tr>
                <td>${account.username}</td>
                <td>${account.role}</td>
                <td>
                    <a href="editAccount.jsp?username=${account.username}">Edit</a> |
                    <a href="AccountController?action=delete&username=${account.username}"
                       onclick="return confirm('Are you sure you want to delete this account?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <a href="addAccount.jsp">Add New Account</a>
    <br>
    <a href="AccountController?action=logout">Logout</a>
</body>
</html>
