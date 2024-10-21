<%@ taglib prefix="currency" uri="/WEB-INF/currency.tld" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Little UK - Shop Online</title>
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


        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

        <style>
            p {
                color:#757575;
                margin: 0;
                line-height:24px;
            }
            .error-message {
                color: red;
                margin-top: 10px;
                display: block;
                text-align: center;
            }
        </style>
    </head>

    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->

        <%@ include file="header.jsp" %>

        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Checkout</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Pages</a></li>
                <li class="breadcrumb-item active text-white">Checkout</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Start Checkout -->
        <section class="shop checkout section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-12">
                        <div class="checkout-form">
                            <div class="information-form">
                                <h1 class="mb-4">Cart Details</h1>
                                <br/>
                                <form name="f" action="order" method="post" id="orderForm">
                                    <table class="table shopping-summery">
                                        <c:if test="${sessionScope.cartSize != 0}">
                                            <thead>
                                                <tr class="main-hading">
                                                    <th>PRODUCTS</th>
                                                    <th>NAME</th>
                                                    <th class="text-center">PRICE</th>
                                                    <th class="text-center">QUANTITY</th>
                                                    <th class="text-center">TOTAL</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${sessionScope.listItemsInCart}" var="item">
                                                    <tr>
                                                        <td class="image" data-title="No"><img src="${pageContext.request.contextPath}/images/${item.pd.image[0]}" alt="${item.pd.color}"></td>
                                                        <td class="product-des" data-title="Description">
                                                            <p class="product-name"><a href="#">${item.pd.name}</a></p>
                                                            <p class="product-color">Color: ${item.pd.color}</p>
                                                            <p class="product-criteria">Capacity: ${item.pd.criteria}</p>
                                                        </td>
                                                        <td class="price" data-title="Price">
                                                            <fmt:formatNumber value="${item.pd.priceDiscount > 0 ? item.pd.priceDiscount : item.pd.product.price}" type="currency"/>
                                                        </td>
                                                        <td class="qty" data-title="Qty">
                                                            <div class="input-group">
                                                                <a type="text" name="quant[${item.pd.id}]" id="quantity-${item.pd.id}" class="input-number" data-min="1" data-max="${item.pd.quantity}" readonly>${cart.getQuantityById(item.pd.id)}</a>
                                                            </div>
                                                        </td>
                                                        <td class="price" data-title="Price">
                                                            <fmt:formatNumber value="${cart.getTotalPriceById(item.pd.id)}" type="currency"/>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </c:if>
                                    </table>
                                </form>
                            </div>
                            <div class="information-form">
                                <h2 class="mb-4">Billing Details</h2>
                                <br/>
                                <form class="form" method="post" action="order" id="orderForm">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <div class="form-group">
                                                <label>Full Name<span>*</span></label>
                                                <input type="text" name="recipientName" id="recipientName" placeholder="" required="required">
                                                <span id="recipientNameError" class="error-message"></span>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <div class="form-group">
                                                <label>Email Address<span>*</span></label>
                                                <input type="email" name="email" id="email" placeholder="Gmail: Chưa cập nhật" value="${account.email}" disabled>
                                                <span id="emailError" class="error-message"></span>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <div class="form-group">
                                                <label>Phone number<span>*</span></label>
                                                <input type="number" name="deliveryPhone" id="deliveryPhone" placeholder="" required="required">
                                                <span id="deliveryPhoneError" class="error-message"></span>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <div class="form-group">
                                                <label>Address<span>*</span></label>
                                                <input type="text" name="deliveryAddress" id="deliveryAddress" placeholder="Enter address including house number, block, street, ..." required="required">
                                                <span id="deliveryAddressError" class="error-message"></span>
                                            </div>
                                        </div>
                                        <div class="form-item">
                                            <textarea name="note" class="form-control" spellcheck="false" cols="30" rows="5" placeholder="Order Notes (Optional)"></textarea>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <span style="color: red">*Important</span>
                                        </div> 
                                    </div>
                                    <div class="information-form">
                                        <h2 class="mb-4">Payment Information</h2>
                                        <div>Please choose the payment methods below:</div>
                                        <br/>
                                        <div class="content">
                                            <ul class="payment-method">
                                                <li class="form-group">
                                                    <input type="radio" id="cod" name="paymentMethod" value="COD" required>
                                                    <label for="cod">
                                                        <img src="https://shopdunk.com/Plugins/Payments.VietQr/logo.jpg" alt="COD">
                                                        Cash On Delivery(COD)
                                                    </label>
                                                </li>
                                                <li class="form-group">
                                                    <input type="radio" id="vnpay" name="paymentMethod" value="VNPAY" required>
                                                    <label for="vnpay">
                                                        <img src="https://shopdunk.com/Plugins/Payments.VNPay/logo.jpg" alt="VNPAY">
                                                        Thanh toán VNPAY
                                                    </label>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <input type="hidden" name="totalAmount" value="${sessionScope.cart.getTotallMoney(listDC)}"/>
                                    <div class="single-widget get-button">
                                        <div class="content">
                                            <div class="button">
                                                <button type="submit" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary">Xác nhận thanh toán</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-12">
                        <div class="order-details sticky-order-details">
                            <div class="single-widget">
                                <h2>Payment</h2>
                                <div class="content">
                                    <ul>
                                        <li>Sub Total<span><currency:formatCurrency value="${sessionScope.cart.getTotallMoney(listDC)}"/></span></li>
                                        <li>(+) Fee Ship<span>00.00</span></li>
                                        <li class="last">Total Money<span><currency:formatCurrency value="${sessionScope.cart.getTotallMoney(listDC)}"/></span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--/ End Checkout -->

        <%@ include file="footer.jsp" %>

        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var form = document.getElementById('orderForm');
                var recipientName = document.getElementById('recipientName');
                var recipientNameError = document.getElementById('recipientNameError');
                var deliveryPhone = document.getElementById('deliveryPhone');
                var deliveryPhoneError = document.getElementById('deliveryPhoneError');
                var deliveryAddress = document.getElementById('deliveryAddress');
                var deliveryAddressError = document.getElementById('deliveryAddressError');

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

                function isValidPhoneNumber(input, errorElement) {
                    if (input && errorElement) {
                        const phoneRegex = /^0\d{9}$/;
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

                function isValidAddress(input, errorElement) {
                    if (input && errorElement) {
                        const addressRegex = /^[^,]+(,[^,]+)*$/;
                        if (!addressRegex.test(input.value)) {
                            errorElement.textContent = "Địa chỉ phải bao gồm số nhà, khu, phố!";
                            return false;
                        } else {
                            errorElement.textContent = "";
                            return true;
                        }
                    }
                    return true;
                }

                recipientName.addEventListener('input', function () {
                    validateNoSpacesStartEnd(recipientName, recipientNameError);
                });

                deliveryPhone.addEventListener('input', function () {
                    isValidPhoneNumber(deliveryPhone, deliveryPhoneError);
                });

                deliveryAddress.addEventListener('input', function () {
                    isValidAddress(deliveryAddress, deliveryAddressError);
                });

                form.addEventListener('submit', function (event) {
                    var isRecipientNameValid = validateNoSpacesStartEnd(recipientName, recipientNameError);
                    var isDeliveryPhoneValid = isValidPhoneNumber(deliveryPhone, deliveryPhoneError);
                    var isDeliveryAddressValid = isValidAddress(deliveryAddress, deliveryAddressError);

                    if (!isRecipientNameValid || !isDeliveryPhoneValid || !isDeliveryAddressValid) {
                        event.preventDefault();
                    } else {
                        event.preventDefault(); // Ngăn chặn form gửi đi ngay lập tức
                        var formData = $(this).serialize();
                        $.ajax({
                            type: "POST",
                            url: form.action,
                            data: formData,
                            dataType: "json",
                            success: function (response) {
                                if (response.code === '00') {
                                    if (window.vnpay) {
                                        vnpay.open({width: 768, height: 600, url: response.data});
                                    } else {
                                        location.href = response.data;
                                    }
                                } else {
                                    alert(response.message);
                                }
                            },
                            error: function (error) {
                                console.error(error);
                                alert("Đã có lỗi xảy ra, vui lòng thử lại.");
                            }
                        });
                    }
                });
            });

            $(document).ready(function () {
                var totalAmountInput = $("input[name='totalAmount']");
                var totalAmountValue = parseFloat(totalAmountInput.val()).toFixed(0); // Chuyển đổi về số nguyên không có định dạng khoa học
                totalAmountInput.val(totalAmountValue);
            });
        </script>




        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   


        <!-- JavaScript Libraries -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>