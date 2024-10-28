<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fruitables - Vegetable Website Template</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
        <!-- SweetAlert from CDN -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!--        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>-->
        <link rel="stylesheet" href="css/login.css">
    </head>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');
        * {
            box-sizing: border-box;
        }
        body {
            background: #f6f5f7;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            font-family: 'Montserrat', sans-serif;
            height: 100vh;
            margin: -20px 0 50px;
        }
        h1 {
            font-weight: bold;
            margin: 0;
        }
        h2 {
            text-align: center;
        }
        p {
            font-size: 14px;
            font-weight: 100;
            line-height: 20px;
            letter-spacing: 0.5px;
            margin: 20px 0 30px;
        }
        span {
            font-size: 12px;
        }
        a {
            color: #333;
            font-size: 14px;
            text-decoration: none;
            margin: 15px 0;
        }
        button {
            border-radius: 20px;
            border: 1px solid green;
            background-color: green;
            color: #FFFFFF;
            font-size: 12px;
            font-weight: bold;
            padding: 12px 45px;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: transform 80ms ease-in;
        }
        button:active {
            transform: scale(0.95);
        }
        button:focus {
            outline: none;
        }
        button.ghost {
            background-color: transparent;
            border-color: #FFFFFF;
        }
        form {
            background-color: #FFFFFF;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 50px;
            height: 100%;
            text-align: center;
        }
        input, select {
            background-color: #eee;
            border: none;
            padding: 12px 15px;
            margin: 8px 0;
            width: 100%;
        }
        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25),
                0 10px 10px rgba(0, 0, 0, 0.22);
            position: relative;
            overflow: hidden;
            width: 768px;
            max-width: 100%;
            min-height: 600px;
        }
        .form-container {
            position: absolute;
            top: 0;
            height: 100%;
            transition: all 0.6s ease-in-out;
        }
        .sign-in-container {
            left: 0;
            width: 50%;
            z-index: 2;
        }
        .container.right-panel-active .sign-in-container {
            transform: translateX(100%);
        }
        .sign-up-container {
            left: 0;
            width: 50%;
            opacity: 0;
            z-index: 1;
        }
        .container.right-panel-active .sign-up-container {
            transform: translateX(100%);
            opacity: 1;
            z-index: 5;
            animation: show 0.6s;
        }
        @keyframes show {
            0%,
            49.99% {
                opacity: 0;
                z-index: 1;
            }
            50%,
            100% {
                opacity: 1;
                z-index: 5;
            }
        }
        .overlay-container {
            position: absolute;
            top: 0;
            left: 50%;
            width: 50%;
            height: 100%;
            overflow: hidden;
            transition: transform 0.6s ease-in-out;
            z-index: 100;
        }
        .container.right-panel-active .overlay-container {
            transform: translateX(-100%);
        }
        .overlay {
            background: #81C408;
            background: -webkit-linear-gradient(to right, green, #81C408);
            background: linear-gradient(to right, green, #81C408);
            background-repeat: no-repeat;
            background-size: cover;
            background-position: 0 0;
            color: #FFFFFF;
            position: relative;
            left: -100%;
            height: 100%;
            width: 200%;
            transform: translateX(0);
            transition: transform 0.6s ease-in-out;
        }
        .container.right-panel-active .overlay {
            transform: translateX(50%);
        }
        .overlay-panel {
            position: absolute;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 40px;
            text-align: center;
            top: 0;
            height: 100%;
            width: 50%;
            transform: translateX(0);
            transition: transform 0.6s ease-in-out;
        }
        .overlay-left {
            transform: translateX(-20%);
        }
        .container.right-panel-active .overlay-left {
            transform: translateX(0);
        }
        .overlay-right {
            right: 0;
            transform: translateX(0);
        }
        .container.right-panel-active .overlay-right {
            transform: translateX(20%);
        }
        .social-container {
            margin: 20px 0;
        }
        .social-container a {
            border: 1px solid #DDDDDD;
            border-radius: 50%;
            display: inline-flex;
            justify-content: center;
            align-items: center;
            margin: 0 5px;
            height: 40px;
            width: 40px;
        }
        .popup {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            z-index: 999;
        }
        .popup-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            width: 500px;
            text-align: center;
        }
        .popup-content h2 {
            margin: 0 0 15px;
        }
        .popup-content input {
            background-color: #eee;
            border: none;
            padding: 10px;
            margin: 10px 0;
            width: 100%;
        }
        .popup-content button {
            border-radius: 20px;
            border: 1px solid green;
            background-color: green;
            color: #FFFFFF;
            font-size: 12px;
            font-weight: bold;
            padding: 12px 45px;
            letter-spacing: 1px;
            text-transform: uppercase;
            margin-top: 15px;
        }
        .close-popup {
            background-color: red;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 5px;
            margin-top: 10px;
        }
    </style>
    <body>

        <!-- Handle Success Message for Registration -->
        <%
            String successMessage = (String) session.getAttribute("successMessage");
            if (successMessage != null) {
                session.removeAttribute("successMessage"); // Clear after showing
        %>
        <script>
            Swal.fire({
                icon: 'success',
                title: 'Success',
                text: '<%= successMessage %>',
                imageUrl: 'img/siu.jpeg',
                imageWidth: 400,
                imageHeight: 200,
                imageAlt: 'Custom image',
                showClass: {
                    popup: 'animate__animated animate__fadeInDown',
                    backdrop: 'animate__animated animate__fadeIn'
                },
                hideClass: {
                    popup: 'animate__animated animate__fadeOutUp',
                    backdrop: 'animate__animated animate__fadeOut'
                },
                confirmButtonText: 'OK'
            });
        </script>
        <%
            }
        %>

        <!-- Handle Error Message for Registration or Login -->
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
        <script>
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: '<%= errorMessage %>',
                showClass: {
                    popup: 'animate__animated animate__fadeInDown',
                    backdrop: 'animate__animated animate__fadeIn'
                },
                hideClass: {
                    popup: 'animate__animated animate__fadeOutUp',
                    backdrop: 'animate__animated animate__fadeOut'
                },
                confirmButtonText: 'OK'
            });
        </script>
        <%
            }
        %>

        <div class="container" id="container">
            <!-- Registration Form -->
            <div class="form-container sign-up-container">
                <form action="#">
                    <h1>Create Account</h1>
                    <div class="social-container">                        
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/OnlineMarketPlace/login&response_type=code&client_id=273365308613-bh0svqt2gvjp973pk4m9g1o54ac5j8v2.apps.googleusercontent.com&approval_prompt=force">
                            <i class="fa-brands fa-google"></i>
                        </a>
                    </div>
                    <span>or use your email for registration</span>

                    <!-- Retain form values after error -->
                    <input type="text" name="username" placeholder="Username" value="<%= request.getAttribute("username") != null ? request.getAttribute("username") : ""%>" required />
                    <input type="password" name="password" placeholder="Password" required />
                    <input type="email" name="email" placeholder="Email" value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>" required />
                    <input type="text" name="phone" placeholder="Phone" value="<%= request.getAttribute("phone") != null ? request.getAttribute("phone") : "" %>" required />
                    <input type="text" name="address" placeholder="Address" value="<%= request.getAttribute("address") != null ? request.getAttribute("address") : "" %>" required />
                    <input type="hidden" name="flag" value="register" />

                    <!-- Handle role selection -->
                    <select name="role" id="role" required>
                        <option value="3" <%= request.getAttribute("role") != null && request.getAttribute("role").equals(3) ? "selected" : "" %>>Customer</option>
                        <option value="2" <%= request.getAttribute("role") != null && request.getAttribute("role").equals(2) ? "selected" : "" %>>Seller</option>
                    </select><br>

                    <button>Register</button>
                </form>
            </div>

            <!-- Login Form -->
            <div class="form-container sign-in-container">
                <form action="login" method="post">
                    <h1>Login</h1>
                    <div class="social-container">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/OnlineMarketPlace/login&response_type=code&client_id=273365308613-bh0svqt2gvjp973pk4m9g1o54ac5j8v2.apps.googleusercontent.com&approval_prompt=force">
                            <i class="fa-brands fa-google"></i>
                        </a>
                    </div>
                    <span>or use your account</span>

                    <!-- Retain email after login error -->
                    <input type="email" name="email" placeholder="Enter email" maxlength="30" value="<%= request.getAttribute("emailLogin") != null ? request.getAttribute("emailLogin") : "" %>" required="required" autocomplete="off" />
                    <input type="password" name="password" placeholder="Enter password" maxlength="16" required="required" autocomplete="off" />

                    <a href="#" id="forgotPasswordLink">Forgot your password?</a>
                    <button type="submit">Login</button>

                </form>

            </div>

            <!-- Overlay for switching between login and registration -->
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p>
                        <button class="ghost" id="signIn">Login</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button class="ghost" id="signUp">Register</button>
                    </div>
                </div>
            </div>
            <div class="popup" id="forgotPasswordPopup">
                <div class="popup-content">
                    <h3>Reset Password</h3>
                    <input type="email" placeholder="Enter your email" />
                    <button>Send</button>
                    <button class="close-popup" id="closePopupButton">Close</button>
                </div>
            </div>
            <form action="EmailSender" method="post">
                <div class="popup" id="forgotPasswordPopup">
                    <div class="popup-content">
                        <h3>Reset Password</h3>
                        <input name="email_forgot" type="email" placeholder="Enter your email" />
                        <input type="hidden" name="flag" value="forgotPassword">
                        <button type="submit" id="submit-btn">Send</button>
                        <button class="close-popup" id="closePopupButton">Close</button>
                    </div>
                </div>
            </form>
        </div>

        <!-- JavaScript for form toggling and popup -->
        <script>
            const signUpButton = document.getElementById('signUp');
            const signInButton = document.getElementById('signIn');
            const container = document.getElementById('container');
            const closePopupButton = document.getElementById('closePopupButton');
            signUpButton.addEventListener('click', () => {
                container.classList.add("right-panel-active");
            });
            signInButton.addEventListener('click', () => {
                container.classList.remove("right-panel-active");
            });
            forgotPasswordLink.addEventListener('click', () => {
                forgotPasswordPopup.style.display = 'flex';
            });
            closePopupButton.addEventListener('click', () => {
                forgotPasswordPopup.style.display = 'none';
            });
        </script>
    </body>
</html>
