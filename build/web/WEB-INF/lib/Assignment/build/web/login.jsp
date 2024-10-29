<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Login</h1>
    <form action="AccountControllerURL" method="post">
        <input type="hidden" name="service" value="login">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        <button type="submit">Login</button>
        <a href="AccountControllerURL?service=forgotpassword">Forgot Password?</a> | 
        <a href="register.jsp">Register</a>
    </form>
    <c:if test="${loginError != null}">
        <p style="color: red;">${loginError}</p>
    </c:if>
</body>
</html>
