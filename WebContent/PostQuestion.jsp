<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="domain.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Post Question</title>
</head>
<body>
<% 
	session=request.getSession(false);  
	if(session.getAttribute("user_details")==null){
	request.setAttribute("SessionExpired", "Your session has expired. Please log in again.");
	RequestDispatcher requestDispatcher;
	requestDispatcher = request.getRequestDispatcher("/login.jsp");
	requestDispatcher.forward(request,response);
	return;
}
	User user= (User)session.getAttribute("user_details");
	%>
	<div class ="input">
	   <form action="PostQuestion" method="post">
	   <textarea name="ques" rows="4" cols="50">
  </textarea>
  <script src="addInput.js" language="Javascript" type="text/javascript">
				</script>
     		<div id="dynamicInput">
          Enter tag:<br><input type="text" value="" name="myInputs">
     	</div>
     		<input type="button" value="Add tag" onClick="addInput('dynamicInput');">
     		   <input type="hidden" name="uid" value="<%=user.getUserId()%>">
     <input type="submit" value="Submit the Question">
</form>
</div>
</body>
</html>