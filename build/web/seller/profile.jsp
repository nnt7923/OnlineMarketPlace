<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%@include file="includes/head.jsp" %>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <%@include file="includes/sidebar.jsp" %>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <%@include file="includes/topbar.jsp" %>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid row">

                    <div class="col-md-4 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                            <img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
                            <span class="font-weight-bold">${account.username}</span> 
                            <span class="text-black-50">${account.email}</span>
                            <a class="btn mt-3" href="orderhistory">Purchase History</a>
                        </div>
                    </div>

                    <div class="col-md-8 border-right">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mt-3">
                                <h4 class="text-right">Profile Settings</h4>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <label class="labels">Full Name</label>
                                    <input type="text" class="form-control" placeholder="Full Name: Not updated"
                                           value="${account.username}" disabled>
                                </div>
                            </div>
                               
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <label class="labels">Email</label>
                                    <input type="text" class="form-control" placeholder="Email: Not updated"
                                           value="${account.email}" disabled>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <label class="labels">Address</label>
                                    <input type="text" class="form-control" placeholder="Address: Not updated"
                                           value="${account.address}" disabled>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <label class="labels">Phone Number</label>
                                    <input type="text" class="form-control" placeholder="Phone Number: Not updated"
                                           value="${account.phone}" disabled>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 mt-10 text-center">
                            <!-- Điều hướng đến trang chỉnh sửa profile -->
                            <a href="${pageContext.request.contextPath}/seller/edit" class="btn btn-primary">Edit Information</a>
                            <a href="changePassword.jsp" class="btn btn-primary">Change Password</a>
                        </div>
                    </div>

                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <%@include file="includes/main-script.jsp" %>
                <!-- Footer -->
                <%@include file="includes/footer.jsp" %>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

</body>

</html>
