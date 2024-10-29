<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer List</title>
    <link rel="stylesheet" href="path/to/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Customer List</h1>

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

        <!-- Form to add a new customer -->
        <div class="card mb-4">
            <div class="card-header">
                <h3>Add New Customer</h3>
            </div>
            <div class="card-body">
                <form action="CustomerController" method="post">
                    <input type="hidden" name="action" value="add">

                    <div class="form-group">
                        <label for="cname">Name:</label>
                        <input type="text" class="form-control" id="cname" name="cname" required>
                    </div>

                    <div class="form-group">
                        <label for="username">Username:</label>
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>

                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>

                    <div class="form-group">
                        <label for="address">Address:</label>
                        <input type="text" class="form-control" id="address" name="address">
                    </div>

                    <div class="form-group">
                        <label for="phone">Phone:</label>
                        <input type="text" class="form-control" id="phone" name="phone">
                    </div>

                    <div class="form-group">
                        <label for="status">Status:</label>
                        <select class="form-control" id="status" name="status">
                            <option value="true">Active</option>
                            <option value="false">Inactive</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="isAdmin">Admin:</label>
                        <select class="form-control" id="isAdmin" name="isAdmin">
                            <option value="true">Yes</option>
                            <option value="false">No</option>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary">Add Customer</button>
                </form>
            </div>
        </div>

        <!-- Table for listing all customers -->
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Customer ID</th>
                    <th>Name</th>
                    <th>Username</th>
                    <th>Phone</th>
                    <th>Status</th>
                    <th>Is Admin</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="customer" items="${customerList}">
                    <tr>
                        <td>${customer.cid}</td>
                        <td>${customer.cname}</td>
                        <td>${customer.username}</td>
                        <td>${customer.phone}</td>
                        <td>${customer.status ? 'Active' : 'Inactive'}</td>
                        <td>${customer.isAdmin ? 'Yes' : 'No'}</td>
                        <td>
                            <a href="CustomerController?action=detail&cid=${customer.cid}" class="btn btn-info">View</a>
                            <a href="CustomerController?action=update&cid=${customer.cid}" class="btn btn-warning">Edit</a>
                            <a href="CustomerController?action=delete&cid=${customer.cid}" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
