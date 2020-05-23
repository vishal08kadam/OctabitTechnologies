<%-- 
    Document   : mainmenu
    Created on : 22-May-2020, 7:55:41 PM
    Author     : kadam_08
--%>

<%@page import="DBConnection.MariaDB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Octabit Technologies :: Main Menu</title>
        <style>
            * {
                box-sizing: border-box;
            }

            body {
                margin: 0;
            }

            /* Style the header */
            .header {
                background-color: yellowgreen;
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
            .student-box {
                margin: auto;
                border: solid;
                padding: 20px;
                width: 25%;
                height: 300px;

            }
            #program, #sc{
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
        <script type="text/javascript">
            function chg() {
                var val = document.getElementById('sc').value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function ()
                {
                    if (xhttp.readyState === 4 && xhttp.status === 200)
                    {
                        document.getElementById('program').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "loadcourse.jsp?valajax=" + val, true);
                xhttp.send();
            }
        </script>
    </head>
    <body>
        <div class="header"><!--div tag for header class -->
            <h1>Octabit Technologies :: Main Menu</h1>
        </div>
        <div class="topnav">
            <a href="index.html">Home</a>
            <a href="#">Register</a>
            <a href="#">About Us</a>
            <a href="contact.jsp">Contact</a>
            <a href="logout.jsp">Logout</a>
        </div>
        <br>
        <div class="column side">
            <%
                String Loggedperson = session.getAttribute("loggeduser").toString();
                String time = session.getAttribute("time").toString();
                //String studycenter = session.getAttribute("loggedusersc").toString();
%>
            <h3>Welcome <%=Loggedperson + ", Your Login time is " + time + "."/*+ " and you have access for " + studycenter + " this study center only."*/%></h3>
        </div>
        <div column middle>
            <form method="POST" action="searchstudent.jsp">
            <div class="student-box">
                <label><b>Select Study Center : </b></label>
                <select style="width: 200px;" name="sc" id="sc" onchange="chg()">
                    <option>--Select Study Center--</option>
                    <%
                        Connection sccon = MariaDB.getConnection();
                        Statement scstm = sccon.createStatement();
                        ResultSet sc;
                        try {
                            String sql = "SELECT DISTINCT(CCODE) FROM admission_data";
                            sc = scstm.executeQuery(sql);
                            while (sc.next()) {
                    %>
                    <option value="<%=sc.getString("CCODE")%>"><%=sc.getString("CCODE")%></option>
                    <%
                            }
                            sccon.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println(e.getMessage());
                        }
                    %>
                </select>
                <br>
                <label><b>Select Program : </b></label>
                <select style="width: 200px;" name="program" id="program">
                    <option>--Select Course--</option>
                </select>
                <br><br>
                <button id="button" type="submit">Proceed</button>
                <button id="button" type="reset">Reset</button>
            </div>
                </form>
        </div>
    </body>
</html>
