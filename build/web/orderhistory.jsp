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
            .row{
                padding-top: 100px;
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
                    <a href="${pageContext.request.contextPath}/home">HOME PAGE</a>
                    <a href="${pageContext.request.contextPath}/orderhistory" class="active">ORDER HISTORY</a>
                    <!-- Add more links as needed -->
                </div>
                <!-- Main Content -->
                <div class="col-md-10 content">
                    <div class="container-fluid order-history-container">
                        <div class="order-history-header">
                            <div class="user-info">
                                <img src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg" alt="User Avatar" width="50">
                                <div>
                                    <span class="badge bg-danger">TECHMEMBER</span>
                                    <h5>${account.username}</h5>
                                    <p>${account.phone}</p>
                                </div>
                            </div>
                            <div id="clock"></div>
                        </div>
                        <div class="order-history-stats">
                            <div class="stat">
                                <h3>${orders.size()}</h3>
                                <p>ORDERS</p>
                            </div>
                            <div class="stat">
                                <h3>
                                    <c:set var="totalAmount" value="0" scope="page"/>
                                    <c:forEach var="order" items="${orders}">
                                        <c:forEach var="orderDetail" items="${order.orderDetail}">
                                            <c:set var="totalAmount" value="${totalAmount + (orderDetail.productPrice * orderDetail.quantity)}" scope="page"/>
                                        </c:forEach>
                                    </c:forEach>
                                    <currency:formatCurrency value="${totalAmount}"/>
                                </h3>
                                <p>TOTAL ORDER AMOUNT</p>
                            </div>

                        </div>
                        <div class="order-history-filter">
                            <!--                            <input type="date" class="form-control" style="width: 200px;" id="orderDate">-->
                            <div>
                                <a href="${pageContext.request.contextPath}/orderhistory" 
                                   class="btn ${statusId == -1 ? 'btn-outline-primary' : 'btn-outline-secondary'}">ALL</a>
                                <c:forEach var="status" items="${statuses}">
                                    <a href="${pageContext.request.contextPath}/orderhistory?status_id=${status.id}" 
                                       class="btn ${statusId == status.id ? 'btn-outline-primary' : 'btn-outline-secondary'}">
                                        ${status.name}
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                        <c:if test="${empty orders}">
                            <div class="order-history-empty">
                                <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:150:150/q:90/plain/https://cellphones.com.vn/media/wysiwyg/cps-ant.png" alt="Empty">
                                <p>NO ORDER SATISFIED!</p>
                            </div>
                        </c:if>
                        <c:if test="${not empty orders}">
                            <table class="table table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                                <thead>
                                    <tr>
                                        <th style="width: 50px">Order ID</th>
                                        <th style="width: 130px">Recipient Name</th>
                                        <th style="width: 120px">Delivery Address</th>
                                        <th style="width: 100px">Delivery Phone Number</th>
                                        <th style="width: 20px">Payment</th>
                                        <th style="width: 100px">Total Amount</th>
                                        <th style="width: 20px">Status</th>
                                        <th style="width: 100px">Order Time</th>
                                        <th style="width: 90px">Function</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="order" items="${orders}">
                                        <tr>
                                            <td>${order.orderId}</td>
                                            <td>${order.shipping.name}</td>
                                            <td>${order.shipping.address}</td>
                                            <td>${order.shipping.phone}</td>
                                            <td>${order.payment}</td>
                                            <td><currency:formatCurrency value="${order.totalPrice}"/></td>
                                            <td>${order.status.name}</td>
                                            <td>
                                                <fmt:formatDate value="${order.ordertime}" pattern="dd/MM/yyyy"/>
                                            </td>
                                            <td>
                                                <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" 
                                                        onclick="showUpdateModal(${order.orderId}, '${order.shipping.name}', '${order.shipping.address}', '${order.shipping.phone}')">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button class="btn btn-danger btn-sm trash" type="button" title="Xóa" onclick="cancelOrder(${order.orderId})">
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                                <button class="btn btn-info btn-sm eye" type="button" title="Chi tiết" id="show-emp" onclick="toggleDetails(${order.orderId})">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr id="details-${order.orderId}" class="hidden-row details-row">
                                            <td colspan="9">
                                                <div class="details-container">
                                                    <c:forEach var="detail" items="${order.orderDetail}">
                                                        <p class="product-name">Products: ${detail.productName}</p>
                                                        <p class="product-quantity">Quantity: ${detail.quantity}</p>
                                                        <p class="product-price">Price: <currency:formatCurrency value="${detail.productPrice}"/></p>
                                                    </c:forEach>
                                                    <button class="btn btn-info btn-sm eye" type="button" title="Purchase Order" 
                                                            onclick="window.location.href = 'orderpurchase?orderId=${order.orderId}'"
                                                            data-id="${order.orderId}">
                                                        <i class="fas fa-eye"></i> Purchase Order
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>

                            </table>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>

        <!-- Update Order Modal -->
        <div class="modal fade" id="updateOrderModal" tabindex="-1" aria-labelledby="updateOrderModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="updateOrderModalLabel">Update Order</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="updateOrderForm">
                            <input type="hidden" id="updateOrderId" name="orderId">
                            <input type="hidden" name="action" value="update">
                            <div class="mb-3">
                                <label for="updateRecipientName" class="form-label">Recipient name</label>
                                <input type="text" class="form-control" id="updateRecipientName" name="recipientName" required>
                                <span style="color:red" id="updateRecipientNameError" class="error-message"></span>
                            </div>
                            <div class="mb-3">
                                <label for="updateDeliveryAddress" class="form-label">Delivery address</label>
                                <input type="text" class="form-control" id="updateDeliveryAddress" name="deliveryAddress" required>
                                <span style="color:red" id="updateDeliveryAddressError" class="error-message"></span>
                            </div>
                            <div class="mb-3">
                                <label for="updateDeliveryPhone" class="form-label">Phone number to receive goods</label>
                                <input type="text" class="form-control" id="updateDeliveryPhone" name="deliveryPhone" required>
                                <span style="color:red" id="updateDeliveryPhoneError" class="error-message"></span>
                            </div>
                            <button type="submit" class="btn btn-primary">Update</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>




        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script>
                                                                document.addEventListener('DOMContentLoaded', function () {
                                                                    var updateForm = document.getElementById('updateOrderForm');
                                                                    var updateRecipientName = document.getElementById('updateRecipientName');
                                                                    var updateRecipientNameError = document.getElementById('updateRecipientNameError');
                                                                    var updateDeliveryPhone = document.getElementById('updateDeliveryPhone');
                                                                    var updateDeliveryPhoneError = document.getElementById('updateDeliveryPhoneError');
                                                                    var updateDeliveryAddress = document.getElementById('updateDeliveryAddress');
                                                                    var updateDeliveryAddressError = document.getElementById('updateDeliveryAddressError');

                                                                    // Hàm kiểm tra khoảng trắng đầu/cuối
                                                                    function validateNoSpacesStartEnd(input, errorElement) {
                                                                        if (input && errorElement) {
                                                                            if (input.value.startsWith(' ') || input.value.endsWith(' ')) {
                                                                                errorElement.textContent = "Không được chứa khoảng trắng ở đầu hoặc cuối!";
                                                                                return false;
                                                                            } else {
                                                                                errorElement.textContent = "";
                                                                                return true;
                                                                            }
                                                                        }
                                                                        return true;
                                                                    }

                                                                    // Hàm kiểm tra số điện thoại
                                                                    function isValidPhoneNumber(input, errorElement) {
                                                                        const phoneRegex = /^0\d{9}$/;
                                                                        if (input && errorElement) {
                                                                            if (!phoneRegex.test(input.value)) {
                                                                                errorElement.textContent = "Số điện thoại phải bắt đầu bằng số 0 và có đúng 10 chữ số!";
                                                                                return false;
                                                                            } else {
                                                                                errorElement.textContent = "";
                                                                                return true;
                                                                            }
                                                                        }
                                                                        return true;
                                                                    }

                                                                    // Hàm kiểm tra địa chỉ
                                                                    function isValidAddress(input, errorElement) {
                                                                        const addressRegex = /^[^,]+(,[^,]+)+$/;  // Điều kiện yêu cầu ít nhất một dấu phẩy trở lên
                                                                        if (input && errorElement) {
                                                                            if (!addressRegex.test(input.value)) {
                                                                                errorElement.textContent = "Địa chỉ phải bao gồm số nhà, khu, phố và cách nhau bởi dấu phẩy!";
                                                                                return false;
                                                                            } else {
                                                                                errorElement.textContent = "";
                                                                                return true;
                                                                            }
                                                                        }
                                                                        return true;
                                                                    }


                                                                    // Sự kiện khi người dùng nhập
                                                                    updateRecipientName.addEventListener('input', function () {
                                                                        validateNoSpacesStartEnd(updateRecipientName, updateRecipientNameError);
                                                                    });

                                                                    updateDeliveryPhone.addEventListener('input', function () {
                                                                        isValidPhoneNumber(updateDeliveryPhone, updateDeliveryPhoneError);
                                                                    });

                                                                    updateDeliveryAddress.addEventListener('input', function () {
                                                                        isValidAddress(updateDeliveryAddress, updateDeliveryAddressError);
                                                                    });

                                                                    // Xử lý khi submit form
                                                                    updateForm.addEventListener('submit', function (event) {
                                                                        var isRecipientNameValid = validateNoSpacesStartEnd(updateRecipientName, updateRecipientNameError);
                                                                        var isDeliveryPhoneValid = isValidPhoneNumber(updateDeliveryPhone, updateDeliveryPhoneError);
                                                                        var isDeliveryAddressValid = isValidAddress(updateDeliveryAddress, updateDeliveryAddressError);

                                                                        if (!isRecipientNameValid || !isDeliveryPhoneValid || !isDeliveryAddressValid) {
                                                                            event.preventDefault();

                                                                            // Thông báo lỗi tùy theo trường hợp cụ thể
                                                                            if (!isRecipientNameValid) {
                                                                                swal('Lỗi', 'Vui lòng kiểm tra lại tên người nhận! Không được chứa khoảng trắng ở đầu hoặc cuối.', 'error');
                                                                            } else if (!isDeliveryPhoneValid) {
                                                                                swal('Lỗi', 'Vui lòng kiểm tra lại số điện thoại! Số điện thoại phải bắt đầu bằng số 0 và có đúng 10 chữ số.', 'error');
                                                                            } else if (!isDeliveryAddressValid) {
                                                                                swal('Lỗi', 'Vui lòng kiểm tra lại địa chỉ! Địa chỉ phải bao gồm số nhà, khu, phố và cách nhau bởi dấu phẩy.', 'error');
                                                                            }
                                                                        }
                                                                    });
                                                                });

        </script>
        <script>
            document.getElementById('updateOrderForm').addEventListener('submit', function (event) {
                event.preventDefault(); // Ngăn chặn form gửi đi ngay lập tức

                var recipientName = document.getElementById('updateRecipientName').value.trim();
                var deliveryAddress = document.getElementById('updateDeliveryAddress').value.trim();
                var deliveryPhone = document.getElementById('updateDeliveryPhone').value.trim();

                var isValid = true;

                // Kiểm tra tên người nhận
                if (!validateNoSpacesStartEnd(recipientName)) {
                    document.getElementById('updateRecipientNameError').textContent = 'Tên người nhận không được để trống hoặc chứa khoảng trắng ở đầu hoặc cuối.';
                    isValid = false;
                } else {
                    document.getElementById('updateRecipientNameError').textContent = '';
                }

                // Kiểm tra địa chỉ giao hàng
                if (!validateAddress(deliveryAddress)) {
                    document.getElementById('updateDeliveryAddressError').textContent = 'Địa chỉ giao hàng phải đầy đủ bao gồm số nhà, khu, phố.';
                    isValid = false;
                } else {
                    document.getElementById('updateDeliveryAddressError').textContent = '';
                }

                // Kiểm tra số điện thoại
                if (!validatePhone(deliveryPhone)) {
                    document.getElementById('updateDeliveryPhoneError').textContent = 'Số điện thoại phải bắt đầu bằng số 0 và có đúng 10 kí tự.';
                    isValid = false;
                } else {
                    document.getElementById('updateDeliveryPhoneError').textContent = '';
                }

                if (isValid) {
                    var formData = $(this).serialize(); // Chuyển đổi dữ liệu form thành chuỗi dữ liệu để gửi qua AJAX
                    $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath}/orderhistory', // Đảm bảo đường dẫn đúng
                        data: formData,
                        success: function (response) {
                            console.log("Success callback called"); // Kiểm tra xem callback này có được gọi không
                            $('#updateOrderModal').modal('hide');
                            Swal.fire({
                                title: 'Success!',
                                text: 'Order has been updated successfully.',
                                icon: 'success',
                                button: 'OK'
                            }).then(() => {
                                location.reload();
                            });
                        }
                        ,
                        error: function (error) {
                            console.error(error);
                            Swal.fire('Lỗi', 'Có lỗi xảy ra khi cập nhật đơn hàng', 'error');
                        }
                    });
                }
            });

            function validateNoSpacesStartEnd(value) {
                return value !== '' && !value.startsWith(' ') && !value.endsWith(' ');
            }

            function validateAddress(address) {
                var addressParts = address.split(',');
                return addressParts.length >= 3;
            }

            function validatePhone(phone) {
                const phoneRegex = /^0\d{9}$/;
                return phoneRegex.test(phone);
            }


            function showUpdateModal(orderId, recipientName, deliveryAddress, deliveryPhone) {
                $('#updateOrderId').val(orderId);
                $('#updateRecipientName').val(recipientName);
                $('#updateDeliveryAddress').val(deliveryAddress);
                $('#updateDeliveryPhone').val(deliveryPhone);
                $('#updateOrderModal').modal('show');
            }

            function cancelOrder(orderId) {
                // Hiển thị SweetAlert xác nhận
                Swal.fire({
                    title: 'Are you sure?',
                    text: "Do you want to cancel this order?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, cancel order!',
                    cancelButtonText: 'No'
                }).then((result) => {
                    if (result.isConfirmed) {
                        fetch(`${pageContext.request.contextPath}/orderhistory`, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded',
                            },
                            body: new URLSearchParams({
                                action: 'cancel',
                                orderId: orderId
                            })
                        })
                                .then(response => {
                                    if (response.ok) {
                                        Swal.fire(
                                                'Cancelled successful!',
                                                'Your order has been cancelled..',
                                                'success'
                                                ).then(() => {
                                            location.reload();
                                        });
                                    } else {
                                        Swal.fire(
                                                'Fail!',
                                                'Không thể hủy đơn hàng. Vui lòng thử lại.',
                                                'error'
                                                );
                                    }
                                })
                                .catch(error => {
                                    console.error("Error:", error);
                                    Swal.fire(
                                            'Lỗi!',
                                            'Đã xảy ra lỗi. Vui lòng thử lại.',
                                            'error'
                                            );
                                });
                    }
                });
            }

            function toggleDetails(orderId) {
                var detailsRow = document.getElementById('details-' + orderId);
                if (detailsRow.style.display === 'none' || detailsRow.style.display === '') {
                    detailsRow.style.display = 'table-row';
                } else {
                    detailsRow.style.display = 'none';
                }
            }

            $('#sampleTable').DataTable();

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
                tmp = '<span class="date"> ' + today + ' - ' + nowTime + '</span>';
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
