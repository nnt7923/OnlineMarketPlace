<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Account</title>
</head>
<body>
    <h1>Account Information</h1>
    <table border="1">
        <tr>
            <td>User ID:</td>
            <td>${account.uid}</td>
        </tr>
        <tr>
            <td>Username:</td>
            <td>${account.user}</td>
        </tr>
        <tr>
            <td>Is Seller:</td>
            <td>${account.isSell == 1 ? 'Yes' : 'No'}</td>
        </tr>
        <tr>
            <td>Is Admin:</td>
            <td>${account.isAdmin == 1 ? 'Yes' : 'No'}</td>
        </tr>
        <tr>
            <td>Account Status:</td>
            <td>${account.active ? 'Active' : 'Blocked'}</td>
        </tr>
    </table>
    <a href="home" class="btn btn-primary">Back to Home</a>
</body>
</html>
