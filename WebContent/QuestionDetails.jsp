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

<html>
<head>
  <meta charset="ISO-8859-1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
  integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <!--<link href="faq/style.css" rel="stylesheet">-->

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respon
    d/1.4.2/respond.min.js"></script>
  <![endif]-->
  <title>TechQuo-Question View</title>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

 <script type="text/javascript">
 var form = $('#ajaxform');
 form.submit(function () {
 $.ajax({
 url: "/Upvote",
 data: form.serialize(),
 type:"get",
 cache: false,
 success: function (data) {
 var result=data;
 $('#content').html(result);
 }
 });
 }); </script>
  <style>
  body{padding-top:30px;}
  </style>





</head>


<body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
crossorigin="anonymous"></script>

<%
	Integer quesid=Integer.parseInt(request.getParameter("QID"));
	try {
		Connection conn=null;
		conn = ConnectionManager.getConnection();
		PreparedStatement qstU= (PreparedStatement) conn.prepareStatement("UPDATE `question` set count=count+1 where Ques_id=?");
		qstU.setInt(1,quesid);
		qstU.executeUpdate();
		PreparedStatement pst= (PreparedStatement) conn.prepareStatement("SELECT Question, user_id,"+
				"create_time,count FROM `question` WHERE Ques_id=?");
		%>
 <jsp:include page="header.jsp"></jsp:include>
 <br>
 <br>
 <br>
 <br>
 <br>
<div class="container">
	<div class="row">
		<div class="col-xs-12 col-sm-10 col-md-10">
			<div class="well well-sm">
				<div class="row">
					<div class="col-sm-6 col-md-8">
            <h3><strong> Question : </strong></h3>
        		<% pst.setInt(1,quesid);
        		ResultSet rst = pst.executeQuery();
        	 	rst.next();
        	 	Question Q1;
        		Q1=new Question(quesid,rst.getString(1),rst.getDate(3),rst.getInt(2));
        		Q1.setCount(rst.getInt(4));
        		PreparedStatement pstu=(PreparedStatement) conn.prepareStatement("SELECT Fname FROM"+
        					"`user` WHERE user_id=?");
        pstu.setInt(1,rst.getInt(2));
        Integer uid=rst.getInt(2);
        ResultSet rstu =pstu.executeQuery();
        rstu.next();%>
        <%=rst.getString(1)%>
						<div style="padding-top:15px;"></div>
						<h5><span class="label label-info">Posted on:<%=rst.getDate(3)%></span></h5>
					</div>
					<div class="col-sm-6 col-md-4">
						<h4><span class="label label-info  pull-right">View Count: <%=Q1.getCount()%></span></h4>
<br>
<br>
        	  <h6> Question Posted By </h6> <h4> <a href="http://localhost:8080/TechQuo/SearchUserServlet?UID=<%=uid%>"><%=rstu.getString(1)%></a></h4>


        	   <p class="well">Think you can answer the question? Post an answer by clicking <a href="EnterAnswer.jsp?qid=<%=quesid%>">here</a>



					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!--Answers-->

<div class="container">
<div class="row">
			<div class="col-sm-7">
        <h4> ANSWERS </h4>
				<hr/>
<!-- fetching data from db -->
        <%PreparedStatement ps= (PreparedStatement) conn.prepareStatement("SELECT Ans_id, Answer, create_time,"+
                  "user_id_A, upvotes, downvotes FROM `answer` WHERE Ques_id_A=?");
        ps.setInt(1,quesid);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
          Answer A1=new Answer(rs.getInt(1),quesid,rs.getString(2),rs.getDate(3),rs.getInt(4),
              rs.getInt(5),rs.getInt(6));%>


          <%PreparedStatement pstau=(PreparedStatement) conn.prepareStatement("SELECT Fname FROM"+
                      "`user` WHERE user_id=?");
            pstau.setInt(1,rs.getInt(4));
            ResultSet rstau =pstau.executeQuery();
            rstau.next();%>
            <!-- ended -->
<!--new panel code  -->
            <div class="panel panel-default">
              <div class="panel-heading">
                <div class="row">
                  <div class="name col-md-8"><a href ="http://localhost:8080/TechQuo/SearchUserServlet?UID=<%=rs.getInt(4)%>"><%=rstau.getString(1)%></a></div>
                  <div class="review-block-date col-md-4"><%=A1.getCreate_time()%></div>
                </div>
              </div>
              <div class="panel-body">
                <div class="row">
                <div class="answer col-md-10"><%=A1.getAnswer()%></div>
                <div class="upvotebutton col-md-2">
      <form id="ajaxform" name="ajaxform" action="Upvote" method="get">
            <input type="hidden" name="ansid" id="ansid" value="<%=A1.getAns_id() %>" />
            <input type="submit" id="submit" value="Upvote"/ class="btn btn-info">
          <div id='content'></div>
       </form>
     
                </div>
              </div>
            </div>
      <div class="panel-footer">
        <div class="row">
                  <div class="upvote col-md-3">Up votes : <%=A1.getUpvotes()%></div>
                  <div class="downvote col-md-3">Down votes : <%=A1.getDownvotes()%></div>
            </div>
          </div>
        </div>
        <!--ended  -->

  <%
             }
         }
         catch (Exception e) {
             e.printStackTrace();
         }
         %>
			</div>
		</div>
</div>


  </body>
</html>
