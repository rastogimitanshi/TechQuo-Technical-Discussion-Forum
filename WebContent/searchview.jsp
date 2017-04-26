<%@ page import="java.util.*" %>
<%@ page import="domain.Question" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE HTML>

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
  <style>
  .post
  {	padding-left: 300px;
  	z-index: 5;
  	font-size:20px;
  	font-weight: 300;
  	color: #00547E;
  	line-height: 38px;
  	letter-spacing: 1px;
  	opacity: 1;
  	text-transform: uppercase;
  }
  </style>

    <title>Search Results</title>
    </head>
    <body>
      <div class="post">
    <p> Here is a list of all questions matching your search tags: </p> </div>
    <%
                if (request.getAttribute("quesList") != null) {
              	ArrayList<Question> al =(ArrayList<Question>)request.getAttribute("quesList");
                    System.out.println(al);
                    %>
                    <div class="panel panel-default">
                      <%
                      for( final Question Q1: al)
                      {
                      	%>

                      <div class="panel-body">
                        <div class="row">
                        <div class="answer col-md-10">Question: <a href ="QuestionDetails.jsp?QID=<%= Q1.getQuesid() %>"><%=Q1.getQuestion() %></a></div>

                      </div>
                    </div>
              <div class="panel-footer">
                <div class="row">
                          <div class="upvote col-md-3">Posted on: <%=Q1.getcreate_time() %></div>
                          <div class="downvote col-md-3">View count: <%=Q1.getCount() %></div>
                    </div>
                  </div>
                  <%
                  }
              }
                  %>
                </div>



    </body>
</html>
