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

                    <h2>Danh sách chi tiết sản phẩm của bạn</h2>

                    <table border="1" style="width:100%; border-collapse: collapse;">
                        <thead>
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
                                        <a href="product?action=editForm&pd_id=${productDetail.pdId}">Sửa</a>
                                        <a href="product?action=delete&pd_id=${productDetail.pdId}" onclick="return confirm('Bạn có chắc muốn xóa không?');">Xóa</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

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
