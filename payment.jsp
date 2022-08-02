<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    Date today = new Date();
    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
    String ddmmyyyyToday = DATE_FORMAT.format(today);


%>


<%

Connection v=null;
Statement st=null;

String id=request.getParameter("id");
String amount=request.getParameter("amonut");
String username=(String)session.getAttribute("user"); 


try
{
Class.forName("com.mysql.jdbc.Driver");
v=DriverManager.getConnection("jdbc:mysql://localhost:3306/school?characterEncoding=utf8", "root", "root");
st=v.createStatement();
String query="Insert into fee_deposite_details values('"+id+"','"+ddmmyyyyToday+"','"+amount+"','"+username+"')";

st.executeUpdate(query);
out.println("Payment Successfull");

}//End of try block
catch(Exception e) 
{
out.println(e);
}
%>