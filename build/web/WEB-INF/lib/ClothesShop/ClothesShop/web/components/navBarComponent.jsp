<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Navigation-->
<script>
    function login() {
        window.location.href = "login.jsp";
    }
    function logout() {
        window.location.href = "logout";
    }
    function viewAccount() {
        window.location.href = "viewAccount";
    }
</script>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="home">Clothes Shop</a>
        <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
            >
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <c:if test="${sessionScope.role_admin != null}">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="managerAccount">Manager Account</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="managerCategory">Manager Category</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.role_admin != null}">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="manager">Manager Product</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#!">Hello ${sessionScope.acc.user}</a>
                    </li>
                </c:if>
            </ul>
            <form action="search" class="d-flex mx-auto" >
                <div class="group">
                    <svg class="icon" aria-hidden="true" viewBox="0 0 24 24">
                    <g>
                    <path d="M21.53 20.47l-3.66-3.66C19.195 15.24 20 13.214 20 11c0-4.97-4.03-9-9-9s-9 4.03-9 9 4.03 9 9 9c2.215 0 4.24-.804 5.808-2.13l3.66 3.66c.147.146.34.22.53.22s.385-.073.53-.22c.295-.293.295-.767.002-1.06zM3.5 11c0-4.135 3.365-7.5 7.5-7.5s7.5 3.365 7.5 7.5-3.365 7.5-7.5 7.5-7.5-3.365-7.5-7.5z"></path>
                    </g>
                    </svg>
                    <input placeholder="Search" value="${key}" type="search" placeholder="Search"aria-label="Search"name="keyword" class="input">
                </div>
                <button style="margin-left: 15px" class="button-search1" type="submit">
                    Search
                </button>
            </form>
            <div class="d-flex my-2">
                <a class="btn btn-outline-dark" href="carts">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                    <span class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.carts.size()}</span>
                </a>
            </div>
            <c:choose>
                <c:when test="${sessionScope.acc == null}">
                    <button class="btn btn-outline-primary ms-lg-2" onclick="login()">Login</button>
                </c:when>
                <c:otherwise>
<!--                    <button class="btn btn-outline-primary ms-lg-2" onclick="viewAccount()">View Account</button>-->
                    <button class="btn btn-outline-primary ms-lg-2" onclick="logout()">Logout</button>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>
