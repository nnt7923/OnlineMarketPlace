<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="includes/head.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fruitables - Vegetable Website Template</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="css/login.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
            margin: 0;
            padding: 0;
            color: #333;
        }
        h2 {
            color: #28a745;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
            font-size: 2rem;
        }
        .container-fluid {
            max-width: 700px;
            background-color: white;
            padding: 40px;
            margin: 40px auto;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            text-align: left;
        }
        label {
            font-weight: 600;
            margin-top: 15px;
            display: block;
            color: #333;
        }
        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 12px;
            margin-top: 8px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 16px;
            color: #495057;
            transition: all 0.3s ease;
        }
        input[type="text"]:focus, input[type="number"]:focus, select:focus {
            border-color: #28a745;
            box-shadow: 0 0 8px rgba(40, 167, 69, 0.2);
            outline: none;
        }
        button[type="submit"] {
            background: linear-gradient(45deg, #28a745, #218838);
            color: white;
            padding: 12px 20px;
            margin-top: 20px;
            width: 100%;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        button[type="submit"]:hover {
            background: linear-gradient(45deg, #218838, #19692c);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
        }
        .form-group {
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
        }
        /* Style for image preview */
        .image-preview {
            margin-top: 15px;
            max-width: 100%;
            max-height: 250px;
            border: 1px solid #ddd;
            border-radius: 8px;
        }
    </style>
</head>
<body id="page-top">

    <!-- Success and Error Messages (if any) -->
    <c:if test="${not empty successMessage}">
        <script>
            Swal.fire({
                icon: 'success',
                title: 'Success',
                text: '${successMessage}',
                showClass: { popup: 'animate__animated animate__fadeInDown' },
                hideClass: { popup: 'animate__animated animate__fadeOutUp' },
                confirmButtonText: 'OK'
            });
        </script>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <script>
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: '${errorMessage}',
                showClass: { popup: 'animate__animated animate__fadeInDown' },
                hideClass: { popup: 'animate__animated animate__fadeOutUp' },
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


                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <h2>Add Product</h2>

                        <!-- Product Addition Form -->
                        <form action="product?service=addProduct" method="post" enctype="multipart/form-data" >
                            <div class="form-group">
                                <label for="name">Product Name:</label>
                                <input type="text" id="name" name="name" required>
                            </div>

                                                   <div class="form-group">
    <label for="price"><i class="fa fa-dollar-sign"></i> Price:</label>
    <input type="text" id="price" name="price" inputmode="decimal" pattern="\d+(\.\d{1,2})?" required>
</div>

                            <div class="form-group">
                                <label for="title">Title:</label>
                                <input type="text" id="title" name="title" required>
                            </div>

                            <div class="form-group">
                                <label for="category">Category:</label>
                                <select id="category" name="cateID" required>
                                    <option value="">-- Select Category --</option>
                                    <c:forEach var="category" items="${categories}">
                                        <option value="${category.cid}">${category.cname}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="brand">Brand:</label>
                                <select id="brand" name="brand_id" required>
                                    <option value="">-- Select Brand --</option>
                                    <c:forEach var="brand" items="${brands}">
                                        <option value="${brand.brandId}">${brand.brandName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="img">Product Image Path:</label>
                                <input type="file" id="img" name="img" required>
                            </div>

                            <button type="submit">Add Product</button>
                        </form>

                    </div>
                    <!-- End of Main Content -->

                    <%@include file="includes/main-script.jsp" %>




        </div>
        <!-- End of Page Wrapper -->

    </div>

    <script>
        // Function to preview the selected image
        function previewImage(event) {
            var reader = new FileReader();
            reader.onload = function(){
                var output = document.getElementById('image-preview');
                output.src = reader.result;
                output.style.display = 'block';
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>
</body>
</html>
