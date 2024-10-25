
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<%@include file="includes/head.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Chi Tiết Sản Phẩm</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="css/login.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    
</head>

<body id="page-top">

    <!-- Page Wrapper -->
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
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h2 class="m-0 font-weight-bold text-primary">Thêm Chi Tiết Sản Phẩm</h2>
                    </div>
                    <div class="card-body">
                        <!-- Form thêm chi tiết sản phẩm -->
                        <form action="product?service=addProductDetail" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="product_id">Chọn sản phẩm:</label>
                                <select name="product_id" id="product_id" class="form-control" required>
                                    <option value="">-- Chọn sản phẩm --</option>
                                    <c:forEach var="product" items="${products}">
                                        <option value="${product.productId}">${product.name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="pdprice_discount">Giá khuyến mãi:</label>
                                <input type="text" name="pdprice_discount" id="pdprice_discount" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label for="pdcolor">Màu sắc:</label>
                                <input type="text" name="pdcolor" id="pdcolor" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label for="pdimg">Hình ảnh:</label>
                                <input type="file" name="pdimg" id="pdimg" class="form-control-file" accept="image/*" multiple required>
                            </div>

                            <div class="form-group">
                                <label for="pdcriteria">Tiêu chí:</label>
                                <input type="text" name="pdcriteria" id="pdcriteria" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label for="pdquantity">Số lượng:</label>
                                <input type="number" name="pdquantity" id="pdquantity" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label for="pddescribe">Mô tả:</label>
                                <textarea name="pddescribe" id="pddescribe" class="form-control" rows="3" required></textarea>
                            </div>

                            <div class="form-group">
                                <label for="pdspecification">Thông số kỹ thuật:</label>
                                <textarea name="pdspecification" id="pdspecification" class="form-control" rows="3" required></textarea>
                            </div>

                            <button type="submit" class="btn btn-primary btn-block">Thêm chi tiết sản phẩm</button>
                        </form>
                    </div>
                </div>
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

