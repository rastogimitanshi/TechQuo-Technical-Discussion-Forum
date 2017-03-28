<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot Password</title>
</head>
<body>
	<form action="ForgotPassword" method="post">
		Enter your email <br> <input type="text" name="mailid" /><br>
		<br>
		<br>Choose security question <br>
					<select name="Q1" id="Q2">
						<option value="1">What is your favourite colour?</option>
						<option value="2">What is your Pokémon of choice?</option>
						<option value="3">A word that rhymes with time.</option>
						<option value="4">What is your pet peeve?</option>
					</select> <input type="text" name="Answer" id = "Answer" /><br>
		<br><br><button id="reg"> Submit </button>
	</form>
</body>
</html>