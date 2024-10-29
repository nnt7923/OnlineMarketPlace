<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Brand Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">Brand List</h2>
        <a href="brands?action=addForm" class="btn btn-primary mb-3">Add New Brand</a>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Brand Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="brand" items="${brands}">
                    <tr>
                        <td>${brand.brandId}</td>
                        <td>${brand.brandName}</td>
                        <td>
                            <a href="brands?action=updateForm&brand_id=${brand.brandId}" class="btn btn-warning">Edit</a>
                            <a href="brands?action=deleteBrand&brand_id=${brand.brandId}" class="btn btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
