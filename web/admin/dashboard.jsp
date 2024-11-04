
<%@page import="dao.NewsDAO"%>
<%@page import="dao.BrandDAO"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="dao.AccountDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Role" %>
<!DOCTYPE html>
<html lang="en">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


    <%@include file="header.jsp" %>
    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <%@include file="sidebar.jsp" %>

            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <%@include file="topbar.jsp" %>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">


                        <!-- Content Row -->
                        <div class="row">

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                    Account</div>
                                                <div class="ms-3">
                                                    <h6 class="mb-0"><%
                                                        AccountDAO daoA = new AccountDAO();
                                                        int userCount = daoA.getUserCount();
                                                        out.print(userCount);
                                                        %></h6>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fa-regular fa-user"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                    Category</div>
                                                <div class="ms-3">
                                                    <h6 class="mb-0"><%
                                                        CategoryDAO daoC = new CategoryDAO();
                                                        int cateCount = daoC.getCategoryCount();
                                                        out.print(cateCount);
                                                        %></h6>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fa-solid fa-list"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                    Brand</div>
                                                <div class="ms-3">
                                                    <h6 class="mb-0"><%
                                                        BrandDAO daoB = new BrandDAO();
                                                        int brandCount = daoB.getBrandCount();
                                                        out.print(brandCount);
                                                        %></h6>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fa-regular fa-copyright"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                    News</div>
                                                <div class="ms-3">
                                                    <h6 class="mb-0"><%
                                                        NewsDAO daoN = new NewsDAO();
                                                        int newCount = daoN.getNewsCount();
                                                        out.print(newCount);
                                                        %></h6>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fa-regular fa-newspaper"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
            <!-- End of Main Content -->
            <%@include file="main-script.jsp" %>
            <!-- Footer -->


        </div>
        <!-- End of Content Wrapper -->


        <!-- End of Page Wrapper -->



    </body>

</html>

