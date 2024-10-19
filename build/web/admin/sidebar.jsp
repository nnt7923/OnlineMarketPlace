

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<ul class="navbar-nav navbar-seller sidebar sidebar-dark accordion" id="accordionSidebar">

<!--     Sidebar - Brand -->
<a class="sidebar-brand d-flex align-items-center justify-content-center" href="dashboard.jsp">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">SHOP </div>
    </a>

<!--     Divider -->
    <hr class="sidebar-divider my-0">

<!--     Nav Item - Dashboard -->
    <li class="nav-item active">
        <a class="nav-link" href="admin/dashboard.jsp">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span></a>
    </li>

<!--     Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/account">
            <i class="fas fa-fw fa-user"></i>
            <span>Account</span>
        </a>
    </li> 
    <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/categories">
            <i class="fas fa-building"></i>
            <span>Category</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/brands">
            <i class="fas fa-building"></i>
            <span>Brand</span>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link collapsed" href="#">
            <i class="fas fa-pencil-ruler"></i>
            <span>Report</span>
        </a>
    </li>
<!--     Divider -->
    <hr class="sidebar-divider d-none d-md-block">

<!--     Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>


</ul>

