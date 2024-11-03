<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="includes/head.jsp" %>
        <title>Edit Product Detail</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f6f9;
                margin: 0;
                padding: 0;
                color: #333;
            }
            .container-fluid {
                max-width: 800px;
                background-color: white;
                padding: 40px;
                margin: 30px auto;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            }
            h2 {
                color: #28a745;
                font-weight: bold;
                margin-bottom: 20px;
                text-align: center;
            }
            .form-group {
                margin-bottom: 20px;
            }
            label {
                font-weight: bold;
                color: #28a745;
                display: block;
                margin-bottom: 5px;
            }
            input[type="text"], input[type="number"], textarea, input[type="file"] {
                width: 100%;
                padding: 10px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
                color: #333;
                transition: border-color 0.3s;
            }
            input[type="text"]:focus, input[type="number"]:focus, textarea:focus {
                border-color: #28a745;
                outline: none;
                box-shadow: 0 0 5px rgba(40, 167, 69, 0.3);
            }
            button[type="submit"] {
                background-color: #28a745;
                color: white;
                padding: 12px 20px;
                margin-top: 20px;
                width: 100%;
                border: none;
                border-radius: 5px;
                font-size: 18px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }
            button[type="submit"]:hover {
                background-color: #218838;
            }
            .alert {
                padding: 15px;
                margin-bottom: 20px;
                border-radius: 5px;
            }
            .alert-success {
                background-color: #d4edda;
                color: #155724;
                border: 1px solid #c3e6cb;
            }
            .alert-danger {
                background-color: #f8d7da;
                color: #721c24;
                border: 1px solid #f5c6cb;
            }
            .current-images img {
                margin: 5px;
                border-radius: 5px;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
            }
        </style>
    </head>
    <body id="page-top">

        <!-- Success and Error Messages with SweetAlert -->
        <c:if test="${not empty successMessage}">
            <script>
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: '${successMessage}',
                    confirmButtonText: 'OK'
                });
            </script>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <script>
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: '${errorMessage}',
                    confirmButtonText: 'OK'
                });
            </script>
        </c:if>

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
                        <h2>Edit Product Detail</h2>

                        <!-- Product Detail Edit Form -->
                        <form action="product?service=update" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="pd_id" value="${productDetail.id}">

                            <div class="form-group">
                                <label for="pdprice_discount">Discount Price:</label>
                                <input type="text" id="pdprice_discount" name="pdprice_discount" value="${productDetail.priceDiscount}">
                            </div>

                            <div class="form-group">
                                <label for="pdcolor">Color:</label>
                                <input type="text" id="pdcolor" name="pdcolor" value="${productDetail.color}">
                            </div>

                            <div class="form-group">
                                <label for="pdcriteria">Criteria:</label>
                                <input type="text" id="pdcriteria" name="pdcriteria" value="${productDetail.criteria}">
                            </div>

                            <div class="form-group">
                                <label for="pdquantity">Quantity:</label>
                                <input type="number" id="pdquantity" name="pdquantity" value="${productDetail.quantity}">
                            </div>

                            <div class="form-group">
                                <label for="pddescribe">Description:</label>
                                <textarea id="pddescribe" name="pddescribe" rows="4">${productDetail.describe}</textarea>
                            </div>

                            <div class="form-group">
                                <label for="pdspecification">Specification:</label>
                                <textarea id="pdspecification" name="pdspecification" rows="4">${productDetail.specification}</textarea>
                            </div>

                            <!-- Existing Images -->
                            <div class="form-group">
                                <label>Current Images:</label>
                                <div class="current-images">
                                    <c:forEach var="imgPath" items="${productDetail.image}">
                                        <img src="${pageContext.request.contextPath}/images/${imgPath}" width="100px" alt="Current Image">
                                    </c:forEach>
                                </div>
                            </div>

                            <!-- New Image Uploads -->
                            <div class="form-group">
                                <label for="pdimg">Add New Images:</label>
                                <input type="file" id="pdimg" name="pdimg" multiple>
                            </div>

                            <button type="submit">Update</button>
                        </form>
                    </div>
                    <!-- End of Main Content -->

                    <%@include file="includes/main-script.jsp" %>

                    <!-- Footer -->
                    <%@include file="includes/footer.jsp" %>
                    <!-- End of Footer -->

                </div>
                <!-- End of Content Wrapper -->

            </div>
            <!-- End of Page Wrapper -->

        </div>
    </body>
</html>
