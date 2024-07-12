<%-- 
    Document   : error
    Created on : Jun 30, 2024, 11:24:08 PM
    Author     : ismai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String username = (String) request.getAttribute("username"); %>
        <h1><%= username%></h1>
    </body>
</html>
