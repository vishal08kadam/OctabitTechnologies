<%-- 
    Document   : loadcourse
    Created on : 23-May-2020, 11:20:11 AM
    Author     : kadam_08
--%>

<%@page import="DBConnection.MariaDB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <option>--Select Course--</option>
        <%
            String sc = request.getParameter("valajax");
           // System.out.println(sc);
            Connection prgcon = MariaDB.getConnection();
            Statement prgstm = prgcon.createStatement();
            ResultSet prg;
            try {
                String prgsql = "SELECT DISTINCT(COURSE) FROM admission_data WHERE CCODE = '"+sc+"'";
                prg = prgstm.executeQuery(prgsql);
                while (prg.next()) {
        %>
    <option value="<%=prg.getString("COURSE")%>"><%=prg.getString("COURSE")%></option>
    <%
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            out.println(e.getMessage());
        }
    %>
</body>
</html>
