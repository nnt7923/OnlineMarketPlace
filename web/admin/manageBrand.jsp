<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Brands</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-mQ93VtyU4kkjAN/fQinwNMeWj/zLM4bqMDiyEJj0e5eG1zqO2BzOjJywqI+kkt9T" crossorigin="anonymous">
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
                <c:if test="${not empty success}">
                                <div class="alert alert-success">
                                    ${success}
                                </div>
                            </c:if>
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger">
                                    ${error}
                                </div>
                            </c:if>
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Brand Management Section -->

                    <!-- Search Form -->
                    <div class="search-container d-flex justify-content-between mb-3">
                        <form class="d-flex" action="brands" method="get">
                            <input class="form-control me-2" type="text" name="keyword" placeholder="Search by brand name">
                            <input type="hidden" name="action" value="search">
                            <button class="btn btn-primary" type="submit">Search</button>
                        </form>
                        <a href="brands?action=addForm" class="btn btn-success">Add New Brand</a>
                    </div>

                    <!-- Brands Table -->
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Brand Name</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="brand" items="${brands}">
                                <tr>
                                    <td>${brand.brandName}</td>
                                    <td>
                                        <a href="brands?action=updateForm&brand_id=${brand.brandId}" class="btn btn-success btn-sm">Edit</a>
                                        <a href="brands?action=deleteBrand&brand_id=${brand.brandId}" class="btn btn-success btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty brands}">
                                <tr>
                                    <td colspan="3" class="text-center">No brands found.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
                <!-- End Page Content -->

            </div>
            <!-- End of Main Content -->

        </div>
        <!-- End of Content Wrapper -->

        <%@include file="main-script.jsp" %>

    </div>
    <!-- End of Page Wrapper -->

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
