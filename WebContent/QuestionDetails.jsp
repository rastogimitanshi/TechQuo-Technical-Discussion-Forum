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
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<style>
.example { margin:20px auto;}
.container {
  margin: 150px auto;
  max-width: 480px;
}
</style>
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
			<div class="example">

        <div class="rating" id="rating2">
            <button class="btn btn-default like">
            <input type="hidden" name="id" value="<%=A1.getAns_id()%>">
            Like</button>
            <span class="likes">0</span>
           
            <button class="btn btn-default dislike">
             <input type="hidden" name="id" value="<%=A1.getAns_id()%>">Dislike</button>
            <span class="dislikes">0</span>
        </div>
    </div>	
<%
			}	
	}	 
	catch (Exception e) {
	    e.printStackTrace();
	}
	%>
	</ol>
	
		</div>
		<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 
<script src="like-dislike.js"></script> 
<script>
$('#rating2').likeDislike({
    reverseMode: true,
    disabledClass: 'disable',
    click: function (value, l, d, event) {
        var likes = $(this.element).find('.likes');
        var dislikes =  $(this.element).find('.dislikes');

        likes.text(parseInt(likes.text()) + l);
        dislikes.text(parseInt(dislikes.text()) + d);
        $.ajax({
  url: '/LikeDislike',
  type: 'GET',
  data: '&id' + id + '&likes=' + likes + '&dislikes=' + dislikes,
  success: function (data) {
    $(self).find('.likes').text(data.likes);
	 $(self).find('.dislikes').text(data.dislikes);
	localStorage['key'] = btnType;
	self.readOnly(false);
  }

});

    }
});

</script>

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

</body>
</html>