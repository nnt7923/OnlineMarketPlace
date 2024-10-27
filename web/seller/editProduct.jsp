<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%@include file="includes/head.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa sản phẩm</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="css/login.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
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
                    <h2>Chỉnh sửa sản phẩm</h2>

                    <!-- Form chỉnh sửa sản phẩm -->
                    <form action="product?service=update" method="post" enctype="multipart/form-data">
                        <!-- ID sản phẩm -->
                        <input type="hidden" name="productId" value="${product.productId}">

                        <!-- Tên sản phẩm -->
                        <div class="form-group">
                            <label for="name">Tên sản phẩm:</label>
                            <input type="text" id="name" name="name" value="${product.name}" required>
                        </div>

                        <!-- Giá sản phẩm -->
                        <div class="form-group">
                            <label for="price">Giá:</label>
                            <input type="number" id="price" name="price" step="0.01" value="${product.price}" required>
                        </div>

                        <!-- Tiêu đề -->
                        <div class="form-group">
                            <label for="title">Tiêu đề:</label>
                            <input type="text" id="title" name="title" value="${product.title}" required>
                        </div>

                        <!-- Chọn danh mục -->
                        <div class="form-group">
                            <label for="category">Chọn danh mục:</label>
                            <select id="category" name="cateID" required>
                                <option value="">-- Chọn danh mục --</option>
                                <c:forEach var="category" items="${categories}">
                                    <option value="${category.cid}" <c:if test="${category.cid == product.cateID}">selected</c:if>>${category.cname}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Chọn thương hiệu -->
                        <div class="form-group">
                            <label for="brand">Chọn thương hiệu:</label>
                            <select id="brand" name="brand_id" required>
                                <option value="">-- Chọn thương hiệu --</option>
                                <c:forEach var="brand" items="${brands}">
                                    <option value="${brand.brandId}" <c:if test="${brand.brandId == product.brandId}">selected</c:if>>${brand.brandName}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Chọn ảnh sản phẩm mới (nếu có) -->
                        <div class="form-group">
                            <label for="img">Chọn ảnh mới (nếu có):</label>
                            <input type="file" id="img" name="img" accept="image/*">
                            <br>
                            <img src="${product.img}" width="100" height="100" alt="Ảnh hiện tại">
                            <!-- Lưu ảnh hiện tại -->
                            <input type="hidden" name="currentImg" value="${product.img}">
                        </div>

                        <!-- Nút cập nhật sản phẩm -->
                        <button type="submit">Cập nhật sản phẩm</button>
                    </form>
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
