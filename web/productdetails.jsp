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
        </style>
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
                                <div class="rating">
                                    <div class="rating-detail">
                                        <a href="#"> đánh giá</a>
                                    </div>
                                </div>
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


                        <div class="col-lg-12">
                            <nav>
                                <div class="nav nav-tabs mb-3">
                                    <button class="nav-link active border-white border-bottom-0" type="button" role="tab"
                                            id="nav-about-tab" data-bs-toggle="tab" data-bs-target="#nav-about"
                                            aria-controls="nav-about" aria-selected="true">Description</button>
                                    <button class="nav-link border-white border-bottom-0" type="button" role="tab"
                                            id="nav-mission-tab" data-bs-toggle="tab" data-bs-target="#nav-mission"
                                            aria-controls="nav-mission" aria-selected="false">Reviews</button>
                                </div>
                            </nav>
                            <div class="tab-content mb-5">
                                <div class="tab-pane active" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                                    <p>The generated Lorem Ipsum is therefore always free from repetition injected humour, or non-characteristic words etc. 
                                        Susp endisse ultricies nisi vel quam suscipit </p>
                                    <p>Sabertooth peacock flounder; chain pickerel hatchetfish, pencilfish snailfish filefish Antarctic 
                                        icefish goldeye aholehole trumpetfish pilot fish airbreathing catfish, electric ray sweeper.</p>
                                    <div class="px-2">
                                        <div class="row g-4">
                                            <div class="col-6">
                                                <div class="row bg-light align-items-center text-center justify-content-center py-2">
                                                    <div class="col-6">
                                                        <p class="mb-0">Weight</p>
                                                    </div>
                                                    <div class="col-6">
                                                        <p class="mb-0">1 kg</p>
                                                    </div>
                                                </div>
                                                <div class="row text-center align-items-center justify-content-center py-2">
                                                    <div class="col-6">
                                                        <p class="mb-0">Country of Origin</p>
                                                    </div>
                                                    <div class="col-6">
                                                        <p class="mb-0">Agro Farm</p>
                                                    </div>
                                                </div>
                                                <div class="row bg-light text-center align-items-center justify-content-center py-2">
                                                    <div class="col-6">
                                                        <p class="mb-0">Quality</p>
                                                    </div>
                                                    <div class="col-6">
                                                        <p class="mb-0">Organic</p>
                                                    </div>
                                                </div>
                                                <div class="row text-center align-items-center justify-content-center py-2">
                                                    <div class="col-6">
                                                        <p class="mb-0">Сheck</p>
                                                    </div>
                                                    <div class="col-6">
                                                        <p class="mb-0">Healthy</p>
                                                    </div>
                                                </div>
                                                <div class="row bg-light text-center align-items-center justify-content-center py-2">
                                                    <div class="col-6">
                                                        <p class="mb-0">Min Weight</p>
                                                    </div>
                                                    <div class="col-6">
                                                        <p class="mb-0">250 Kg</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="nav-vision" role="tabpanel">
                                    <p class="text-dark">Tempor erat elitr rebum at clita. Diam dolor diam ipsum et tempor sit. Aliqu diam
                                        amet diam et eos labore. 3</p>
                                    <p class="mb-0">Diam dolor diam ipsum et tempor sit. Aliqu diam amet diam et eos labore.
                                        Clita erat ipsum et lorem et sit</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-xl-3">
                    <div class="row g-4 fruite">
                        <div class="col-lg-12">
                            <div class="input-group w-100 mx-auto d-flex mb-4">
                                <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                                <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                            </div>
                            <div class="mb-4">
                                <h4>Categories</h4>
                                <ul class="list-unstyled fruite-categorie">
                                    <li>
                                        <div class="d-flex justify-content-between fruite-name">
                                            <a href="#"><i class="fas fa-apple-alt me-2"></i>Apples</a>
                                            <span>(3)</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="d-flex justify-content-between fruite-name">
                                            <a href="#"><i class="fas fa-apple-alt me-2"></i>Oranges</a>
                                            <span>(5)</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="d-flex justify-content-between fruite-name">
                                            <a href="#"><i class="fas fa-apple-alt me-2"></i>Strawbery</a>
                                            <span>(2)</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="d-flex justify-content-between fruite-name">
                                            <a href="#"><i class="fas fa-apple-alt me-2"></i>Banana</a>
                                            <span>(8)</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="d-flex justify-content-between fruite-name">
                                            <a href="#"><i class="fas fa-apple-alt me-2"></i>Pumpkin</a>
                                            <span>(5)</span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <h4 class="mb-4">Featured products</h4>
                            <div class="d-flex align-items-center justify-content-start">
                                <div class="rounded" style="width: 100px; height: 100px;">
                                    <img src="img/featur-1.jpg" class="img-fluid rounded" alt="Image">
                                </div>
                                <div>
                                    <h6 class="mb-2">Big Banana</h6>
                                    <div class="d-flex mb-2">
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="d-flex mb-2">
                                        <h5 class="fw-bold me-2">2.99 $</h5>
                                        <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center justify-content-start">
                                <div class="rounded" style="width: 100px; height: 100px;">
                                    <img src="img/featur-2.jpg" class="img-fluid rounded" alt="">
                                </div>
                                <div>
                                    <h6 class="mb-2">Big Banana</h6>
                                    <div class="d-flex mb-2">
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="d-flex mb-2">
                                        <h5 class="fw-bold me-2">2.99 $</h5>
                                        <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center justify-content-start">
                                <div class="rounded" style="width: 100px; height: 100px;">
                                    <img src="img/featur-3.jpg" class="img-fluid rounded" alt="">
                                </div>
                                <div>
                                    <h6 class="mb-2">Big Banana</h6>
                                    <div class="d-flex mb-2">
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="d-flex mb-2">
                                        <h5 class="fw-bold me-2">2.99 $</h5>
                                        <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center justify-content-start">
                                <div class="rounded me-4" style="width: 100px; height: 100px;">
                                    <img src="img/vegetable-item-4.jpg" class="img-fluid rounded" alt="">
                                </div>
                                <div>
                                    <h6 class="mb-2">Big Banana</h6>
                                    <div class="d-flex mb-2">
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="d-flex mb-2">
                                        <h5 class="fw-bold me-2">2.99 $</h5>
                                        <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center justify-content-start">
                                <div class="rounded me-4" style="width: 100px; height: 100px;">
                                    <img src="img/vegetable-item-5.jpg" class="img-fluid rounded" alt="">
                                </div>
                                <div>
                                    <h6 class="mb-2">Big Banana</h6>
                                    <div class="d-flex mb-2">
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="d-flex mb-2">
                                        <h5 class="fw-bold me-2">2.99 $</h5>
                                        <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center justify-content-start">
                                <div class="rounded me-4" style="width: 100px; height: 100px;">
                                    <img src="img/vegetable-item-6.jpg" class="img-fluid rounded" alt="">
                                </div>
                                <div>
                                    <h6 class="mb-2">Big Banana</h6>
                                    <div class="d-flex mb-2">
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="d-flex mb-2">
                                        <h5 class="fw-bold me-2">2.99 $</h5>
                                        <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-center my-4">
                                <a href="#" class="btn border border-secondary px-4 py-3 rounded-pill text-primary w-100">Vew More</a>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="position-relative">
                                <img src="img/banner-fruits.jpg" class="img-fluid w-100 rounded" alt="">
                                <div class="position-absolute" style="top: 50%; right: 10px; transform: translateY(-50%);">
                                    <h3 class="text-secondary fw-bold">Fresh <br> Fruits <br> Banner</h3>
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