<%-- 
    Document   : registration
    Created on : 22-May-2020, 6:10:35 PM
    Author     : kadam_08
--%>

<%@page import="DBConnection.MariaDB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Octabit Technologies :: Registration</title>
        <style>
            * {
                box-sizing: border-box;
            }

            body {
                margin: 0;
            }

            /* Style the header */
            .header {
                background-color: greenyellow;
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
            /* Create three unequal columns that floats next to each other */
            .column {
                float: left;
                padding: 10px;
            }

            /* Left and right column */
            .column.side {
                width: 25%;
            }

            /* Middle column */
            .column.middle {
                width: 50%;
            }

            /* Clear floats after the columns */
            .row:after {
                content: "";
                display: table;
                clear: both;
            }

            .registartion-box {
                margin: auto;
                border: solid;
                padding: 20px;
                width: 30%;
                height: 550px;

            }
            #fname, #loginid, #sc, #pwd, #role{
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            
            #button {
                width: 35%;
                color: black;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                background-color: yellow;
            }
            #button:hover {
                background-color: yellowgreen;
            }
        </style>
    </head>
    <body>
        <form method="POST" action="saveuser.jsp">
            <div class="header"><!--div tag for header class -->
                <h1>Register User</h1>
            </div>
            <div class="topnav">
                <a href="index.html">Home</a>
                <a href="#">Register</a>
                <a href="#">About Us</a>
                <a href="contact.jsp">Contact</a>
                <a href="logout.jsp">Logout</a>
            </div>
            <br>
            <div class="leftcolumn"></div>
            <div class="middlecolumn">
                <div class="registartion-box">
                    <label><b>Username : </b></label>
                    <input type="text" name="fname" id="fname" placeholder="Enter Full Name" required="">
                    <br><br>
                    <label><b>Login ID : </b></label>
                    <input type="text" name="loginid" id="loginid" required="" placeholder="Enter Login ID">
                    <br><br>
                    <label><b>Select Study Center : </b></label>
                    <select style="width: 200px;" name="sc" id="sc">
                        <option>-- Select Study Center --</option>
                        <option>All</option>
                        <%
                            Connection con = MariaDB.getConnection();
                            Statement stm = con.createStatement();
                            ResultSet rs;
                            try {
                                String sql = "select SCCODE from studycentermasters";
                                rs = stm.executeQuery(sql);
                                while (rs.next()) {
                        %>
                        <option value="<%=rs.getString("SCCODE")%>"><%=rs.getString("SCCODE")%></option> 
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                                out.println(e.getMessage());
                            }
                        %>
                    </select>
                    <br><br>
                    <label><b>Password : </b></label>
                    <input type="text" name="pwd" id="pwd" placeholder="Enter Password" required="">
                    <br><br>
                    <label><b>Role : </b></label>
                    <select style="width: 200px;" name="role" id="role">
                        <option>--Select Role --</option>
                        <option>Admin</option>
                        <option>College User</option>
                    </select>
                    <br><br>
                    <button id="button" type="submit">Save</button>
                    <button id="button" type="reset">Reset</button>
                </div>
            </div>
            <div class="rightcolumn"></div>
            <div class="footer"></div>
        </form>
    </body>
</html>
