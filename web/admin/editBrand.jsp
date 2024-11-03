<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Brand</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-mQ93VtyU4kkjAN/fQinwNMeWj/zLM4bqMDiyEJj0e5eG1zqO2BzOjJywqI+kkt9T" crossorigin="anonymous">
    <!-- Google Fonts -->
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
                    <!-- Edit Brand Section -->
                    <div class="row">
                        <div class="col-md-8 offset-md-2">
                            <h2>Edit Brand</h2>
                            
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
                            <form action="brands" method="post">
                                <!-- Hidden action and brand ID fields -->
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="brand_id" value="${brand.brandId}">

                                <div class="form-group mb-3">
                                    <label for="brandName" class="form-label">Brand Name</label>
                                    <input type="text" class="form-control" id="brandName" name="brandName" value="${brand.brandName}" required>
                                </div>

                                <button type="submit" class="btn btn-primary">Update Brand</button>
                                <a href="brands" class="btn btn-secondary">Cancel</a>
                            </form>
                        </div>
                    </div>
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
