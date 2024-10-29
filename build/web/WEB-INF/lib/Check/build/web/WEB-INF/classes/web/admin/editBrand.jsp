<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Brand</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h1 class="mb-4">Edit Brand</h1>
    <form action="brands" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="brand_id" value="${brand.brandId}">
        <div class="form-group">
            <label for="brandName">Brand Name</label>
            <input type="text" class="form-control" id="brandName" name="brandName" value="${brand.brandName}" required>
        </div>
        <button type="submit" class="btn btn-primary">Update Brand</button>
        <a href="brands" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>
