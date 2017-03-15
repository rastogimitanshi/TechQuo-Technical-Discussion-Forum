<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="java.io.IOException" %>
<%@ page import ="domain.Question" %>
<%@ page import ="domain.Answer" %>
<%@ page import ="domain.User" %>
<%@ page import ="controller.*" %>
<%@ page import ="connection.ConnectionManager" %>
<%@ page import ="com.mysql.jdbc.Connection" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>TechQuo-Question View</title>
</head>
<body>
<%
	Integer quesid=Integer.parseInt(request.getParameter("QID")); 
	
	try {
		Connection conn=null;
		conn = ConnectionManager.getConnection();
		PreparedStatement pst= (PreparedStatement) conn.prepareStatement("SELECT Question, user_id,"+
				"create_time FROM `question` WHERE Ques_id=?");
		
		%>
		<div class ="question">
		<h3 class="main"><strong>Question ID: </strong><%=quesid%></h3>
		<% pst.setInt(1,quesid);
		ResultSet rst = pst.executeQuery();
	 	rst.next();
	 	PreparedStatement qstU= (PreparedStatement) conn.prepareStatement("UPDATE `question` set count=count+1 where Ques_id=?");
		qstU.setInt(1,quesid);
	 	Question Q1;
		Q1=new Question(quesid,rst.getString(1),rst.getDate(3),rst.getInt(2));%>
		<ul>
		
		<li><strong>Question Statement:</strong>   <%=rst.getString(1)%><li>
	    <%PreparedStatement pstu=(PreparedStatement) conn.prepareStatement("SELECT Fname FROM"+
									"`user` WHERE user_id=?");
	    pstu.setInt(1,rst.getInt(2));
	    Integer uid=rst.getInt(2);
	    ResultSet rstu =pstu.executeQuery();
	    rstu.next();%>
	    
	   <li><strong>Question Posted By:</strong><a href="http://localhost:8080/TechQuo/SearchUserServlet?UID=<%=uid%>"><%=rstu.getString(1)%></a></li>
	    <li><strong>Posted on: </strong><%=rst.getDate(3)%></li>
	    
	   </ul>
	   <p>Think you can answer the question? Post an answer by clicking <a href="EnterAnswer.jsp?qid=<%=quesid%>">here</a>
	   </div>
	   
		<div class="answers">
		<h3 class="main" > ANSWERS: </h3>
		<ol>
		<%PreparedStatement ps= (PreparedStatement) conn.prepareStatement("SELECT Ans_id, Answer, create_time,"+
							"user_id_A, upvotes, downvotes FROM `answer` WHERE Ques_id_A=?");
		ps.setInt(1,quesid);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()){
			Answer A1=new Answer(rs.getInt(1),quesid,rs.getString(2),rs.getDate(3),rs.getInt(4),
					rs.getInt(5),rs.getInt(6));%>
			<li><ul> <li><strong>Answer ID: </strong><%=A1.getAns_id()%></li>
			<li><strong>Answer Statement: </strong><%=A1.getAnswer()%></li>
			<li><strong>Answer Posted On: </strong><%=A1.getCreate_time()%></li>
		
			<%PreparedStatement pstau=(PreparedStatement) conn.prepareStatement("SELECT Fname FROM"+
									"`user` WHERE user_id=?");
	    	pstau.setInt(1,rs.getInt(4));
	    	ResultSet rstau =pstau.executeQuery();
	    	rstau.next();%>
	    	<li><strong>Posted By:</strong>
	   		<a href ="http://localhost:8080/TechQuo/SearchUserServlet?UID=<%=rs.getInt(4)%>"><%=rstau.getString(1)%></a></li>
			<li><strong>Up votes : </strong><%=A1.getUpvotes()%></li>
			<li><strong>Down votes : </strong><%=A1.getDownvotes()%></li>
			</ul></li>
			
			<%
			}	
	}	 
	catch (Exception e) {
	    e.printStackTrace();
	}
	%>
	</ol>
	
		</div>

</body>
</html>