<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .error-container {
            max-width: 600px;
            margin: 100px auto;
            padding: 20px;
            text-align: center;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }
        .error-container h1 {
            color: #e74c3c;
            font-size: 48px;
        }
        .error-container p {
            font-size: 18px;
            margin: 20px 0;
        }
        .back-btn {
            padding: 10px 20px;
            background-color: #3498db;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
        }
        .back-btn:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

    <div class="error-container">
        <h1>Oops! Đã có lỗi xảy ra</h1>
        <p>Chúng tôi xin lỗi, đã xảy ra lỗi trong quá trình xử lý yêu cầu của bạn. Vui lòng thử lại sau.</p>

        <!-- Thông báo lỗi chi tiết nếu cần thiết -->
        <p><i><%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "Lỗi không xác định" %></i></p>

        <!-- Nút quay lại trang trước -->
        <a href="javascript:history.back()" class="back-btn">Quay lại trang trước</a>
    </div>

</body>
</html>
