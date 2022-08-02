<%@ page import="java.sql.*" %>

<%
Connection con=null;
ResultSet rs=null;
Statement st=null;


String u=request.getParameter("uname");
String p=request.getParameter("p1");

try{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/school?characterEncoding=utf8", "root", "root");
st=con.createStatement();
String query="Select * from login_details where username='"+u+"' and password='"+p+"' and role='Cashier'";
rs= st.executeQuery(query);


if(rs.next())
{
session.setAttribute("user",u);
response.sendRedirect("cashier.jsp");
}
else
{
response.sendRedirect("index.html");
}

}//End of try
catch(Exception e)
{
out.println(e);
}
%>