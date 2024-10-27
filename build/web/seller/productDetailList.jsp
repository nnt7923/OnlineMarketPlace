<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

<%@include file="includes/head.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách chi tiết sản phẩm của Seller</title>
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

                    <h2 class="my-4">Danh sách chi tiết sản phẩm của bạn</h2>

                    <table class="table table-bordered table-striped table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>ID</th>
                                <th>Tên sản phẩm</th>
                                <th>Giá khuyến mãi</th>
                                <th>Màu sắc</th>
                                <th>Hình ảnh</th>
                                <th>Tiêu chí</th>
                                <th>Số lượng</th>
                                <th>Mô tả</th>
                                <th>Thông số kỹ thuật</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="productDetail" items="${productDetailsList}">
                                <tr>
                                    <td>${productDetail.pdId}</td>
                                    <td>${productDetail.pdname}</td>
                                    <td>${productDetail.pdpriceDiscount}</td>
                                    <td>${productDetail.pdcolor}</td>
                                    <td><img src="${productDetail.pdimg}" alt="Hình ảnh sản phẩm" width="100"></td>
                                    <td>${productDetail.pdcriteria}</td>
                                    <td>${productDetail.pdquantity}</td>
                                    <td>${productDetail.pddescribe}</td>
                                    <td>${productDetail.pdspecification}</td>
                                    <td>
                                        <a href="product?action=editForm&pd_id=${productDetail.pdId}" class="btn btn-warning btn-sm">Sửa</a>
                                        <!--<a href="product?action=delete&pd_id=${productDetail.pdId}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa không?');">Xóa</a>-->
                                              <form action="product?service=delete" method="post" style="display:inline-block;">
                                            <input type="hidden" name="pd_id" value="${productDetail.pdId}">
                                            <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')">Xóa</button>
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
