<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bill Details</title>
    <link rel="stylesheet" href="path/to/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Bill Details</h1>

        <c:if test="${not empty error}">
            <div class="alert alert-danger">
                ${error}
            </div>
        </c:if>

        <div class="card mb-4">
            <div class="card-header">
                <h3>Bill Information</h3>
            </div>
            <div class="card-body">
                <dl class="row">
                    <dt class="col-sm-3">Bill ID</dt>
                    <dd class="col-sm-9">${bill.bid}</dd>

                    <dt class="col-sm-3">Date Created</dt>
                    <dd class="col-sm-9">${bill.dateCreate}</dd>

                    <dt class="col-sm-3">Recipient Address</dt>
                    <dd class="col-sm-9">${bill.recAddress}</dd>

                    <dt class="col-sm-3">Recipient Phone</dt>
                    <dd class="col-sm-9">${bill.recPhone}</dd>

                    <dt class="col-sm-3">Note</dt>
                    <dd class="col-sm-9">${bill.note}</dd>

                    <dt class="col-sm-3">Total Money</dt>
                    <dd class="col-sm-9">${bill.totalMoney}</dd>

                    <dt class="col-sm-3">Status</dt>
                    <dd class="col-sm-9">${bill.status ? 'Active' : 'Inactive'}</dd>

                    <dt class="col-sm-3">Customer ID</dt>
                    <dd class="col-sm-9">${bill.cid}</dd>
                </dl>
            </div>
        </div>

        <a href="BillController?action=list" class="btn btn-secondary">Back to List</a>
    </div>
</body>
</html>
