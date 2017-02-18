<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="domain.User" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>User Profile</title>
	</head>


	<style>
		.main{
			position:fixed;
		}
		.logout button {
			
			text-align: center;
			margin-top: 0px;
			margin-left: 1200px;
			
			text-transform: uppercase;
			outline: 0;
			background: #4CAF50;
			width: 6%;
			border: 1px;
			border-style: solid;
			border-color:#FFFFFF;
			padding: 5px;
			color: #FFFFFF;
			font-size: 13px;
			cursor: pointer;
		}
		.logout button:hover,.form button:active,.form button:focus {
		  	background: #FFFFFF;
			color: #4CAF50;
			border: 1px;
			border-style: solid;
			border-color: #4CAF50;
		}
		
		.btns{
			
			margin-left:500px;
		}
		
		.btns button{
			
			align:center;
			text-transform: uppercase;
			outline: 0;
			background: #4CAF50;
			width: 15%;
			border: 1px;
			border-style: solid;
			border-color: #FFFFFF;
			padding: 5px;
			color: #FFFFFF;
			font-size: 15px;
			-webkit-transition: all 0.3 ease;
			transition: all 0.3 ease;
			cursor: pointer;
		}
		.btns button:hover,.form button:active,.form button:focus {
		  	background: #FFFFFF;
			color: #4CAF50;
			border: 1px;
			border-style: solid;
			border-color: #4CAF50;
		}
			
		#fields{
			float:left;
			text-align:left;
			margin-left:80px;
		}
		
		#values{
			text-align:left;
			float:left;
			width:50%;
		}
		.contents {
			background: #76b852; 
			max-width:30%;
			font-size:17px;
			color:#FFFFFF;
			align:center;
			position: relative;
			z-index: 1;
			height: 230px;
			margin: -10px auto 20px;
			padding: 45px;
			text-align: center;
			box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
			
		}
	</style>
	<body>
	<div class="main">
		<div class="logout">
			<a href ="LogOut"> <button id="btnLogout">Logout</button> </a>
		</div>
			<br><br>
		<% 	User user =(User)request.getAttribute("UserDetails"); 
			String Interests =(String)request.getAttribute("Interests");	
			String Education =(String)request.getAttribute("Education");	
			Integer profileV =(Integer)request.getAttribute("ProfileViews");
				%>
				
				<img src="/TechQuo/GetProfilePicture?Uid=<%=user.getUserId()%>" width="50" height="50" alt="User Profile Picture"/>
			<div class="contents"> 
				<div id="fields">
					<br>User Id 
					<br>First Name
					<br>Last Name 
					<br>Email ID 
					<br>Country
					<br>City
					<br>Job Position
					<br>DOB
					<br>Interests
					<br>Education
					<br>Profile Views
				</div>
			
			
				<div id="values" style="margin-bottom:80px;">
					<% 
						out.println("<BR>: " + user.getUserId()); 
						out.println("<BR>: " + user.getFirstName());
						out.println("<BR>: " + user.getLastName());
						out.println("<BR>: " + user.getEmailId());
						out.println("<BR>: " + user.getCountry());
						out.println("<BR>: " + user.getCity());
						out.println("<BR>: " + user.getJobPosition());
						out.println("<BR>: " + user.getDOB());
						out.println("<BR>: "+ Interests);
						out.println("<BR>: "+ Education);
						out.println("<BR>: "+ profileV);
						
					%>
				 </div>
	
		</div>
		<br><br><br><br>
	
	</div>


</body>
</html>