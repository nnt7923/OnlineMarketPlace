

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
        <a class="nav-link" href="dashboard.jsp">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span></a>
    </li>

<!--     Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/admin/account">
            <i class="fas fa-fw fa-user"></i>
            <span>Account</span>
        </a>
        
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapse_department" aria-expanded="true" aria-controls="collapseTwo">
            <i class="fas fa-building"></i>
            <span>Category</span>
        </a>
        <div id="collapse_department" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">

                <a class="collapse-item" href="${pageContext.request.contextPath}/departments">List</a>
                <a class="collapse-item" href="${pageContext.request.contextPath}/departments/store">Create</a>
            </div>
        </div>
    </li>
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapse_role" aria-expanded="true" aria-controls="collapseTwo">
            <i class="fas fa-pencil-ruler"></i>
            <span>Report</span>
        </a>
        <div id="collapse_role" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">

                <a class="collapse-item" href="${pageContext.request.contextPath}/roles">List</a>
                <a class="collapse-item" href="${pageContext.request.contextPath}/roles/store">Create</a>
            </div>
        </div>
    </li>
<!--     Divider -->
    <hr class="sidebar-divider d-none d-md-block">

<!--     Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>


</ul>
