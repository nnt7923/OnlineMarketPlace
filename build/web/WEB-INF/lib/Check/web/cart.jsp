<%-- 
    Document   : index
    Created on : Sep 20, 2024, 11:34:06 PM
    Author     : Admin
--%>

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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

        <!-- Libraries Stylesheet -->
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

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
        </style>
    </head>

    <body>
        <%@ include file="header.jsp" %>

        <!-- Shopping Cart -->
        <div class="shopping-cart">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <!-- Shopping Summary -->
                        <form name="f" action="" method="post">
                            <table class="table shopping-summery">
                                <!-- Nếu giỏ hàng trống -->
                                <c:if test="${sessionScope.listItemsInCart == null || sessionScope.listItemsInCart.isEmpty()}">
                                    <div class="nothing-in-cart">
                                        <img src="images/emptycart2.png" width="400px" alt="Emptycart"/>
                                        <span>Your cart is empty.
                                            <br>
                                            Please select more products to shopping.
                                        </span>
                                    </div>
                                    <div id="stickyBottomBar">
                                        <a href="${pageContext.request.contextPath}/home" class="go-back">Back to home page</a>
                                    </div>
                                </c:if>
                                <c:if test="${!sessionScope.listItemsInCart.isEmpty()}">
                                    <thead>
                                        <tr class="main-hading">
                                            <th>PRODUCTS</th>
                                            <th>NAME</th>
                                            <th class="text-center">PRICE</th>
                                            <th class="text-center">QUANTITY</th>
                                            <th class="text-center">TOTAL</th>
                                            <th class="text-center"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${sessionScope.listItemsInCart}" var="item">
                                            <tr>
                                                <td class="image" data-title="No">
                                                    <img src="${pageContext.request.contextPath}/images/${item.pd.image[0]}" alt="${item.pd.color}" class="img-fluid">
                                                </td>
                                                <td class="product-des" data-title="Description">
                                                    <p class="product-name"><a href="#">${item.pd.name}</a></p>
                                                    <p class="product-color">Color: ${item.pd.color}</p>
                                                    <p class="product-criteria">Capacity: ${item.pd.criteria}</p>
                                                    <a class="edit-item" href="${pageContext.request.contextPath}/productdetails?pid=${item.pd.product.productId}&oldProductDetailId=${item.pd.id}&pdcriteria=${item.pd.criteria}&isUpdate=true" 
                                                       style="color: #0066cc; text-align: center; text-decoration: none; display: inline-block; font-size: 14px; margin: 4px 2px; cursor: pointer; border-radius: 4px;">
                                                        Update
                                                    </a>

                                                </td>                                               
                                                <td class="price" data-title="Price">
                                                    <span>
                                                        <currency:formatCurrency value="${item.pd.priceDiscount > 0 ? item.pd.priceDiscount : item.pd.product.price}"/>
                                                    </span>
                                                </td>
                                                <td class="qty" data-title="Qty">
                                                    <div class="input-group">
                                                        <div class="button minus">
                                                            <button type="button" class="btn btn-primary btn-number" data-min="1"  data-type="minus" data-field="quant[${item.pd.id}]" data-id="${item.pd.id}" data-product-id="${item.pd.product.productId}" data-product-criteria="${item.pd.criteria}" onclick="removeFromCart(${item.pd.product.productId}, ${item.pd.id}, '${item.pd.criteria}', -1)">
                                                                <i class="bi bi-dash-lg"></i>
                                                            </button>
                                                        </div>
                                                        <input type="text" name="quant[${item.pd.id}]" id="quantity-${item.pd.id}" class="input-number" data-min="1" data-max="${item.pd.quantity}" value="${cart.getQuantityById(item.pd.id)}" readonly>
                                                        <div class="button plus">
                                                            <button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[${item.pd.id}]" data-id="${item.pd.id}" data-product-id="${item.pd.product.productId}" data-product-criteria="${item.pd.criteria}" onclick="addToCart(${item.pd.product.productId}, ${item.pd.id}, '${item.pd.criteria}', 1)">
                                                                <i class="bi bi-plus-lg"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="price" data-title="Price"><currency:formatCurrency value="${item.quantity * (item.pd.priceDiscount > 0 ? item.pd.priceDiscount : item.pd.product.price)}"/></td>
                                                <td class="action" data-title="Remove">
                                                    <a href="javascript:void(0);" onclick="confirmRemove(${item.pd.id})">
                                                        <i class="bi bi-trash"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </c:if>

                            </table>

                        </form>
                        <!--/ End Shopping Summary -->

                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <!-- Total Amount -->
                        <c:if test="${!sessionScope.listItemsInCart.isEmpty()}">
                            <div class="row g-4 justify-content-end">
                                <div class="col-8"></div>
                                <div class="col-sm-8 col-md-7 col-lg-6 col-xl-4">
                                    <div class="bg-light rounded">
                                        <div class="p-4">
                                            <h1 class="display-6 mb-4">Cart <span class="fw-normal">Total</span></h1>
                                            <div class="d-flex justify-content-between mb-4">
                                                <h5 class="mb-0 me-4">Sub total:</h5>
                                                <p class="mb-0"><currency:formatCurrency value="${sessionScope.cart.getTotalMoney()}"/></p>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <h5 class="mb-0 me-4">Shipping</h5>
                                                <div class="">
                                                    <p class="mb-0">FREE</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                            <h5 class="mb-0 ps-4 me-4">Total</h5>
                                            <p class="mb-0 pe-4"><currency:formatCurrency value="${sessionScope.cart.getTotalMoney()}"/></p>
                                        </div>
                                        <a href="${pageContext.request.contextPath}/checkout" class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4" type="button" style="width: 90%;">Proceed Checkout</a>
                                        <a href="${pageContext.request.contextPath}/home" class="btn border-secondary rounded-pill px-4 py-3 text-secondary text-uppercase mb-4 ms-4" type="button">Continue shopping</a>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <!--/ End Total Amount -->

                    </div>
                </div>
            </div>
        </div>

        <!--/ End Shopping Cart -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
                                                        function confirmRemove(rid) {
                                                            Swal.fire({
                                                                title: 'Are you sure?',
                                                                text: "Do you want to remove this product from your cart?",
                                                                icon: 'warning',
                                                                showCancelButton: true,
                                                                confirmButtonColor: '#3085d6',
                                                                cancelButtonColor: '#d33',
                                                                confirmButtonText: 'Yes, remove it!',
                                                                cancelButtonText: 'No'
                                                            }).then((result) => {
                                                                if (result.isConfirmed) {
                                                                    window.location.href = `${pageContext.request.contextPath}/cart?rid=` + rid;
                                                                }
                                                            });
                                                        }
        </script>
        <script>
            function addToCart(productId, productDetailId, productCriteria, quantity = 1) {
                const inputField = document.getElementById(`quantity-${productDetailId}`);
                if (inputField) {
                    const currentQuantity = parseInt(inputField.value);
                    const maxQuantity = parseInt(inputField.getAttribute("data-max"));

                    // Kiểm tra nếu số lượng vượt quá mức tối đa
                    if (currentQuantity + quantity > maxQuantity) {
                        alert("Số lượng sản phẩm đã đạt đến mức tối đa.");
                        return;
                    }
                }

                $.ajax({
                    type: "POST",
                    url: `${pageContext.request.contextPath}/addtocart`,
                    data: {
                        productId: productId,
                        productDetailId: productDetailId,
                        productCriteria: productCriteria,
                        quantity: quantity
                    },
                    success: function (response) {
                        try {
                            const jsonResponse = JSON.parse(response);
                            if (jsonResponse.status === "error") {
                                alert(jsonResponse.message);
                            } else {
                                location.reload();
                            }
                        } catch (e) {
                            location.reload();
                        }
                    },
                    error: function (xhr, status, error) {
                        alert("Đã xảy ra lỗi khi thêm sản phẩm vào giỏ hàng!");
                        console.error(xhr.responseText);
                    }
                });
            }

            function removeFromCart(productId, productDetailId, productCriteria, quantity = - 1) {
                var quantityInput = document.getElementById('quantity-' + productDetailId);
                var currentQuantity = parseInt(quantityInput.value);

                if (currentQuantity <= 1) {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Can not be removed!',
                        text: 'The number of products cannot be reduced below 1.',
                        confirmButtonText: 'OK'
                    });
                    return;
                }


                $.ajax({
                    type: "POST",
                    url: `${pageContext.request.contextPath}/addtocart`,
                    data: {
                        productId: productId,
                        productDetailId: productDetailId,
                        productCriteria: productCriteria,
                        quantity: quantity,
                    },
                    success: function (response) {
                        try {
                            const jsonResponse = JSON.parse(response);
                            if (jsonResponse.status === "error") {
                                alert(jsonResponse.message);
                            } else {
                                location.reload();
                            }
                        } catch (e) {
                            location.reload();
                        }
                    },
                    error: function (xhr, status, error) {
                        alert("Đã xảy ra lỗi khi xóa sản phẩm khỏi giỏ hàng!");
                        console.error(xhr.responseText);
                    }
                });
            }
        </script>
        <%@ include file="footer.jsp" %>



        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   


        <!-- JavaScript Libraries -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>
