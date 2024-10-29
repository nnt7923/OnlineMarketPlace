<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Register</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body, html {
                height: 100%;
            }
            .register-container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100%;
            }
            .register-box {
                width: 100%;
                max-width: 400px;
                padding: 15px;
                background: #f7f7f7;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>
    <body>
        <div class="register-container">
            <div class="register-box">
                <h1 class="text-center">Register</h1>
                <c:if test="${not empty sessionScope.message}">
                    <div class="alert alert-success" role="alert">
                        ${sessionScope.message}
                    </div>
                </c:if>
                <c:if test="${not empty sessionScope.error}">
                    <div class="alert alert-danger" role="alert">
                        ${sessionScope.error}
                    </div>
                </c:if>           
                <form action="AccountController" method="get">
                    <input type="hidden" name="action" value="register">               
                    <div class="form-group">
                        <label for="username">Username:</label>
                        <input type="text" id="username" name="username" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" class="form-control" required>
                    </div>
                    <input type="hidden" id="role" name="role" value="2">
                    <button type="submit" class="btn btn-primary btn-block">Register</button>              
                </form>
                <div class="text-center mt-3">
                    <p>Already have an account?</p>
                    <a href="login.jsp" class="btn btn-secondary btn-block">Login</a>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS, Popper.js, and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
