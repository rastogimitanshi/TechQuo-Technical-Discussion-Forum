<%@ page import="java.util.*" %>
<%@ page import="domain.Question" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE HTML>
 
<html>
    <head>
    <title>Search Results</title>
    </head>
    <body>
    <p> Here is a list of all questions matching your search tags. </p>
    <%
                if (request.getAttribute("quesList") != null) {
              	ArrayList<Question> al =(ArrayList<Question>)request.getAttribute("quesList");
                    System.out.println(al);
                    %>
                    <ol>
                    <%
                    for( final Question Q1: al)
                    {
                    	%>
                    	<li><ul>
                    	<li>Question: <a href ="QuestionDetails.jsp?QID=<%= Q1.getQuesid() %>"><%=Q1.getQuestion() %></a><li> 
                    	<li>Posted on: <%=Q1.getcreate_time() %></li>
                    	<li>View count: <%=Q1.getCount() %> </li>   
                    	</ul>
                    	</li>
                    <%
                    }
                }
                    %>	
                    </ol>
                  
          
    </body>
</html>