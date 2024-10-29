<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Customer</title>
    <link rel="stylesheet" href="path/to/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Update Customer</h1>

        <form action="CustomerController" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="cid" value="${customer.cid}">

            <div class="form-group">
                <label for="cname">Name:</label>
                <input type="text" class="form-control" id="cname" name="cname" value="${customer.cname}" required>
            </div>

            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" class="form-control" id="username" name="username" value="${customer.username}" required>
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" value="${customer.password}" required>
            </div>

            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" class="form-control" id="address" name="address" value="${customer.address}">
            </div>

            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="text" class="form-control" id="phone" name="phone" value="${customer.phone}">
            </div>

            <div class="form-group">
                <label for="status">Status:</label>
                <select class="form-control" id="status" name="status">
                    <option value="true" ${customer.status ? 'selected' : ''}>Active</option>
                    <option value="false" ${!customer.status ? 'selected' : ''}>Inactive</option>
                </select>
            </div>

            <div class="form-group">
                <label for="isAdmin">Admin:</label>
                <select class="form-control" id="isAdmin" name="isAdmin">
                    <option value="true" ${customer.isAdmin ? 'selected' : ''}>Yes</option>
                    <option value="false" ${!customer.isAdmin ? 'selected' : ''}>No</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Update Customer</button>
        </form>

        <a href="CustomerController?action=list" class="btn btn-secondary">Back to Customer List</a>
    </div>
</body>
</html>
