<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="includes/head.jsp" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller Product Feedback</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fc;
            font-family: Arial, sans-serif;
        }
        h2 {
            color: #32CD32; /* Lime Green */
        }
        .table-primary {
            background-color: #32CD32; /* Lime Green */
            color: white;
        }
        .table-striped > tbody > tr:nth-of-type(odd) {
            background-color: #e8f5e9; /* Light lime green background */
        }
        .table-hover tbody tr:hover {
            background-color: #d4edda; /* Lighter lime green on hover */
        }
        .btn-lime {
            background-color: #32CD32; /* Lime Green */
            color: white;
        }
        .btn-lime:hover {
            background-color: #28a745; /* Slightly darker green on hover */
            color: white;
        }
        .img-thumbnail {
            border-color: #32CD32; /* Lime green border for images */
        }
    </style>
    <script>
        function loadFeedback(productId) {
            window.location.href = "feedbackReply?action=viewFeedback&product_id=" + productId;
        }
    </script>
</head>
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
                <div class="container-fluid">
                    <h2 class="text-center my-4">Your Products</h2>

                    <!-- Product Table -->
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered table-striped align-middle text-center">
                            <thead class="table-primary">
                                <tr>
                                    <th scope="col">Product ID</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">View Feedback</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="product" items="${products}">
                                    <tr>
                                        <td>${product.productId}</td>
                                        <td>${product.name}</td>
                                        <td><fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫" groupingUsed="true"/></td>
                                        <td>
                                            <img src="${pageContext.request.contextPath}/images/${product.img}" class="img-thumbnail" width="100" height="100" alt="Product Image">
                                        </td>
                                        <td>
                                            <button class="btn btn-lime" onclick="loadFeedback(${product.productId})">
                                                <i class="fas fa-comments"></i> View Feedback
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- End of Product Table -->

                </div>
                <!-- End of Page Content -->

                <%@include file="includes/main-script.jsp" %>

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
