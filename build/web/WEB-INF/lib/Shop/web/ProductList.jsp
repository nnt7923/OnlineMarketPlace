<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2>Product List</h2>
        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Category ID</th>
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${productList}">
                    <tr>
                        <td>${product.pid}</td>
                        <td>${product.pname}</td>
                        <td>${product.quantity}</td>
                        <td>${product.price}</td>
                        <td>${product.description}</td>
                        <td>${product.status ? 'Active' : 'Inactive'}</td>
                        <td>${product.cateId}</td>
                        <td><img src="${product.image}" alt="Image" width="100"></td>
                        <td>
                            <a href="ProductController?service=detailProduct&pid=${product.pid}" class="btn btn-info btn-sm">View</a>
                            <a href="ProductController?service=updateProduct&pid=${product.pid}" class="btn btn-warning btn-sm">Edit</a>
                            <a href="ProductController?service=deleteProduct&pid=${product.pid}" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="AddProduct.jsp" class="btn btn-primary">Add New Product</a>
    </div>
</body>
</html>
