<%@ page import="java.sql.*" %>
<%
int flag=0;

Connection con=null;
ResultSet rs=null;
Statement st=null;

%>
<%
String username=(String)session.getAttribute("user");
if(username!=null)
{
%>

<html>
    <head>
        <title>Home</title>
        <link rel="stylesheet" href="CSS/style.css">
        <link rel="stylesheet" href="CSS/style1.css">

    </head>
    <body>
        <header>
        <div class="header">
            <marquee><h1>Fee payment</h1></marquee>
            <h3 align="right" bgcolor="white"><%
              out.println("Welcome "+username+"<br>");
              %>
              <font size=3><a href=logout.jsp>Logout</a></font></h3>
          </div>
        </header>
    
    
</div>
</div>
<br><br>
<%
try{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/school?characterEncoding=utf8", "root", "root");
st=con.createStatement();
rs= st.executeQuery("Select * from Student_details");
out.println("<div class=left>");
out.println("<table class=window border=1>");
out.println("<tr><th>Student id</th><th>Student Name</th><th>Father Name</th><th>Standard</th><th>Section</th><th>Date of birth</th></tr>");
while(rs.next())
{ 
flag=1;
out.println("<tr><td>"+rs.getString(1)+ "</td><td>" +rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>" +rs.getString(4)+"</td><td>" +rs.getString(5)+"</td><td>" +rs.getString(6)+"</td></tr>");
}
if(flag==0)
{
out.println("<tr><th colspan=9>No data to be displayed</th></tr>");
}
out.println("</table>");
out.println("</div>");
}

//End of try
catch(Exception e) 
{
out.println(e);
}
%>
  <div class="right">
  <div class="card" style="float:right">
    <form method="post" action="payment.jsp">
        <div class="container">
        <p><b>Student_id</b></p>
        <input type="text" placeholder="Student ID" name="id" required/>
        <p><b>Enter Amount</b></p>
        <input type="text" placeholder="Enter Amount" name="amonut" required/>
        <button type="submit">Payment</button>
    </div>
    </form>
  </div>
</div>
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