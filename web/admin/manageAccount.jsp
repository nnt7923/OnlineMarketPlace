<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Account" %>
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
            body {
                font-family: 'Roboto', sans-serif;
                background-color: #f8f9fa;
                padding: 20px;
            }

            h1 {
                margin-bottom: 20px;
            }

            .search-container {
                margin-bottom: 20px;
            }

            .table th, .table td {
                vertical-align: middle;
            }

            .btn {
                margin-right: 5px;
            }

            .no-accounts {
                color: #6c757d;
                text-align: center;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <h1 class="text-center">Manage Accounts</h1>

            <!-- Form tìm kiếm -->
            <div class="search-container d-flex justify-content-between">
                <form class="d-flex" action="account" method="get">
                    <input class="form-control me-2" type="text" name="keyword" placeholder="Search by username">
                    <input type="hidden" name="service" value="searchAccount">
                    <button class="btn btn-primary" type="submit">Search</button>
                </form>
                <a href="account?service=addAccountForm" class="btn btn-success">Add New Account</a>
            </div>

            <!-- Bảng tài khoản -->
            <table class="table table-striped table-hover">

                <head>
                    <title>Manage Accounts</title>
                    <!-- Bootstrap CSS -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
                    <link rel="stylesheet" href="path/to/your/styles.css">
                </head>
                <body class="container mt-5">
                    <h1 class="mb-4">Manage Accounts</h1>

                    <form action="account" method="get" class="row g-3 mb-4">
                        <div class="col-auto">
                            <input type="text" name="keyword" class="form-control" placeholder="Search by username">
                        </div>
                        <input type="hidden" name="service" value="searchAccount">
                        <div class="col-auto">
                            <button type="submit" class="btn btn-primary">Search</button>
                        </div>
                    </form>

                    <table class="table table-bordered table-striped">

                        <thead class="table-dark">
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
                                <td><%= account.getAccountId()%></td>
                                <td><%= account.getUsername()%></td>
                                <td><%= account.getEmail()%></td>
                                <td><%= account.getPhone()%></td>
                                <td><%= account.getAddress()%></td>
                                <td><%= account.getRoleId()%></td>
                                <td><%= account.getStatus()%></td>
                                <td>
                                    <a href="account?service=updateAccountForm&accountId=<%= account.getAccountId()%>" class="btn btn-warning btn-sm">Edit</a>
                                    <a href="account?service=deleteAccount&accountId=<%= account.getAccountId()%>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
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

                    <!-- Thêm Bootstrap JavaScript để hỗ trợ các chức năng -->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-mQ93VtyU4kkjAN/fQinwNMeWj/zLM4bqMDiyEJj0e5eG1zqO2BzOjJywqI+kkt9T" crossorigin="anonymous"></script>
                </body>


                <a href="account?service=addAccountForm" class="btn btn-success mt-3">Add New Account</a>

                <!-- Bootstrap JS Bundle -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
                </body>

                </html>
