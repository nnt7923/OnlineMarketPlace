<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Category</title>
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
                    <div class="row">
                        <div class="col-md-8 offset-md-2">
                            <h2>Edit Category</h2>

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

                            <form action="categories" method="post">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="cid" value="${category.cid}">
                                <div class="form-group mb-3">
                                    <label for="cname">Category Name</label>
                                    <input type="text" class="form-control" id="cname" name="cname" value="${category.cname}" required>
                                </div>
                                <div class="form-group mb-3">
                                    <label for="cimg">Category Images</label>
                                    <input type="text" class="form-control" id="cimg" name="cimg" value="${category.cimg}" required>
                                </div>
                                <button type="submit" class="btn btn-primary">Update Category</button>
                                <a href="categories" class="btn btn-secondary">Cancel</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="main-script.jsp" %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
