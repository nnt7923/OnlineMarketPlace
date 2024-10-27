<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@include file="includes/head.jsp" %>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fruitables - Vegetable Website Template</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
        <link rel="stylesheet" href="css/login.css">
        <!-- SweetAlert from CDN -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f8f9fc;
                margin: 0;
                padding: 0;
            }
            h2 {
                color: #28a745; /* Màu xanh lá cây đậm */
                font-weight: bold;
                margin-bottom: 20px;
            }
            .container-fluid {
                max-width: 800px;
                background-color: white;
                padding: 40px;
                margin: 30px auto;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            }
            label {
                font-weight: 600;
                margin-top: 15px;
                color: #28a745;
            }
            input[type="text"], input[type="number"], select {
                width: 100%;
                padding: 10px;
                margin-top: 5px;
                border: 1px solid #d1d3e2;
                border-radius: 5px;
                box-sizing: border-box;
                font-size: 16px;
                color: #28a745;
            }
            input[type="text"]:focus, input[type="number"]:focus, select:focus {
                border-color: #28a745; /* Màu xanh lá khi focus */
                outline: none;
                box-shadow: 0 0 5px rgba(40, 167, 69, 0.3); /* Hiệu ứng viền xanh lá */
            }
            button[type="submit"] {
                background-color: #28a745; /* Nút màu xanh lá */
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
                background-color: #218838; /* Màu xanh lá đậm hơn khi hover */
            }
            .form-group {
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body id="page-top">

        <!-- Kiểm tra và hiển thị thông báo thành công -->
        <c:if test="${not empty successMessage}">
            <script>
                Swal.fire({
                    icon: 'success',
                    title: 'Thành công',
                    text: '${successMessage}',
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown',
                        backdrop: 'animate__animated animate__fadeIn'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp',
                        backdrop: 'animate__animated animate__fadeOut'
                    },
                    confirmButtonText: 'OK'
                });
            </script>
        </c:if>

        <!-- Kiểm tra và hiển thị thông báo lỗi -->
        <c:if test="${not empty errorMessage}">
            <script>
                Swal.fire({
                    icon: 'error',
                    title: 'Lỗi',
                    text: '${errorMessage}',
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown',
                        backdrop: 'animate__animated animate__fadeIn'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp',
                        backdrop: 'animate__animated animate__fadeOut'
                    },
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

                        <h2>Thêm Sản Phẩm</h2>

                        <!-- Form thêm sản phẩm -->
                        <form action="product?service=addProduct" method="post" enctype="multipart/form-data" >
                            <div class="form-group">
                                <label for="name">Tên sản phẩm:</label>
                                <input type="text" id="name" name="name" required>
                            </div>

                            <div class="form-group">
                                <label for="price">Giá:</label>
                                <input type="number" id="price" name="price" step="0.01" required>
                            </div>

                            <div class="form-group">
                                <label for="title">Tiêu đề:</label>
                                <input type="text" id="title" name="title" required>
                            </div>

                            <div class="form-group">
                                <label for="category">Danh mục:</label>
                                <select id="category" name="cateID" required>
                                    <option value="">-- Chọn danh mục --</option>
                                    <c:forEach var="category" items="${categories}">
                                        <option value="${category.cid}">${category.cname}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="brand">Thương hiệu:</label>
                                <select id="brand" name="brand_id" required>
                                    <option value="">-- Chọn thương hiệu --</option>
                                    <c:forEach var="brand" items="${brands}">
                                        <option value="${brand.brandId}">${brand.brandName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="img">Đường dẫn ảnh sản phẩm:</label>
                                <input type="file" id="img" name="img"  required>
                            </div>

                            <button type="submit">Thêm sản phẩm</button>
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
