<!DOCTYPE html>
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


  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respon
    d/1.4.2/respond.min.js"></script>
  <![endif]-->

  <title> HEADER </title>

  <style>
  .menu
{
background-color: #00547E;
border-bottom: 4px solid #04A3ED;
width:100%;
height: auto;
padding: 0 10px;
position: fixed;
margin: 0px;
z-index: 1;
opacity: 0.9;
}
.menu  .navbar-nav > .active > a
{
background-color : #04A3ED;
color: white;
font-weight: bold;
}
.menu  .navbar-nav >  li >  a
{
font-size: 13px;
color: white;
padding: 10px 35px;
}
.menu  .navbar-nav >  li >  a:hover
{
background-color: #04A3ED;
}
.navbar-header > a
{
font-family: 'Ubuntu Condensed', sans-serif;
padding: 0px;
margin: 0px;
text-decoration: none;
color: white;
font-size: 25px;
padding: 5px 30px;
}
.navbar-header > a:hover
{
text-decoration: none;
color: #04A3ED;
}

</style>

</head>
<body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
crossorigin="anonymous"></script>

<div class="menu">

    <div class="container-fluid">
      <%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
          <%@page import="domain.User" %>
      <div class="dropdown navbar-left">
        <%	session = request.getSession(false);
        	User user =new User();
        	if(session.getAttribute("user_details")!=null)
        	 user = (User)session.getAttribute("user_details");
        	%>
      <button class="btn btn-default dropdown-toggle " type="button" id="dropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
      <span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>
      </button>

      <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">

        <li><a href="Home.jsp">Home</a></li>
         <li><a href="login.jsp">Login</a></li>
         <li role="separator" class="divider"></li>
        <li><a href="EditProfile.jsp">Edit Profile</a></li>
         <li><a href="EditPassword.jsp">Change Password</a></li>
        <li><a href="http://localhost:8080/TechQuo/SearchUserServlet?UID=<%=user.getUserId()%>">View Profile</a></li>
        <li role="separator" class="divider"></li>
         <li><a href="PostQuestion.jsp">Post Question</a></li>
         <li role="separator" class="divider"></li>
        <li><a href="LogOut">Log Out</a></li></li>



      </ul>
    </div>

		<div class="navbar-header">

			<a href="#">TechQuo</a>
		</div>
		<div>
			<ul class="nav navbar-nav navbar-right">

				<li><a href="Register.html" ><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        <li>
          <form class="navbar-form navbar-left" method="get" name="frm" action="SearchQuestionServlet">
            <div class="form-group">
              <input type="text" name="tag" id="tag" required class="form-control" placeholder="Enter Tag">
          </div>
  <button type="submit" name ="submit" class="btn btn-default">Search</button>

</form>


  </li>
			</ul>


      </div>
		</div>
	</div>
</div>




</body>
</html>
