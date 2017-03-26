<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="domain.User" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>User Profile</title>
	</head>


	
		<body>
	
	<div class="main">
		
		
		<% 	User user =(User)request.getAttribute("UserDetails"); 
			String Interests =(String)request.getAttribute("Interests");	
			String Education =(String)request.getAttribute("Education");	
			Integer profileV =(Integer)request.getAttribute("ProfileViews");
		
				%>
				
				<img src="http://localhost:8080/TechQuo/GetProfilePicture?Uid=<%=user.getUserId()%>" width="100" height="100" alt="User Profile Picture"/>
			<div class="contents"> 
				<div id="fields">
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
					<br>Questions Posted
					<br>Answers Answered
				</div>
			
			
				<div id="values" style="margin-bottom:80px;">
					<%
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
						out.println("<BR>: "+ user.getQuestionsPosted());
						out.println("<BR>: "+ user.getAnswersAnswered());
					
					%>
				 </div>
	
		</div>
	</div>

</body>
</html>