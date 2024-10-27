<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<%@include file="includes/head.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller's Product Details List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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

                    <h2 class="my-4">Your Product Details List</h2>

                    <table class="table table-bordered table-striped table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>ID</th>
                                <th>Product Name</th>
                                <th>Discount Price</th>
                                <th>Color</th>
                                <th>Image</th>
                                <th>Criteria</th>
                                <th>Quantity</th>
                                <th>Description</th>
                                <th>Specification</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="productDetail" items="${productDetailsList}">
                                <tr>
                                    <td>${productDetail.pdId}</td>
                                    <td>${productDetail.pdname}</td>
                                    <td>${productDetail.pdpriceDiscount}</td>
                                    <td>${productDetail.pdcolor}</td>
                                    <td><img src="${productDetail.pdimg}" alt="Product Image" width="100"></td>
                                    <td>${productDetail.pdcriteria}</td>
                                    <td>${productDetail.pdquantity}</td>
                                    <td>${productDetail.pddescribe}</td>
                                    <td>${productDetail.pdspecification}</td>
                                    <td>
                                        <form action="product?service=updateProductDetailForm" method="post" style="display:inline-block;">
                                            <input type="hidden" name="pd_id" value="${productDetail.pdId}">
                                            <button type="submit" class="btn btn-warning btn-sm" onclick="return confirm('Are you sure you want to edit this product?')">Edit</button>
                                        </form>
                                        <form action="product?service=delete" method="post" style="display:inline-block;">
                                            <input type="hidden" name="pd_id" value="${productDetail.pdId}">
                                            <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this product?')">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>
                <!-- End of Main Content -->

                <%@include file="includes/main-script.jsp" %>

                

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

    </div>

    <!-- Bootstrap and necessary plugins -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

</html>
