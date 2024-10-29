<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Forgot Password</h1>
    
    <c:if test="${forgotPasswordError != null}">
        <p style="color: red;">${forgotPasswordError}</p>
    </c:if>
    
    <form action="AccountControllerURL" method="post">
        <input type="hidden" name="service" value="forgotpassword">
        <label for="email">Email (username):</label>
        <input type="text" id="email" name="email" required><br><br>
        <label for="newPassword">New Password:</label>
        <input type="password" id="newPassword" name="newPassword" required><br><br>
        <button type="submit">Reset Password</button>
    </form>

    <a href="login.jsp">Back to Login</a>
</body>
</html>
