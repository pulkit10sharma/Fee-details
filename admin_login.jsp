<%@ page import="java.sql.*" %>

<%
Connection con=null;
ResultSet rs=null;
Statement st=null;


String u=request.getParameter("aname");
String p=request.getParameter("p2");

try{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/school?characterEncoding=utf8", "root", "root");
st=con.createStatement();
String query="Select * from login_details where username='"+u+"' and password='"+p+"' and role='Admin'";
rs= st.executeQuery(query);


if(rs.next())
{
session.setAttribute("user",u);
response.sendRedirect("admin.jsp");
}
else
{
response.sendRedirect("admin_login.html");
}

}//End of try
catch(Exception e)
{
out.println(e);
}
%>