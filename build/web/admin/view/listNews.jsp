<%-- 
    Document   : listBlog
    Created on : Jul 16, 2024, 8:59:35 AM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="currency" uri="/WEB-INF/currency.tld" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Management News</title>
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
                            <ul class="app-breadcrumb breadcrumb side">
                                <li class="breadcrumb-item active"><a href="listnews"><b>News List</b></a></li>
                            </ul>
                            <div id="clock"></div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="tile">
                                    <div class="tile-body">
                                        <div class="row element-button">
                                            <div class="col-sm-2">
                                                <a class="btn btn-add btn-sm" href="addblog" title="Thêm"><i class="fas fa-plus"></i>
                                                    Add News List</a>
                                            </div>

                                        </div>
                                        <div id="sampleTable_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
                                            <div class="row">
                                                <div class="col-sm-12 col-md-2">
                                                    <div class="dataTables" style="margin-right: 30px">
                                                        <form id="frmsearch" action="listnews" method="POST">
                                                            <select class="form-control" id="exampleSelect1" style="height: 51px" name="btid" onchange="document.getElementById('frmsearch').submit()">
                                                                <option value="0">All</option>
                                                                <c:forEach items="${blogtype}" var="n">
                                                                    <option
                                                                        <c:if test="${n.id eq param.btid}"> 
                                                                            selected="selected"
                                                                        </c:if>
                                                                        value="${n.id}"
                                                                        > ${n.type}
                                                                    </option>
                                                                </c:forEach>
                                                            </select>
                                                        </form>
                                                    </div>
                                                </div>

                                                <div class="col-sm-12 col-md-5"></div>
                                                <!-- Search Form -->                                   
                                                <div class="col-sm-12 col-md-5">
                                                    <form id="frmsearch" method="post" action="listnews" >
                                                        <div id="sampleTable_filter" class="dataTables_filter">
                                                            <label>Search:
                                                                <input type="text" class="form-control" id="searchQuery" name="searchQuery" value="${param.searchQuery}" placeholder=" Search by title, date">
                                                            </label>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <table class="table table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                                                        <thead>
                                                            <tr role="row">
                                                                <th class="sorting" style="width: 20.2px;">News ID
                                                                </th>
                                                                <th class="sorting" style="width: 20.2px;">Image
                                                                </th>
                                                                <th class="sorting" style="width: 40.2px;">News Type
                                                                </th>
                                                                <th class="sorting" style="width: 120.2px;">Title
                                                                </th>
                                                                <th class="sorting" style="width: 120.2px;">News Content
                                                                </th>
                                                                <th class="sorting" style="width: 40.2px;">Create Date
                                                                </th>
                                                                <th class="sorting" style="width: 20.2px;">Status
                                                                </th>
                                                                <th class="sorting" style="width: 0.2px;">Functions
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>   
                                                            <c:forEach var="blog" items="${requestScope.blog}">
                                                                <tr role="row" class="even">
                                                                    <td>${blog.id}
                                                                        <form id="frmDelete${blog.id}" action="deleteblog" method="POST">
                                                                            <input type="hidden" name="id" value="${blog.id}"/>
                                                                        </form>
                                                                    </td>
                                                                    <td><img src="${pageContext.request.contextPath}/images/${blog.image}" style="height: 70px; max-width: 100%; border-radius: 10px; margin: 0px 0;"></td>
                                                                    <td>${blog.newsType.type}</td>
                                                                    <td>${blog.title}</td>

                                                                    <td class="truncate-text">${blog.content}</td>

                                                                    <td>${blog.createdDate}</td>
                                                                    <td style="color: ${blog.status ? 'green' : 'red'};">${blog.status ? 'Show' : 'Hidden'}</td>
                                                                    <td>
                                                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="editor1" data-toggle="modal"
                                                                                onclick="window.location.href = 'updateblog?id=${blog.id}'"><i class="fas fa-edit"></i>
                                                                        </button>
                                                                        <button class="btn btn-danger btn-sm trash" type="button" title="Xóa" data-id="${blog.id}"><i class="fas fa-trash-alt"></i></button>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-12 col-md-5"></div>
                                                <div class="col-sm-12 col-md-7">
                                                    <div class="dataTables_paginate paging_simple_numbers" id="sampleTable_paginate">
                                                        <ul class="pagination">
                                                            <c:if test="${tag > 1}">
                                                                <li class="paginate_button page-item previous" id="sampleTable_previous">
                                                                    <a href="listnews?index=${tag-1}&searchQuery=${param.searchQuery}" aria-controls="sampleTable" data-dt-idx="0" tabindex="0" class="page-link" style="color: black">Lùi</a>
                                                                </li>
                                                            </c:if>

                                                            <!-- Always show the first page -->
                                                            <li class="paginate_button page-item ${tag == 1 ? 'active' : ''}">
                                                                <a href="listnews?index=1&searchQuery=${param.searchQuery}" aria-controls="sampleTable" data-dt-idx="1" tabindex="0" class="page-link">1</a>
                                                            </li>

                                                            <!-- Show ... if current page > 4 -->
                                                            <c:if test="${tag > 4}">
                                                                <li class="paginate_button page-item disabled"><a href="#" class="page-link">...</a></li>
                                                                </c:if>

                                                            <!-- Show 3 pages in the middle -->
                                                            <c:forEach begin="${tag - 1}" end="${tag + 1}" var="i">
                                                                <c:if test="${i > 1 && i < endP}">
                                                                    <li class="paginate_button page-item ${tag == i ? 'active' : ''}">
                                                                        <a href="listnews?index=${i}&searchQuery=${param.searchQuery}" aria-controls="sampleTable" data-dt-idx="${i}" tabindex="0" class="page-link">${i}</a>
                                                                    </li>
                                                                </c:if>
                                                            </c:forEach>

                                                            <!-- Show ... if current page < endP - 3 -->
                                                            <c:if test="${tag < endP - 3}">
                                                                <li class="paginate_button page-item disabled"><a href="#" class="page-link">...</a></li>
                                                                </c:if>

                                                            <!-- Always show the last page -->
                                                            <li class="paginate_button page-item ${tag == endP ? 'active' : ''}">
                                                                <a href="listnews?index=${endP}&searchQuery=${param.searchQuery}" aria-controls="sampleTable" data-dt-idx="${endP}" tabindex="0" class="page-link">${endP}</a>
                                                            </li>

                                                            <c:if test="${tag < endP}">
                                                                <li class="paginate_button page-item next" id="sampleTable_next">
                                                                    <a href="listnews?index=${tag+1}&searchQuery=${param.searchQuery}" aria-controls="sampleTable" data-dt-idx="2" tabindex="0" class="page-link" style="color: black">Tiếp</a>
                                                                </li>
                                                            </c:if>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>


        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <script>
                                                                            function deleteRow(row) {
                                                                                var id = row.getAttribute('data-id');
                                                                                document.getElementById("frmDelete" + id).submit();
                                                                            }

                                                                            jQuery(function () {
                                                                                jQuery(".trash").click(function () {
                                                                                    var row = this;
                                                                                    swal({
                                                                                        title: "Warning",
                                                                                        text: "Are you sure you want to delete this news?",
                                                                                        buttons: ["Cancel", "Confirm"]
                                                                                    })
                                                                                            .then((willDelete) => {
                                                                                                if (willDelete) {
                                                                                                    deleteRow(row);
                                                                                                    swal("Delete Successful!", {
                                                                                                        icon: "success"
                                                                                                    });
                                                                                                }
                                                                                            });
                                                                                });
                                                                            });

                                                                            // Function to truncate text
                                                                            function truncateText(selector, maxLength) {
                                                                                var elements = document.querySelectorAll(selector);
                                                                                elements.forEach(function (element) {
                                                                                    var text = element.innerText;
                                                                                    if (text.length > maxLength) {
                                                                                        element.innerText = text.substring(0, maxLength) + '...';
                                                                                    }
                                                                                });
                                                                            }

                                                                            // Call the truncate function on page load
                                                                            document.addEventListener('DOMContentLoaded', function () {
                                                                                truncateText('.truncate-text', 50);
                                                                            });
        </script>
    </body>
</html>

