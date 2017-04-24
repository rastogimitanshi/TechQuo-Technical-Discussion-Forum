<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
  integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <!--<link href="faq/style.css" rel="stylesheet">-->
<title>Login</title>
<style>
.container{
  padding-top: 100px;
}
</style>
</head>
<body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
crossorigin="anonymous"></script>

<div class="container">
	<div class="row">
	<form class="form-horizontal" class="login-form" name="myForm" id="myForm" method = "post" action = "login" >
<fieldset>

<!-- Email-->
<div class="form-group">
  <label class="col-md-4 control-label" >Email</label>
  <div class="col-md-4">
  <input type="text" name="username"  placeholder="Enter your email id" class="form-control input-md" required="">

  </div>
</div>

<!-- Password input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="password">Password</label>
  <div class="col-md-4">
    <input type="password" name="password"  placeholder="Enter a password" class="form-control input-md" required="">

  </div>
</div>


<!-- Button -->
<div class="form-group" >
  <label class="col-md-4 control-label"></label>
  <div class="col-md-8" >
     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="submit" class="btn btn-primary" value="Login" >
    </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-8">
  New User?
    <a href="Register.jsp">Sign In</a>
         &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;Forgot Password?
    <a href="ForgotPassword.jsp">Click here</a>

    </div>
</div>

  </fieldset>
</form>

	</div>
</div>

</body>
</html>
