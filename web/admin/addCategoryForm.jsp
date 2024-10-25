<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Category</title>
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
                    <!-- Add New Category Section -->
                    <div class="row">
                        <div class="col-md-8 offset-md-2">
                            <h2>Add New Category</h2>
                            <form action="categories" method="post">
                                <!-- Hidden action field -->
                                <input type="hidden" name="action" value="add">

                                <div class="form-group mb-4">
                                    <label for="cname">Category Name</label>
                                    <input type="text" class="form-control" id="cname" name="cname" required>
                                </div>
                                <div class="form-group mb-4">
                                    <label for="cimg">Category Images</label>
                                    <input type="text" class="form-control" id="cimg" name="cimg" required>
                                </div>

                                <button type="submit" class="btn btn-primary">Add Category</button>
                                <a href="categories" class="btn btn-secondary">Cancel</a>
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
