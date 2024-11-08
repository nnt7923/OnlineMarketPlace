<%-- 
    Document   : index
    Created on : Sep 20, 2024, 11:34:06 PM
    Author     : Admin
--%>
<%@ taglib prefix="currency" uri="/WEB-INF/currency.tld" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    
    <head>
        <meta charset="utf-8">
        <title>Little UK - Shop Online</title>
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">


        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <style>
            .py-5{
                margin-top: 20px;
            }
            .product-price-show{
                color: #d70018;
                display: inline-block;
                font-size: 18px;
                font-weight: 700;
                line-height: 1.1;
            }
            .product-price-through{
                color: #707070;
                display: inline-block;
                font-size: 14px;
                font-weight: 600;
                position: relative;
                -webkit-text-decoration: line-through;
                text-decoration: line-through;
                top: 2px;
            }
            .product-images {
                margin-bottom: 20px;
            }

            .product-images main {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
            }

            .product-images.main-img {
                width: 100%;
                height: 400px;
                margin-bottom: 20px;
                border: 1px solid #ddd;
            }

            .product-images.main-img img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .product-images.images {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
            }

            .product-images.images img {
                width: 20%;
                height: 100px;
                margin: 10px;
                border: 1px solid #ddd;
                cursor: pointer;
            }

            .product-images.images img:hover {
                border-color: #aaa;
            }
            .item-details .product-images img {
                max-width: 100%;
                align-items: center;
                background: #fff;
                display: flex;
                justify-content: center;
                overflow: hidden;
                text-align: center;
                width: 360px;
            }
            .align-items-center {
                align-items: center !important;
            }
            .item-details .product-images .images {
                display: -ms-grid;
                display: grid;
                Grid-template-columns: repeat(5, 1fr);
                Grid-gap: 1em 1em;
                Margin-top: 1em;
            }
            .item-details .product-info .title {
                font-size: 22px;
                font-weight: 600;
                margin-bottom: 10px;
            }
            .product-options {
                padding: 16px;
            }
            .product-options {
                margin-bottom: 20px;
            }
            .storage-options {
                display: flex;
                flex-wrap: wrap;
                width: 100%;
            }
            .storage-option.selected {
                border: 2px solid #81c408;
            }

            .storage-option {
                padding: 10px 20px;
                margin: 5px;
                border: 2px solid transparent;
                border-radius: 5px;
                cursor: pointer;
                transition: border-color 0.3s;
                align-items: center;
                background: #fff;
                border: 1px solid #d1d5db;
                border-radius: 8px;
                color: #444;
                cursor: pointer;
                display: flex;
                flex-direction: column;
                font-size: 12px;
                gap: 3px;
                justify-content: center;
                margin: 0 10px 10px 0;
                overflow: hidden;
                padding: 5px 4px;
                position: relative;
                text-decoration: none;
                width: calc(33.33333% - 6.66667px);
            }
            .selected {
                border-color: #333;
            }
            .storage-option.selected {
                border: 2px solid #81c408;
            }
            .product-storage-options h3 {
                color: #444;
                font-size: 14px;
                font-weight: 700;
                margin-bottom: 10px;
            }
            .product-color-options h3 {
                color: #444;
                font-size: 14px;
                font-weight: 700;
                margin-bottom: 10px;
            }
            .color-option-content {
                display: flex;
                align-items: center;
                padding: 8px;
            }
            .color-options {
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                gap: 8px;
            }
            .color-option {
                height: 70px;
                border: 1px solid #ddd;
                border-radius: 8px;
                cursor: pointer;
                position: relative;
                transition: box-shadow 0.2s ease-in-out;
            }
            .color-option.selected {
                border: 2px solid #81c408;
            }
            .color-option:hover {
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .color-option-content {
                display: flex;
                align-items: center;
                padding: 8px;
            }
            .color-option-content.selected {
                border: 2px solid #cc0c1b;
                background-color: #f8f8f8;
            }
            .color-option-content img {
                width: 40px;
                height: 40px;
                object-fit: cover;
                border-radius: 4px;
            }

            .color-option-info {
                margin-left: 8px;
            }

            .color-option-info p {
                margin-bottom: 2px;
            }
            .color-option-info .price {
                font-weight: 600;
                font-size: 12px;
            }
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0,0.4);
                padding-top: 60px;
            }

            /* Modal Content */
            .modal-content {
                background-color: #fefefe;
                margin: 5% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 60%;
            }
            .modal-login {
                background-color: #fff;
                border-radius: 15px;
                display: flex;
                flex-direction: column;
                gap: 16px;
                max-width: 450px;
                padding: 15px;
                text-align: center;
                margin: 5% auto;
                margin-top: 10%;
            }
            .modal-login .title {
                align-items: center;
                display: flex;
                flex-direction: column;
                margin: 0;
            }
            .modal-login .title img {
                margin-left: 10px;
            }
            .modal-login .text p {
                font-size: 1rem;
                margin-bottom: 20px;
            }
            .modal-login .group-login-btn {
                display: flex;
                justify-content: space-around;
            }
            .modal-login .group-login-btn .register-btn,
            .modal-login .group-login-btn .login-btn {
                width: 45%;
                padding: 10px;
                border-radius: 25px;
                text-align: center;
                cursor: pointer;
                font-size: 1rem;
                font-weight: bold;
            }
            .modal-login .group-login-btn .register-btn {
                border: 2px solid #cc0c1b;
                color: #cc0c1b;
                background-color: #fff;
            }
            .modal-login .group-login-btn .login-btn {
                background-color: #81c408;
                color: #fff;
            }
            .modal-close {
                position: absolute;
                top: 10px;
                right: 10px;
                background: none;
                border: none;
                font-size: 1.5rem;
                cursor: pointer;
            }

            .rating {
                direction: rtl; /* Đảo ngược thứ tự ngôi sao */
                position: absolute;
                bottom:  2px; /* Điều chỉnh vị trí theo ý muốn */
                right: 10px; /* Điều chỉnh vị trí theo ý muốn */
            }

            .rating input {
                display: none; /* Ẩn các input radio */
            }

            .rating label {
                font-size: 1.5rem; /* Kích thước của ngôi sao */
                color: gray; /* Màu sắc của ngôi sao chưa được chọn */
                cursor: pointer;
            }

            .rating input:checked ~ label {
                color: gold; /* Màu sắc của ngôi sao khi được chọn */
            }

            .rating label:hover,
            .rating label:hover ~ label {
                color: gold; /* Màu sắc của ngôi sao khi di chuột qua */
            }
            #feedback_content {
                padding-bottom:  40px; /* Thay đổi giá trị này để điều chỉnh khoảng cách giữa ngôi sao và nội dung */
            }
            .vote-text {
                font-size: 1rem; /* Kích thước chữ */
                color: gray; /* Màu sắc chữ */
                margin-right: 5px; /* Khoảng cách giữa chữ và các ngôi sao */
            }

            .product-images .main-img {
                max-width: 360px; /* Kích thước tối đa cho chiều rộng */
                max-height: 360px; /* Kích thước tối đa cho chiều cao */
                width: 100%; /* Cho phép tự động điều chỉnh theo chiều rộng của khung chứa */
                height: auto; /* Chiều cao tự động để giữ tỷ lệ */
            }

            .product-images .images img {
                max-width: 126.39px; /* Kích thước tối đa cho chiều rộng */
                max-height: 126.39px !important; /* Kích thước tối đa cho chiều cao */
                width: 100%; /* Tự điều chỉnh theo tỷ lệ của khung chứa nhưng không vượt quá kích thước tối đa */
                height: auto; /* Giữ tỷ lệ */
            }
            .blog-container {
                font-family: 'Roboto', sans-serif;
                color: #333;
                line-height: 1.6;
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

        <!-- Single Product Start -->
        <div class="container-fluid item-details py-5 mt-5">
            <div class="container py-5">
                <div class="row g-4 mb-5">
                    <div class="col-lg-8 col-xl-9">
                        <div class="row align-items-center">
                            <div class="col-lg-6 col-md-12 col-12">
                                <div class="product-images">
                                    <main id="gallery">
                                        <div class="main-img">
                                            <img id="current" src="${pageContext.request.contextPath}/images/${productDetail.image[0]}" class="img-fluid" alt="${productDetail.product.name}">                                    
                                        </div>
                                        <div class="images">
                                            <c:forEach items="${productDetail.image}" var="image">
                                                <img src="${pageContext.request.contextPath}/images/${image}" class="img" alt="" 
                                                     onclick="changeMainImage('${pageContext.request.contextPath}/images/${image}')">
                                            </c:forEach>
                                        </div>
                                    </main>

                                </div>
                            </div>

                            <div class="col-lg-6 col-md-12 col-12">
                                <div class="product-info">
                                    <h2 class="title" id="product-name">${productDetail.name}</h2>
                                    <br/>
                                    <div class="product-price" id="product-price">
                                        <p class="product-price-show" id="product-price-show">
                                            <currency:formatCurrency value="${productDetail.priceDiscount}" />
                                        </p>
                                        <p class="product-price-through" id="product-price-through">
                                            <currency:formatCurrency value="${productDetail.product.price}" />
                                        </p>
                                    </div>
                                    <div class="product-options">
                                        <div class="product-storage-options">
                                            <h3>Capacity</h3>
                                            <div class="storage-options">
                                                <c:forEach items="${allCriteria}" var="criteria">
                                                    <button class="storage-option" data-criteria="${criteria}" onclick="selectCriteria('${criteria}', '${productDetail.product.productId}')">
                                                        ${criteria}
                                                    </button>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="product-color-options">
                                            <h3>Color</h3>
                                            <div class="color-options">
                                                <c:forEach items="${productDetails}" var="detail">
                                                    <div class="color-option" data-color="${detail.color}" data-pdid="${detail.id}" data-criteria="${detail.criteria}" 
                                                         onclick="selectColor('${detail.color}', '${detail.product.productId}', '${detail.id}', '${detail.criteria}')">
                                                        <div class="color-option-content">
                                                            <img src="${pageContext.request.contextPath}/images/${detail.image[0]}" alt="${detail.color}" />
                                                            <div class="color-option-info">
                                                                <p>${detail.color}</p>
                                                                <p class="price">
                                                                    <currency:formatCurrency value="${detail.priceDiscount}" />
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="product-actions">
                                        <div class="button cart-button">
                                            <c:choose>
                                                <c:when test="${param.isUpdate == 'true'}">
                                                    <input type="hidden" id="newProductDetailId" value="${productDetail.id}" />
                                                    <input type="hidden" id="newColor" value="${productDetail.color}" />
                                                    <input type="hidden" id="newCriteria" value="${productDetail.criteria}" />
                                                    <input type="hidden" id="oldProductDetailId" value="${param.oldProductDetailId}" />
                                                    <input type="hidden" id="oldProductCriteria" value="${param.pdcriteria}" />
                                                    <input type="hidden" id="isUpdate" value="${param.isUpdate}" />

                                                    <!-- Debugging output for JSP -->
                                                    <script>
                                                        console.log("newProductDetailId: ${productDetail.id}");
                                                        console.log("newColor: ${productDetail.color}");
                                                        console.log("newCriteria: ${productDetail.criteria}");
                                                        console.log("oldProductDetailId: ${param.oldProductDetailId}");
                                                    </script>

                                                    <button class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary" 
                                                            style="width: 100%;" 
                                                            onclick="updateCart(${productDetail.product.productId}, ${param.updatecartitemid})">
                                                        <i class="fa fa-shopping-bag me-2 text-primary"></i>Update
                                                    </button>
                                                </c:when>

                                                <c:otherwise>
                                                    <c:if test="${account eq null}">
                                                        <a style="width: 100%;">
                                                            <button class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary" id="loginModalbutton">
                                                                <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</button>
                                                        </a>
                                                    </c:if>
                                                    <c:if test="${account ne null}">
                                                        <button id="add-to-cart-button" type="button" class="add-to-cart btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary" style="width: 100%;"
                                                                onclick="addToCart(${productDetail.product.productId}, ${productDetail.id}, 1)">
                                                            <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
                                                        </button>
                                                    </c:if>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div id="loginModall" class="modal" style="display: none;">
                                <div class="modal-login">
                                    <div class="title is-flex is-justify-content-center is-align-items-center">
                                        <H4>Tech Store</H4>
                                        <img src="${pageContext.request.contextPath}/images/chibi.png" height="80" alt="cps-smember-icon">
                                    </div>
                                    <div class="text">
                                        <p>Please login to your Tech Store account to view the shopping cart.</p>
                                    </div>
                                    <div class="group-login-btn">
                                        <a href="${pageContext.request.contextPath}/login" class="login-btn">Login</a>
                                    </div>
                                </div>
                            </div>
                            <div id="tailwind-container"></div>

                            <div class="col-lg-12">
                                <nav>
                                    <div class="nav nav-tabs mb-3">
                                        <button class="nav-link active border-white border-bottom-0" type="button" role="tab"
                                                id="nav-about-tab" data-bs-toggle="tab" data-bs-target="#nav-about"
                                                aria-controls="nav-about" aria-selected="true">Description</button>
                                        <button class="nav-link border-white border-bottom-0" type="button" role="tab"
                                                id="nav-reviews-tab" data-bs-toggle="tab" data-bs-target="#nav-reviews"
                                                aria-controls="nav-reviews" aria-selected="false">Feedbacks</button>
                                    </div>
                                </nav>
                                <div class="tab-content mb-5">
                                    <div class="tab-pane active" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                                        <p class="blog-container">${productDetail.describe}</p>
                                    </div>
                                    <div class="tab-pane" id="nav-reviews" role="tabpanel" aria-labelledby="nav-reviews-tab">
                                        <h5 class="mb-3">Add a Review</h5>
                                        <c:choose>

                                            <c:when test="${account eq null}">
                                                <p>Please <a href="${pageContext.request.contextPath}/login" class="text-primary">login</a> to add a review.</p>
                                            </c:when>

                                            <c:otherwise>
                                                <form action="feedback" method="post">
                                                    <div class="mb-3 position-relative">
                                                        <label for="feedback_content" class="form-label">Your Review</label>
                                                        <textarea class="form-control" id="feedback_content" name="feedback_content" rows="3" placeholder="Write your review here..." required></textarea>
                                                        <div class="rating position-absolute">  
                                                            <span class="vote-text">Vote Here:</span>
                                                            <input type="radio" name="rating" id="star5" value="5"><label for="star5" class="star">★</label>
                                                            <input type="radio" name="rating" id="star4" value="4"><label for="star4" class="star">★</label>
                                                            <input type="radio" name="rating" id="star3" value="3"><label for="star3" class="star">★</label>
                                                            <input type="radio" name="rating" id="star2" value="2"><label for="star2" class="star">★</label>
                                                            <input type="radio" name="rating" id="star1" value="1"><label for="star1" class="star">★</label>
                                                        </div>
                                                    </div>
                                                    <% String pid = (String) request.getAttribute("pid");%>
                                                    <input type="hidden" name="product_id"  value="${productDetail.getProduct().getProductId()}">
                                                    <button type="submit" class="btn btn-primary">Submit</button>
                                                </form>
                                            </c:otherwise>
                                        </c:choose>

                                        <!-- Phần hiển thị phản hồi -->
                                        <h5 class="mt-5">All Reviews</h5>
                                        <div id="feedback-list">

                                            <c:forEach var="feedback" items="${feedbacks}">
                                                <div class="feedback-item mb-4 border p-3">
                                                    <p>
                                                        <span>Đánh giá: 
                                                            <c:forEach var="i" begin="1" end="${feedback.rating}">★</c:forEach>
                                                            <c:forEach var="i" begin="${feedback.rating + 1}" end="5">☆</c:forEach>
                                                            </span>
                                                        </p>
                                                        <p>Nội dung: ${feedback.feedback_content}</p>
                                                </div>
                                            </c:forEach>
                                        </div>                  
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Single Product End -->

        <%@ include file="footer.jsp" %>
        <script>
            // Load Tailwind CSS within Shadow DOM
            document.addEventListener("DOMContentLoaded", function () {
                const container = document.querySelector("#tailwind-container");

                // Create shadow root for isolation
                const shadow = container.attachShadow({mode: "open"});

                // Add style and HTML content within shadow DOM
                shadow.innerHTML = `
                    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
                    <div class="flex items-center p-4 bg-white border border-gray-200 rounded-lg">
                        <div class="flex items-center">
                            <img alt="Store logo" class="w-20 h-20 rounded-full" height="80" src="./images/${seller.image}" width="80"/>
                            <div class="ml-4">
                                <div class="text-lg font-semibold">${seller.storeName}</div>
                            </div>
                        </div>
                        <div class="ml-4">
                            <div class="flex items-center">
                                <button class="flex items-center px-4 py-2 text-red-600 border border-red-600 rounded-md">
                                    <i class="fas fa-comments mr-2"></i>Chat Ngay
                                </button>
                                <button class="flex items-center px-4 py-2 ml-2 text-gray-600 border border-gray-600 rounded-md">
                                    <i class="fas fa-store mr-2"></i>Xem Shop
                                </button>
                            </div>
                        </div>
                        <div class="ml-8">
                            <div class="flex space-x-8">
                                <div class="text-center">
                                    <div class="text-gray-500">Đánh Giá</div>
                                    <div class="text-red-600">${seller.rating}</div>
                                </div>
                                <div class="text-center">
                                    <div class="text-gray-500">Tỉ Lệ Phản Hồi</div>
                                    <div class="text-red-600">100%</div>
                                </div>
                                <div class="text-center">
                                    <div class="text-gray-500">Tham Gia</div>
                                    <div class="text-red-600">${seller.joinDate}</div>
                                </div>
                            </div>
                            <div class="flex space-x-8 mt-2">
                                <div class="text-center">
                                    <div class="text-gray-500">Sản Phẩm</div>
                                    <div class="text-red-600">${totalProducts}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                `;
            });
        </script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var loginModal = document.getElementById('loginModal');
                var loginModall = document.getElementById('loginModall');
                var reviewModalElement = document.getElementById("reviewModal");
                var reviewBtn = document.getElementById("reviewBtn");
                var loginModalBtn = document.getElementById("loginModalBtn");
                var loginModalbutton = document.getElementById("loginModalbutton");
                var loginModalCart = document.getElementById('loginModal-cart');
                var loginModalbuttoncart = document.getElementById('loginModalbuttoncart');
                var closeButtons = document.getElementsByClassName("close");

                if (loginModalbuttoncart) {
                    loginModalbuttoncart.onclick = function () {
                        loginModalCart.style.display = "block";
                    };
                }

                if (loginModalbutton) {
                    loginModalbutton.onclick = function () {
                        loginModall.style.display = "block";
                    };
                }

                if (loginModalBtn) {
                    loginModalBtn.onclick = function () {
                        loginModal.style.display = "block";
                    };
                }

                if (reviewBtn) {
                    reviewBtn.onclick = function () {
                        reviewModalElement.style.display = "block";
                    };
                }

                for (var i = 0; i < closeButtons.length; i++) {
                    closeButtons[i].onclick = function () {
                        this.closest('.modal').style.display = 'none';
                    };
                }

                window.onclick = function (event) {
                    if (event.target == reviewModalElement) {
                        reviewModalElement.style.display = "none";
                    } else if (event.target == loginModal) {
                        loginModal.style.display = "none";
                    } else if (event.target == loginModall) {
                        loginModall.style.display = "none";
                    } else if (event.target == loginModalCart) {
                        loginModalCart.style.display = "none";
                    }
                };
            });
            document.addEventListener("DOMContentLoaded", function () {
                var progressBars = document.querySelectorAll('.progress div');
                progressBars.forEach(function (bar) {
                    var value = bar.getAttribute('data-value');
                    bar.style.width = value + '%';
                });

                initializePage();
            });

            document.addEventListener("DOMContentLoaded", function () {
                initializePage();
            });

            function initializePage() {
                // Lựa chọn tiêu chí và màu sắc mặc định khi trang được tải
                const firstCriteria = $('.storage-option').first().data('criteria');
                const productId = '${productDetail.product.productId}';

                if (firstCriteria) {
                    selectCriteria(firstCriteria, productId);
                }
            }

            function selectCriteria(criteria, pid) {
                $.getJSON('${pageContext.request.contextPath}/productdetails', {pid: pid, criteria: criteria}, function (data) {
                    if (data && data.length > 0) {
                        var colors = new Set();
                        data.forEach(function (detail) {
                            colors.add(detail.color);
                        });
                        $('.color-options').html('');
                        colors.forEach(function (color) {
                            var detail = data.find(d => d.color === color);
                            var pdid = detail.id;
                            var price = detail.priceDiscount;
                            var image = detail.image[0];

                            // Thêm các tùy chọn màu mới vào HTML
                            $('.color-options').append(
                                    '<div class="color-option" data-color="' + color + '" data-pdid="' + pdid + '" data-criteria="' + criteria + '" ' +
                                    'onclick="selectColor(\'' + color + '\', \'' + pid + '\', \'' + pdid + '\', \'' + criteria + '\')">' +
                                    '<div class="color-option-content">' +
                                    '<img src="${pageContext.request.contextPath}/images/' + image + '" alt="' + color + '" />' +
                                    '<div class="color-option-info">' +
                                    '<p>' + color + '</p>' +
                                    '<p class="price">' + formatCurrency(price) + '</p>' +
                                    '</div>' +
                                    '</div>' +
                                    '</div>'
                                    );

                        });
                        var oldProductDetailId = $('#oldProductDetailId').val();
                        var selectedDetail = data.find(d => d.id == oldProductDetailId);  // Tìm chi tiết đã chọn
                        if (selectedDetail) {
                            selectColor(selectedDetail.color, pid, selectedDetail.id, criteria);  // Chọn màu sắc đã tồn tại
                        } else if (data[0]) {
                            selectColor(data[0].color, pid, data[0].id, criteria);  // Chọn màu sắc đầu tiên
                        }

                        // Bỏ chọn màu cũ và thêm class selected cho tiêu chí đã chọn
                        $('.storage-option').removeClass('selected');
                        $('.storage-option').filter(function () {
                            return $(this).text().trim() === criteria;
                        }).addClass('selected');
                        // Update URL
                        var isUpdate = $('#isUpdate').val();
                        var newUrl = `${pageContext.request.contextPath}/productdetails?pid=${pid}&oldProductDetailId=${oldProductDetailId}&pdcriteria=${criteria}&isUpdate=${isUpdate}`;
                                        history.replaceState({}, '', newUrl);


                                    }
                                });
                            }

                            function selectColor(color, pid, pdid, criteria) {
                                var contextPath = '<%= request.getContextPath()%>';
                                $.getJSON(contextPath + '/productdetails', {pid: pid, pdid: pdid, color: color, criteria: criteria}, function (data) {
                                    if (data) {
                                        var newProductDetailId = data.id;
                                        console.log("Product Detail ID: ", newProductDetailId);

                                        $('#product-name').text(data.name);
                                        $('#product-price-show').text(formatCurrency(data.priceDiscount));
                                        $('#product-price-through').text(formatCurrency(data.product.price));
                                        $('#current').attr('src', contextPath + '/images/' + data.image[0]);

                                        var imagesHtml = '';
                                        data.image.forEach(function (image) {
                                            imagesHtml += '<img src="' + contextPath + '/images/' + image + '" class="img" alt="#" onclick="changeMainImage(\'' + contextPath + '/images/' + image + '\')">';
                                        });
                                        $('.images').html(imagesHtml);

                                        var newUrl = contextPath + '/productdetails?pid=' + pid + '&pdid=' + newProductDetailId + '&pdcriteria=' + criteria;
                                        history.replaceState({}, '', newUrl);
                                        updateAddToCartButton(pid, newProductDetailId);
                                    }
                                });
                                $('.color-option').removeClass('selected');
                                $('.color-option[data-color="' + color + '"]').addClass('selected');
                            }

                            function updateAddToCartButton(pid, pdid) {
                                $('#add-to-cart-button').attr('onclick', 'addToCart(' + pid + ', ' + pdid + ', 1)');
                            }



                            function formatCurrency(value) {
                                return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(value);
                            }

                            function changeMainImage(imageSrc) {
                                $('#current').attr('src', imageSrc);
                            }


                            function addToCart(productID, productDetailId, quantity = 1) {
                                console.log("Product ID: ", productID);
                                console.log("Product Detail ID: ", productDetailId);
                                console.log("Quantity: ", quantity);

                                $.ajax({
                                    type: "POST",
                                    url: "${pageContext.request.contextPath}/addtocart",
                                    data: {
                                        productId: productID,
                                        productDetailId: productDetailId,
                                        quantity: quantity
                                    },
                                    success: function (response) {
                                        Swal.fire({
                                            icon: 'success',
                                            title: 'Success!',
                                            text: 'Product has been added to cart!',
                                            showConfirmButton: false,
                                            timer: 1500
                                        }).then(() => {
                                            // Update the cart size in the header
                                            if (response.cartSize !== undefined) {
                                                updateCartSize(response.cartSize);
                                            }
                                        });
                                    },
                                    error: function (xhr, status, error) {
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Error!',
                                            text: 'There was an error adding the product to the cart.',
                                            showConfirmButton: false,
                                            timer: 1500
                                        });
                                        console.error(xhr.responseText);
                                    }
                                });
                            }

                            function updateCartSize(cartSize) {
                                var cartSizeElement = document.getElementById('cart-size');  // Target the cart-size element
                                if (cartSizeElement) {
                                    cartSizeElement.textContent = cartSize;
                                }

                                // Optionally, you can add logic to show/hide the cart size based on the value
                                if (cartSize > 0) {
                                    cartSizeElement.style.display = 'block';  // Ensure it's visible
                                } else {
                                    cartSizeElement.style.display = 'none';  // Hide if no items
                                }
                            }

                            function updateCart(productId, pdid) {
                                var newProductDetailId = $('.color-option.selected').data('pdid');
                                var newColor = $('.color-option.selected').data('color');
                                var newCriteria = $('.storage-option.selected').data('criteria');
                                var oldProductDetailId = $('#oldProductDetailId').val();

                                $.ajax({
                                    type: "POST",
                                    url: "${pageContext.request.contextPath}/updatecart",
                                    data: {
                                        productId: productId,
                                        oldProductDetailId: oldProductDetailId,
                                        newProductDetailId: newProductDetailId,
                                        newColor: newColor,
                                        newCriteria: newCriteria
                                    },
                                    success: function (response) {
                                        Swal.fire({
                                            icon: 'success',
                                            title: 'Cập nhật thành công!',
                                            text: 'Sản phẩm đã được cập nhật trong giỏ hàng.',
                                            showConfirmButton: false,
                                            timer: 1500
                                        }).then(() => {
                                        });
                                    },
                                    error: function (xhr, status, error) {
                                        Swal.fire({
                                            icon: 'error',
                                            title: 'Lỗi!',
                                            text: 'Đã xảy ra lỗi khi cập nhật sản phẩm trong giỏ hàng!',
                                            showConfirmButton: false,
                                            timer: 1500
                                        });
                                        console.error("Error:", xhr.responseText);
                                    }
                                });
                            }

        </script>


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   


        <!-- JavaScript Libraries -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>
