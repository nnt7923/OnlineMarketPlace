<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Detail</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2>Product Detail</h2>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
        <div class="card">
            <img src="${product.image}" class="card-img-top" alt="Image">
            <div class="card-body">
                <h5 class="card-title">${product.pname}</h5>
                <p class="card-text">Quantity: ${product.quantity}</p>
                <p class="card-text">Price: ${product.price}</p>
                <p class="card-text">Description: ${product.description}</p>
                <p class="card-text">Status: ${product.status ? 'Active' : 'Inactive'}</p>
                <p class="card-text">Category ID: ${product.cateId}</p>
                <a href="ProductController?service=listAll" class="btn btn-primary">Back to List</a>
            </div>
        </div>
    </div>
</body>
</html>
