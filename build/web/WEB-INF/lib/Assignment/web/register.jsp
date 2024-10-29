<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Register</h1>
    <form action="AccountControllerURL" method="post">
        <input type="hidden" name="service" value="register">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        <label for="isSell">Seller (1 for Yes, 0 for No):</label>
        <input type="number" id="isSell" name="isSell" min="0" max="1" required><br><br>
        <label for="isAdmin">Admin (1 for Yes, 0 for No):</label>
        <input type="number" id="isAdmin" name="isAdmin" min="0" max="1" required><br><br>
        <button type="submit">Register</button>
        <a href="login.jsp">Back to Login</a>
    </form>
</body>
</html>
