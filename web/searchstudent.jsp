<%-- 
    Document   : searchstudent
    Created on : 23-May-2020, 12:04:02 PM
    Author     : kadam_08
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Octabit Technologies :: Student Search</title>
        <style>
            * {
                box-sizing: border-box;
            }

            body {
                margin: 0;
            }

            /* Style the header */
            .header {
                background-color: orange;
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
            #searchoption, #one, #two, #three, #lname, #fname, #prnno, #appno{
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#searchoption').on('change', function () {
                    if (this.value === '0') {
                        $("#one").show();
                        $("#two").hide();
                        $("#three").hide();
                    } else if (this.value === '1') {
                        $("#one").hide();
                        $("#two").show();
                        $("#three").hide();
                    } else if (this.value === '2') {
                        $("#one").hide();
                        $("#two").hide();
                        $("#three").show();
                    }
                });

            });
        </script>
    </head>
    <body>
        <div class="header"><!--div tag for header class -->
                <h1>Welcome!</h1>
            </div>
            <div class="topnav">
                <a href="index.html">Home</a>
                <a href="mainmenu.jsp">Main Menu</a>
                <a href="#">About Us</a>
                <a href="contact.jsp">Contact</a>
                <a href="logout.jsp">Logout</a>
            </div>
            <br>
            <div class="column side"></div>
            <div class="column middle">
        <form method="POST" action="sprofile.jsp">
            <h1>Student profile</h1>
            <div>
                <label><b>Search Student Option : </b></label>
                <select style="width: 200px;" name="searchoption" id="searchoption">
                    <option>--</option>
                    <option value="0">Search By PRN Number</option>
                    <option value="1">Search By Application Number</option>
                    <option value="2">Search By Name</option>
                </select>
            </div>
            <div id="one" name="one" style="display: none">
                <h2>Search Student by PRN</h2>
                <label><b>Enter PRN Number : </b></label>
                <input type="text" name="prnno" id="prnno" style="width: 200px;" placeholder="Enter PRN Number">
                <br><br>
            </div>
            <div id="two" name="two" style="display: none">
                <h2>Search Student by Application Number : </h2>
                <label><b>Enter Application Number : </b></label>
                <input type="text" name="appno" id="appno" placeholder="Enter Application Number" style="width: 200px;">
                <br><br>
            </div>
            <div id="three" name="three" style="display: none">
                <h2>Search Student by Name</h2>
                <label><b>Last Name : </b></label>
                <input type="text" name="lname" id="lname" style="width: 200px;" placeholder="Last Name">
                <br><br>
                <label><b>First Name :</b></label>
                <input type="text" name="fname" id="fname" style="width: 200px;" placeholder="First Name">
                <br><br>
            </div>
            <br><br>
            
            <button id="button" onclick="chg()">Search</button>
            <button id="button" type="reset">Reset</button>
            <br><br>
        </form>
                </div>
            <div class="columnside"></div>
            <div class="footer"></div>
    </body>
</html>
