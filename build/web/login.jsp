<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fruitables - Vegetable Website Template</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form action="#">
                    <h1>Create Account</h1>
                    <div class="social-container">
                        <a href="#" class="social"><i class="fa-brands fa-facebook"></i></a>
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/OnlineMarketPlace/login&response_type=code&client_id=273365308613-bh0svqt2gvjp973pk4m9g1o54ac5j8v2.apps.googleusercontent.com&approval_prompt=force">
                            <i class="fa-brands fa-google"></i>
                        </a>
                    </div>
                    <span>or use your email for registration</span>
                    <input type="text" placeholder="Username" />
                    <input type="email" placeholder="Email" />
                    <input type="password" placeholder="Password" />
                    <input type="text" placeholder="Phone" />
                    <input type="text" placeholder="Address" />
                    <select name="vaiTro" id="role">
                        <option value="mua" selected>Customer</option>
                        <option value="ban">Seller</option>
                    </select><br>
                    <button>Register</button>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <form action="login" method="post">
                    <h1>Login</h1>
                    <div class="social-container">
                        <a href="#" class="social"><i class="fa-brands fa-facebook"></i></a>
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/OnlineMarketPlace/login&response_type=code&client_id=273365308613-bh0svqt2gvjp973pk4m9g1o54ac5j8v2.apps.googleusercontent.com&approval_prompt=force">
                            <i class="fa-brands fa-google"></i>
                        </a>
                    </div>
                    <span>or use your account</span>
                    <input type="email" name="email" placeholder="Enter email" maxlength="30" required="required" autocomplete="off" />
                    <input type="password" name="password" placeholder="Enter password" maxlength="16" required="required" autocomplete="off" />
                    <a href="#" id="forgotPasswordLink">Forgot your password?</a>
                    <button type="submit">Login</button>
                    <%
                        String errorMessage = (String) request.getAttribute("errorMessage");
                        if (errorMessage != null) {
                            out.println("<p style='color: red;'>" + errorMessage + "</p>");
                        }
                    %>
                </form>

            </div>
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