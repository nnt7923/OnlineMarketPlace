<%-- 
    Document   : dashboard
    Created on : Sep 19, 2024, 4:43:29 PM
    Author     : phuvu
--%>

<%@ page import="model.Account" %>
<%
    Account account = (Account) session.getAttribute("account");
    if (account == null || account.getRoleID() != 4) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<h1>Welcome Shipper: <%= account.getUsername()%></h1>
