<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="domain.User" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Change Password</title>
	</head>
	
	<script type = "text/javascript" src = "JS/jquery-min.js"> </script>
	
	<script>

		
	</script>
	
	
	<script>
$(document).ready(function() {

	$("#CurrPass").blur(function(){
			Pass= $("#Pass").val();
			CurrPass= $("#CurrPass").val();
			if(CurrPass==null || CurrPass==""){
				 $("#CurrPass").attr("placeholder", "Please enter Current Password");
				return false;
			}
			
			if(Pass!=CurrPass){
				 $("#CurrPass").val('');
				 $("#CurrPass").attr("placeholder", "Incorrect Current Password");
				return false;
			}  
	 		return false;
	    }); 
		
		
	
		
		$("#submit").click(function() {
			Pass= $("#Pass").val();
			CurrPass= $("#CurrPass").val();
			NewPass= $("#NewPass").val();
			ConPass= $("#ConPass").val();
	
	     
	        $("#CurrPass").attr("placeholder", "Current Password");
			$("#NewPass").attr("placeholder", "New Password.");
			$("#ConPass").attr("placeholder", "Re-enter new Password.");
						 
	        if(CurrPass == "" || CurrPass == null) {
			  $("#CurrPass").attr("placeholder", "Please enter current Password");
		         return false;
	        }
	        if(NewPass==null || NewPass==""){
				$("#NewPass").attr("placeholder", "Please enter new Password");
				return false;
			}
	        if(ConPass==null || ConPass==""){
				$("#ConPass").attr("placeholder", "Please re-enter new Password");
				return false;
			}
	        if(NewPass!=ConPass){
				$("#CurrPass").val('CurrPass');
				$("#NewPass").val('');
				$("#ConPass").val('');
				$("#NewPass").attr("placeholder", "Passwords do not match");
				return false;
			}
	   	
	        
	   	 $.ajax({
	            type : "POST",
	            url : "UpdatePassword",
	            data : "&CurrPass=" + CurrPass + "&NewPass=" + NewPass + "&ConPass" + ConPass,
	            success : function(data) {
	    
	   	             if(data.toString().indexOf("admin") != -1) {   // means if the message received from servlet in form of out.print.ln contains invalid or not
	   	            	alert("Password Updated successfully.");
	   			             	$(location).attr('href',"Home.jsp");
	   			            
	   	             }
	   	             else if(data.toString().indexOf("user") != -1) {   // means if the message received from servlet in form of out.print.ln contains invalid or not
	   		            	alert("Password Updated successfully.");
	   		             	$(location).attr('href',"Home.jsp");
	   		            
	                }
	   	          else if(data.toString().indexOf("admine") != -1) {
	   	            	alert("Some unexpected error has occured. Please try again later.")
	   	            	$(location).attr('href',"Home.jsp");
	   	        }
	   	          else if(data.toString().indexOf("usere") != -1) {
	   	            	alert("Some unexpected error has occured. Please try again later.")
	   	            	$(location).attr('href',"Home.jsp");
	   	        }
	          },
	   	   error: function(data) {
	   		   alert("Some unexpected error has occured. Please try again later.")
	   		   $(location).attr('href',"LogOut");
	   	   }
	        });
	   return false;
	    });  
	   return false;
	    });  
});
	</script>
	
	
	
	
	<style>

	#comment {
		text-align:center;

	}
		.logout button {
			
			text-align: center;
			margin-top: 0px;
			margin-left: 1200px;
			
			text-transform: uppercase;
			outline: 0;
			background: #FFFFFF;
			width: 6%;
			border: 1px;
			border-style: solid;
			border-color:#4CAF50;
			padding: 5px;
			color: #4CAF50;
			font-size: 13px;
			cursor: pointer;
		}
		.logout button:hover,.form button:active,.form button:focus {
		  background: #4CAF50;
		  color: #FFFFFF;
		   border:1px;
			  border-style: solid;
			  border-color: #FFFFFF;
		}
	
	body {
		  background: #76b852; 
		  
	}

	.login-page {
		align:center;
		width: 360px;
		padding: 8% 0 0;
		margin: auto;
	}
	
	.f {
		align:center;
		position: relative;
		z-index: 1;
		background: #FFFFFF;
		max-width: 360px;
		margin: -90px auto 50px;
		padding: 30px;
		text-align: center;
		box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
	}
		
	.f input {
		outline: 0;
		background: #e5e5e5;
		width: 100%;
		border: 0;
		margin: 0 0 15px;
		padding: 8px;
		box-sizing: border-box;
		font-size: 14px;
	}
	.f button {
		text-transform: uppercase;
		outline: 0;
		background: #4CAF50;
		width: 40%;
		border: 1px;
		border-style: solid;
		border-color:#FFFFFF;
		padding: 10px;
		color: #FFFFFF;
		font-size: 15px;
		-webkit-transition: all 0.3 ease;
		transition: all 0.3 ease;
		cursor: pointer;
	}
	.f button:hover,.form button:active,.form button:focus {
		  background: #FFFFFF;
		  color: #4CAF50;
		   border:1px;
			  border-style: solid;
			  border-color:#4CAF50;
	}
		
	 .abc{
		margin-left:600px;
		font-size: 17px;
		font-weight:bold;
	}
	
	.abc a {
  color: #FFFFFF;
  text-decoration: none;
  font-size: 17px;
}
		</style>

	<body>
<%		session = request.getSession(false);
		if(session.getAttribute("user_details")==null){
			request.setAttribute("SessionExpired", "Your session has expired. Please log in again.");
			RequestDispatcher requestDispatcher;
			requestDispatcher = request.getRequestDispatcher("/login.jsp");
			requestDispatcher.forward(request,response);
			return;
		}
		
		
		%>
		<h1 style="text-align:center; color:white;">CHANGE PASSWORD</h1>
		<p class="logout">
			<a href ="LogOut"> <button id="btnLogout">Logout</button> </a>
		</p>
		
		<%
			User user= (User)session.getAttribute("user_details");
		%>
		<div class="login-page">
			<div class="f">
				
				<form  class="login-form" action = "UpdatePassword" method="post" onsubmit="return CurrentPassword();">
					
					
					<input type="password" id ="CurrPass" name ="CurrPass" placeholder="Current Password">
							
					<br><br>
			
					<input type="password" id ="NewPass" name="NewPass" placeholder="New Password">
						
					<br><br>
				
					<input type="password" id="ConPass" name="ConPass" placeholder="Re-enter New Password">
							
					<br><br>
					<button id="submit">submit</button>
							
					<input type="hidden" id="Pass" name="Pass" value="<%=user.getPassword()%>">
				</form>
		</div>
		</div>
		
		<div class="abc">
			<br><br>
			<a href="Home.jsp">BACK</a> &nbsp;&nbsp;
			<a href="EditPassword.jsp">RESET</a>
		</div>
	</body>
</html>