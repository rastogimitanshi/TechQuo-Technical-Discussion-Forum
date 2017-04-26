<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
   <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
   <%@page import ="domain.Question" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
     <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
     <title>Home Page</title>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
  <%	session = request.getSession(false);
        	User user =new User();
        	if(session.getAttribute("user_details")!=null)
        	 user = (User)session.getAttribute("user_details");
        	%>
 <div class="menu">

    <div class="container-fluid">
          <%@page import="domain.User" %>
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

		<div class="navbar-header">

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
    
    
      <h3>Home Page</h3>
      
     TechQuo is a technical Discussion Forum! <br>
    <br>
    <br>
      <jsp:include page="/LoadPosts" flush="true"></jsp:include>
      <div style="float: left;">
      <br>View the top 20 Posts! <br>
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
				type="submit" class="button" value="View All">
		</form>
		</div>

      <jsp:include page="/ViewTopTags" flush="true"></jsp:include>
      <div style="float: right;">
       <br>View the top trending tags! <br>
      <c:forEach items="${toptags}" var="tag">
      <a href="http://localhost:8080/TechQuo/SearchQuestionServlet?tag=<c:out value="${tag}"/>"><c:out value="${tag}"></c:out></a>
      <br>
      </c:forEach>
      </div>
      
     <jsp:include page="footer.jsp"></jsp:include>
      
 
  </body>
</html>