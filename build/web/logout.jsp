<%-- 
    Document   : logout
    Created on : 22-May-2020, 8:51:20 PM
    Author     : kadam_08
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            session.invalidate();
            response.sendRedirect("index.html");
        
        %>
    </body>
</html>
