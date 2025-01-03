<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Category" %>
<%@ page import="model.Product" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>FireFly</title>
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
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f8f8f8;
            }

            /* Container */
            .category-container {
                max-width: 1200px;
                margin: 20px auto;
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .category-container h2 {
                text-align: left;
                font-size: 20px;
                margin-bottom: 20px;
                color: #333;
            }

            /* Grid for Categories */
            .category-grid {
                display: grid;
                grid-template-columns: repeat(4, 1fr); /* 6 columns */
                gap: 20px;
            }

            .category-item {
                text-align: center;
                padding: 10px;
            }

            .category-item img {
                width: 80px;
                height: 80px;
                object-fit: contain;
                border-radius: 50%;
                margin-bottom: 10px;
                border: 1px solid #eee;
                padding: 10px;
                background-color: #fff;
            }

            .category-item p {
                margin: 0;
                font-size: 14px;
                color: #333;
            }

            /* Responsive Design */
            @media (max-width: 1024px) {
                .category-grid {
                    grid-template-columns: repeat(4, 1fr); /* 4 columns for smaller screens */
                }
            }

            @media (max-width: 768px) {
                .category-grid {
                    grid-template-columns: repeat(3, 1fr); /* 3 columns for tablet size */
                }
            }

            @media (max-width: 480px) {
                .category-grid {
                    grid-template-columns: repeat(2, 1fr); /* 2 columns for mobile size */
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
            </style>
        </head>

        <body>

            <!-- Spinner Start -->
            <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                <div class="spinner-grow text-primary" role="status"></div>
            </div>
            <!-- Spinner End -->


            <%@ include file="header.jsp" %>

            <!-- Modal Search Start -->
            <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-fullscreen">
                    <div class="modal-content rounded-0">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body d-flex align-items-center">
                            <div class="input-group w-75 mx-auto d-flex">
                                <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                                <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal Search End -->


            <!-- Hero Start -->
            <div class="container-fluid py-5 mb-5 hero-header">
                <div class="container py-5">
                    <!--                    <div class="row g-5 align-items-center">
                                            <div class="col-md-12 col-lg-7">
                                                <h4 class="mb-3 text-secondary">100% Organic Foods</h4>
                                                <h1 class="mb-5 display-3 text-primary">Organic Veggies & Fruits Foods</h1>
                                                <div class="position-relative mx-auto">
                                                    <input class="form-control border-2 border-secondary w-75 py-3 px-4 rounded-pill" type="number" placeholder="Search">
                                                    <button type="submit" class="btn btn-primary border-2 border-secondary py-3 px-4 position-absolute rounded-pill text-white h-100" style="top: 0;
                                                            right: 25%;">Submit Now</button>
                                                </div>
                                            </div>-->
                    <div class="col-md-12 col-lg-5">
                        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                                <%
                                    List<Product> products = (List<Product>) request.getAttribute("advertise");
                                    for (int i = 0; i < products.size(); i++) {
                                        // Chỉ mục đầu tiên cần có class 'active'
                                        String activeClass = (i == 0) ? "active" : "";
                                %>
                                <div class="carousel-item <%= activeClass%>">
                                    <img src="img/banner-ads/banner-ads-<%= i + 1%>.jpg" 
                                         class="d-block w-100 rounded"
                                         alt="Product slide"
                                         style="width: 600px;
                                         height: 400px;
                                         object-fit: cover;">
                                </div>
                                <% } %>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- Hero End -->

        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <div class="tab-class text-center">
                    <div class="row g-4">
                        <div class="col-lg-4 text-start">
                            <h1>MOST FEATURED PHONES</h1>
                        </div>
                        <div class="col-lg-8 text-end">
                            <ul class="nav nav-pills d-inline-flex text-center mb-5">
                                <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill active" data-bs-toggle="pill" href="#tab-1">
                                        <span class="text-dark" style="width: 130px;">All Products</span>
                                    </a>
                                </li>
                                <!--                                    <li class="nav-item">
                                                                        <a class="d-flex py-2 m-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-2">
                                                                            <span class="text-dark" style="width: 130px;">Vegetables</span>
                                                                        </a>
                                                                    </li>
                                                                    <li class="nav-item">
                                                                        <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-3">
                                                                            <span class="text-dark" style="width: 130px;">Fruits</span>
                                                                        </a>
                                                                    </li>
                                                                    <li class="nav-item">
                                                                        <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-4">
                                                                            <span class="text-dark" style="width: 130px;">Bread</span>
                                                                        </a>
                                                                    </li>
                                                                    <li class="nav-item">
                                                                        <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-5">
                                                                            <span class="text-dark" style="width: 130px;">Meat</span>
                                                                        </a>
                                                                    </li>-->
                            </ul>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <c:forEach items="${products}" var="p" >
                                            <div class="col-md-6 col-lg-4 col-xl-3">
                                                <a href="${pageContext.request.contextPath}/productdetails?pid=${p.product.productId}&pdid=${p.id}&pdcriteria=${p.criteria}" class="text-decoration-none">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="${pageContext.request.contextPath}/images/${p.product.img}" class="img-fluid w-100 rounded-top" alt="${p.product.name}">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px;
                                                             left: 10px;">

                                                        </div>
                                                        <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4 class="text-dark">${p.product.name}</h4>
                                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                                <p class="product-price-show"><currency:formatCurrency value="${p.priceDiscount}" /></p>
                                                                <p class="product-price-through"><currency:formatCurrency value="${p.product.price}" /></p>
                                                                <span class="btn border border-secondary rounded-pill px-3 text-primary">
                                                                    <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>

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
        <!-- Fruits Shop End-->
        <div class="category-container">
            <h2>Category</h2>

            <div class="category-grid">
                <%
                    // Retrieve the categories from the request attribute
                    List<Category> categories = (List<Category>) request.getAttribute("category");
                    if (categories != null && !categories.isEmpty()) {
                        for (Category category : categories) {
                %>

                <div class="category-item">
                    <!-- Link to categoryProducts.jsp with the categoryId parameter -->
                    <a href="productCategory.jsp?cid=<%= category.getCid()%>">
                        <img src="<%= category.getCimg()%>" alt="<%= category.getCname()%>" style="width: 150px;
                             height: auto;">
                        <p><%= category.getCname()%></p>
                    </a>
                </div>

                <%
                    } // End of for loop
                } else {
                %>
                <p>No categories available.</p>
                <%
                    }
                %>
            </div>
        </div>

        <!-- Featurs Section Start -->
        <div class="container-fluid featurs py-5">
            <div class="container py-5">
                <div class="row g-4">
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                <i class="fas fa-car-side fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>Free Shipping</h5>
                                <p class="mb-0">Free on order over $300</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                <i class="fas fa-user-shield fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>Security Payment</h5>
                                <p class="mb-0">100% security payment</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                <i class="fas fa-exchange-alt fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>30 Day Return</h5>
                                <p class="mb-0">30 day money guarantee</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                <i class="fa fa-phone-alt fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>24/7 Support</h5>
                                <p class="mb-0">Support every time fast</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Featurs Section End -->






        <!--             Featurs Start 
                    <div class="container-fluid service py-5">
                        <div class="container py-5">
                            <div class="row g-4 justify-content-center">
                                <div class="col-md-6 col-lg-4">
                                    <a href="#">
                                        <div class="service-item bg-secondary rounded border border-secondary">
                                            <img src="img/featur-1.jpg" class="img-fluid rounded-top w-100" alt="">
                                            <div class="px-4 rounded-bottom">
                                                <div class="service-content bg-primary text-center p-4 rounded">
                                                    <h5 class="text-white">Fresh Apples</h5>
                                                    <h3 class="mb-0">20% OFF</h3>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-6 col-lg-4">
                                    <a href="#">
                                        <div class="service-item bg-dark rounded border border-dark">
                                            <img src="img/featur-2.jpg" class="img-fluid rounded-top w-100" alt="">
                                            <div class="px-4 rounded-bottom">
                                                <div class="service-content bg-light text-center p-4 rounded">
                                                    <h5 class="text-primary">Tasty Fruits</h5>
                                                    <h3 class="mb-0">Free delivery</h3>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-6 col-lg-4">
                                    <a href="#">
                                        <div class="service-item bg-primary rounded border border-primary">
                                            <img src="img/featur-3.jpg" class="img-fluid rounded-top w-100" alt="">
                                            <div class="px-4 rounded-bottom">
                                                <div class="service-content bg-secondary text-center p-4 rounded">
                                                    <h5 class="text-white">Exotic Vegitable</h5>
                                                    <h3 class="mb-0">Discount 30$</h3>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                     Featurs End -->


        <!--             Vesitable Shop Start
                    <div class="container-fluid vesitable py-5">
                        <div class="container py-5">
                            <h1 class="mb-0">Fresh Organic Vegetables</h1>
                            <div class="owl-carousel vegetable-carousel justify-content-center">
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px;
                                         right: 10px;">Vegetable</div>
                                    <div class="p-4 rounded-bottom">
                                        <h4>Parsely</h4>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/vegetable-item-1.jpg" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px;
                                         right: 10px;">Vegetable</div>
                                    <div class="p-4 rounded-bottom">
                                        <h4>Parsely</h4>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/vegetable-item-3.png" class="img-fluid w-100 rounded-top bg-light" alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px;
                                         right: 10px;">Vegetable</div>
                                    <div class="p-4 rounded-bottom">
                                        <h4>Banana</h4>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold mb-0">$7.99 / kg</p>
                                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/vegetable-item-4.jpg" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px;
                                         right: 10px;">Vegetable</div>
                                    <div class="p-4 rounded-bottom">
                                        <h4>Bell Papper</h4>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold mb-0">$7.99 / kg</p>
                                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/vegetable-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px;
                                         right: 10px;">Vegetable</div>
                                    <div class="p-4 rounded-bottom">
                                        <h4>Potatoes</h4>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold mb-0">$7.99 / kg</p>
                                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px;
                                         right: 10px;">Vegetable</div>
                                    <div class="p-4 rounded-bottom">
                                        <h4>Parsely</h4>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold mb-0">$7.99 / kg</p>
                                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/vegetable-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px;
                                         right: 10px;">Vegetable</div>
                                    <div class="p-4 rounded-bottom">
                                        <h4>Potatoes</h4>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold mb-0">$7.99 / kg</p>
                                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="img/vegetable-item-6.jpg" class="img-fluid w-100 rounded-top" alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px;
                                         right: 10px;">Vegetable</div>
                                    <div class="p-4 rounded-bottom">
                                        <h4>Parsely</h4>
                                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold mb-0">$7.99 / kg</p>
                                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>-->
        <!-- Vesitable Shop End -->


        <!--             Banner Section Start
                    <div class="container-fluid banner bg-secondary my-5">
                        <div class="container py-5">
                            <div class="row g-4 align-items-center">
                                <div class="col-lg-6">
                                    <div class="py-4">
                                        <h1 class="display-3 text-white">Fresh Exotic Fruits</h1>
                                        <p class="fw-normal display-3 text-dark mb-4">in Our Store</p>
                                        <p class="mb-4 text-dark">The generated Lorem Ipsum is therefore always free from repetition injected humour, or non-characteristic words etc.</p>
                                        <a href="#" class="banner-btn btn border-2 border-white rounded-pill text-dark py-3 px-5">BUY</a>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="position-relative">
                                        <img src="img/baner-1.png" class="img-fluid w-100 rounded" alt="">
                                        <div class="d-flex align-items-center justify-content-center bg-white rounded-circle position-absolute" style="width: 140px;
                                             height: 140px;
                                             top: 0;
                                             left: 0;">
                                            <h1 style="font-size: 100px;">1</h1>
                                            <div class="d-flex flex-column">
                                                <span class="h2 mb-0">50$</span>
                                                <span class="h4 text-muted mb-0">kg</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                     Banner Section End -->


        <!-- Bestsaler Product Start -->
        <div class="container-fluid fruite py-5 mt-5">
            <div class="container py-5">
                <div class="tab-class text-center">
                    <h1 class="display-4 mb-5">New Products</h1> <!-- Tiêu đề New Products ở giữa -->
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <c:forEach items="${newProduct}" var="product">
                                            <div class="col-md-6 col-lg-4 col-xl-3">
                                                <a href="${pageContext.request.contextPath}/productdetails?pid=${product.productId}" class="text-decoration-none">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="${pageContext.request.contextPath}/images/${product.img}" class="img-fluid w-100 rounded-top" alt="${product.name}">
                                                        </div>
                                                        <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4 class="text-dark">${product.name}</h4>
                                                            <span class="btn border border-secondary rounded-pill px-3 text-primary">
                                                                <i class="fa fa-shopping-bag me-2 text-primary"></i> Details
                                                            </span>
                                                        </div>
                                                    </div>
                                                </a>
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


        <!-- Bestsaler Product End -->


        <!-- Fact Start -->
        <div class="container-fluid py-5">
            <div class="container">
                <div class="bg-light p-5 rounded">
                    <div class="row g-4 justify-content-center">
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users text-secondary"></i>
                                <h4>satisfied customers</h4>
                                <h1>1963</h1>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users text-secondary"></i>
                                <h4>quality of service</h4>
                                <h1>99%</h1>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users text-secondary"></i>
                                <h4>quality certificates</h4>
                                <h1>33</h1>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users text-secondary"></i>
                                <h4>Available Products</h4>
                                <h1>789</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


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
