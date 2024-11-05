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
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                margin: 0;
                padding: 0;
            }
            .container {
                display: block;
                width: 80%;
                margin: 0 auto;
                background-color: #fff;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding-bottom: 20px;
                border-bottom: 1px solid #eaeaea;
            }
            .header a {
                text-decoration: none;
                color: #333;
                font-size: 14px;
            }
            .header .order-id {
                font-size: 14px;
                color: #333;
            }
            .header .order-status {
                color: #ff5722;
                font-size: 14px;
            }
            .timeline {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 20px;
                margin: 20px;
            }
            .timeline-item {
                text-align: center;
                position: relative;
                flex: 1;
            }
            .timeline-item:not(:last-child)::after {
                content: '';
                position: absolute;
                top: 50%;
                right: -50%;
                width: 100%;
                height: 2px;
                background-color: #28a745;
                z-index: -1;
            }
            .timeline-item:last-child::after {
                background-color: #d3d3d3;
            }
            .timeline-icon {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                background-color: #28a745;
                color: white;
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 0 auto 10px;
                font-size: 24px;
            }
            .timeline-icon.inactive {
                background-color: #d3d3d3;
            }
            .timeline-text {
                font-size: 14px;
                color: #333;
            }
            .timeline-date {
                font-size: 12px;
                color: #888;
            }
            .note {
                background-color: #fff8e1;
                padding: 10px;
                margin: 20px 0;
                font-size: 14px;
                color: #333;
            }
            .actions {
                display: flex;
                justify-content: flex-end;
                margin: 20px 0;
            }
            .actions button {
                padding: 10px 20px;
                border: none;
                cursor: pointer;
                font-size: 14px;
            }
            .actions .confirm {
                background-color: #ff5722;
                color: #fff;
                margin-right: 10px;
            }
            .actions .request-return {
                background-color: #fff;
                color: #333;
                border: 1px solid #eaeaea;
                margin-right: 10px;
            }
            .actions .contact-seller {
                background-color: #fff;
                color: #333;
                border: 1px solid #eaeaea;
            }
            .address {
                margin: 20px 0;
                padding: 20px;
                border: 1px solid #eaeaea;
                background-color: #fff;
            }
            .address h3 {
                margin: 0 0 10px;
                font-size: 20px;
                color: #333;
            }
            .address-text {
                font-size: 16px;
                color: rgba(0, 0, 0, .54);
                margin: 0 0 7px;
                max-width: 100%;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            .address-name{
                color: rgba(0, 0, 0, .8);
                margin: 0 0 7px;
                max-width: 100%;
                overflow: hidden;
                text-overflow: ellipsis;
                font-size: 18px;
            }
            .container-product {
                width: 80%;
                margin: 20px auto;
                border: 1px solid #ddd;
                padding: 20px;
            }
            .header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                border-bottom: 1px solid #ddd;
                padding-bottom: 10px;
                font-size: 24px;
                color: #ff5722;
                margin-bottom: 10px;
            }
            .header img {
                width: 60px;
                height: 100%;
            }
            .header .title {
                font-size: 18px;
                font-weight: bold;
            }
            .header .actions {
                display: flex;
                align-items: center;
            }
            .header .actions button {
                background-color: #ff5722;
                color: white;
                border: none;
                padding: 5px 10px;
                margin-left: 10px;
                cursor: pointer;
            }
            .header .actions button:first-child {
                background-color: #ff5722;
            }
            .header .actions button:last-child {
                background-color: #f5f5f5;
                color: #333;
            }
            .product {
                display: flex;
                margin-top: 20px;
            }
            .product img {
                width: 100px;
                height: 100px;
                margin-right: 20px;
            }
            .product-details {
                flex-grow: 1;
            }
            .product-details .name {
                font-size: 16px;
                font-weight: bold;
            }
            .product-details .description {
                color: #888;
                margin-top: 5px;
            }
            .product-details .price {
                color: #ff5722;
                font-size: 18px;
                font-weight: bold;
                margin-top: 10px;
            }
            .product-details .original-price {
                text-decoration: line-through;
                color: #888;
                margin-left: 10px;
            }
            .return-policy {
                margin-top: 10px;
                color: #00aaff;
                cursor: pointer;
            }
            .summary {
                margin-top: 20px;
            }
            .summary .row {
                display: flex;
                justify-content: space-between;
                padding: 10px 0;
                border-bottom: 1px dashed #ddd;
            }
            .summary .row:last-child {
                border-bottom: none;
            }
            .summary .row .label {
                color: #888;
            }
            .summary .row .value {
                font-weight: bold;
            }
            .summary .row .value.total {
                color: #ff5722;
                font-size: 18px;
            }
            .payment-method {
                margin-top: 20px;
                padding: 10px;
                background-color: #fff8e1;
                border: 1px solid #ffeb3b;
                color: #ff5722;
                font-weight: bold;
            }
            .footer {
                margin-top: 20px;
                text-align: right;
                color: #888;
            }
            .RO2wsz {
                background-image: repeating-linear-gradient(45deg, #6fa6d6, #6fa6d6 33px, transparent 0, transparent 41px, #f18d9b 0, #f18d9b 74px, transparent 0, transparent 82px);
                background-position-x: -1.875rem;
                background-size: 7.25rem .1875rem;
                height: .1875rem;
                width: 100%;
            }
            .MwCO3u {
                background-color: rgb(255, 252, 245);
                padding: 0px 24px;
                display: flex;
                padding: 20px 30px;
            }

            .reason {
                margin-top: 20px;
                background-color: rgb(255, 252, 245);
                padding: 16px 24px;
            }
            .reason .text{
                color: rgba(0, 0, 0, .87);
                font-size: 16px;
                font-weight: 500;
                line-height: 24px;
                margin-bottom: 0px;
            }
        </style>
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
                                            <li class="breadcrumb-item"><a href="ordermanagement"><b style="font-size: 17px">Purchase Order</b></a></li>

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
                                            <h3 class="tile-title">Purchase Order</h3>
                                            <div class="container-fluid">
                                                <c:if test="${orderStatus == 'Cancelled'}">
                                                    <div class="MwCO3u">
                                                        <div class="header">
                                                            Order Cancelled
                                                        </div>
                                                    </div>

                                                </c:if>
                                                <c:if test="${orderStatus != 'Cancelled'}">
                                                    <div class="header">
                                                        <a class="btn btn-warning " data-dismiss="modal" href="ordermanagement">◀ Come Back</a>
                                                        <div class="order-id">Order ID: ${orderDetails[0].order.orderId}</div>
                                                        <div class="order-status">Order in progress</div>
                                                    </div>
                                                    <div class="timeline">
                                                        <div class="timeline-item <c:if test="${orderStatus == 'Awaiting Confirmation' || orderStatus == 'Preparing Goods' || orderStatus == 'Preparing For Delivery' || orderStatus == 'In delivery' || orderStatus == 'Delivered'}">active</c:if>">
                                                            <div class="timeline-icon <c:if test="${orderStatus != 'Awaiting Confirmation' && orderStatus != 'Preparing Goods' && orderStatus != 'Preparing For Delivery' && orderStatus != 'In delivery' && orderStatus != 'Delivered'}">inactive</c:if>">
                                                                    <i class="fas fa-receipt"></i>
                                                                </div>
                                                                <div class="timeline-text">Awaiting Confirmation</div>
                                                                <div class="timeline-date">${orderDetails[0].order.ordertime}</div>
                                                        </div>

                                                        <div class="timeline-item <c:if test="${orderStatus == 'Preparing Goods' || orderStatus == 'Preparing For Delivery' || orderStatus == 'In delivery' || orderStatus == 'Delivered'}">active</c:if>">
                                                            <div class="timeline-icon <c:if test="${orderStatus != 'Preparing Goods' && orderStatus != 'Preparing For Delivery' && orderStatus != 'In delivery' && orderStatus != 'Delivered'}">inactive</c:if>">
                                                                    <i class="fas fa-dollar-sign"></i>
                                                                </div>
                                                                <div class="timeline-text">Preparing Goods</div>
                                                                <div class="timeline-date"></div>
                                                            </div>

                                                            <div class="timeline-item <c:if test="${orderStatus == 'Preparing For Delivery' || orderStatus == 'In delivery' || orderStatus == 'Delivered'}">active</c:if>">
                                                            <div class="timeline-icon <c:if test="${orderStatus != 'Preparing For Delivery' && orderStatus != 'In delivery' && orderStatus != 'Delivered'}">inactive</c:if>">
                                                                    <i class="fas fa-truck"></i>
                                                                </div>
                                                                <div class="timeline-text">Preparing For Delivery</div>
                                                                <div class="timeline-date"></div>
                                                            </div>

                                                            <div class="timeline-item <c:if test="${orderStatus == 'In delivery' || orderStatus == 'Delivered'}">active</c:if>">
                                                            <div class="timeline-icon <c:if test="${orderStatus != 'In delivery' && orderStatus != 'Delivered'}">inactive</c:if>">
                                                                    <i class="fas fa-box"></i>
                                                                </div>
                                                                <div class="timeline-text">In delivery</div>
                                                            </div>

                                                            <div class="timeline-item <c:if test="${orderStatus == 'Delivered'}">active</c:if>">
                                                            <div class="timeline-icon <c:if test="${orderStatus != 'Delivered'}">inactive</c:if>">
                                                                    <i class="fas fa-star"></i>
                                                                </div>
                                                                <div class="timeline-text">Delivered</div>
                                                            </div>
                                                        </div>




                                                    <c:if test="${orderStatus == 'Awaiting Confirmation'}">
                                                        <div class="note">
                                                            Please carefully check all products in stock before clicking "Confirm Order".
                                                        </div>
                                                        <div class="actions">
                                                            <button class="confirm quick-confirm" type="button" title="Confirm Order" 
                                                                    data-id="${orderDetails[0].order.orderId}" data-status-id="2">
                                                                Confirm Order
                                                            </button>

                                                            <button class="contact-seller">Customer Contact</button>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${orderStatus != 'Awaiting Confirmation'}">
                                                        <div class="actions">
                                                            <button class="contact-seller" href="tel:${orderDetails[0].order.shipping.phone}" >
                                                                Customer Contact
                                                            </button>
                                                        </div>
                                                    </c:if>
                                                </c:if>

                                                <div class="TWLNg9"><div class="RO2wsz"></div></div>
                                                <div class="address">
                                                    <h3>Shipping Address</h3>
                                                    <p class="address-name">${orderDetails[0].order.shipping.name}</p>
                                                    <p class="address-text">${orderDetails[0].order.shipping.phone}</p>
                                                    <p class="address-text">${orderDetails[0].order.shipping.address}</p>
                                                </div>

                                                <div class="container-fluid container-product">
                                                    <div class="header">
                                                        <div class="title">
                                                            <img alt="Shop Logo" height="30" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg" width="30"/>
                                                            ${orderDetails[0].order.shipping.name}
                                                        </div>

                                                        <div class="actions">
                                                            <button>
                                                                Chat
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <c:forEach var="detail" items="${productDetails}">
                                                        <div class="product">
                                                            <img alt="Product Image" height="100" 
                                                                 src="${pageContext.request.contextPath}/images/${detail.productdetail.image[0]}" 
                                                                 width="100"/>
                                                            <div class="product-details">
                                                                <div class="name">
                                                                    ${detail.productdetail.name}
                                                                </div>
                                                                <div class="description">
                                                                    Capacity: ${detail.productdetail.criteria}
                                                                </div>
                                                                <div class="description">
                                                                    Color: ${detail.productdetail.color}
                                                                </div>
                                                                <div class="price">
                                                                    <currency:formatCurrency value="${detail.productdetail.priceDiscount}" />
                                                                    <span class="original-price">
                                                                        <currency:formatCurrency value="${detail.productdetail.product.price}" />
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                    <div class="reason">
                                                        <p class="text">
                                                            Note: ${orderDetails[0].order.note}
                                                        </p>
                                                    </div>

                                                    <div class="summary">
                                                        <div class="row">
                                                            <div class="label">
                                                                Total Price
                                                            </div>
                                                            <div class="value">
                                                                <currency:formatCurrency value="${totalMoney}" />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="label">
                                                                Free Ship
                                                            </div>
                                                            <div class="value">
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="label">
                                                                Total Money
                                                            </div>
                                                            <div class="value total">
                                                                <currency:formatCurrency value="${totalMoney}" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="payment-method">
                                                        Payment method: ${orderDetails[0].order.payment}
                                                    </div>

                                                </div>
                                                <a class="btn btn-warning " data-dismiss="modal" href="orderstatus">◀ Come Back</a>
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
                        document.querySelector('.contact-seller').addEventListener('click', function (e) {
                            if (!/Android|iPhone|iPad|iPod/i.test(navigator.userAgent)) {
                                e.preventDefault();
                                Swal.fire("Please use a mobile device to initiate a call.");
                            }
                        });

                        $(document).ready(function () {
                            // Handle Quick Confirm button click
                            $(document).on('click', '.quick-confirm', function () {
                                var orderId = $(this).data('id');
                                var statusId = $(this).data('status-id');

                                $.ajax({
                                    url: '/OnlineMarketPlace/seller/orderpurchase',
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
                                            showConfirmButton: true,
                                            timer: 1500
                                        }).then(() => {
                                            location.reload();  // Reload the page after showing success message
                                        });
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
                            });
                        });



                        function setOrderId(orderId, statusId, statusName) {
                            // Đặt giá trị cho input ẩn
                            $('#orderIdInput').val(orderId);

                            // Đặt giá trị cho select với statusId đã chọn
                            $('#statusSelect').val(statusId); // Chọn trạng thái hiện tại

                            // Kiểm tra giá trị đã nhận
                            console.log("Order ID:", orderId, "Status ID:", statusId, "Status Name:", statusName);
                        }

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
