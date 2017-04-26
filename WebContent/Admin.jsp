<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
  integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <!--<link href="faq/style.css" rel="stylesheet">-->

 <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script>
function deactivate(id)
{
	/* alert("User deactivated Successfully");

	alert("Flag value is"+myVar);
	$.post('ChangingFlags.jsp'); */
	  var f=document.form;
    f.method="post";
    f.action='ChangingFlags.jsp?id='+id;
    f.submit();
	// window.history.back();
	}
</script>
<title>Admin Console</title>
</head>
<body>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
  integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
  crossorigin="anonymous"></script>

    <jsp:include page="header.jsp"></jsp:include>
    <br>
    <br>
    <br>
    <br>
<h2>Details of Users</h2>
<form  class="login-form form-horizontal"  method="post" name="form">
<fieldset>

<%
String value=(String)session.getAttribute("flag_val");
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
connection = DriverManager.getConnection(connectionURL, "root", "dnsingh87");
/* createStatement() is used for create statement object that is used for
sending sql statements to the specified database. */
statement = connection.createStatement();
// sql query to retrieve values from the secified table.
String QueryString = "SELECT * from user where Role!='Admin' and Flag!='DeActivate'";
rs = statement.executeQuery(QueryString);
%>

<table class="table table-striped">
  <thead>
    <tr>
      <th>User Id</th>
      <th>First Name</th>
      <th>Last Name</th>
      <Th>Role</Th>
      <Th>Action</Th>
    </tr>
  </thead>
  <%
  while (rs.next()) {
  %>
  <tbody>
    <tr>

    <TD><%=rs.getInt(1)%></TD>
    <TD><%=rs.getString(2)%></TD>
    <TD><%=rs.getString(3)%></TD>
    <TD><%=rs.getString(8)%></TD>
    <TD><input type="button" class="btn btn-primary" value="Deactivate" onclick="deactivate(<%=rs.getInt(1)%>)"></TD>
    </tr>
    <% } %>
    <%
    // close all the connections.
    rs.close();
    statement.close();
    connection.close();
    } catch (Exception ex) {
    %>
  </font>
  <font size="+3" color="red"></b>
  <%
  out.println("Unable to connect to database.");
  }
  %>
  </tbody>
</table>
<TABLE>
<TR>
<TD> <form class="login-form form-horizontal" action="login.jsp" method="get" >
<button class="btn btn-primary" type="submit"><-- back</button></TD>
</TR>
</TABLE>
</font>
</body>
</html>
