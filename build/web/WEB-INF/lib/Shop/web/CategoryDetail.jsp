<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Category Details</title>
    <link rel="stylesheet" href="path/to/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Category Details</h1>

        <c:if test="${not empty error}">
            <div class="alert alert-danger">
                ${error}
            </div>
        </c:if>

        <div class="card mb-4">
            <div class="card-header">
                <h3>Category Information</h3>
            </div>
            <div class="card-body">
                <dl class="row">
                    <dt class="col-sm-3">Category ID</dt>
                    <dd class="col-sm-9">${category.cateID}</dd>

                    <dt class="col-sm-3">Category Name</dt>
                    <dd class="col-sm-9">${category.cateName}</dd>

                    <dt class="col-sm-3">Status</dt>
                    <dd class="col-sm-9">${category.status ? 'Active' : 'Inactive'}</dd>
                </dl>
            </div>
        </div>

        <a href="CategoryController?action=list" class="btn btn-secondary">Back to List</a>
    </div>
</body>
</html>
