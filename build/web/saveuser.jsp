<%-- 
    Document   : saveuser
    Created on : 22-May-2020, 6:40:17 PM
    Author     : kadam_08
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="DBConnection.MariaDB"%>
<%@page import="mdhash.mdjavahash"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String name = request.getParameter("fname");
            session.putValue("fname", name);
            String login = request.getParameter("loginid");
            session.putValue("loginid", login);
            String sc = request.getParameter("sc");
            session.putValue("sc", sc);
            String pwd = request.getParameter("pwd");
            session.putValue("pwd", pwd);
            mdjavahash md = new mdjavahash();
            String pwdmdhash = md.getHashPass(pwd);
            String role = request.getParameter("role");
            session.putValue("role", role);

            try {
                Connection con = MariaDB.getConnection();
                Statement stm = con.createStatement();
                String sql = "INSERT INTO usersinfo (UNAME, SCASSIGNED, LOGINID, LOGINPASSWORD, HASHPASSWORD, ROLE) VALUES"
                        + " ('" + name + "', '" + sc + "', '" + login + "','" + pwd + "', '" + pwdmdhash + "', '" + role + "' )";
                int i = stm.executeUpdate(sql);
                JOptionPane.showMessageDialog(null, "User created Successfully" + "\n" + "Username :- " + name, "Success", JOptionPane.INFORMATION_MESSAGE);
                response.sendRedirect("registration.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                out.println(e.getMessage());
            }
        %>
    </body>
</html>
