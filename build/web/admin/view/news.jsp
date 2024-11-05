<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home News</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <!-- Bootstrap -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
        <!-- Eshop StyleSheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
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
            /* Existing styles */
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
            .container {
                margin: 0 auto;
                padding: 20px;
            }
            .category-section {
                margin-bottom: 40px;
            }
            .category-section h2 {
                margin-bottom: 20px;
                font-size: 1.5rem;
                color: #333;
            }
            .news-grid {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                gap: 20px;
            }
            .news-item {
                transition: none;
                background: unset;
                box-shadow: unset;
                border-radius: unset;
                padding-bottom: 20px;
                display: flex;
            }
            .news-img {
                flex: 1;
            }
            .news-img img {
                width: 302px;
                height: 170px;
                max-height: 100%;
                object-fit: cover;
                border-radius: 8px;
            }
            .news-content {
                flex: 1;
                padding: 10px;
                margin-left: 10px;
            }
            .news-content p {
                font-size: 1.2rem;
                margin: 0 0 10px 0;
                color: #333;
                transition: color 0.3s;
            }
            .news-content p:hover {
                color: black;
                ;
            }
            .news-date {
                color: #888;
                font-size: 0.9rem;
            }
            .view-all-link {
                display: inline-block;
                margin-top: 10px;
                color: #007bff;
                text-decoration: none;
                font-weight: bold;
            }
            .view-all-link:hover {
                text-decoration: underline;
            }
            .container {
                width: 90%;
                margin: 0 auto;
                padding: 20px 0;
            }
            .header {
                text-align: center;
                font-size: 24px;
                margin-bottom: 20px;
            }
            .main-content {
                display: flex;
                gap: 20px;
            }
            .main-content .left {
                flex: 2;
            }
            .main-content .right {
                flex: 1;
            }
            .main-content .left img, .main-content .right img {
                width: 100%;
                border-radius: 10px;
            }
            .main-content .left {
                position: relative;
            }
            .main-content .left .overlay {
                position: absolute;
                bottom: 0;
                left: 0;
                right: 0;
                background: linear-gradient(180deg, rgba(0, 0, 0, 0) 2.68%, rgba(0, 0, 0, .72) 53.2%, rgba(0, 0, 0, .86) 69.35%, #000 86.01%);
                color: #fff;
                padding: 10px;
                border-radius: 0 0 10px 10px;
                font-size: 18px;
                line-height: 23px;
                font-weight: 700;
                color: #fbfbfb;
                position: absolute;
                bottom: 0;
                padding: 25px;
                width: 100%;
                border-radius: 0 0 8px 8px;
            }
            .main-content .right {
                display: flex;
                flex-direction: column;
                gap: 20px;
            }
            .main-content .right .item {
                position: relative;
            }
            .main-content .right .item .overlay {
                position: absolute;
                bottom: 0;
                left: 0;
                right: 0;
                background: linear-gradient(180deg, rgba(0, 0, 0, 0) 2.68%, rgba(0, 0, 0, .72) 53.2%, rgba(0, 0, 0, .86) 69.35%, #000 86.01%);
                color: #fff;
                padding: 10px;
                border-radius: 0 0 10px 10px;
                font-size: 18px;
                line-height: 23px;
                font-weight: 700;
                color: #fbfbfb;
                position: absolute;
                bottom: 0;
                padding: 25px;
                width: 100%;
                border-radius: 0 0 8px 8px;
            }
            .footer {
                display: flex;
                justify-content: center;
                gap: 10px;
                margin-top: 20px;
            }
            .footer .button {
                background: #fff;
                border: 1px solid #ddd;
                border-radius: 10px;
                padding: 10px 20px;
                display: flex;
                align-items: center;
                gap: 10px;
                cursor: pointer;
                transition: background 0.3s;
            }
            .footer .button:hover {
                background: #f0f0f0;
            }
        </style>

    </head>
    <body>
        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


        <%@ include file="../../header.jsp" %>
        <div class="container" style="margin-top: 215px">
            <h2 style="text-align: center; font-weight: normal">NEWS</h2>
            <div class="tab-content" id="myTabContent" style="margin-top: 30px">
                <div class="container-fluid">
                    <div class="main-content">
                        <!-- Left Section - Top 1 Blog -->
                        <div class="left">
                            <c:if test="${not empty top3Blogs and top3Blogs.size() > 0}">
                                <a href="${pageContext.request.contextPath}/homenews?blogId=${top3Blogs[0].id}">
                                    <img alt="${top3Blogs[0].title}" height="400" src="${pageContext.request.contextPath}/images/${top3Blogs[0].image}" width="600" />
                                    <div class="overlay">
                                        ${top3Blogs[0].title}
                                    </div>
                                </a>
                            </c:if>
                        </div>

                        <!-- Right Section - Next 2 Blogs -->
                        <div class="right">
                            <c:if test="${not empty top3Blogs and top3Blogs.size() > 1}">
                                <div class="item">
                                    <a href="${pageContext.request.contextPath}/homenews?blogId=${top3Blogs[1].id}">
                                        <img alt="${top3Blogs[1].title}" height="200" src="${pageContext.request.contextPath}/images/${top3Blogs[1].image}" width="300" />
                                        <div class="overlay">
                                            ${top3Blogs[1].title}
                                        </div>
                                    </a>

                                </div>
                            </c:if>
                            <c:if test="${not empty top3Blogs and top3Blogs.size() > 2}">
                                <div class="item">
                                    <a href="${pageContext.request.contextPath}/homenews?blogId=${top3Blogs[2].id}">
                                        <img alt="${top3Blogs[2].title}" height="200" src="${pageContext.request.contextPath}/images/${top3Blogs[2].image}" width="300" />
                                        <div class="overlay">
                                            ${top3Blogs[2].title}
                                        </div>
                                    </a>

                                </div>
                            </c:if>
                        </div>
                    </div>

                    <div class="footer">
                        <div class="button">
                            <a href="${pageContext.request.contextPath}/homenews?categoryId=1" style="color: #747d88">
                                <i class="fas fa-apple-alt">
                                </i>
                                Tin tức Apple
                            </a>
                        </div>
                        <div class="button">
                            <a href="${pageContext.request.contextPath}/homenews?categoryId=2" style="color: #747d88">
                                <i class="fas fa-file-alt">
                                </i>
                                Bài viết review
                            </a>
                        </div>
                        <div class="button">
                            <a href="${pageContext.request.contextPath}/homenews?categoryId=3" style="color: #747d88">
                                <i class="fas fa-compass">
                                </i>
                                Khám phá
                            </a>
                        </div>
                        <div class="button">
                            <a href="${pageContext.request.contextPath}/homenews?categoryId=4" style="color: #747d88">
                                <i class="fas fa-lightbulb">
                                </i>
                                Thủ thuật
                            </a>
                        </div>
                        <div class="button">
                            <a href="${pageContext.request.contextPath}/homenews?categoryId=5" style="color: #747d88">
                                <i class="fas fa-tags">
                                </i>
                                Khuyến mại
                            </a>
                        </div>
                        <div class="button">
                            <a href="${pageContext.request.contextPath}/homenews?categoryId=6" style="color: #747d88">
                                <i class="fas fa-ellipsis-h">
                                </i>
                                Tin khác
                            </a>
                        </div>
                    </div>
                </div>
                <!-- Start Single Tab -->
                <div class="tab-pane fade show active" id="apple" role="tabpanel">
                    <div class="tab-single">
                        <c:forEach var="category" items="${requestScope.type}">
                            <div class="category-section">
                                <h2 style="padding: 40px 0px 20px;
                                    font-size: 32px;
                                    line-height: 36px;
                                    text-align: left;
                                    color: #1D1D1F;">${category.type}</h2>
                                <div class="news-grid">
                                    <c:forEach var="blog" items="${category.news}" varStatus="status">
                                        <c:if test="${status.index < 4}">
                                            <div class="news-item">
                                                <div class="news-img">
                                                    <a href="${pageContext.request.contextPath}/homenews?blogId=${blog.id}">
                                                        <img class="default-img" src="./images/${blog.image}" alt="${blog.image}">
                                                    </a>
                                                </div>
                                                <div class="news-content">
                                                    <a href="${pageContext.request.contextPath}/homenews?blogId=${blog.id}">
                                                        <p>${blog.title}</p>
                                                    </a>
                                                    <div class="news-date">
                                                        <span style="margin: 0">
                                                            <i class="fas fa-calendar-alt" style="margin-right: 8px;"></i> 
                                                            ${blog.createdDate}
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <div style="color: blue; text-align: center">
                                    <a href="${pageContext.request.contextPath}/homenews?categoryId=${category.id}" class="view-all-link">
                                        <span style="font-weight: normal">Xem tất cả ${category.type} <i class="fas fa-angle-right"></i></span>
                                    </a>
                                </div>

                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!--/ End Single Tab -->
            </div>
        </div>
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
