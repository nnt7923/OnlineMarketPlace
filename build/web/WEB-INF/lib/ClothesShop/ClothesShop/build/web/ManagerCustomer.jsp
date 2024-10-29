<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    if (request.getSession().getAttribute("role_admin") == null) {
        response.sendRedirect("home");
        return;
    }
%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manager Account</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/ManagerProduct.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
        <link href="css/styles.css" rel="stylesheet" />
        <style>
            body {
                font-size: medium;
            }
            .table-title {
                background-color: #FFC0CB; /* Màu hồng */
                color: #000; /* Màu chữ, tùy chỉnh theo ý bạn */
                padding: 15px;
                border-radius: 4px;
                margin-bottom: 20px;
            }
            .btn-success {
                background-color: #28a745; /* Màu xanh cho nút thêm sản phẩm */
                border-color: #28a745;
            }
            .btn-primary {
                background-color: #007bff; /* Màu xanh cho nút quay lại trang chủ */
                border-color: #007bff;
            }
            .btn-danger {
                background-color: #dc3545; /* Màu đỏ cho nút xóa */
                border-color: #dc3545;
            }
        </style>
        <script>
            function back() {
                window.location.href = "home";
            }
            function doDelete(id) {
                var c = confirm("Are you sure you want to delete this account?");
                if (c) {
                    window.location.href = "managerAccount?deleteId=" + id;
                }
            }
        </script>
    </head>
    <body>

        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <h2>Manage <b>Account</b></h2>   
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>User</th>
                            <th>Pass</th>
                            <th>IsSell</th>
                            <th>Active</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${accounts}" var="p">
                            <tr>
                                <td>${p.uid}</td>
                                <td>${p.user}</td>
                                <td>${p.pass}</td>
                                <td>${p.isSell}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${!p.active}">
                                            <p style="color: red">Blocked</p>
                                        </c:when>    
                                        <c:otherwise>
                                            <p style="color: green">Active</p>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <a href="loadAccount?pid=${p.uid}" class="edit" data-toggle="modal">
                                        <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                                    </a>
                                </td>
                                <td>
                                    <a href="#" class="delete" onclick="doDelete(${p.uid})">
                                        <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
                <!-- Pagination at the bottom -->
                <div class="clearfix"> 
                    <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link" href="managerAccount?page=${page-1}" 
                               <c:if test="${page == 1}">class="disabled"</c:if>>Trước</a>
                        </li>
                        <c:forEach begin="1" end="${totalPage}" var="i">
                            <li class="page-item ${i == page ? 'active' : ''}">
                                <a class="page-link" href="managerAccount?page=${i}">${i}</a>
                            </li>
                        </c:forEach>
                        <li class="page-item">
                            <a class="page-link" href="managerAccount?page=${page+1}" 
                               <c:if test="${page == totalPage}">class="disabled"</c:if>>Sau</a>
                        </li>
                    </ul>
                </div>
            </div>
            
            <!-- Back to Home Button -->
            <button type="button" class="btn btn-primary" onclick="back()">Back to home</button>

        </div>

        <script src="js/ManagerProduct.js" type="text/javascript"></script>
    </body>
</html>
