

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<ul class="navbar-nav navbar-seller sidebar sidebar-dark accordion" id="accordionSidebar">

    <!--     Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/home.jsp">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">SHOP </div>
    </a>

    <!--     Divider -->
    <hr class="sidebar-divider my-0">

    <!--     Nav Item - Dashboard -->
    <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/seller/dashboard">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span></a>
    </li>
    <!--     Nav Item - Dashboard -->
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/seller/orderstatus">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Order Status</span></a>
    </li>
    <!--     Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/seller/profile">
            <i class="fas fa-fw fa-user"></i>
            <span>Profile</span>
        </a>

    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapse_department" aria-expanded="true" aria-controls="collapse_department">
            <i class="fas fa-building"></i>
            <span>Product manager</span>
        </a>
        <div id="collapse_department" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="${pageContext.request.contextPath}/seller/product?service=addProduct">Add Product</a>
                <a class="collapse-item" href="${pageContext.request.contextPath}/seller/product?service=listProductsBySeller">List Product</a>
            </div>
        </div>
    </li>

<!-- Product Detail Manager -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapse_department2" aria-expanded="true" aria-controls="collapse_department2">
            <i class="fas fa-building"></i>
            <span>Product detail manager</span>
        </a>
        <div id="collapse_department2" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="${pageContext.request.contextPath}/seller/product?service=addProductDetail">Add Product Detail</a>
                <a class="collapse-item" href="${pageContext.request.contextPath}/seller/product?service=list">List Product Details</a>
            </div>
        </div>
    </li>

<!--Reply Feedback -->


    </li>
        <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/feedbackReply">
            <i class="fas fa-fw fa-user"></i>
            <span>Reply Feedback</span>
        </a>
    </li>
    <!--     Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!--     Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>


</ul>

