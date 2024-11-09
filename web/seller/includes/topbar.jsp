<%-- 
    Document   : topbar
    Created on : Jul 20, 2024, 12:51:05 AM
    Author     : phamd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .navbar {
            display: flex;
            align-items: center;
            background-color: #fff;
            padding: 10px;
        }
        .navbar:hover{
            background-color: rgba(0,0,0,.06);
        }
        .navbar .menu-icon, .navbar .user-icon {
            margin-right: 20px;
        }
        .navbar .user-icon {
            display: flex;
            align-items: center;
        }
        .navbar .user-icon img {
            border-radius: 50%;
            width: 42px;
            height: 42px;
        }
        .navbar .user-icon .username {
            margin-left: 10px;
            font-weight: bold;
        }
        .navbar .user-icon .dropdown-icon {
            margin-left: 5px;
        }
        .dropdown {
            position: relative;
            display: inline-block;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            background-color: #fff;
            min-width: 200px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border-radius: 5px;
            padding: 10px;
        }
        .dropdown-content a {
            color: black;
            padding: 10px 15px;
            text-decoration: none;
            display: flex;
            align-items: center;
        }
        .dropdown-content a:hover {
            background-color: #f1f1f1;
        }
        .dropdown-content a i {
            margin-right: 10px;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
        .dropdown:hover .dropdown-icon .fa-chevron-up {
            display: none;
        }
        .dropdown:hover .dropdown-icon .fa-chevron-down {
            display: inline;
        }
        .dropdown-icon .fa-chevron-down {
            display: none;
        }
        .dropdown-content .user-info {
            text-align: center;
            margin-bottom: 10px;
        }
        .dropdown-content .user-info img {
            border-radius: 50%;
            width: 50px;
            height: 50px;
        }
        .dropdown-content .user-info p {
            margin: 5px 0 0;
            font-weight: bold;
        }
    </style>
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



        <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <!--                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Khanh Duy</span>-->
                <img class="img-profile rounded-circle"
                      src="${pageContext.request.contextPath}/public/img/undraw_profile.svg">
            </a>
            <!--             Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                 aria-labelledby="userDropdown">
                <!--                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>-->
                <div class="dropdown-divider"></div>
                <button class="dropdown-item" onclick="confirmLogout()">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    Logout
                </button>
            </div>
        </li>

    </ul>


</nav>
<script type="text/javascript">
    function confirmLogout() {
        var result = confirm("Are you sure you want to logout?");
        if (result) {
            window.location.href = '${pageContext.request.contextPath}/logout';
        }
    }
</script>



