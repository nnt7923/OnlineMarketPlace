<%-- 
    Document   : list
    Created on : Aug 7, 2024, 2:06:25 PM
    Author     : nntru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <c:forEach items="${requestScope.list}" var="s"> 
            ${s.id} ${s.name}<br/> 
        </c:forEach> 
</body>
</html>
