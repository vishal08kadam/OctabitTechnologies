<%-- 
    Document   : sprofile
    Created on : 23-May-2020, 1:32:06 PM
    Author     : kadam_08
--%>

<%@page import="DBConnection.MariaDB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Octabit Technologies :: Student Profile</title>
        <style>
            #four {
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            #four td, #four th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            #four tr:nth-child(even){background-color: #f2f2f2;}

            #four tr:hover {background-color: #ddd;}

            #four th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #4CAF50;
                color: white;
            }
            #four tr.header {
                background-color: orange;
            }

            #five {
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 62%;
            }

            #five td, #five th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            #five tr:nth-child(even){background-color: #f2f2f2;}

            #five tr:hover {background-color: #ddd;}

            #five th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #4CAF50;
                color: white;
            }
            * {
                box-sizing: border-box;
            }

            body {
                margin: 0;
            }

            /* Style the header */
            .header {
                background-color: blueviolet;
                padding: 20px;
                text-align: center;
            }

            /* Style the top navigation bar */
            .topnav {
                overflow: hidden;
                background-color: #333;
            }
            .topnav a {
                float: left;
                display: block;
                color: #f2f2f2;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

            /* Change color on hover */
            .topnav a:hover {
                background-color: #ddd;
                color: black;
            }

        </style>
    </head>
    <body>
        <div class="header"><!--div tag for header class -->
                <h1>Student Profile</h1>
            </div>
            <div class="topnav">
                <a href="index.html">Home</a>
                <a href="mainmenu.jsp">Main Menu</a>
                <a href="#">About Us</a>
                <a href="searchstudent.jsp">Search Student</a>
                <a href="contact.jsp">Contact</a>
                <a href="logout.jsp">Logout</a>
            </div>
            <br>
            <table id="four">
            <tr class="header">
                <td><b>Application Number</b></td>
                <td><b>Name On MarkSheet</b></td>
                <td><b>Father Name</b></td>
                <td><b>Mother Name</b></td>
                <td><b>Username</b></td>
                <td><b>PRN</b></td>
                <td><b>Admission Date</b></td>
                <td><b>College</b></td>
                <td><b>College Code</b></td>
                <td><b>Course</b></td>
                <td><b>Papers</b></td>
              <!--  <td><b>Select</b></td> -->
            </tr>
            <%
                int counter = 1;
                int a = Integer.parseInt(request.getParameter("searchoption"));
                //System.out.println(a);
                Connection con = MariaDB.getConnection();
                Statement stm = con.createStatement();
                ResultSet rs;
                switch (a) {
                    case 0:
                        String prn = request.getParameter("prnno");
                         session.setAttribute("prn", prn);
                        String sql = "SELECT APPLICATIONNUMBER, NAMEONMARKSHEET, MIDDLENAME, MOTHERNAME, USERNAME, PRN, ADMISSIONDATE, COLLEGE, CCODE, COURSE, PAPERS FROM admission_data WHERE PRN ='" + prn + "'";
                        try {
                            rs = stm.executeQuery(sql);
                            ResultSetMetaData rsmd = rs.getMetaData();
                            while (rs.next()) {
                                %>
                                
                            <tr>
                <%
                    for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                %>
                <td><%=rs.getString(i)%></td>
                
                <%
                    }
                    
                %>
             <!--   <td><a href="academicdetails.jsp">Select</a></td> -->
            </tr>
            <%   
                    
                        }
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println(e.getMessage());
                    }
                    break;
                case 1:
                    String app = request.getParameter("appno");
                    String sql1 = "SELECT APPLICATIONNUMBER, NAMEONMARKSHEET, MIDDLENAME, MOTHERNAME, USERNAME, PRN, ADMISSIONDATE, COLLEGE, CCODE, COURSE, PAPERS FROM admission_data WHERE APPLICATIONNUMBER = '" + app + "'";
                    try {
                        rs = stm.executeQuery(sql1);
                        ResultSetMetaData rsmd1 = rs.getMetaData();
                        while (rs.next()) {
            %>
            <tr>
                <%
                    for (int i = 1; i <= rsmd1.getColumnCount(); i++) {
                %>
                <td><%=rs.getString(i)%></td>
                <%
                    }
                %>
              <!--  <td><a href="">Select</a></td> -->
            </tr>
            <%
                        }
                        con.close();
                    } catch (Exception e) {
                    e.printStackTrace();
                        out.println(e.getMessage());
                    }
                    break;
                case 2:
                    String f_name = request.getParameter("fname");
                    String l_name = request.getParameter("lname");
                    String sql2 = "SELECT APPLICATIONNUMBER, NAMEONMARKSHEET, MIDDLENAME, MOTHERNAME, USERNAME, PRN, ADMISSIONDATE, COLLEGE, CCODE, COURSE, PAPERS FROM admission_data WHERE LastName LIKE '%" + l_name + "%' AND FirstName LIKE '%" + f_name + "%' ORDER BY NAMEONMARKSHEET ASC";
                    try {
                        rs = stm.executeQuery(sql2);
                        ResultSetMetaData rsmd2 = rs.getMetaData();
                        while (rs.next()) {
            %>
            <tr>
                <%
                    for (int i = 1; i <= rsmd2.getColumnCount(); i++) {
                %>
                <td><%=rs.getString(i)%></td>
                <%
                    }
                %>
              <!--  <td><a href="">Select</a></td> -->
            </tr>
            <%
                            }
                            con.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println(e.getMessage());
                        }
                        break;
                }

            %>
        </table>
        
    </body>
</html>
