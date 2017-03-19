<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    <%@page import="domain.User" %>
<div style="padding: 5px;">
 <%	session = request.getSession(false);
 	User user =new User();
 	if(session.getAttribute("user_details")!=null)
 	user = (User)session.getAttribute("user_details");
 	%>
   <a href="Home.jsp">Home</a>
   | <a href="login.jsp">Login</a>
   |<a href="EditProfile.jsp">Edit Profile</a>
   | <a href="EditPassword.jsp">Change Password</a>
   |<a href="http://localhost:8080/TechQuo/SearchUserServlet?UID=<%=user.getUserId()%>">View Profile</a>
   | <a href="PostQuestion.jsp">Post Question</a>
   |<a href="LogOut">Log Out</a>
   
</div>  