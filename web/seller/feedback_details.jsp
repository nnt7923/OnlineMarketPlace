<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="includes/head.jsp" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Feedback Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
    <style>
        .feedback-card { border: 1px solid #ddd; border-radius: 8px; margin-bottom: 15px; padding: 15px; }
        .reply-card { background-color: #f8f9fc; border-radius: 8px; padding: 15px; margin-bottom: 10px; position: relative; border: 1px solid #ddd; }
        .reply-content { display: flex; align-items: center; justify-content: space-between; }
        .reply-list { display: none; margin-top: 15px; }
        .btn-action {
            font-size: 0.875rem;
            padding: 4px 8px;
            border-radius: 20px;
            color: white;
            margin-right: 5px;
        }
        .btn-update {
            background-color: #32CD32; /* Lime green */
        }
        .btn-delete {
            background-color: #dc3545; /* Red */
        }
        .edit-area {
            display: none;
            margin-top: 10px;
        }
        /* Styling for the back button and title */
        .btn-back {
            position: absolute;
            top: 80px;
            left: 240px;
            z-index: 1;
        }
        .page-title {
            position: absolute;
            top: 20px;
            right: 800px;
            color: #32CD32; /* Lime green */
            font-weight: bold;
            font-size: 1.5rem;
        }
    </style>
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <%@include file="includes/sidebar.jsp" %>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <%@include file="includes/topbar.jsp" %>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Back Button in Top Left -->
                    <a href="feedbackReply?action=listProducts" class="btn btn-secondary btn-back">Back</a>
                    
                    <!-- Product Feedback Title in Top Right -->
                    <div class="page-title">Product Feedback</div>

                    <!-- Product Information -->
                    <div class="card mx-auto mb-4 text-center shadow-sm" style="max-width: 400px; border-radius: 12px;">
                        <div class="card-body">
                            <h4 class="card-subtitle mb-3 text-dark">${productName}</h4>
                            <img src="${pageContext.request.contextPath}/images/${productImage}" class="img-fluid rounded shadow-sm mb-3" style="max-width: 250px;" alt="${productName}">
                            <p class="card-text font-weight-bold text-primary">
                                Price: <fmt:formatNumber value="${productPrice}" type="currency" currencySymbol="₫" groupingUsed="true"/>
                            </p>
                            <p class="card-text text-muted">Product ID: ${selectedProductId}</p>
                        </div>
                    </div>

                    <!-- Feedback List (Remains unchanged) -->
                </div>

                <!-- Feedback List -->
                <c:if test="${not empty feedbackList}">
                    <div class="feedback-list">
                        <c:forEach var="feedback" items="${feedbackList}">
                            <div class="feedback-card shadow-sm">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h5>Feedback ID: ${feedback.feedback_id}</h5>
                                    <span class="badge bg-primary">${feedback.rating} ★</span>
                                </div>
                                <p class="mb-1"><strong>Content:</strong> ${feedback.feedback_content}</p>
                                <small class="text-muted">Date: ${feedback.create_date}</small>

                                <!-- Reply Form -->
                                <form action="feedbackReply" method="post" class="mt-3">
                                    <input type="hidden" name="action" value="add">
                                    <input type="hidden" name="feedback_id" value="${feedback.feedback_id}">
                                    <textarea name="reply_content" class="form-control" placeholder="Write your reply..." required></textarea>
                                    <button type="submit" class="btn btn-primary btn-sm btn-reply">Reply</button>
                                </form>

                                <!-- View Replies Button -->
                                <button onclick="toggleReplies(${feedback.feedback_id})" class="btn btn-link btn-sm text-primary mt-2">
                                    <i class="fas fa-comments"></i> View Replies
                                </button>

                                <!-- Replies List (Hidden by Default) -->
                                <div id="replies-${feedback.feedback_id}" class="reply-list mt-3">
                                    <c:forEach var="reply" items="${feedback.replies}">
                                        <div class="reply-card shadow-sm">
                                            <div class="reply-content">
                                                <p id="reply-text-${reply.replyId}" class="mb-0">${reply.replyContent}</p>
                                                <div class="d-flex gap-2">
                                                    <a href="javascript:void(0);" onclick="showUpdateArea(${reply.replyId})" class="btn btn-update btn-action">
                                                        <i class="fas fa-edit"></i> Update
                                                    </a>
                                                    <a href="javascript:void(0);" onclick="deleteReply(${reply.replyId})" class="btn btn-delete btn-action">
                                                        <i class="fas fa-trash-alt"></i> Delete
                                                    </a>
                                                </div>
                                            </div>

                                            <!-- Inline Edit Area for Updating Reply -->
                                            <div id="edit-area-${reply.replyId}" class="edit-area">
                                                <textarea id="edit-text-${reply.replyId}" class="form-control mb-2">${reply.replyContent}</textarea>
                                                <button onclick="applyUpdate(${reply.replyId})" class="btn btn-primary btn-sm">Apply</button>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>

            </div>
            <!-- End of Content Wrapper -->
        </div>
        <!-- End of Page Wrapper -->
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>

