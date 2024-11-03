<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Categories</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<%@include file="header.jsp" %>

<body id="page-top">
    <div id="wrapper">
        <%@include file="sidebar.jsp" %>

        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <%@include file="topbar.jsp" %>

                <div class="container-fluid">
                    <!-- Display Messages -->
                    <c:if test="${not empty successMessage}">
                        <div class="alert alert-success">
                            ${successMessage}
                        </div>
                    </c:if>
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger">
                            ${errorMessage}
                        </div>
                    </c:if>

                    <!-- Search Form -->
                    <div class="search-container d-flex justify-content-between mb-3">
                        <form class="d-flex" action="categories" method="get">
                            <input class="form-control me-2" type="text" name="keyword" placeholder="Search by category name">
                            <input type="hidden" name="action" value="search">
                            <button class="btn btn-primary" type="submit">Search</button>
                        </form>
                        <a href="categories?action=addForm" class="btn btn-success">Add New Category</a>
                    </div>

                    <!-- Categories Table -->
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Category Name</th>
                                <th>Actions</th>
                                <th>Images</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="category" items="${categories}">
                                <tr>
                                    <td>${category.cname}</td>
                                    <td>
                                        <a href="categories?action=updateForm&cid=${category.cid}" class="btn btn-success btn-sm">Edit</a>
                                        <a href="categories?action=deleteCategory&cid=${category.cid}" class="btn btn-success btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                                    </td>
                                    <td>
                                        <c:if test="${not empty category.cimg}">
                                            <img src="${category.cimg}" alt="${category.cname} Image" style="width: 100px; height: auto;">
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty categories}">
                                <tr>
                                    <td colspan="3" class="text-center">No categories found.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <%@include file="main-script.jsp" %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
