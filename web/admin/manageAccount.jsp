<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Account" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Accounts</title>
    <!-- Thêm Bootstrap CSS để tạo kiểu -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-mQ93VtyU4kkjAN/fQinwNMeWj/zLM4bqMDiyEJj0e5eG1zqO2BzOjJywqI+kkt9T" crossorigin="anonymous">
    <!-- Thêm font Google để cải thiện thẩm mỹ -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        .th {
            border-color: #81c408;
        }
    </style>
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
                
                <!-- add message -->
                <%
                        String message = (String) session.getAttribute("message");
                        if (message != null) {
                    %>
                        <div class="alert alert-success">
                            <%= message %>
                        </div>
                        <%
                            session.removeAttribute("message"); // Remove it after displaying once
                        %>
                    <%
                        }
                    %>
                    
                    <!-- update message -->
                    <%
                        String successMessage = (String) session.getAttribute("successMessage");
                        if (successMessage != null) {
                    %>
                        <div class="alert alert-success">
                            <%= successMessage %>
                        </div>
                        <%
                            session.removeAttribute("successMessage"); // Remove it after displaying once
                        %>
                    <%
                        }
                    %>
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Manage Accounts Section -->
                    

                    <!-- Search Form -->
                    <div class="search-container d-flex justify-content-between mb-3">
                        <form class="d-flex" action="account" method="get">
                            <input class="form-control me-2" type="text" name="keyword" placeholder="Search by username">
                            <input type="hidden" name="service" value="searchAccount">
                            <button class="btn btn-primary" type="submit">Search</button>
                        </form>
                        <a href="account?service=addAccountForm" class="btn btn-success">Add New Account</a>
                    </div>

                    <!-- Accounts Table -->
                    <table class="table table-bordered table-striped">
                        <thead class="">
                            <tr>
                                <th>ID</th>
                                <th>Username</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Address</th>
                                <th>Role ID</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Account> accounts = (List<Account>) request.getAttribute("accounts");
                                if (accounts != null && !accounts.isEmpty()) {
                                    for (Account account : accounts) {
                            %>
                            <tr>
                                <td><%= account.getAccountId() %></td>
                                <td><%= account.getUsername() %></td>
                                <td><%= account.getEmail() %></td>
                                <td><%= account.getPhone() %></td>
                                <td><%= account.getAddress() %></td>
                                <td><%= account.getRoleId() %></td>
                                <td><%= account.getStatus() %></td>
                                <td>
                                    <a href="account?service=updateAccountForm&accountId=<%= account.getAccountId() %>" class="btn btn-success btn-sm">Edit</a>
                                    <a href="account?service=deleteAccount&accountId=<%= account.getAccountId() %>" class="btn btn-success btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                                </td>
                            </tr>
                            <%
                                    }
                                } else {
                            %>
                            <tr>
                                <td colspan="8" class="text-center">No accounts found.</td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <!-- End Page Content -->

            </div>
            <!-- End of Main Content -->

        </div>
        <!-- End of Content Wrapper -->
        <%@include file="main-script.jsp" %>
        <!-- Footer -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
