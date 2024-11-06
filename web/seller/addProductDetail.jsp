<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
    <title>Add Product Detail</title>
    <style>
        .image-container { margin-top: 10px; }
        .image-preview { margin-top: 10px; width: 100px; height: auto; }
        .remove-button { margin-left: 10px; color: red; cursor: pointer; }
    </style>
</head>

<body id="page-top">
    
        <c:if test="${not empty successMessage}">
            <script>
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
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
    <div id="wrapper">
        <%@include file="includes/sidebar.jsp" %>
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <%@include file="includes/topbar.jsp" %>

                <div class="container-fluid">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h2 class="m-0 font-weight-bold text-primary">Add Product Detail</h2>
                        </div>
                        <div class="card-body">
                            <form action="product?service=addProductDetail" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="product_id">Select Product:</label>
                                    <select name="product_id" id="product_id" class="form-control" required>
                                        <option value="">-- Select Product --</option>
                                        <c:forEach var="product" items="${products}">
                                            <option value="${product.productId}">${product.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="pdprice_discount">Discount Price:</label>
                                    <input type="text" name="pdprice_discount" id="pdprice_discount" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label for="pdcolor">Color:</label>
                                    <input type="text" name="pdcolor" id="pdcolor" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label for="pdcriteria">Criteria:</label>
                                    <input type="text" name="pdcriteria" id="pdcriteria" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label for="pdquantity">Quantity:</label>
                                    <input type="number" name="pdquantity" id="pdquantity" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label for="pddescribe">Description:</label>
                                    <textarea name="pddescribe" id="pddescribe" class="form-control" rows="3" required></textarea>
                                    <script>CKEDITOR.replace('pddescribe');</script>
                                </div>

                                <div class="form-group">
                                    <label for="pdspecification">Specification:</label>
                                    <textarea name="pdspecification" id="pdspecification" class="form-control" rows="3" required></textarea>
                                </div>

                                <div class="form-group">
                                    <label for="pdimg">Images:</label>
                                    <input type="file" name="pdimg" id="pdimg" class="form-control-file" accept="image/*" multiple required>
                                    <div id="image-preview-container" class="image-container"></div>
                                </div>

                                <button type="submit" class="btn btn-primary btn-block">Add Product Detail</button>
                            </form>
                        </div>
                    </div>
                </div>
                <%@include file="includes/main-script.jsp" %>
            </div>
        </div>
    </div>

    <script>
        document.getElementById('pdimg').addEventListener('change', function(event) {
            const container = document.getElementById('image-preview-container');
            container.innerHTML = '';  // Clear previous previews

            Array.from(event.target.files).forEach((file, index) => {
                const reader = new FileReader();
                
                reader.onload = function(e) {
                    const img = document.createElement('img');
                    img.src = e.target.result;
                    img.classList.add('image-preview');
                    container.appendChild(img);
                };
                
                reader.readAsDataURL(file);
            });
        });
    </script>
</body>
</html>
