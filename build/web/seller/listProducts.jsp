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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
        <style>
            body {
                background-color: #e8f4ff; /* Light pastel blue background */
                font-family: Arial, sans-serif;
            }

            h2 {
                color: #32CD32; /* Lime green for the header */
                margin-top: 20px;
                font-weight: bold;
            }

            .product-table {
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                margin-top: 20px;
                border-radius: 10px;
                overflow: hidden;
                background-color: #ffffff; /* White background for better color contrast */
            }

            .table th {
                background-color: #32CD32; /* Lime green for header background */
                color: #ffffff;
                text-align: center;
                vertical-align: middle;
            }

            .table td, .table th {
                padding: 12px;
                vertical-align: middle;
                text-align: center;
            }

            .product-details-container {
                padding: 15px;
                background-color: #ffffff;
                border: 1px solid #e2e6ea;
                border-radius: 10px;
                margin-top: 10px;
                animation: fadeIn 0.5s ease-in-out;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            .btn-primary, .btn-warning, .btn-danger {
                font-size: 0.9rem;
                padding: 6px 12px;
                border-radius: 20px;
                transition: transform 0.2s ease-in-out;
            }

            .btn-warning {
                background-color: #32CD32; /* Lime green for edit button */
                border: none;
            }

            .btn-danger {
                background-color: #ff3860; /* Bright red for delete button */
                border: none;
            }

            .btn:hover {
                transform: scale(1.05);
                opacity: 0.9;
            }

            .fade-in {
                animation: fadeIn 0.5s ease-in-out;
            }

            @keyframes fadeIn {
                from { opacity: 0; }
                to { opacity: 1; }
            }
        </style>
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
                        }
                    };
                    xhr.send();
                } else {
                    detailRow.style.display = "none";
                }
            }
        </script>
    </head>

    <body id="page-top">
        <div id="wrapper">

            <!-- Sidebar -->
            <%@include file="includes/sidebar.jsp" %>

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">
                    <%@include file="includes/topbar.jsp" %>

                    <div class="container-fluid">

                        <h2 class="text-center">Product List</h2>

                        <!-- Display product list -->
                        <div class="table-responsive">
                            <table class="table table-hover table-striped product-table align-middle">
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
                                                <a href="javascript:void(0);" class="text-decoration-none text-primary fw-bold" onclick="loadDetails(${product.productId})">
                                                    ${product.name}
                                                </a>
                                            </td>
                                            <td>
                                                <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                                            </td>
                                            <td>
                                                <img src="${pageContext.request.contextPath}/images/${product.img}" width="70" height="70" class="rounded img-fluid" alt="Product Image">
                                            </td>
                                            <td>
                                                <div class="d-flex gap-2 justify-content-center">
                                                    <form action="product?service=showEditForm" method="post">
                                                        <input type="hidden" name="productId" value="${product.productId}">
                                                        <button type="submit" class="btn btn-warning btn-sm" onclick="return confirm('Are you sure you want to edit this product?')">
                                                            <i class="fas fa-edit"></i> Edit
                                                        </button>
                                                    </form>

                                                    <form action="product?service=deleteProduct" method="post">
                                                        <input type="hidden" name="productId" value="${product.productId}">
                                                        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this product?')">
                                                            <i class="fas fa-trash-alt"></i> Delete
                                                        </button>
                                                    </form>
                                                </div>
                                            </td>
                                        </tr>

                                        <!-- Hidden Details Row -->
                                        <tr id="details-${product.productId}" style="display:none;">
                                            <td colspan="5">
                                                <div class="product-details-container"></div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                    </div>
                    <%@include file="includes/main-script.jsp" %>

                </div>
                <!-- End of Content Wrapper -->

            </div>
            <!-- End of Page Wrapper -->

        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
    </body>

</html>
