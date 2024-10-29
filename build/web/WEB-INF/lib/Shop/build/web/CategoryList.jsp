<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Category List</title>
    <link rel="stylesheet" href="path/to/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Category List</h1>

        <c:if test="${not empty message}">
            <div class="alert alert-success">
                ${message}
            </div>
        </c:if>

        <c:if test="${not empty error}">
            <div class="alert alert-danger">
                ${error}
            </div>
        </c:if>

        <!-- Form to add a new category -->
        <div class="card mb-4">
            <div class="card-header">
                <h3>Add New Category</h3>
            </div>
            <div class="card-body">
                <form action="CategoryController" method="post">
                    <input type="hidden" name="action" value="add">

                    <div class="form-group">
                        <label for="cateName">Category Name:</label>
                        <input type="text" class="form-control" id="cateName" name="cateName" required>
                    </div>

                    <div class="form-group">
                        <label for="status">Status:</label>
                        <select class="form-control" id="status" name="status">
                            <option value="true">Active</option>
                            <option value="false">Inactive</option>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary">Add Category</button>
                </form>
            </div>
        </div>

        <!-- Table for listing all categories -->
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Category ID</th>
                    <th>Category Name</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="category" items="${categoryList}">
                    <tr>
                        <td>${category.cateID}</td>
                        <td>${category.cateName}</td>
                        <td>${category.status ? 'Active' : 'Inactive'}</td>
                        <td>
                            <a href="CategoryController?action=detail&cateID=${category.cateID}" class="btn btn-info">View</a>
                            <a href="CategoryController?action=update&cateID=${category.cateID}" class="btn btn-warning">Edit</a>
                            <a href="CategoryController?action=delete&cateID=${category.cateID}" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
