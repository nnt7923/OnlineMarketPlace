<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Account" %>
<%
    Account account = (Account) request.getAttribute("account");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Account</title>
        <!-- Add Bootstrap CSS for styling -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-mQ93VtyU4kkjAN/fQinwNMeWj/zLM4bqMDiyEJj0e5eG1zqO2BzOjJywqI+kkt9T" crossorigin="anonymous">
        <!-- Google Fonts for improved aesthetics -->
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    </head>
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
                        <!-- Edit Account Section -->
                        <h1 class="h3 mb-3 text-gray-800">Edit Account</h1>

                        <!-- Edit Account Form -->
                        <form action="account?service=updateAccount" method="post" class="row g-3">
                            <!-- Hidden field for account ID -->
                            <input type="hidden" name="accountId" value="<%= account.getAccountId() %>">

                            <div class="col-md-6">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" class="form-control" name="username" id="username" value="<%= account.getUsername() %>" required>
                            </div>

                            <div class="col-md-6">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" name="password" id="password" value="<%= account.getPassword() %>" required>
                            </div>

                            <div class="col-md-6">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" name="email" id="email" value="<%= account.getEmail() %>" required>
                            </div>

                            <div class="col-md-6">
                                <label for="phone" class="form-label">Phone</label>
                                <input type="text" class="form-control" name="phone" id="phone" value="<%= account.getPhone() %>" required>
                            </div>

                            <div class="col-md-6">
                                <label for="address" class="form-label">Address</label>
                                <input type="text" class="form-control" name="address" id="address" value="<%= account.getAddress() %>" required>
                            </div>

                            <div class="col-md-6">
                                <label for="roleId" class="form-label">Role ID</label>
                                <select class="form-control" name="roleId" id="roleId" required>
                                    <option value="1" <%= account.getRoleId() == 1 ? "selected" : "" %>>1</option>
                                    <option value="2" <%= account.getRoleId() == 2 ? "selected" : "" %>>2</option>
                                    <option value="3" <%= account.getRoleId() == 3 ? "selected" : "" %>>3</option>
                                    <option value="4" <%= account.getRoleId() == 4 ? "selected" : "" %>>4</option>
                                </select>
                            </div>

                            <div class="col-md-6">
                                <label for="status" class="form-label">Status</label>
                                <select class="form-control" name="status" id="status" required>
                                    <option value="active" <%= "active".equals(account.getStatus()) ? "selected" : "" %>>Active</option>
                                    <option value="inactive" <%= "inactive".equals(account.getStatus()) ? "selected" : "" %>>Inactive</option>
                                </select>
                            </div>

                            <div class="col-12">
                                <button type="submit" class="btn btn-primary">Update Account</button>
                                <a href="account?service=listAll" class="btn btn-secondary">Cancel</a>
                            </div>
                        </form>
                    </div>
                    <!-- End Page Content -->

                </div>
                <!-- End of Main Content -->

            </div>
            <!-- End of Content Wrapper -->


        </div>
        <!-- End of Page Wrapper -->

        <!-- Bootstrap JS Bundle -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
