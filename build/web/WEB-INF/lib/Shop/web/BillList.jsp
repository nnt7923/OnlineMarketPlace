<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bill List</title>
    <link rel="stylesheet" href="path/to/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Bill List</h1>

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

        <!-- Form to add a new bill -->
        <div class="card mb-4">
            <div class="card-header">
                <h3>Add New Bill</h3>
            </div>
            <div class="card-body">
                <form action="BillController" method="post">
                    <input type="hidden" name="action" value="add">

                    <div class="form-group">
                        <label for="dateCreate">Date Created:</label>
                        <input type="date" class="form-control" id="dateCreate" name="dateCreate" required>
                    </div>

                    <div class="form-group">
                        <label for="recAddress">Recipient Address:</label>
                        <input type="text" class="form-control" id="recAddress" name="recAddress" required>
                    </div>

                    <div class="form-group">
                        <label for="recPhone">Recipient Phone:</label>
                        <input type="text" class="form-control" id="recPhone" name="recPhone" required>
                    </div>

                    <div class="form-group">
                        <label for="note">Note:</label>
                        <textarea class="form-control" id="note" name="note"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="totalMoney">Total Money:</label>
                        <input type="number" class="form-control" id="totalMoney" name="totalMoney" step="0.01" required>
                    </div>

                    <div class="form-group">
                        <label for="status">Status:</label>
                        <select class="form-control" id="status" name="status">
                            <option value="true">Active</option>
                            <option value="false">Inactive</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="cid">Customer ID:</label>
                        <input type="number" class="form-control" id="cid" name="cid" required>
                    </div>

                    <button type="submit" class="btn btn-primary">Add Bill</button>
                </form>
            </div>
        </div>

        <!-- Table for listing all bills -->
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Bill ID</th>
                    <th>Date Created</th>
                    <th>Recipient Address</th>
                    <th>Recipient Phone</th>
                    <th>Note</th>
                    <th>Total Money</th>
                    <th>Status</th>
                    <th>Customer ID</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="bill" items="${billList}">
                    <tr>
                        <td>${bill.bid}</td>
                        <td>${bill.dateCreate}</td>
                        <td>${bill.recAddress}</td>
                        <td>${bill.recPhone}</td>
                        <td>${bill.note}</td>
                        <td>${bill.totalMoney}</td>
                        <td>${bill.status ? 'Active' : 'Inactive'}</td>
                        <td>${bill.cid}</td>
                        <td>
                            <a href="BillController?action=detail&bid=${bill.bid}" class="btn btn-info">View</a>
                            <a href="BillController?action=update&bid=${bill.bid}" class="btn btn-warning">Edit</a>
                            <a href="BillController?action=delete&bid=${bill.bid}" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
