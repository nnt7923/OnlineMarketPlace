<%@ taglib prefix="currency" uri="/WEB-INF/currency.tld" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Order Success</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

        <style>
            .success-message {
                text-align: center;
                background: #fff;
                padding: 40px;
                border: 1px solid #ddd;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                max-width: 600px;
                margin: 150px auto;
                margin-top: 200px;
            }

            .success-message h1 {
                margin-bottom: 20px;
            }

            .success-message .order-details {
                margin-bottom: 20px;
                font-size: 16px;
                color: #333;
            }

            .success-message .order-details p {
                margin: 10px 0;
            }

            .success-message .order-details span {
                font-weight: bold;
            }

            .success-message .actions {
                display: flex;
                justify-content: space-around;
                margin-top: 20px;
            }

            .success-message .actions .btn {
                color: white;
                text-decoration: none;
                transition: background-color 0.3s;
            }

            .success-message .actions .btn:hover {
                background-color: #81c408;
            }


            .success-message .actions .btn-secondary:hover {
                background-color: #81c408;
            }
            .breadcrumb a {
                font-weight: bold;
            }
            .success-icon {
                margin-bottom: 20px;
                font-size: 70px;
                color: #49ce66;
            }
        </style>
    </head>

    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->

        <%@ include file="header.jsp" %>

    <body class="js">
        <div class="container">
            <div class="success-message">
                <div class="success-icon">
                    <i class="bi bi-check-circle-fill"></i>
                </div>
                <h1>ORDER SUCCESSFUL</h1>
                <div class="order-details">
                    <p>You have successfully placed an order with code <span>${orderId}</span> value <span><currency:formatCurrency value="${totalAmount}"/></span>, Payment method: <span>${paymentMethod}</span>.</p>
                    <p>After Tech Store confirms the order, the product will be delivered to the address <span>${deliveryAddress}</span> as soon as possible.</p>
                    <p class="breadcrumb">
                        You can track your order at:<br/>
                        <a href="${pageContext.request.contextPath}/profiles">Profiles<i class="bi bi-arrow-right"></i></a> 
                        <a href="${pageContext.request.contextPath}/orderhistory"> Order History</a>
                    </p>                    
                </div>
                <div class="actions">
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/home">CONTINUE SHOPPING</a>
                    <a href="${pageContext.request.contextPath}/orderhistory" class="btn btn-secondary">ORDER HISTORY</a>
                </div>
            </div>
        </div>
    </body>      


    <%@ include file="footer.jsp" %>
    <!-- Back to Top -->
    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   


    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>