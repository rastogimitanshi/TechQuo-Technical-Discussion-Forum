<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.io.IOException" %>
<%@ page import ="domain.Question" %>
<%@ page import ="domain.Answer" %>
<%@ page import ="domain.User" %>
<%@ page import ="com.mysql.jdbc.Connection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Question View</title>
</head>
<body>
<%
Integer quesid=Integer.parseInt(request.getParameter("QID")); 
try {

    Class.forName("com.mysql.jdbc.Driver").newInstance();
} catch (Exception ex){
}
Connection conn = null;
try {
    conn =
       (Connection) DriverManager.getConnection("jdbc:mysql://localhost/techquo?" +
                                   "user=root&password=tiger");
    
	System.out.println("Connection Established");
	PreparedStatement pst= (PreparedStatement) conn.prepareStatement("SELECT Question, user_id, create_time FROM `question` WHERE Ques_id=?");
	%>
	<br>
	<h1>QUESTION ID: <%=quesid%></h1>
	<%
	pst.setInt(1,quesid);
	ResultSet rst = pst.executeQuery();
 	rst.next();
 	Question Q1;
	Q1=new Question(quesid,rst.getString(1),rst.getDate(3),rst.getInt(2));
	%>
	<br>
	QUESTION: <% 
    out.println(rst.getString(1));
    %>
    <br>
    <% 
    PreparedStatement pstu=(PreparedStatement) conn.prepareStatement("SELECT Fname, Lname FROM `user` WHERE user_id=?");
    pstu.setInt(1,rst.getInt(2));
    ResultSet rstu =pstu.executeQuery();
    rstu.next();
    %>
    <br>
    POSTED BY:
    <% 
    out.println(rstu.getString(1));
    out.println("\n");
    out.println(rstu.getString(2));
    %>
    <br>
    QUESTION POSTED ON: 
    <%
    out.println(rst.getDate(3));
    %>
	<br>
	<br>
	<p> ANSWERS: <p>
	<%
	PreparedStatement ps= (PreparedStatement) conn.prepareStatement("SELECT Ans_id, Answer, create_time, user_id_A, upvotes, downvotes FROM `answer` WHERE Ques_id_A=?");
	ps.setInt(1,quesid);
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
		Answer A1=new Answer(rs.getInt(1),quesid,rs.getString(2),rs.getDate(3),rs.getInt(4),rs.getInt(5),rs.getInt(6));
		%>
		<br>ANSWER ID:
		<%
		out.println(A1.getAns_id());
		%>
		<br>ANSWER:
		<%
		out.println(A1.getAnswer());
		%>
		<br>ANSWER POSTED ON:
		<%
		
		out.println(A1.getCreate_time());
		%>
		<br>ANSWER POSTED BY USER ID:
		<p><a href ="SearchUser?UID=<%=A1.getUser_id_A() %>"><%=A1.getUser_id_A()%></a> </p>
		
		<br>UPVOTES:
		<%
		out.println(A1.getUpvotes());
		%>
		<br>DOWNVOTES:
		<%
		out.println(A1.getDownvotes());
		%>
	
	
		<%
		
	}
} catch (Exception e) {
    e.printStackTrace();
}
%>

</body>
</html>