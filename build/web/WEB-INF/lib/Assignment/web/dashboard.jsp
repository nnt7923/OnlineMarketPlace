<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Welcome to Dashboard</h1>
    <p>Welcome, ${sessionScope.account.user}!</p>
    <a href="AccountControllerURL?service=logout">Logout</a>
</body>
</html>
