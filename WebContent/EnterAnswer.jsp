<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Post Answer</title>
</head>
<body>
<% Integer quesid=Integer.parseInt(request.getParameter("qid"));
//Enter code for session. User can only answer if they have logged in. Else redirect to Login Page.
%>
<div class ="input">
	   <form action="EnterAnswer">
	   <textarea name="ans" rows="4" cols="50">
  </textarea>
   <input type="hidden" name="qid" value="<%=quesid%>">
  <input type="submit" value="Submit the Answer">
</form>
</div>
</body>
</html>