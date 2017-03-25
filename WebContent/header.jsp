<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity = "sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin = "anonymous">
</script>

<div class="menu">
    <div class="container-fluid">
		<div class="navbar-header">
			<a href="#">TechQuo</a>
		</div>
		<div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="Register.html" ><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        <li> <form method="get" name="frm" action="SearchQuestionServlet">
          <table>
            <tr><td colspan=2 style="font-size:10pt; padding-top :3px; padding-bottom: 3px; " align="center">
            <tr><td style="font-family: 'Ubuntu Condensed', sans-serif; color: white;
            font-size: 15px;" >TAG</td>
              <td>: <input  type="text" name="tag" id="tag" placeholder="Search" required>
            </td>
            <td colspan=2 align="center">
            <input  type="submit" name="submit" value="Submit" ></td></tr>
          </table>
        </form> </li>
			</ul>
		</div>
	</div>
</div>




</body>
</html>
