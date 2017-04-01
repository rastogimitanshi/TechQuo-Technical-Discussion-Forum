<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Password</title>
</head>
<body>
<% String mail = (String)request.getAttribute("Mail"); %>
	<form action="UpdatePassword" method="post">
		<br><br>New Password:<br>
		<input type="password" name="npwd" id="npwd">
		<br><br>Confirm Password:<br>
		<input type="password" name="cpwd" id="cpwd">
		<input type="hidden" name="Mail" value="<%=mail%>" />
		<br><br><br>
		<button id="reg"> Submit </button>
		<br><br>
	</form>
</body>
</html>