<% String message = (String) request.getParameter("message"); %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="home-guest/favicon.png">
        <title>Enter OTP</title>

        <style>
            body {
                background: linear-gradient(135deg, #30BD36, #5A84E6);
                font-family: 'Poppins', sans-serif;
                margin: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .enter-otp {
                background-color: #fff;
                width: fit-content;
                text-align: center;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease-in-out;
            }

            .enter-otp:hover {
                box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
            }

            .enter-otp img {
                width: 120px;
                margin-top: 20px;
                border-radius: 50%;
            }

            .text-notice {
                color: #343a40;
                font-size: 22px;
                margin-top: 15px;
                font-weight: 600;
            }

            .otp-text {
                color: red;
                font-size: 16px;
                margin-top: 10px;
            }

            .otp-value input {
                width: 250px;
                padding: 10px;
                margin-top: 20px;
                border: 2px solid #ddd;
                border-radius: 8px;
                font-size: 16px;
                transition: border-color 0.2s;
            }

            .otp-value input:focus {
                border-color: #30BD36;
                outline: none;
            }

            .reset-password input {
                background-color: #30BD36;
                color: white;
                border: none;
                border-radius: 8px;
                padding: 12px 24px;
                cursor: pointer;
                font-size: 16px;
                margin-top: 20px;
                transition: background-color 0.3s ease;
            }

            .reset-password input:hover {
                background-color: #228B22;
            }

            .reset-password input:active {
                background-color: #1E7D1E;
            }

            h3#message {
                color: #FF0E0E;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="enter-otp">
            <div class="text-notice">Enter OTP</div>
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWxaKG6HL-_z88M5D0-zeXZjQHqN33XNtYmA&usqp=CAU" alt="OTP Image">
            <div class="text-notice">Check your email for the OTP</div>
            <div class="otp-text">
                <% if(message != null) { %>
                <h3 id="message"><%= message %></h3> 
                <% } %>
            </div>
            <% String flag = (String) session.getAttribute("flag") == null ? "" : (String) session.getAttribute("flag"); %>
            <form id="register-form" action="VerifyCodeController" method="post">
                <div class="otp-value">
                    <input id="otp" name="code" placeholder="Enter OTP" type="text" required>
                    <input type="hidden" name="flag" value="<%= flag %>">
                </div>
                <div class="reset-password">
                    <input name="recover-submit" value="Submit" type="submit">
                </div>
            </form>
        </div>
    </body>
</html>
