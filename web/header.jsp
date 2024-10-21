<%-- 
    Document   : header
    Created on : Sep 22, 2024, 5:39:16 PM
    Author     : Admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
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
    </head>
    <body>
        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container topbar bg-primary d-none d-lg-block">
                <div class="d-flex justify-content-between">
                    <div class="top-info ps-2">
                        <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#" class="text-white">123 Street, New York</a></small>
                        <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#" class="text-white">Email@Example.com</a></small>
                    </div>
                    <div class="top-link pe-2">
                        <c:if test="${account ne null}">
                            <a href="#" class="text-white">
                                <small class="text-white ms-2">Hello, ${account.username} </small>/
                            </a>
                        </c:if>
                        <a href="#" class="text-white"><small class="text-white mx-2">Terms of Use</small>/</a>
                        <c:if test="${account eq null}">
                            <a href="login.jsp" class="text-white">
                                <small class="text-white ms-2">Login</small>
                            </a>
                        </c:if>
                        <c:if test="${account ne null}">
                            <a href="${pageContext.request.contextPath}/logout" class="text-white">
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
                            <a href="home" class="nav-item nav-link active">Home</a>
                            <a href="shop.html" class="nav-item nav-link">Shop</a>
                            <a href="shop-detail.html" class="nav-item nav-link">Shop Detail</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                                <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                    <a href="cart.html" class="dropdown-item">Cart</a>
                                    <a href="chackout.html" class="dropdown-item">Checkout</a>
                                    <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                                    <a href="404.html" class="dropdown-item">404 Page</a>
                                </div>
                            </div>
                            <a href="contact.html" class="nav-item nav-link">Contact</a>
                        </div>
                        <div class="d-flex m-3 me-0">
                            <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fas fa-search text-primary"></i></button>
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
                                    <a href="profiles.jsp" class="my-auto">
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
        <div id="loginModal-cart" class="modal" style="display: none;">
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
        </script>
    </body>
</html>
