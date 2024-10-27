<%@ page isErrorPage="true" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>
</head>
<body>
    <h1>Oops! An error occurred.</h1>
    
    <p><strong>Error Message:</strong> ${errorMessage}</p>

    <c:if test="${not empty errorDetails}">
        <h2>Error Details:</h2>
        <pre>
            ${errorDetails}
        </pre>
    </c:if>
</body>
</html>
