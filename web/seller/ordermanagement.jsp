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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">

        <!-- Tải jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Tải Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- Tải Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

    </head>
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
                        <main>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="app-title">
                                        <ul class="app-breadcrumb breadcrumb">
                                            <li class="breadcrumb-item"><a href="orderstatus"><b style="font-size: 17px">Order Status</b></a></li>
                                            <li class="breadcrumb-item"><a href="ordermanagement"><b style="font-size: 17px">Order Management</b></a></li>
                                        </ul>
                                        <div id="clock"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <!--Right-->
                                <div class="col-md-12 col-lg-12">
                                    <div class="row">
                                        <div class="tile">
                                            <h3 class="tile-title">Order Management</h3>
                                            <div id="sampleTable_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
                                                <div class="row">
                                                    <div class="col-sm-12 col-md-4">
                                                        <div class="dataTables_length" id="sampleTable_length">
                                                            <form id="frmsearch" method="POST" action="ordermanagement">
                                                                <input type="hidden" name="action" value="Filter" />
                                                                <label style="margin-top: 0px">
                                                                    <label style="font-size: 16px ">Status: </label>
                                                                    <select class="form-control" id="exampleSelect1" style="height: 36px; width: 80% " name="statusId" onchange="updateFilter(event)">
                                                                        <option value="0">All</option>
                                                                        <c:forEach items="${status}" var="status">
                                                                            <option value="${status.id}" ${param.statusId == status.id ? 'selected' : ''}>
                                                                                ${status.name}
                                                                            </option>
                                                                        </c:forEach>
                                                                    </select>
                                                                    <input type="submit" value="Lọc" class="btn btn-add" />
                                                                </label>
                                                            </form>

                                                        </div>
                                                    </div>
                                                    <div class="col-sm-12 col-md-8">
                                                        <form id="frmsearch" method="post" action="ordermanagement" onsubmit="updateSearch(event)">
                                                            <div id="sampleTable_filter" class="dataTables_filter">
                                                                <label style="width: 40%">Search:
                                                                    <input style="width: 80%" type="text" class="form-control" id="searchQuery" name="searchQuery" 
                                                                           value="${param.searchQuery}" placeholder="Search by id, customer name, date">
                                                                </label>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <table class="table table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                                                            <thead>
                                                                <tr role="row">
                                                                    <th class="sorting">Order ID</th>
                                                                    <th class="sorting">Customer Name</th>
                                                                    <th class="sorting">Total Amount</th>
                                                                    <th class="sorting">Order time</th>
                                                                    <th class="sorting">Status</th>
                                                                    <th class="sorting">Actions</th>
                                                                    <th class="sorting">Function Button</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="order" items="${orderList}">
                                                                    <tr>
                                                                        <td>${order.orderId}</td>
                                                                        <td>${order.shipping.name}</td>
                                                                        <td><currency:formatCurrency value="${order.totalPrice}" /></td>
                                                                        <td>${order.ordertime}</td>
                                                                        <td>
                                                                            <c:choose>
                                                                                <c:when test="${order.status.name == 'Preparing Goods'}">
                                                                                    <span class="badge bg-warning">${order.status.name}</span>
                                                                                </c:when>
                                                                                <c:when test="${order.status.name == 'Cancelled'}">
                                                                                    <span class="badge bg-danger">${order.status.name}</span>
                                                                                </c:when>
                                                                                <c:when test="${order.status.name == 'Delivered'}">
                                                                                    <span class="badge bg-success">${order.status.name}</span>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <span class="badge bg-info">${order.status.name}</span>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                            <c:if test="${order.status.name == 'Awaiting Confirmation'}">
                                                                                <button class="btn btn-primary btn-sm quick-confirm" type="button" title="Quick Confirm" 
                                                                                        data-id="${order.orderId}" data-status-id="2">
                                                                                    <i class="fas fa-check"></i>
                                                                                </button>
                                                                            </c:if>
                                                                        </td>
                                                                        <td>
                                                                            <button style="width: 100%" class="btn btn-success btn-sm accept" type="button" title="Confirm Order" 
                                                                                    data-id="${order.orderId}" data-status-id="${order.status.id}" data-status-name="${order.status.name}"
                                                                                    data-toggle="modal" data-target="#confirmOrderModal" 
                                                                                    onclick="setOrderId(${order.orderId}, ${order.status.id}, '${order.status.name}')">
                                                                                <i class="fas fa-clipboard-check"></i>
                                                                            </button>
                                                                        </td>



                                                                        <td>
                                                                            <c:if test="${order.status.name != 'Cancelled'}">
                                                                                <button class="btn btn-danger btn-sm trash quick-cancel" type="button" title="Cancel Order" data-id="${order.orderId}" data-status-id="6">
                                                                                    <i class="fas fa-ban"></i>
                                                                                </button>
                                                                            </c:if>

                                                                            <button class="btn btn-info btn-sm eye" type="button" title="Purchase Order" 
                                                                                    onclick="window.location.href = 'orderpurchase?orderId=${order.orderId}'"
                                                                                    data-id="${order.orderId}">
                                                                                <i class="fas fa-eye"></i> Purchase Order
                                                                            </button>

                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>          
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>


                        <!-- Confirm Order Modal -->
                        <div class="modal fade" id="confirmOrderModal" tabindex="-1" role="dialog" aria-labelledby="confirmOrderModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="confirmOrderModalLabel">Xác nhận trạng thái đơn hàng</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="confirmOrderForm">
                                            <input type="hidden" id="orderIdInput" name="orderId" value="${order.orderId}">
                                            <div class="form-group">
                                                <label for="statusSelect">Option To Change Order Status</label>
                                                <select class="form-control" id="statusSelect" name="statusId">
                                                    <c:forEach var="status" items="${status}">
                                                        <option value="${status.id}" ${order.status.id == status.id ? 'selected' : ''}>
                                                            ${status.name}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <button type="button" class="btn btn-success" id="confirmStatusButton">Confirm</button>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-sm-12 col-md-5"></div>
                            <div class="col-sm-12 col-md-7">
                                <div class="dataTables_paginate paging_simple_numbers" id="sampleTable_paginate">
                                    <ul class="pagination">
                                        <!-- Previous Page Button -->
                                        <c:if test="${currentPage > 1}">
                                            <li class="paginate_button page-item previous">
                                                <a href="ordermanagement?page=${currentPage - 1}&statusId=${param.statusId}&searchQuery=${param.searchQuery}" class="page-link">Previous</a>
                                            </li>
                                        </c:if>

                                        <!-- First Page Link -->
                                        <li class="paginate_button page-item ${currentPage == 1 ? 'active' : ''}">
                                            <a href="ordermanagement?page=1&statusId=${param.statusId}&searchQuery=${param.searchQuery}" class="page-link">1</a>
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
                                                    <a href="ordermanagement?page=${i}&statusId=${param.statusId}&searchQuery=${param.searchQuery}" class="page-link">${i}</a>
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
                                            <a href="ordermanagement?page=${totalPages}&statusId=${param.statusId}&searchQuery=${param.searchQuery}" class="page-link">${totalPages}</a>
                                        </li>

                                        <!-- Next Page Button -->
                                        <c:if test="${currentPage < totalPages}">
                                            <li class="paginate_button page-item next">
                                                <a href="ordermanagement?page=${currentPage + 1}&statusId=${param.statusId}&searchQuery=${param.searchQuery}" class="page-link">Next</a>
                                            </li>
                                        </c:if>
                                    </ul>


                                </div>
                            </div>
                        </div>
                        <a class="btn btn-warning " data-dismiss="modal" href="orderstatus">◀ Come Back</a>

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

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script type="text/javascript">
                                                                                        function updateFilter(event) {
                                                                                            event.preventDefault();
                                                                                            var searchValue = document.querySelector('input[name="statusId"]').value;

                                                                                            var statusId = document.getElementById('exampleSelect1').value;
                                                                                            var pageIndex = 1;

                                                                                            var newUrl = "ordermanagement?&page=" + encodeURIComponent(pageIndex) + "&statusId=" + encodeURIComponent(statusId) + "&searchQuery=" + encodeURIComponent(searchValue);

                                                                                            history.pushState({path: newUrl}, '', newUrl);

                                                                                            window.location.href = newUrl;

                                                                                        }

                                                                                        function updateSearch(event) {
                                                                                            event.preventDefault(); // Ngăn chặn hành vi mặc định của form
                                                                                            var searchValue = document.querySelector('input[name="searchQuery"]').value; // Lấy giá trị tìm kiếm

                                                                                            // Lấy statusId và pageIndex từ các phần tử hiện tại hoặc biến toàn cục
                                                                                            var statusId = document.getElementById('exampleSelect1').value; // ID của select status
                                                                                            var pageIndex = 1; // Thay đổi giá trị này nếu bạn cần truy cập trang hiện tại

                                                                                            if (searchValue) {
                                                                                                var newUrl = "ordermanagement?&page=" + encodeURIComponent(pageIndex) + "&statusId=" + encodeURIComponent(statusId) + "&searchQuery=" + encodeURIComponent(searchValue);

                                                                                                history.pushState({path: newUrl}, '', newUrl);

                                                                                                window.location.href = newUrl;
                                                                                            } else {
                                                                                                Swal.fire({
                                                                                                    icon: 'error',
                                                                                                    title: 'Fail!',
                                                                                                    text: 'Please enter search keywords',
                                                                                                    showConfirmButton: false,
                                                                                                    timer: 1000
                                                                                                });
                                                                                            }
                                                                                        }


                                                                                        function setOrderId(orderId, statusId, statusName) {
                                                                                            // Đặt giá trị cho input ẩn
                                                                                            $('#orderIdInput').val(orderId);

                                                                                            // Đặt giá trị cho select với statusId đã chọn
                                                                                            $('#statusSelect').val(statusId); // Chọn trạng thái hiện tại

                                                                                            // Kiểm tra giá trị đã nhận
                                                                                            console.log("Order ID:", orderId, "Status ID:", statusId, "Status Name:", statusName);
                                                                                        }
                                                                                        $(document).ready(function () {
                                                                                            // Handle Quick Cancel button click
                                                                                            $(document).on('click', '.quick-cancel', function () {
                                                                                                var orderId = $(this).data('id');
                                                                                                var statusId = $(this).data('status-id');

                                                                                                // Show confirmation dialog
                                                                                                Swal.fire({
                                                                                                    title: 'Are you sure?',
                                                                                                    text: "Do you really want to cancel this order?",
                                                                                                    icon: 'warning',
                                                                                                    showCancelButton: true,
                                                                                                    confirmButtonColor: '#3085d6',
                                                                                                    cancelButtonColor: '#d33',
                                                                                                    confirmButtonText: 'Yes, cancel it!'
                                                                                                }).then((result) => {
                                                                                                    if (result.isConfirmed) {
                                                                                                        $.ajax({
                                                                                                            url: '/OnlineMarketPlace/seller/ordermanagement',
                                                                                                            method: 'GET',
                                                                                                            data: {
                                                                                                                orderId: orderId,
                                                                                                                statusId: statusId
                                                                                                            },
                                                                                                            success: function (response) {
                                                                                                                Swal.fire({
                                                                                                                    icon: 'success',
                                                                                                                    title: 'Update Successful!',
                                                                                                                    text: 'Order status has been updated successfully!',
                                                                                                                    showConfirmButton: false,
                                                                                                                    timer: 1500
                                                                                                                }).then(() => {
                                                                                                                    location.reload();
                                                                                                                });
                                                                                                                $('#confirmOrderModal').modal('hide');
                                                                                                            },
                                                                                                            error: function (xhr, status, error) {
                                                                                                                console.error('Error updating order status:', error);
                                                                                                                Swal.fire({
                                                                                                                    icon: 'error',
                                                                                                                    title: 'Failed!',
                                                                                                                    text: 'Failed to update order status!',
                                                                                                                    showConfirmButton: false,
                                                                                                                    timer: 1500
                                                                                                                });
                                                                                                            }
                                                                                                        });
                                                                                                    }
                                                                                                });
                                                                                            });
                                                                                        });


                                                                                        $(document).ready(function () {
                                                                                            // Xử lý nút Quick Confirm
                                                                                            $(document).on('click', '.quick-confirm', function () {
                                                                                                var orderId = $(this).data('id');
                                                                                                var statusId = $(this).data('status-id');

                                                                                                $.ajax({
                                                                                                    url: '/OnlineMarketPlace/seller/ordermanagement',
                                                                                                    method: 'GET',
                                                                                                    data: {
                                                                                                        orderId: orderId,
                                                                                                        statusId: statusId
                                                                                                    },
                                                                                                    success: function (response) {
                                                                                                        Swal.fire({
                                                                                                            icon: 'success',
                                                                                                            title: 'Update Successfully!',
                                                                                                            text: 'Update Order Status Successfully!',
                                                                                                            showConfirmButton: false,
                                                                                                            timer: 1500
                                                                                                        }).then(() => {
                                                                                                            location.reload();
                                                                                                        });
                                                                                                        $('#confirmOrderModal').modal('hide');
                                                                                                    },
                                                                                                    error: function (xhr, status, error) {
                                                                                                        console.error('Error updating order status:', error);
                                                                                                        Swal.fire({
                                                                                                            icon: 'error',
                                                                                                            title: 'Fail!',
                                                                                                            text: 'Update Order Status Failed!',
                                                                                                            showConfirmButton: false,
                                                                                                            timer: 1500
                                                                                                        });
                                                                                                    }
                                                                                                });
                                                                                            });
                                                                                        });

                                                                                        $(document).ready(function () {
                                                                                            $('#confirmStatusButton').on('click', function () {
                                                                                                var orderId = $('#orderIdInput').val();
                                                                                                var statusId = $('#statusSelect').val();

                                                                                                $.ajax({
                                                                                                    url: '/OnlineMarketPlace/seller/ordermanagement',
                                                                                                    method: 'GET',
                                                                                                    data: {
                                                                                                        orderId: orderId,
                                                                                                        statusId: statusId
                                                                                                    },
                                                                                                    success: function (response) {
                                                                                                        Swal.fire({
                                                                                                            icon: 'success',
                                                                                                            title: 'Update Successfully!',
                                                                                                            text: 'Update Order Status Successfully!',
                                                                                                            showConfirmButton: false,
                                                                                                            timer: 1500
                                                                                                        }).then(() => {
                                                                                                            location.reload();
                                                                                                        });
                                                                                                        $('#confirmOrderModal').modal('hide');
                                                                                                    },
                                                                                                    error: function (xhr, status, error) {
                                                                                                        console.error('Error updating order status:', error);
                                                                                                        Swal.fire({
                                                                                                            icon: 'error',
                                                                                                            title: 'Fail!',
                                                                                                            text: 'Update Order Status Failed!',
                                                                                                            showConfirmButton: false,
                                                                                                            timer: 1500
                                                                                                        });
                                                                                                    }
                                                                                                });
                                                                                            });
                                                                                        });
        </script>
</body>

</html>
