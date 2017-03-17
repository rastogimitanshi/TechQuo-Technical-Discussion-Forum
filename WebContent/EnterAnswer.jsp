<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="domain.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Post Answer</title>
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
	Integer quesid=Integer.parseInt(request.getParameter("qid"));
 	User user= (User)session.getAttribute("user_details");
%>
<div class ="input">
	   <form action="EnterAnswer">
	   <textarea name="ans" rows="4" cols="50">
  </textarea>
   <input type="hidden" name="qid" value="<%=quesid%>">
   <input type="hidden" name="uid" value="<%=user.getUserId()%>">
  <input type="submit" value="Submit the Answer">
</form>
</div>
</body>
</html>