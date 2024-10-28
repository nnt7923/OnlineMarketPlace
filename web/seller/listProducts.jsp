<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <%@include file="includes/head.jsp" %>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product List</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
        <link rel="stylesheet" href="css/styles.css">
        <script>
            function loadDetails(productId) {
                var detailRow = document.getElementById("details-" + productId);
                if (detailRow.style.display === "none") {
                    var xhr = new XMLHttpRequest();
                    xhr.open("GET", "product?service=listProductDetailsByProductId&productId=" + productId, true);
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                            detailRow.querySelector(".product-details-container").innerHTML = xhr.responseText;
                            detailRow.style.display = "table-row";
                            detailRow.classList.add('fade-in');
                        }
                    };
                    xhr.send();
                } else {
                    detailRow.style.display = "none";
                }
            }
        </script>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f8f9fc;
            }

            h2 {
                margin: 20px 0;
                text-align: center;
                color: #333;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            th, td {
                padding: 12px;
                text-align: center;
                border: 1px solid #ddd;
            }

            th {
                background-color: #007bff;
                color: white;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #e9ecef;
            }

            img {
                border-radius: 8px;
                transition: transform 0.3s;
            }

            img:hover {
                transform: scale(1.1);
            }

            .btn {
                padding: 8px 12px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .btn-warning {
                background-color: #ffc107;
                color: white;
            }

            .btn-danger {
                background-color: #dc3545;
                color: white;
            }

            .btn:hover {
                opacity: 0.8;
            }

            .product-details-container {
                padding: 10px;
                background-color: #f8f9fc;
                border: 1px solid #ddd;
                border-radius: 4px;
                margin-top: 10px;
            }

            .fade-in {
                animation: fadeIn 0.5s ease-in-out;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }
        </style>
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

                        <h2>Product List</h2>

                        <!-- Display product list -->
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Image</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="product" items="${products}">
                                    <tr>
                                        <td>${product.productId}</td>
                                        <td>
                                            <a href="javascript:void(0);" onclick="loadDetails(${product.productId})">
                                                ${product.name}
                                            </a>
                                        </td>
                                        <td>
                                            <!-- Format price as currency -->
                                            <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                                        </td>
                                        <td><img src="${pageContext.request.contextPath}/${product.img}" width="100" height="100" alt="Product Image"></td>
                                        <td>
                                            <form action="product?service=showEditForm" method="post" style="display:inline-block;">
                                                <input type="hidden" name="productId" value="${product.productId}">
                                                <button type="submit" class="btn btn-warning" onclick="return confirm('Are you sure you want to edit this product?')">Edit</button>
                                            </form>

                                            <form action="product?service=deleteProduct" method="post" style="display:inline-block;">
                                                <input type="hidden" name="productId" value="${product.productId}">
                                                <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this product?')">Delete</button>
                                            </form>
                                        </td>
                                    </tr>

                                    <tr id="details-${product.productId}" style="display:none;">
                                        <td colspan="5">
                                            <div class="product-details-container"></div>
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
    </body>

</html>
