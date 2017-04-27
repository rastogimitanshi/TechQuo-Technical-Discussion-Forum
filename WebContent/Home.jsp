<!--<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
   <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
   <%@page import ="domain.Question" %>-->
   <%@ page import ="domain.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="ISO-8859-1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
  integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <!--<link href="faq/style.css" rel="stylesheet">-->

     <title>Home Page</title>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <style>
  .menu
{
background-color: #00547E;
border-bottom: 4px solid #04A3ED;
width:100%;
height: 75px;
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

.main-header
{
	background: url(http://www.jokemobi.com/i/2017/04/computer-technology-wallpapers-widescreen.jpg) no-repeat;
	background-size: cover;
	max-height: 600px;


}

.top-title
{
	z-index: 5;
	font-size: 27px;
	font-weight: 700;
	color: #00547E;
	line-height: 38px;
	letter-spacing: 4px;
	opacity: 1;
	text-transform: uppercase;
}
.sub-title
{
	font-size: 50px;
	font-weight: 700;
	color: #00547E;
	line-height: 71px;
	letter-spacing: 4px;
	opacity: 1;
	text-transform: uppercase;
}
.title
{
	font-size: 123px;
	font-weight: 700;
	color: #00547E;
	line-height: 88px;
	letter-spacing: 4px;
	opacity: 1;
	text-transform: uppercase;
	padding: 25px 0px;
}

.wrapper
{
	padding: 90px 0px 130px;
}
.post
{	padding-left: 520px;
	z-index: 5;
	font-size:20px;
	font-weight: 300;
	color: #00547E;
	line-height: 38px;
	letter-spacing: 1px;
	opacity: 1;
	text-transform: uppercase;
}

.question{
	color: #fff;

}

</style>
  </head>
  <body>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		crossorigin="anonymous"></script>
  <%	session = request.getSession(false);
        	User user =new User();
        	if(session.getAttribute("user_details")!=null)
        	 user = (User)session.getAttribute("user_details");
        	%>
 <!--header-->
 <div class="menu">

    <div class="container-fluid">
      <div class="dropdown navbar-left">

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

		<div class="navbar-header ">

			<a href="Home.jsp">TechQuo</a>
		</div>
		<div>
			<ul class="nav navbar-nav navbar-right">

				<li><a href="Register.jsp" ><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
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
     <br>
     <br>
     <br>
     <br>

		 <!--header ends-->
		 <header class="main-header" id="header">
        <div class="bg-color">
		 <div class="container text-center">
                <div class="wrapper wow fadeInUp delay-05s" >
                    <h2 class="top-title">Welcome to</h2>
                    <h3 class="title">TECHQUO</h3>
                    <h4 class="top-title">Join Us; it only takes a minute </h4>

                </div>
            </div>
				</div>
			</header>

      <jsp:include page="/LoadPosts" flush="true"></jsp:include>
      <div class="post">
      <br>TOP 20 POSTS OF THE DAY <br>
      <c:forEach items="${quesList}" var="q">

      <a href="QuestionDetails.jsp?QID=<c:out value="${q.getQuesid()}"/>"><c:out value="${q.getQuestion()}"></c:out></a>
      <br>

      </c:forEach>
      </div>
      <br>
      <br>

     <!-- <div>
     <a href="index.jsp">Click here to view All posts</a>
      </div>
        -->
        <div>

		<form action="pagination" method="post">
			<input type="hidden" name="action" value="load"> <input
				type="submit" class="button btn btn-primary" value="View All">
		</form>
		</div>

      <jsp:include page="/ViewTopTags" flush="true"></jsp:include>
      <div class="post">
       <br>View the top trending tags! <br>
      <c:forEach items="${toptags}" var="tag">
      <a href="http://localhost:8080/TechQuo/SearchQuestionServlet?tag=<c:out value="${tag}"/>"><c:out value="${tag}"></c:out></a>
      <br>
      </c:forEach>
      </div>

     <jsp:include page="footer.jsp"></jsp:include>


  </body>
</html>
