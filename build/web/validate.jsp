<%-- 
    Document   : validate
    Created on : 22-May-2020, 5:57:20 PM
    Author     : kadam_08
--%>
<%@page import="otp.generateotp"%>
<%@page import="javax.swing.*"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="mdhash.mdjavahash"%>
<%@page import="DBConnection.MariaDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import = "java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            //get values of textfield from ajax jquery from index.jsp

            String u_name = request.getParameter("uname");
            session.putValue("uname", u_name);
            String _pwd = request.getParameter("pwd");
            session.putValue("pwd", _pwd);
            //System.out.println(u_name + _pwd);
            /*
            we are md hashing the password and saving the mdhashpassword to the database
            below is the code to create mdhash password            
             */
            mdjavahash md = new mdjavahash();
            String pwdmdhash = md.getHashPass(_pwd);
            //System.out.println(pwdmdhash);
            generateotp otp = new generateotp();
            String _otp = otp.getotp("");
            System.out.println(_otp);
            /*
            Connection to Database and validating login details
             */
            try {
                Connection con = MariaDB.getConnection(); //db connection
                Statement stm = con.createStatement();
                String sql = "SELECT UNAME, SCASSIGNED, LOGINID, HASHPASSWORD FROM usersinfo WHERE LOGINID = '" + u_name + "' AND HASHPASSWORD = '" + pwdmdhash + "'";
                ResultSet rs;
                rs = stm.executeQuery(sql); //validation of user in the query itself
                if (rs.next()) {
                    HttpSession s = request.getSession(); //get session
                    
                    String user = rs.getString("UNAME");
                    String scassigned = rs.getString("SCASSIGNED");
                    
                    JOptionPane.showMessageDialog(new JFrame(), "Login SuccessFull", "Success", JOptionPane.INFORMATION_MESSAGE);
                    session.setAttribute("loggeduser", user); //assign user to session
                    session.setAttribute("loggedusersc", scassigned);
                    response.sendRedirect("mainmenu.jsp");
                    Date logintime = new Date();
                    logintime = new java.util.Date();
                    session.setAttribute("time", logintime);
                } else {
                    JOptionPane.showMessageDialog(new JFrame(), "Invalid details", "Error", JOptionPane.ERROR_MESSAGE);
                    response.sendRedirect("index.html");
                }

                con.close();
            } catch (Exception e) {
                e.printStackTrace();
                out.println(e.getMessage());
            }
        %>
    </body>
</html>
