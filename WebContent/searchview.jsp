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
                    	<li><ul><li> Question ID: <%= Q1.getQuesid() %>  </li>
                    	<li>Question: <a href ="QuestionDetails.jsp?QID=<%= Q1.getQuesid() %>"><%=Q1.getQuestion() %></a><li> 
                    	<li>Question Create Time: <%=Q1.getcreate_time() %></li>
                    	<li>User ID Who Posted Question: <%=Q1.getuser_id() %><li>
                    	</ul>
                    	</li>
                    <%
                    }
                }
                    %>	
                    </ol>
                  
                 
                
     
          
    </body>
</html>