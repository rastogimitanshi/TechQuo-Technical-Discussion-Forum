<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
<%
String value=(String)session.getAttribute("flag_val");
int id=Integer.parseInt(request.getParameter("id"));
//out.println("value is"+value);
try {
/* Create string of connection url within specified format with machine
name, port number and database name. Here machine name id localhost and 
database name is student. */
String connectionURL = "jdbc:mysql://localhost:3306/techquo";
// declare a connection by using Connection interface
Connection connection = null;
/* declare object of Statement interface that is used for executing sql 
statements. */
Statement statement = null;
// declare a resultset that uses as a table for output data from tha table.
ResultSet rs = null;
// Load JBBC driver "com.mysql.jdbc.Driver"
Class.forName("com.mysql.jdbc.Driver").newInstance();
/* Create a connection by using getConnection() method that takes parameters 
of string type connection url, user name and password to connect to database.*/
connection = DriverManager.getConnection(connectionURL, "root", "tiger");
/* createStatement() is used for create statement object that is used for 
sending sql statements to the specified database. */
statement = connection.createStatement();
// sql query to retrieve values from the secified table.
String QueryString = "update user set Flag='Deactivate' where Flag='"+value+"' and user_id="+id+"";
statement.executeUpdate(QueryString);

out.println("<font size='+3' color='red'></b>User Deactivated Successfully</b></font>");


}

catch (Exception ex) {
}
%>
<FORM ACTION="login.jsp" method="get" >
<button type="submit">Back</button>
</FORM>
</body>
</html>