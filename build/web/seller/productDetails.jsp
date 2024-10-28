<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table border="1" cellpadding="5" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>ID</th>
            <th>Color</th>
            <th>Discount Price</th>
            <th>Quantity</th>
            <th>Description</th>
            <th>Action</th> <!-- Action column in English -->
        </tr>
    </thead>
    <tbody>
        <c:forEach var="detail" items="${productDetailsList}">
            <tr>
                <td>${detail.pdId}</td>
                <td>${detail.pdcolor}</td>
                <td>
                    <fmt:formatNumber value="${detail.pdpriceDiscount}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                </td>
                <td>${detail.pdquantity}</td>
                <td>${detail.pddescribe}</td>
                <td>
                    <!-- Edit Button -->
                    <form action="product?service=updateProductDetailForm" method="post" style="display:inline-block;">
                        <input type="hidden" name="pd_id" value="${detail.pdId}">
                        <button type="submit" class="btn btn-warning btn-sm">Edit</button>
                    </form>

                    <!-- Delete Button -->
                    <form action="product?service=delete" method="post" style="display:inline-block;">
                        <input type="hidden" name="pd_id" value="${detail.pdId}">
                        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this detail?')">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
