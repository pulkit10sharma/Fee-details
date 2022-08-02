<%@ page import="java.sql.*" %>
<%
int flag=0;
String id=request.getParameter("q");
Connection con=null;
ResultSet rs=null;
Statement st=null;
try{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/school?characterEncoding=utf8", "root", "root");
st=con.createStatement();
rs= st.executeQuery("Select distinct * from fee_deposite_details where student_id like'"+id+"%'");
out.println("<table border=1 width:200px; height:100px; >");
out.println("<tr><th>Student ID</th><th>Date Submission</th><th>Amount Paid</th><th>Cashier Id</th></tr>");
while(rs.next())
{ 
flag=1;
out.println("<tr><td>"+rs.getString(1)+ "</td><td>" +rs.getString(2)+"</td><td>" +rs.getString(3)+"</td><td>" +rs.getString(4)+"</td></tr>");
}
if(flag==0)
{
out.println("<tr><th colspan=7>No data to be displayed</th></tr>");
}
out.println("</table>");
}//End of try
catch(Exception e) 
{
out.println(e);
}
%>