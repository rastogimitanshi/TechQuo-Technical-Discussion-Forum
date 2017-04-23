<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
	<center>
		<h2>Enter your login credentials</h2>
		<form action="login" method="post">
			Enter your Email ID <br> <input type="text" name="username" required></input><br> 
			<br> Enter your password <br>
			<input type="password" name="password" required/> <br>
			<input type="submit" value="Login">
			<br><br>New User?
			<a href="Register.jsp">Sign In</a>
			<br><br>Forgot Password?
			<a href="ForgotPassword.jsp">Click here</a>
			
			

		</form>
	</center>
</body>
</html>
