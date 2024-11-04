<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="dao.ProductDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<head>
    <meta charset="utf-8">
    <title>FireFly</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet"> 

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }

        /* Container */
        .category-container {
            max-width: 1200px;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .category-container h2 {
            text-align: left;
            font-size: 20px;
            margin-bottom: 20px;
            color: #333;
        }

        /* Grid for Categories */
        .category-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr); /* 6 columns */
            gap: 20px;
        }

        .category-item {
            text-align: center;
            padding: 10px;
        }

        .category-item img {
            width: 80px;
            height: 80px;
            object-fit: contain;
            border-radius: 50%;
            margin-bottom: 10px;
            border: 1px solid #eee;
            padding: 10px;
            background-color: #fff;
        }

        .category-item p {
            margin: 0;
            font-size: 14px;
            color: #333;
        }

        /* Responsive Design */
        @media (max-width: 1024px) {
            .category-grid {
                grid-template-columns: repeat(4, 1fr); /* 4 columns for smaller screens */
            }
        }

        @media (max-width: 768px) {
            .category-grid {
                grid-template-columns: repeat(3, 1fr); /* 3 columns for tablet size */
            }
        }

        @media (max-width: 480px) {
            .category-grid {
                grid-template-columns: repeat(2, 1fr); /* 2 columns for mobile size */
            }
            .product-price-show{
                color: #d70018;
                display: inline-block;
                font-size: 18px;
                font-weight: 700;
                line-height: 1.1;
            }
            .product-price-through{
                color: #707070;
                display: inline-block;
                font-size: 14px;
                font-weight: 600;
                position: relative;
                -webkit-text-decoration: line-through;
                text-decoration: line-through;
                top: 2px;
            }
            /* Ensure header has a fixed height and stays at the top */
            header {
                position: fixed;
                top: 0;
                width: 100%;
                height: 80px; /* Adjust as needed */
                z-index: 1000;
            }

            /* Add top margin to main content to push it below the header */
            .container-fluid.fruite {
                margin-top: 100px; /* Adjust based on header height */
            }

            /* Additional styling for product grid */
            .fruite-item {
                background-color: #fff;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            }

            .fruite-item:hover {
                transform: translateY(-5px);
                transition: transform 0.3s;
            }

        </style>
    </head>

    <%
        // Get categoryId parameter from request
        String cid = request.getParameter("cid");

        // Check if categoryId is provided; if not, display an error message
        if (cid == null || cid.isEmpty()) {
            out.println("<p>Error: Category ID is not provided.</p>");
            return;
        }

        // Initialize ProductDAO and fetch products based on categoryId
        ProductDAO productDAO = new ProductDAO();
        List<Product> products = productDAO.getProductByCategory(Integer.parseInt(cid));

        // Set the products list as a request attribute for JSTL
        request.setAttribute("products", products);
    %>
    
    

    <%@ include file="header.jsp" %>

    <!-- Apply a margin-top to push content below the header -->
    <div class="container-fluid fruite py-5 mt-5">
        <div class="container py-5">
            <div class="tab-class text-center">
                <div class="tab-content">
                    <div id="tab-1" class="tab-pane fade show p-0 active">
                        <div class="row g-4">
                            <div class="col-lg-12">
                                <div class="row g-4">
                                    <c:forEach items="${products}" var="product">
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <a href="${pageContext.request.contextPath}/productdetails?pid=${product.productId}" class="text-decoration-none">
                                                <div class="rounded position-relative fruite-item">
                                                    <div class="fruite-img">
                                                        <img src="${pageContext.request.contextPath}/images/${product.img}" class="img-fluid w-100 rounded-top" alt="${product.name}">
                                                    </div>
                                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                        <h4 class="text-dark">${product.name}</h4>
                                                        <span class="btn border border-secondary rounded-pill px-3 text-primary">
                                                            <i class="fa fa-shopping-bag me-2 text-primary"></i> Details
                                                        </span>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%@ include file="footer.jsp" %>
