<%
String username=(String)session.getAttribute("user");
if(username!=null)
{
%>
<html>
    <head>
        <title>
            Admin
        </title>
        <link rel="stylesheet" href="CSS/style.css">

        <script>
        function displayResult() {
            str=document.getElementById("search").value;
            if (str.length == 0) { 
                document.getElementById("display").innerHTML = "Please enter the name correctly";
                    return;
                } else {
            
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function() {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                            document.getElementById("display").innerHTML = xmlhttp.responseText;
                        }
                    }
                    xmlhttp.open("GET", "stdetails.jsp?q=" + str, true);
                    xmlhttp.send();
                }
            }
            </script>
    </head>
    <body>
        <header>
            <div class="header">
                <h1>Fee payment</h1>
                <p align="right"><%
                out.println("Welcome "+username+"<br>");
                %>
                <font size=3><a href=logout.jsp>Logout</a></font></p>
              </div>
              </header>
        <div width="70%">
            <input type=text id="search" placeholder="Search by name"> <button type=button onclick=displayResult()>Search</button>
            </div>
            <br>
            <center><div id=display style="width:500px; height:300px;">
            Your Search results will be displayed here
            </div></center>
<%
}//end of if
else
{
response.sendRedirect("admin.html");
}
%>
<footer>
    <p>Created by Pulkit's Group.<br>
    <a href="pulkitakku@gmail.com">XYZ@gmail.com</a></p>
</footer>
</body>
</html>