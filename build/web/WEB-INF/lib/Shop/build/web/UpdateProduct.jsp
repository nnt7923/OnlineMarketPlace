<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Product</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2>Update Product</h2>
        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
        <form action="ProductController" method="post">
            <input type="hidden" name="service" value="updateProduct"/>
            <input type="hidden" name="pid" value="${product.pid}"/>
            <div class="form-group">
                <label for="pname">Name:</label>
                <input type="text" class="form-control" id="pname" name="pname" value="${product.pname}" required/>
            </div>
            <div class="form-group">
                <label for="quantity">Quantity:</label>
                <input type="number" class="form-control" id="quantity" name="quantity" value="${product.quantity}" required/>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="text" class="form-control" id="price" name="price" value="${product.price}" required/>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea class="form-control" id="description" name="description" rows="3">${product.description}</textarea>
            </div>
            <div class="form-group">
                <label for="status">Status:</label>
                <select class="form-control" id="status" name="status">
                    <option value="true" ${product.status ? 'selected' : ''}>Active</option>
                    <option value="false" ${!product.status ? 'selected' : ''}>Inactive</option>
                </select>
            </div>
            <div class="form-group">
                <label for="cateId">Category ID:</label>
                <input type="number" class="form-control" id="cateId" name="cateId" value="${product.cateId}" required/>
            </div>
            <div class="form-group">
                <label for="image">Image URL:</label>
                <input type="text" class="form-control" id="image" name="image" value="${product.image}"/>
            </div>
            <div class="form-group">
                <label for="isFeatured">Featured:</label>
                <select class="form-control" id="isFeatured" name="isFeatured">
                    <option value="true" ${product.isFeatured ? 'selected' : ''}>Yes</option>
                    <option value="false" ${!product.isFeatured ? 'selected' : ''}>No</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Update Product</button>
            <a href="ProductList.jsp" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>
</html>
