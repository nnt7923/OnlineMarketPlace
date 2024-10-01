<%-- 
    Document   : topbar
    Created on : Jul 20, 2024, 12:51:05 AM
    Author     : phamd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
    <h1>Manage Accounts</h1>
    <!-- Sidebar Toggle (Topbar) -->

    <form class="form-inline">
        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
        </button>
    </form>


    <!-- Topbar Navbar -->

    <ul class="navbar-nav ml-auto">

        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
        <li class="nav-item dropdown no-arrow d-sm-none">
            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
            </a>

            <!-- Dropdown - Messages -->
            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                 aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                    <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small"
                               placeholder="Search for..." aria-label="Search"
                               aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </li>

        <c:if test="${account ne null}">
            <button class="btn btn-danger" onclick="window.location.href = '${pageContext.request.contextPath}/logout'">
                <small class="text-white">Logout</small>
            </button>
        </c:if>

        <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <!--                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Khanh Duy</span>-->
                <img class="img-profile rounded-circle"
                     src="${pageContext.request.contextPath}/public/img/undraw_profile.svg">
            </a>

        </li>

    </ul>

</nav>