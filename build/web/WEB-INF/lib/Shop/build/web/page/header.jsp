<!-- page/header.jsp -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="path/to/custom.css"> <!-- ???ng d?n ??n CSS tùy ch?nh c?a b?n -->
    <title>CR7 Shop</title>
</head>
<body>
    <header class="bg-dark text-white">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center py-3">
                <div class="logo">
                    <a href="Home.jsp" class="text-white">
                        <img src="path/to/logo.png" alt="Logo" height="50">
                    </a>
                </div>
                <nav class="d-flex">
                    <a href="ProductList.jsp" class="nav-link text-white">Products</a>
                    <a href="Cart.jsp" class="nav-link text-white">Cart</a>
                    <form class="form-inline" action="SearchController" method="get">
                        <input class="form-control mr-sm-2" type="search" name="query" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
                    </form>
                    <a href="login.jsp" class="btn btn-outline-light ml-3">Login</a>
                </nav>
            </div>
        </div>
    </header>
</body>
</html>
