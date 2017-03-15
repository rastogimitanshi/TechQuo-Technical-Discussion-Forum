<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="domain.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit User Profile</title>
</head>

<script type="text/javascript" src="JS/jquery-min.js"> </script>

<style>
p {
	display: inline-block;
	font-size: 15px;
	margin: 4px 8px 2px;
}

.logout button {
	text-align: center;
	margin-top: 0px;
	margin-left: 1200px;
	text-transform: uppercase;
	font-weight: bold;
	outline: 0;
	background: #FFFFFF;
	width: 6%;
	border: 1px;
	border-style: solid;
	border-color: #4CAF50;
	padding: 4px;
	color: #4CAF50;
	font-size: 15px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.logout button:hover, .form button:active, .form button:focus {
	background: #4CAF50;
	color: #FFFFFF;
	border: 1px;
	border-style: solid;
	border-color: #FFFFFF;
}

body {
	background: #76b852;
}

.login-page {
	align: center;
	width: 750px;
	padding: 8% 0 0;
	margin: auto;
}

.f {
	align: center;
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 750px;
	margin: -90px auto 50px;
	padding: 40px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
}

.f input {
	outline: 0;
	background: #e5e5e5;
	width: 35%;
	border: 0;
	margin: 0 0 15px;
	padding: 5px;
	box-sizing: border-box;
	font-size: 14px;
}

.f button {
	text-transform: uppercase;
	outline: 0;
	background: #4CAF50;
	width: 30%;
	border: 1px;
	border-style: solid;
	border-color: #FFFFFF;
	padding: 8px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.f button:hover, .form button:active, .form button:focus {
	background: #FFFFFF;
	color: #4CAF50;
	border: 1px;
	border-style: solid;
	border-color: #4CAF50;
}

.f .abc {
	margin: 14px 0 0;
	font-size: 14px;
}
</style>

<script>
function validateEmail(email) {
	  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	  return re.test(email);
	}

	function validate() {
	  $("#result").text("");
	  var email = $("#email").val();
	  if (validateEmail(email)) {
	    $("#result").text(email + " is valid :)");
	    $("#result").css("color", "green");
	  } else {
	    $("#result").text(email + " is not valid :(");
	    $("#result").css("color", "red");
	  }
	  return false;
	}
	
	$("#validate").bind("click", validate);
	</script>


<body>
	<h1 style="text-align: center; color: white;">EDIT PROFILE</h1>

	<%	if(session.getAttribute("user_details")==null){
				request.setAttribute("SessionExpired", "Your session has expired. Please log in again.");
				RequestDispatcher requestDispatcher;
				requestDispatcher = request.getRequestDispatcher("/login.jsp");
				requestDispatcher.forward(request,response);
				return;
			}
 
	User user= (User)session.getAttribute("user_details");%>
	


	<div class="logout">
		<a href="LogOut">
			<button id="btnLogout">Log Out</button>
		</a>
	</div>
	<div class="login-page">
		<div class="f">
			<form class="login-form" 
				action="UpdateProfile" method="post" enctype="multipart/form-data">
				<br>
				<br>User ID: <br> <input type="number" name="UserId"
					id="UserId" value="<%=user.getUserId()%>"> 

				<br>
				<br>First Name:<br> <input type="text" name="FirstName"
					id="FirstName" value="<%=user.getFirstName()%>" autocomplete="on"> <br>
				<br>Last Name:<br> <input type="text" name="LastName"
					id="LastName" value="<%=user.getLastName()%>" autocomplete="on"> <br>
				<p id="comment" style="color: red; position: absolute;"></p>

				<br>
				<br>Email ID: <br> <input type="email" name="EmailId"
					id="EmailId" value="<%=user.getEmailId()%>">
					<br>
				<br>Country: <br> <input type="text" name="Country"
					id="Country" value="<%=user.getCountry()%>"> <br>
				<br>City:<br> <input type="text" name="City" id="City"
					value="<%=user.getCity()%>"> <br>
				<br>Date of birth: <br> <input type="date" name="DOB"
					id="DOB" value="<%=user.getDOB()%>" max="1999-01-02"> <br>
				<br>Job Position: <br> <input type="text" name="JobPosition"
					id="JobPosition" value="<%=user.getJobPosition()%>"> <br>
				<script src="addInput.js" language="Javascript" type="text/javascript">
				</script>
     		<div id="dynamicInput">
          Enter Interests:<br><input type="text" value="" name="myInputs">
     	</div>
     		<input type="button" value="Add more interests" onClick="addInput('dynamicInput');">
		<br>
		<br>
		<script src="addEducation.js" language="Javascript" type="text/javascript">
				</script>
     		<div id="dynamicEducation">
          Enter Education:<br><input type="text" value="" name="myEducation">
     	</div>
     		<input type="button" value="Add more Education" onClick="addEducation('dynamicEducation');">
		<br>
		<br>
		<input type="file" name="photo" size="50"/>
		<br>
		<br>
		<input type="submit" value="Submit">
			<input type="reset">
			</form>
 <p> Click <strong>Submit</strong> to save changes </p>
			
			</div>
		</div>
	
</body>
</html>