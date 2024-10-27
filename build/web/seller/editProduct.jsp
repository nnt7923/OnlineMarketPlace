<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="includes/head.jsp" %>
    <meta charset="UTF-8">
    <title>Edit Product</title>
    <!-- SweetAlert and Animate.css -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .container-fluid {
            max-width: 800px;
            background-color: white;
            padding: 40px;
            margin: 30px auto;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
        }
        h2 {
            color: #28a745;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }
        label {
            font-weight: bold;
            margin-top: 15px;
            color: #28a745;
            display: block;
        }
        input[type="text"], input[type="number"], select, input[type="file"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
            color: #333;
            transition: border-color 0.3s;
        }
        input[type="text"]:focus, input[type="number"]:focus, select:focus {
            border-color: #28a745;
            outline: none;
            box-shadow: 0 0 5px rgba(40, 167, 69, 0.3);
        }
        button[type="submit"] {
            background-color: #28a745;
            color: white;
            padding: 12px 20px;
            margin-top: 20px;
            width: 100%;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button[type="submit"]:hover {
            background-color: #218838;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .current-image {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }
        .current-image img {
            margin-left: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
            max-width: 100px;
        }
    </style>
</head>
<body id="page-top">

    <!-- Success message -->
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

    <!-- Error message -->
    <c:if test="${not empty errorMessage}">
        <script>
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: '${errorMessage}',
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

                    <h2>Edit Product</h2>
                    
                    <!-- Product Edit Form -->
                    <form action="${pageContext.request.contextPath}/product?service=updateProduct" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="productId" value="${product.productId}">
                        <input type="hidden" name="currentImg" value="${product.img}">
                        
                        <!-- Product Name -->
                        <div class="form-group">
                            <label for="name">Product Name:</label>
                            <input type="text" id="name" name="name" value="${product.name}" required>
                        </div>
                        
                        <!-- Price -->
                        <div class="form-group">
                            <label for="price">Price:</label>
                            <input type="number" id="price" name="price" step="0.01" value="${product.price}" required>
                        </div>
                        
                        <!-- Title -->
                        <div class="form-group">
                            <label for="title">Title:</label>
                            <input type="text" id="title" name="title" value="${product.title}">
                        </div>
                        
                        <!-- Category Selection -->
                        <div class="form-group">
                            <label for="cid">Category:</label>
                            <select id="cid" name="cid" required>
                                <c:forEach var="category" items="${categories}">
                                    <option value="${category.cid}" ${category.cid == product.cid ? "selected" : ""}>
                                        ${category.cname}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        
                        <!-- Brand Selection -->
                        <div class="form-group">
                            <label for="brandId">Brand:</label>
                            <select id="brandId" name="brandId" required>
                                <c:forEach var="brand" items="${brands}">
                                    <option value="${brand.brandId}" ${brand.brandId == product.brandId ? "selected" : ""}>
                                        ${brand.brandName}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        
                        <!-- Image Upload -->
                        <div class="form-group">
                            <label for="img">Image:</label>
                            <input type="file" id="img" name="img" accept="image/*">
                            <div class="current-image">
                                <p>Current Image:</p>
                                <img src="${pageContext.request.contextPath}/${product.img}" alt="Current Image">
                            </div>
                        </div>
                        
                        <!-- Submit Button -->
                        <button type="submit">Update Product</button>
                    </form>

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
