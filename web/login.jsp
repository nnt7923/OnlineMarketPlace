<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fruitables - Vegetable Website Template</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
        <link rel="stylesheet" href="css/login.css">
        <!-- SweetAlert from CDN -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    </head>
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
                <form action="EmailSender" method="post">
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
                    <%
                        String errorAccount = (String) session.getAttribute("errorAccount");
                        if (errorAccount != null) {
                    %>
                        <div class="alert alert-danger">
                            <%= errorAccount %>
                        </div>
                        <%
                            session.removeAttribute("errorAccount"); // Remove it after displaying once
                        %>
                    <%
                        }
                    %>
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

            <!-- Forgot Password Popup -->
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
            const forgotPasswordLink = document.getElementById('forgotPasswordLink');
            const forgotPasswordPopup = document.getElementById('forgotPasswordPopup');

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
