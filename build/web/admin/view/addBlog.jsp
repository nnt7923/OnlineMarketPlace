<%-- 
    Document   : addBlog
    Created on : Jul 16, 2024, 9:17:06 AM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Quản trị Sale</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
        <style>
            .Choicefile {
                display: block;
                background: #14142B;
                border: 1px solid #fff;
                color: #fff;
                width: 150px;
                text-align: center;
                text-decoration: none;
                cursor: pointer;
                padding: 5px 0px;
                border-radius: 5px;
                font-weight: 500;
                align-items: center;
                justify-content: center;
            }

            .Choicefile:hover {
                text-decoration: none;
                color: white;
            }

            #blogPicture {
                display: none; /* Hide the actual file input */
            }
            .form-control{
                background-color: white;
            }
            .btn-save:disabled {
                background-color: #ccc;
                cursor: not-allowed;
            }
        </style>
    </head>

    <body>
        <%@include file="../header.jsp" %>
        <div id="wrapper">
            <%@include file="../sidebar.jsp" %>
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <%@include file="../topbar.jsp" %>
                    <div class="container-fluid">
                        <div class="app-title">
                            <ul class="app-breadcrumb breadcrumb">
                                <li class="breadcrumb-item"><a href="listnews">News List</a></li>
                                <li class="breadcrumb-item"><a href="addblog">Add News List</a></li>
                            </ul>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="tile">
                                    <h3 class="tile-title">Add News List</h3>
                                    <div class="tile-body">
                                        <form class="row" name="blogForm" action="addblog" method="POST" enctype="multipart/form-data" onsubmit="return validateForm()">
                                            <div class="form-group col-md-3">
                                                <label class="control-label">Title<strong style="color: red">*</strong></label>
                                                <input class="form-control" type="text" name="title" id="title" required/>
                                            </div>

                                            <div class="form-group col-md-3">
                                                <label class="control-label">News Type</label>
                                                <select class="form-control" name="btid" required>
                                                    <option value="0">-- Select type --</option>
                                                    <c:forEach items="${requestScope.blogType}" var="c">
                                                        <option value="${c.id}" <c:if test="${c.id == param.btid}">selected</c:if>>${c.type}</option>
                                                    </c:forEach>

                                                </select>
                                            </div>

                                            <div class="form-group col-md-3">
                                                <label class="control-label">Status</label><br> 
                                                <div class="d-flex align-items-center">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="status" value="1" id="statusShow" checked>
                                                        <label class="form-check-label" for="statusShow">Show</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="status" value="0" id="statusHide">
                                                        <label class="form-check-label" for="statusHide">Hidden</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group col-md-12">
                                                <label class="control-label">Imgage</label>
                                                <div id="myfileupload">
                                                    <img id="image1" style="display: none; height: 200px; max-width: 100%; border-radius: 8px; margin: 10px 0px;">
                                                    <label for="blogPicture" class="Choicefile">Choose image</label>
                                                    <input type="file" id="blogPicture" name="image" accept=".png, .jpg, .jpeg" onchange="chooseFile(this)" required>
                                                </div>
                                            </div>

                                            <div class="form-group col-md-12">
                                                <label class="control-label">News Content<strong style="color: red">*</strong></label>
                                                <textarea class="form-control" name="contents" id="content" required></textarea>
                                                <script>CKEDITOR.replace('contents');</script>
                                            </div>

                                            <div class="form-group col-md-12">
                                                <button class="btn btn-save" type="submit">Save</button>
                                                <a class="btn btn-cancel" onclick="window.location.href = 'listnews'">Cancel</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>





        <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
        <script src="${pageContext.request.contextPath}/js/plugins/pace.min.js"></script>
        <script>
                                                    // Xác nhận việc lưu form
                                                    function confirmSave(event) {
                                                        event.preventDefault(); // Ngăn chặn gửi form mặc định

                                                        swal({
                                                            title: "Confirm?",
                                                            text: "Are you sure to add this News?",
                                                            buttons: ["Cancel", "Confirm"]
                                                        }).then((willSave) => {
                                                            if (willSave) {
                                                                // Kiểm tra tính hợp lệ của form trước khi gửi
                                                                if (validateForm()) {
                                                                    document.forms["blogForm"].submit(); // Gửi form nếu tất cả đều hợp lệ
                                                                    swal("Đã lưu thành công!", {
                                                                        icon: "success",
                                                                        timer: 2000,
                                                                        buttons: false
                                                                    });
                                                                }
                                                            }
                                                        });
                                                    }

                                                    // Kiểm tra tính hợp lệ của form
                                                    function validateForm() {
                                                        const form = document.forms["blogForm"];
                                                        const blogsTitle = form["title"].value.trim();
                                                        const blogsType = form["btid"].value;
                                                        const blogsContent = CKEDITOR.instances['content'].getData().trim();
                                                        const image = form["image"].files[0];

                                                        // Kiểm tra các trường thông tin
                                                        if (!blogsTitle) {
                                                            swal("Warning!", "Title can not null.", "warning");
                                                            return false;
                                                        }

                                                        if (checkDuplicateBlogTitle(blogsTitle)) {
                                                            swal("Warning!", "Title already exist.", "warning");
                                                            return false;
                                                        }

                                                        if (!blogsType || blogsType === "0") {
                                                            swal("Warning!", "News Type can not null.", "warning");
                                                            return false;
                                                        }

                                                        if (!image) {
                                                            swal("Warning!", "Image can not null.", "warning");
                                                            return false;
                                                        }

                                                        if (!blogsContent) {
                                                            swal("Warning!", "News Content can not null.", "warning");
                                                            return false;
                                                        }

                                                        // Gán lại giá trị tên sản phẩm chuẩn hóa (loại bỏ khoảng trắng giữa các từ)
                                                        form["title"].value = blogsTitle;
                                                        return true; // Tất cả các điều kiện đều hợp lệ
                                                    }

                                                    // Kiểm tra xem tên blog đã tồn tại hay chưa
                                                    function checkDuplicateBlogTitle(blogsTitle) {
                                                        const normalizedTitle = normalizeTitle(blogsTitle);
                                                        return checkBlogsTitleExist.includes(normalizedTitle);
                                                    }

                                                    // Chuẩn hóa tên blog
                                                    function normalizeTitle(name) {
                                                        return name.trim().toLowerCase().replace(/\s+/g, ''); // Xóa tất cả khoảng trắng giữa các từ
                                                    }

                                                    // Chọn file hình ảnh
                                                    function chooseFile(fileInput) {
                                                        const file = fileInput.files[0];
                                                        const allowedExtensions = ['png', 'jpg', 'jpeg'];
                                                        const fileExtension = file.name.split('.').pop().toLowerCase();

                                                        if (!allowedExtensions.includes(fileExtension)) {
                                                            alert('Chỉ cho phép các tệp .png, .jpg và .jpeg');
                                                            fileInput.value = ''; // reset the input value
                                                            return;
                                                        }

                                                        const reader = new FileReader();
                                                        const output = document.getElementById('image1');

                                                        reader.onload = function () {
                                                            output.src = reader.result;
                                                            output.style.display = 'block';
                                                        };

                                                        if (file) {
                                                            reader.readAsDataURL(file);
                                                        }
                                                    }

                                                    // Khởi tạo kiểm tra tồn tại tiêu đề blog
                                                    var checkBlogsTitleExist = [];
            <c:forEach items="${requestScope.blog}" var="b">
                                                    checkBlogsTitleExist.push(normalizeTitle("${b.title}"));
            </c:forEach>

                                                    // Kiểm tra tính hợp lệ của CKEditor khi submit form
                                                    document.querySelector("form").onsubmit = function () {
                                                        const content = CKEDITOR.instances['content'].getData().trim();
                                                        if (!content) {
                                                            alert("Nội dung không được để trống.");
                                                            return false;
                                                        }
                                                        return true;
                                                    };

                                                    // Gắn sự kiện vào nút save
                                                    jQuery(function () {
                                                        jQuery(".btn-save").click(confirmSave);
                                                    });
        </script>

    </body>

</html>

