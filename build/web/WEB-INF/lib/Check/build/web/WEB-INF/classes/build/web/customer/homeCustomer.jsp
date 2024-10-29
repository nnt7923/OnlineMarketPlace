<%-- 
    Document   : home
    Created on : Sep 19, 2024, 4:42:33 PM
    Author     : phuvu
--%>

<%@ page import="model.Account" %>
<%
    Account account = (Account) session.getAttribute("account");
    if (account == null || account.getRoleId()!= 3) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<h1>Welcome Customer: <%= account.getUsername()%></h1>
