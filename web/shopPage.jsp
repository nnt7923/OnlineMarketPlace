<%@ taglib prefix="currency" uri="/WEB-INF/currency.tld" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
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

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

        <style>
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

            .text-truncate {
                max-width: 100%; /* Giới hạn chiều rộng để chữ không tràn */
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }




            /* Khung chứa shop */
            .shop-container {
                display: flex;
                align-items: center;
                border: 1px solid #ddd;
                padding: 20px;
                border-radius: 8px;
                background-color: #fff;

                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px; /* Tạo khoảng cách với nội dung bên dưới */
                transition: box-shadow 0.3s ease;
            }
            .shop-logo {
                width: 80px;
                height: 80px;
                border-radius: 50%;
                margin-right: 20px;
                object-fit: cover;
                border: 2px solid #f43b47;
            }
            .shop-info {
                flex: 1;
            }
            .shop-info h2 {
                font-size: 20px;
                color: #333;
                margin-bottom: 5px;
            }

            .shop-info p {
                color: #888;
                font-size: 14px;
                margin-bottom: 15px;
            }
            .shop-actions {
                margin-top: 10px;
            }
            .btn {
                padding: 10px 15px;
                margin-right: 10px;
                border-radius: 5px;
                cursor: pointer;
                font-weight: bold;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                transition: background-color 0.3s ease, color 0.3s ease;
            }
            .btn-chat {
                background-color: #f43b47;
                color: #fff;
                border: 1px solid #f43b47;
            }
            .btn-chat:hover {
                background-color: #ff6666;
                border-color: #ff6666;
            }
            .btn-view-shop {
                background-color: #f5f5f5;
                color: #333;
                border: 1px solid #ddd;
            }

            .btn-view-shop:hover {
                background-color: #e0e0e0;
            }
            .shop-stats {
                display: grid;
                grid-template-columns: repeat(2, auto);
                gap: 20px 50px;
                padding-left: 25px;
                padding-right: 25px;
                justify-content: space-around;
                font-size: 14px;
                color: #777;
                margin-top: 10px;
                margin-right: 25px;

            }

            .shop-stats div {
                text-align: left;
                margin-bottom: 5px;
            }
            .shop-stats span {
                color: red;
                font-weight: bold;
            }

        </style>
    </head>

    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container topbar bg-primary d-none d-lg-block">
                <div class="d-flex justify-content-between">
                    <div class="top-info ps-2">
                        <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#" class="text-white">Ha Noi</a></small>
                        <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#" class="text-white">nntruong79230@gmail.com</a></small>
                    </div>
                    <div class="top-link pe-2">
                        <c:if test="${account ne null}">
                            <a href="#" class="text-white">
                                <small class="text-white ms-2">Hello, ${account.username} </small>/
                            </a>
                        </c:if>
                        <a href="#" class="text-white"><small class="text-white mx-2">Terms of Use</small>/</a>
                        <c:if test="${account eq null}">
                            <a href="login" class="text-white">
                                <small class="text-white ms-2">Login</small>
                            </a>
                        </c:if>
                        <c:if test="${account ne null}">
                            <a href="logout" class="text-white">
                                <small class="text-white ms-2">Logout</small>
                            </a>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">

                    <a href="home" class="navbar-brand"><h1 class="text-primary display-6">Tech Store</h1></a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <a href="home" class="nav-item nav-link ">Home</a>
                            <a href="shop" class="nav-item nav-link active" >Shop</a>
                            <!--                            <a href="shop-detail.jsp" class="nav-item nav-link">Shop Detail</a>-->
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                                <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                    <a href="cart.jsp" class="dropdown-item">Cart</a>
                                    <a href="checkout.jsp" class="dropdown-item">Checkout</a>

                                </div>
                            </div>

                        </div>
                        <div class="d-flex m-3 me-0">

                            <c:if test="${sessionScope.account == null}">
                                <a id="loginModalbuttoncart" href="#" class="position-relative me-4 my-auto" >
                                    <i class="fa fa-shopping-bag fa-2x"></i>
                                    <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;">0</span>
                                </a>
                            </c:if>
                            <c:if test="${sessionScope.account != null}">
                                <a href="cart" class="position-relative me-4 my-auto">
                                    <i class="fa fa-shopping-bag fa-2x"></i>
                                    <span id="cart-size" class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                                          style="top: -5px; left: 15px; height: 20px; min-width: 20px;">
                                        ${sessionScope.cartSize != null ? sessionScope.cartSize : 0}
                                    </span>
                                </a>
                            </c:if>


                            <c:choose>
                                <c:when test="${sessionScope.account == null}">
                                    <a href="login.jsp" class="my-auto">
                                        <i class="fas fa-user fa-2x"></i>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="profile.jsp" class="my-auto">
                                        <i class="fas fa-user fa-2x"></i>
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->



        <!-- Single Page Header Start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Shop</h1>
            <!--            <ol class="breadcrumb justify-content-center mb-0">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
                            <li class="breadcrumb-item active text-white">Shop</li>
                        </ol>-->
        </div>
        <!-- Single Page Header End -->

        <!-- Fruits Shop Start -->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <div class="shop-container">
                    <img src="https://via.placeholder.com/80" alt="Ensure Gold" class="shop-logo">

                    <div class="shop-info">
                        <h2>Store Name</h2>
                        <p>Online 10 Phút Trước</p>

                        <div class="shop-actions">
                            <a href="#" class="btn btn-chat">Chat Ngay</a>
                            <a href="#" class="btn btn-view-shop">Xem Shop</a>
                        </div>


                    </div>
                    <div class="shop-stats">
                        <div>Đánh Giá <span>133,6k</span></div>
                        <div>Tỉ Lệ Phản Hồi <span>100%</span></div>
                        <div>Sản Phẩm <span>72</span></div>
                        <div>Thời Gian Phản Hồi <span>trong vài giờ</span></div>
                    </div>
                </div>
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4">
                            <div class="col-xl-3">
                                <div class="input-group w-100 mx-auto d-flex mb-4" style="max-width: 600px;">
                                    <form action="${pageContext.request.contextPath}/shop" method="get" class="w-100 d-flex">
                                        <input type="search" name="search" class="form-control p-3" placeholder="Tìm kiếm sản phẩm..." aria-describedby="search-icon-1" style="border-radius: 25px 0 0 25px; border: 1px solid #ced4da;">
                                        <button type="submit" class="btn btn-primary" style="border-radius: 0 25px 25px 0;">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </form>
                                </div>



                            </div>
                            <div class="col-6"></div>
                            <div class="col-xl-3">
                                <div class="bg-light ps-2 py-2 rounded d-flex justify-content-between mb-4 collapse navbar-collapse" id="navbarCollapse">
                                    <div class="nav-item dropdown">
                                        <a href="#" class="nav-link dropdown-toggle text-truncate" data-bs-toggle="dropdown">Filter</a>
                                        <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                            <a href="shop" class="dropdown-item text-truncate">All Products</a>
                                            <c:if test="${not empty param.cid}">
                                                <a href="${pageContext.request.contextPath}/shop?sort=price_asc&cid=${param.cid}" class="dropdown-item">Sort by Price Ascending</a>
                                                <a href="${pageContext.request.contextPath}/shop?sort=price_desc&cid=${param.cid}" class="dropdown-item">Sort by Price Descending</a>
                                            </c:if>
                                            <c:if test="${empty param.cid}">
                                                <a href="${pageContext.request.contextPath}/shop?sort=price_asc" class="dropdown-item">Sort by Price Ascending</a>
                                                <a href="${pageContext.request.contextPath}/shop?sort=price_desc" class="dropdown-item">Sort by Price Descending</a>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row g-4">
                            <div class="row g-4">
                                <div class="col-lg-3">
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4>Categories</h4>
                                            <ul class="list-unstyled fruite-categorie">
                                                
                                                <c:forEach items="${categories}" var="c">
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="${pageContext.request.contextPath}/shop?cid=${c.cid}">  
                                                                <i class="fas fa-apple-alt me-2"></i>${c.cname}
                                                            </a>
                                                            <span>(${c.productCount})</span>
                                                        </div>
                                                    </li>
                                                </c:forEach>
                                            </ul>


                                        </div>
                                    </div>


                                </div>
                                <div class="col-lg-9">
                                    <div class="row g-4 justify-content-center">




                                        <c:forEach items="${products}" var="p" varStatus="status">
                                            <!-- Hiển thị tối đa 9 sản phẩm -->
                                            <c:if test="${status.index < 9}">
                                                <div class="col-md-6 col-lg-4 col-xl-4">
                                                    <a href="${pageContext.request.contextPath}/productdetails?pid=${p.product.productId}&pdid=${p.id}&pdcriteria=${p.criteria}" class="text-decoration-none">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="${pageContext.request.contextPath}/images/${p.product.img}" class="img-fluid w-100 rounded-top" alt="${p.product.name}">
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;"></div>
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
                                            </c:if>
                                        </c:forEach>


                                        <!-- Phần phân trang -->
                                        <div class="col-12">
                                            <div class="pagination d-flex justify-content-center mt-5">
                                                <!-- Nút trang trước -->
                                                <c:if test="${currentPage > 1}">
                                                    <a href="?page=${currentPage - 1}" class="rounded">&laquo;</a>
                                                </c:if>

                                                <!-- Các số trang -->
                                                <c:forEach begin="1" end="${totalPages}" var="i">
                                                    <a href="?page=${i}" class="rounded <c:if test='${i == currentPage}'>active</c:if>">${i}</a>
                                                </c:forEach>

                                                <!-- Nút trang tiếp theo -->
                                                <c:if test="${currentPage < totalPages}">
                                                    <a href="?page=${currentPage + 1}" class="rounded">&raquo;</a>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Fruits Shop End-->

            <!-- Footer Start --> 
            <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
                <div class="container py-5">
                    <div class="pb-4 mb-4" style="border-bottom: 1px solid rgba(226, 175, 24, 0.5);">
                        <div class="row g-4">
                            <div class="col-lg-3">
                                <a href="#">
                                    <h1 class="text-primary mb-0">Fruitables</h1>
                                    <p class="text-secondary mb-0">Fresh products</p>
                                </a>
                            </div>
                            <div class="col-lg-6">
                                <div class="position-relative mx-auto">
                                    <input class="form-control border-0 w-100 py-3 px-4 rounded-pill" type="email" placeholder="Your Email">
                                    <button type="submit" class="btn btn-primary border-0 border-secondary py-3 px-4 position-absolute rounded-pill text-white" style="top: 0; right: 0;">Subscribe Now</button>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="d-flex justify-content-end pt-3">
                                    <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-youtube"></i></a>
                                    <a class="btn btn-outline-secondary btn-md-square rounded-circle" href=""><i class="fab fa-linkedin-in"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row g-5">
                        <div class="col-lg-3 col-md-6">
                            <div class="footer-item">
                                <h4 class="text-light mb-3">Why People Like us!</h4>
                                <p class="mb-4">Typesetting, remaining essentially unchanged. It was 
                                    popularised in the 1960s with the like Aldus PageMaker including of Lorem Ipsum.</p>
                                <a href="" class="btn border-secondary py-2 px-4 rounded-pill text-primary">Read More</a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="d-flex flex-column text-start footer-item">
                                <h4 class="text-light mb-3">Shop Info</h4>
                                <a class="btn-link" href="">About Us</a>
                                <a class="btn-link" href="">Contact Us</a>
                                <a class="btn-link" href="">Privacy Policy</a>
                                <a class="btn-link" href="">Terms & Condition</a>
                                <a class="btn-link" href="">Return Policy</a>
                                <a class="btn-link" href="">FAQs & Help</a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="d-flex flex-column text-start footer-item">
                                <h4 class="text-light mb-3">Account</h4>
                                <a class="btn-link" href="">My Account</a>
                                <a class="btn-link" href="">Shop details</a>
                                <a class="btn-link" href="">Shopping Cart</a>
                                <a class="btn-link" href="">Wishlist</a>
                                <a class="btn-link" href="">Order History</a>
                                <a class="btn-link" href="">International Orders</a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="footer-item">
                                <h4 class="text-light mb-3">Contact</h4>
                                <p>Address: 1429 Netus Rd, NY 48247</p>
                                <p>Email: Example@gmail.com</p>
                                <p>Phone: +0123 4567 8910</p>
                                <p>Payment Accepted</p>
                                <img src="img/payment.png" class="img-fluid" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer End -->

            <!-- Copyright Start -->
            <div class="container-fluid copyright bg-dark py-4">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            <span class="text-light"><a href="#"><i class="fas fa-copyright text-light me-2"></i>Your Site Name</a>, All right reserved.</span>
                        </div>
                        <div class="col-md-6 my-auto text-center text-md-end text-white">
                            <!--/*** This template is free as long as you keep the below author’s credit link/attribution link/backlink. ***/-->
                            <!--/*** If you'd like to use the template without the below author’s credit link/attribution link/backlink, ***/-->
                            <!--/*** you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". ***/-->
                            Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a> Distributed By <a class="border-bottom" href="https://themewagon.com">ThemeWagon</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Copyright End -->

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

