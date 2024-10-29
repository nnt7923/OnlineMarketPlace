<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Detail</title>
    <link rel="stylesheet" href="path/to/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Customer Detail</h1>

        <c:if test="${not empty customer}">
            <table class="table table-bordered">
                <tr>
                    <th>Customer ID</th>
                    <td>${customer.cid}</td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td>${customer.cname}</td>
                </tr>
                <tr>
                    <th>Username</th>
                    <td>${customer.username}</td>
                </tr>
                <tr>
                    <th>Address</th>
                    <td>${customer.address}</td>
                </tr>
                <tr>
                    <th>Phone</th>
                    <td>${customer.phone}</td>
                </tr>
                <tr>
                    <th>Status</th>
                    <td>${customer.status ? 'Active' : 'Inactive'}</td>
                </tr>
                <tr>
                    <th>Admin</th>
                    <td>${customer.isAdmin ? 'Yes' : 'No'}</td>
                </tr>
            </table>
        </c:if>

        <a href="CustomerController?action=list" class="btn btn-secondary">Back to Customer List</a>
    </div>
</body>
</html>
