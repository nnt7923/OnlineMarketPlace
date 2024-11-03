
<%-- 
    Document   : homeSale
    Created on : May 20, 2024, 7:25:24 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="currency" uri="/WEB-INF/currency.tld" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="zxx">   
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Title Tag  -->
        <title>Fire Fly</title>
        <!-- Bootstrap -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
        <!-- Eshop StyleSheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
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
            .blog-container {
                font-family: 'Roboto', sans-serif;
                color: #333;
                line-height: 1.6;
            }
            .breadcrumb {
                font-size: 14px;
                color: #666;
                margin-bottom: 15px;
            }

            .breadcrumb-link {
                color: #1a73e8;
                text-decoration: none;
                transition: color 0.3s;
            }

            .breadcrumb-link:hover {
                color: #0c5bcd;
            }
        </style>
    </head>
    <body class="js">
        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


        <%@ include file="../../header.jsp" %>
        <header class="header shop">

            <!-- Laptop product-->
            <div class="product-area section">
                <div class="container">
                    <div class="row" >
                        <%@include file="menuSale.jsp" %>
                        <div class="col-9 blog-container" style="margin-top: 250px">
                            <div class="product-info" style="padding: 0">
                                <div class="tab-content" id="myTabContent">
                                    <!-- Start Single Tab -->
                                    <div class="tab-pane fade show active" id="apple" role="tabpanel">
                                        <div class="tab-single">
                                            <div class="row container mx-auto px-4 py-8">
                                                <c:if test="${not empty blogId}">
                                                    <nav class="breadcrumb">
                                                        <a href="news" class="breadcrumb-link">News</a>
                                                        <span class="mx-2">></span>
                                                        <a href="${pageContext.request.contextPath}/homenews?categoryId=${category.id}" class="breadcrumb-link">${category.type}</a>
                                                        <span class="mx-2">></span>
                                                        <a href="#" class="breadcrumb-link">${blogId.title}</a>

                                                    </nav>

                                                    <h1 class="blog-title">${blogId.title}</h1>
                                                    <p class="blog-date">Cập Nhật ${blogId.createdDate} in <a href="${pageContext.request.contextPath}/homenews?categoryId=${category.id}" class="breadcrumb-link">${category.type}</a></p>

                                                    <img src="./images/${blogId.image}" alt="${blogId.title}" class="blog-image">

                                                    <div class="blog-content-container">
                                                        <div class="blog-content-text">${blogId.content}</div>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <!--/ End Single Tab -->
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </header>


        <%@ include file="../../footer.jsp" %>


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