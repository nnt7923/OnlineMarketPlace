
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
            .span{
                color: black;
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
                <div class="container" >
                    <div class="row"">
                        <%@include file="menuSale.jsp" %>
                        <div class="col-9" style="margin-top: 250px" >
                            <div>
                                <c:if test="${not empty types}">
                                    <h3>${requestScope.types}</h3>
                                </c:if>
                            </div>

                            <div class="product-info" style="padding: 0">
                                <div class="tab-content" id="myTabContent">
                                    <!-- Start Single Tab -->
                                    <div class="tab-pane fade show active" id="apple" role="tabpanel">
                                        <div class="tab-single">
                                            <div class="row">
                                                <c:forEach items="${requestScope.news}" var="b">
                                                    <div class="col-xl-4 col-lg-4 col-md-4 col-12" style="margin-bottom: 20px">
                                                        <div class="single-product">
                                                            <div class="product-img">
                                                                <a href="${pageContext.request.contextPath}/homenews?blogId=${b.id}">
                                                                    <img class="default-img" src="./images/${b.image}" alt="${b.image}" style="width: 100%; height: 150px; border-radius: 9px 9px 0 0 ">
                                                                </a>
                                                            </div>
                                                            <div class="product-content mt-3" style="padding: 0 5px 0 5px">
                                                                <div style="font-size: 17px">
                                                                    <a href="${pageContext.request.contextPath}/homenews?blogId=${b.id}">
                                                                        <span  class="blog-title" data-title="${b.title}" style="color: black"></span>
                                                                    </a>
                                                                </div>
                                                                <div class="product-price" style="display: inline-block;">
                                                                    <p style="margin: 0">
                                                                        <i class="fas fa-calendar-alt" style="margin-right: 8px;"></i> 
                                                                        ${b.createdDate}
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
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



        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Truy xuất lấy toàn bộ nội dung
                var contentElements = document.querySelectorAll(".blog-title");
                contentElements.forEach(function (el) {
                    var fullContent = el.getAttribute("data-title");

                    // Kiểm tra xem thuộc tính data-title có giá trị hay không
                    if (!fullContent) {
                        return;
                    }

                    // Tạo thẻ div .innerHTML loại bỏ các thẻ html 
                    var tempDiv = document.createElement("div");
                    tempDiv.innerHTML = fullContent;

                    // Trích xuất nội dung bằng tempDiv or innerText
                    var textContent = tempDiv.textContent || tempDiv.innerText || "";

                    // Chia nội dung bằng các ký tự dòng mới và lấy dòng đầu tiên của nội dung 
                    var firstLine = textContent.split('\n')[0];

                    // Giới hạn hiển thị chỉ 50 ký tự
                    if (firstLine.length > 50) {
                        firstLine = firstLine.substring(0, 50) + '...';
                    }

                    el.textContent = firstLine;
                });
            });

        </script>
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