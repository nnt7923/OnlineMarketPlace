<%-- 
    Document   : index
    Created on : Sep 20, 2024, 11:34:06 PM
    Author     : Admin
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Fruitables - Vegetable Website Template</title>
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
            .body {
                margin-top: 100px;
            }

            .form-control:focus {
                box-shadow: none;
                border-color: #BA68C8
            }

            .profile-button {
                color: #fff;
                background: #000;
                box-shadow: none;
                border: none
            }

            .profile-button:hover {
                background: #81c408
            }

            .profile-button:focus {
                background: #682773;
                box-shadow: none
            }

            .profile-button:active {
                background: #81c408;
                box-shadow: none
            }

            .back:hover {
                color: #682773;
                cursor: pointer
            }

            .labels {
                font-size: 15px
            }

            .add-experience:hover {
                background: #BA68C8;
                color: #fff;
                cursor: pointer;
                border: solid 1px #BA68C8
            }
        </style>
    </head>

    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


        <%@ include file="header.jsp" %>

        <div class="body">
            <div class="container rounded bg-white mt-5 mb-5">
                <div class="row">
                    <div class="col-md-3 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                            <c:if test="${customer.customerImages != null}">
                                <div class="avatar">
                                    <img class="user_image" src="${customer.customerImages}" alt="" id="iUser" style="border: 1px solid #0D6EFD"/>
                                    <input type="file" name="customerImage" id="form_file" style="display: none"/>
                                </div>
                            </c:if>
                            <c:if test="${customer.customerImages == null}">
                                <div class="avatar">
                                    <img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
                                    <input type="file" name="customerImage" id="form_file" style="display: none"/>
                                </div>
                            </c:if>
                            <span class="font-weight-bold" id="usernameDisplay">${account.username}</span> 
                            <span class="text-black-50" id="emailDisplay">${account.email}</span>
                            <span> </span>
                            <a class="btn mt-3" href="orderhistory">Purchase History</a>
                        </div>
                    </div>
                    <div class="col-md-5 border-right">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mt-3">
                                <h4 class="text-right">YOUR PROFILES</h4>
                                <button class="btn btn-primary" id="editButton" onclick="enableEdit()">Edit Profiles</button>
                            </div>
                            <form id="profileForm" method="POST" action="/profiles">
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <label class="labels">User Name</label>
                                        <input type="text" class="form-control" id="username" name="username" value="${account.username}" disabled> 
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <label class="labels">Full Name</label>
                                        <input type="text" class="form-control" id="fullName" name="fullName" value="${customer != null ? customer.customerName : ''}" disabled> 
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-6">
                                        <label class="labels">Date of Birth</label>
                                        <input type="date" class="form-control" id="dob" name="dob" value="${customer != null ? customer.customerDob : ''}" disabled>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="labels">Gender</label>
                                        <select class="form-control" id="gender" name="gender" disabled>
                                            <option value="Male" ${customer != null && customer.customerGender == 'Male' ? 'selected' : ''}>Male</option>
                                            <option value="Female" ${customer != null && customer.customerGender == 'Female' ? 'selected' : ''}>Female</option>
                                            <option value="Other" ${customer != null && customer.customerGender == 'Other' ? 'selected' : ''}>Other</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <label class="labels">Email</label>
                                        <input type="email" class="form-control" id="email" name="email" value="${account.email}" disabled>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <label class="labels">Address</label>
                                        <input type="text" class="form-control" id="address" name="address" value="${account.address}" disabled>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <label class="labels">Phone Number</label>
                                        <input type="text" class="form-control" id="phone" name="phone" value="${account.phone}" disabled>
                                    </div>
                                </div>
                                <div class="col-md-12 mt-5 text-center">
                                    <button type="button" class="btn btn-success profile-button" id="saveButton" onclick="saveProfile()" style="display: none;">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                    
        <script>
            function enableEdit() {
                // Cho phép chỉnh sửa các trường input và select
                const inputs = document.querySelectorAll('#profileForm input, #profileForm select');
                inputs.forEach(input => input.disabled = false);
                document.getElementById('saveButton').style.display = 'block';
                document.getElementById('editButton').style.display = 'none';
            }

            function saveProfile() {
                const formData = new FormData(document.getElementById('profileForm'));

                fetch('/OnlineMarketPlace/profiles', {
                    method: 'POST',
                    body: formData
                })
                        .then(response => {
                            // Kiểm tra nếu nội dung phản hồi là JSON
                            const contentType = response.headers.get("content-type");
                            if (contentType && contentType.includes("application/json")) {
                                return response.json();
                            } else {
                                throw new Error('Server không trả về JSON như mong đợi');
                            }
                        })
                        .then(data => {
                            if (data.success) {
                                alert("Thông tin đã được cập nhật thành công!");

                                document.getElementById('usernameDisplay').textContent = formData.get('username');
                                document.getElementById('emailDisplay').textContent = formData.get('email');

                                const inputs = document.querySelectorAll('#profileForm input, #profileForm select');
                                inputs.forEach(input => input.disabled = true);

                                document.getElementById('editButton').style.display = 'block';
                                document.getElementById('saveButton').style.display = 'none';
                            } else {
                                alert("Cập nhật thất bại. Vui lòng thử lại.");
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert("Đã xảy ra lỗi khi gửi yêu cầu. Vui lòng kiểm tra lại.");
                        });
            }
        </script>




        <%@ include file="footer.jsp" %>

        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   


        <!-- JavaScript Libraries -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>
