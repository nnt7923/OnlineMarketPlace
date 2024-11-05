<%-- 
    Document   : orderstatus
    Created on : Nov 1, 2024, 9:48:53 AM
    Author     : Admin
--%>
<%@ taglib prefix="currency" uri="/WEB-INF/currency.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Manage Order | Seller</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

        <style>
            /* Nút quản lý */
            .btn .btn-management {
                display: flex;
                justify-content: center;
                height: 100%;
                width: 100%;
                font-size: 16px;
                font-weight: bold;
                color: white;
                background-color: #4CAF50; /* Màu xanh lá cây */
                border: none;
                border-radius: 8px;
                padding: 10px;
                transition: background-color 0.3s ease;
            }

            .btn-management:hover {
                background-color: #45a049; /* Màu đậm hơn khi hover */
            }

            /* Biểu tượng trong nút */
            .btn-management .icon {
                margin-right: 8px;
                font-size: 18px;
            }

        </style>
    </head>

    <body>
        <%@include file="includes/head.jsp" %>
        <div id="wrapper">
            <%@include file="includes/sidebar.jsp" %>
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <%@include file="includes/topbar.jsp" %>
                    <div class="container-fluid">
                        <div onload="time()">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="app-title">
                                        <ul class="app-breadcrumb breadcrumb">
                                            <li class="breadcrumb-item"><a href="orderstatus"><b style="font-size: 17px">Order Status</b></a></li>
                                        </ul>
                                        <div id="clock"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <!--Right-->

                                <div class="col-md-12 col-lg-4">
                                    <div class="row">
                                        <!-- col-6 -->
                                        <div class="col-md-12">
                                            <div class="widget-small info coloured-icon"><i class='icon bx bxs-data fa-3x'></i>
                                                <div class="info">
                                                    <a href="product?service=list">
                                                        <h4>Total Products</h4>
                                                    </a>
                                                    <p><b>${totalProducts} product</b></p>
                                                    <c:if test="${not empty errorMessage}">
                                                        <p>Error: ${errorMessage}</p>
                                                    </c:if>
                                                    <p class="info-tong">Total number of products managed.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="widget-small warning coloured-icon"><i class='icon bx bxs-shopping-bags fa-3x'></i>
                                                <div class="info">
                                                    <h4>Total Orders</h4>
                                                    <p><b>${totalOrders} orders</b></p>
                                                    <c:if test="${not empty errorMessage}">
                                                        <p>Error: ${errorMessage}</p>
                                                    </c:if>
                                                    <p class="info-tong">Total Sales Invoices.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="widget-small danger coloured-icon"><i class='icon bx bxs-error-alt fa-3x'></i>
                                                <div class="info">
                                                    <h4>Out of stock</h4>
                                                    <p><b>${outOfStockCount} orders</b></p>
                                                    <c:if test="${not empty errorMessage}">
                                                        <p>Error: ${errorMessage}</p>
                                                    </c:if>
                                                    <p class="info-tong">Number of products that are out of stock and need to be restocked.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>



                                </div>
                                <div class="col-md-12 col-lg-8">
                                    <div class="row">
                                        <!-- col-12 -->
                                        <div class="col-md-12">
                                            <div class="tile">
                                                <h3 class="tile-title">Order Tracking</h3>
                                                <button type="button" class="btn btn-add btn-sm" onclick="window.location.href = 'ordermanagement'">
                                                    <i class="fas fa-tasks icon"></i>
                                                    Click To Management
                                                </button>                                                
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Order ID</th>
                                                            <th>Customer Name</th>
                                                            <th>Total Amount</th>
                                                            <th>Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="order" items="${orderList}">
                                                            <tr>
                                                                <td>${order.orderId}</td>
                                                                <td>${order.shipping.name}</td>
                                                                <td><currency:formatCurrency value="${order.totalPrice}"/></td>
                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${order.status.id == 2}">
                                                                            <span class="badge bg-warning">${order.status.name}</span>
                                                                        </c:when>
                                                                        <c:when test="${order.status.id == 6}">
                                                                            <span class="badge bg-danger">${order.status.name}</span>
                                                                        </c:when>
                                                                        <c:when test="${order.status.name == 'In delivery'}">
                                                                            <span class="badge bg-primary">${order.status.name}</span>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <span class="badge bg-info">${order.status.name}</span>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-12 col-md-5"></div>
                                                <div class="col-sm-12 col-md-7">
                                                    <div class="dataTables_paginate paging_simple_numbers" id="sampleTable_paginate">
                                                        <ul class="pagination">

                                                            <!-- Previous Page Button -->
                                                            <c:if test="${currentPage > 1}">
                                                                <li class="paginate_button page-item previous">
                                                                    <a href="orderstatus?page=${currentPage - 1}" class="page-link">Previous</a>
                                                                </li>
                                                            </c:if>

                                                            <!-- First Page Link -->
                                                            <li class="paginate_button page-item ${currentPage == 1 ? 'active' : ''}">
                                                                <a href="orderstatus?page=1" class="page-link">1</a>
                                                            </li>

                                                            <!-- Show "..." if current page is beyond page 4 -->
                                                            <c:if test="${currentPage > 4}">
                                                                <li class="paginate_button page-item disabled">
                                                                    <a href="#" class="page-link">...</a>
                                                                </li>
                                                            </c:if>

                                                            <!-- Display middle pages (current page - 1, current page, current page + 1) -->
                                                            <c:forEach var="i" begin="${currentPage - 1}" end="${currentPage + 1}">
                                                                <c:if test="${i > 1 && i < totalPages}">
                                                                    <li class="paginate_button page-item ${currentPage == i ? 'active' : ''}">
                                                                        <a href="orderstatus?page=${i}" class="page-link">${i}</a>
                                                                    </li>
                                                                </c:if>
                                                            </c:forEach>

                                                            <!-- Show "..." if current page is less than totalPages - 3 -->
                                                            <c:if test="${currentPage < totalPages - 3}">
                                                                <li class="paginate_button page-item disabled">
                                                                    <a href="#" class="page-link">...</a>
                                                                </li>
                                                            </c:if>

                                                            <!-- Last Page Link -->
                                                            <li class="paginate_button page-item ${currentPage == totalPages ? 'active' : ''}">
                                                                <a href="orderstatus?page=${totalPages}" class="page-link">${totalPages}</a>
                                                            </li>

                                                            <!-- Next Page Button -->
                                                            <c:if test="${currentPage < totalPages}">
                                                                <li class="paginate_button page-item next">
                                                                    <a href="orderstatus?page=${currentPage + 1}" class="page-link">Next</a>
                                                                </li>
                                                            </c:if>

                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </main>

                </div>

            </div>

        </div>

    </div>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
    <script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/pace.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/plugins/chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

    <script type="text/javascript">
                                                    var data = {
                                                        labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6"],
                                                        datasets: [{
                                                                label: "Dữ liệu đầu tiên",
                                                                fillColor: "rgba(255, 213, 59, 0.767), 212, 59)",
                                                                strokeColor: "rgb(255, 212, 59)",
                                                                pointColor: "rgb(255, 212, 59)",
                                                                pointStrokeColor: "rgb(255, 212, 59)",
                                                                pointHighlightFill: "rgb(255, 212, 59)",
                                                                pointHighlightStroke: "rgb(255, 212, 59)",
                                                                data: [20, 59, 90, 51, 56, 100]
                                                            },
                                                            {
                                                                label: "Dữ liệu kế tiếp",
                                                                fillColor: "rgba(9, 109, 239, 0.651)  ",
                                                                pointColor: "rgb(9, 109, 239)",
                                                                strokeColor: "rgb(9, 109, 239)",
                                                                pointStrokeColor: "rgb(9, 109, 239)",
                                                                pointHighlightFill: "rgb(9, 109, 239)",
                                                                pointHighlightStroke: "rgb(9, 109, 239)",
                                                                data: [48, 48, 49, 39, 86, 10]
                                                            }
                                                        ]
                                                    };
                                                    var ctxl = $("#lineChartDemo").get(0).getContext("2d");
                                                    var lineChart = new Chart(ctxl).Line(data);

                                                    var ctxb = $("#barChartDemo").get(0).getContext("2d");
                                                    var barChart = new Chart(ctxb).Bar(data);
    </script>
    <script type="text/javascript">
        //Thời Gian
        function time() {
            var today = new Date();
            var weekday = new Array(7);
            weekday[0] = "Chủ Nhật";
            weekday[1] = "Thứ Hai";
            weekday[2] = "Thứ Ba";
            weekday[3] = "Thứ Tư";
            weekday[4] = "Thứ Năm";
            weekday[5] = "Thứ Sáu";
            weekday[6] = "Thứ Bảy";
            var day = weekday[today.getDay()];
            var dd = today.getDate();
            var mm = today.getMonth() + 1;
            var yyyy = today.getFullYear();
            var h = today.getHours();
            var m = today.getMinutes();
            var s = today.getSeconds();
            m = checkTime(m);
            s = checkTime(s);
            nowTime = h + " giờ " + m + " phút " + s + " giây";
            if (dd < 10) {
                dd = '0' + dd;
            }
            if (mm < 10) {
                mm = '0' + mm;
            }
            today = day + ', ' + dd + '/' + mm + '/' + yyyy;
            tmp = '<span class="date"> ' + today + ' - ' + nowTime +
                    '</span>';
            document.getElementById("clock").innerHTML = tmp;
            clocktime = setTimeout("time()", "1000", "Javascript");

            function checkTime(i) {
                if (i < 10) {
                    i = "0" + i;
                }
                return i;
            }
        }
    </script>
</body>

</html>
