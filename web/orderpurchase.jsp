<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="currency" uri="/WEB-INF/currency.tld" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Order Success</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

        <style>

            body {
                font-family: 'Poppins', sans-serif;
            }
            .sidebar {
                padding-top: 100px;
                height: 200px;
            }
            .sidebar a {
                text-decoration: none;
                color: #333;
                display: flex;
                align-items: center;
                padding: 10px 15px;
                border-radius: 5px;
                transition: background-color 0.3s, color 0.3s;
                margin-bottom: 10px;
            }
            .sidebar a.active {
                background-color: #f3feec;
                border: 1px solid #81c408;
                color: #81c408;
            }
            .sidebar a.active i, .sidebar a:hover i {
                color: #81c408;
            }
            .sidebar i {
                margin-right: 10px;
                font-size: 1.2em;
                transition: color 0.3s;
            }
            .content {
                padding: 20px;
            }
            .order-history-container {
                padding: 20px;
                background-color: #f8f9fa;
                border-radius: 10px;
            }
            .order-history-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }
            .order-history-header .user-info {
                display: flex;
                align-items: center;
            }
            .order-history-header .user-info img {
                border-radius: 50%;
                margin-right: 10px;
            }
            .order-history-stats {
                display: flex;
                justify-content: space-around;
                padding: 20px;
                background-color: #fff;
                border-radius: 10px;
                margin-bottom: 20px;
            }
            .order-history-stats .stat {
                text-align: center;
            }
            .order-history-filter {
                margin-bottom: 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .order-history-filter button {
                margin-right: 10px;
            }
            .order-history-empty {
                text-align: center;
                padding: 50px 0;
            }
            .order-history-empty img {
                width: 150px;
            }
            .hidden-row {
                display: none;
            }
            .details-container {
                background-color: #f9f9f9;
                padding: 15px;
                border: 1px solid #ddd;
                border-radius: 5px;
                margin-top: 10px;
            }
            .details-container p {
                margin: 5px 0;
            }
            .details-container .product-name {
                font-weight: bold;
            }
            .details-container .product-quantity,
            .details-container .product-price {
                color: #555;
            }
            .details-row td {
                padding: 0 !important;
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
            .container-note {
                width: 100%;
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }
            .alert-box {
                background-color: #fff8e1;
                border: 1px solid #ffe0b2;
                padding: 10px 20px;
                border-radius: 4px;
                display: flex;
                align-items: center;
                margin-bottom: 20px;
            }
            .alert-box i {
                color: #ff9800;
                margin-right: 10px;
            }
            .alert-box span {
                color: #333;
                font-size: 14px;
            }
            .alert-box .amount {
                color: #e53935;
                font-weight: bold;
            }
            .payment-method {
                background-color: #fff;
                border: 1px solid #e0e0e0;
                padding: 20px;
                border-radius: 4px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .payment-method .method-title {
                color: #757575;
                font-size: 14px;
            }
            .payment-method .method-detail {
                color: #333;
                font-size: 14px;
                font-weight: bold;
            }
        </style>
    </head>
    <body onload="time()" class="app sidebar-mini rtl">
        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


        <%@ include file="header.jsp" %>
        <br/>
        <br/>
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <div class="col-md-2 sidebar">
                    <a href="${pageContext.request.contextPath}/home">Home Page</a>
                    <a href="${pageContext.request.contextPath}/orderhistory">Order History</a>
                    <a href="${pageContext.request.contextPath}/orderpurchase" class="active">Order Purchase</a>
                    <!-- Add more links as needed -->
                </div>
                <!-- Main Content -->
                <div class="col-md-10 content">
                    <div class="container-fluid">
                        <main>
                            <div class="row">
                                <!--Right-->
                                <div class="col-md-12 col-lg-12">
                                    <div class="row">
                                        <div class="tile">
                                            <h3 class="tile-title">Purchase Order</h3>
                                            <div class="container-fluid" style="padding-top: 70px">
                                                <c:if test="${orderStatus == 'Cancelled'}">
                                                    <div class="MwCO3u">
                                                        <div class="header">
                                                            Order Cancelled
                                                        </div>
                                                    </div>

                                                </c:if>
                                                <c:if test="${orderStatus != 'Cancelled'}">
                                                    <div class="header">
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




                                                    <c:if test="${orderStatus == 'In delivery'}">
                                                        <div class="note">
                                                            Please check the product carefully when opening the package, record the unpacking video to get the earliest support before clicking "Confirm Order".
                                                        </div>
                                                        <div class="actions">
                                                            <button class="confirm quick-confirm" type="button" title="Confirm Order" 
                                                                    data-id="${orderDetails[0].order.orderId}" data-status-id="5">
                                                                Confirm Order
                                                            </button>

                                                            <button class="contact-seller" href="tel:${orderDetails[0].order.shipping.phone}" >
                                                                Shop Contact
                                                            </button>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${orderStatus != 'In delivery'}">
                                                        <div class="actions">
                                                            <button class="contact-seller" href="tel:${orderDetails[0].order.shipping.phone}" >
                                                                Shop Contact
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

                                                    <c:if test="${orderDetails[0].order.payment == 'COD'}">
                                                        <div class="container-note">
                                                            <div class="alert-box">
                                                                <i class="fas fa-exclamation-circle"></i>
                                                                <span>Please pay <span class="amount"><currency:formatCurrency value="${totalMoney}" /></span> upon receipt.</span>
                                                            </div>
                                                            <div class="payment-method">
                                                                <div class="method-title">Payment method: ${orderDetails[0].order.payment}</div>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${orderDetails[0].order.payment != 'COD'}">
                                                        <div class="container-note">
                                                            <div class="payment-method">
                                                                <div class="method-title">Payment method: ${orderDetails[0].order.payment}</div>
                                                            </div>
                                                        </div>
                                                    </c:if>

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
    </div>





    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
                    url: '/OnlineMarketPlace/orderpurchase',
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

        
    </script>
    <%@ include file="footer.jsp" %>

    <!-- Back to Top -->
    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   


    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
</html>
