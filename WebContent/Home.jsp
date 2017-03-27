<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
   <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
   <%@page import ="domain.Question" %>
<!DOCTYPE html>
<html>
  <head>
     <meta charset="UTF-8">
     <title>Home Page</title>
 
  </head>
  <body>
 
     <jsp:include page="header.jsp"></jsp:include>
     <br>
     <br>
     <br>
     <br>
     <jsp:include page="menu.jsp"></jsp:include>
    
    
      <h3>Home Page</h3>
      
     TechQuo is a technical Discussion Forum! <br>
    <br>
    <br>
      <jsp:include page="/LoadPosts" flush="true"></jsp:include>
      <div style="float: left;">
      <br>View the top 20 Posts! <br>
      <c:forEach items="${quesList}" var="q">
    
      <a href="QuestionDetails.jsp?QID=<c:out value="${q.getQuesid()}"/>"><c:out value="${q.getQuestion()}"></c:out></a>
      <br>
      
      </c:forEach>
      </div>
      <br>
      <br>
      
     <!-- <div>
     <a href="index.jsp">Click here to view All posts</a>
      </div>
        -->
        <div>
		
		<form action="pagination" method="post">
			<input type="hidden" name="action" value="load"> <input
				type="submit" class="button" value="View All">
		</form>
		</div>

      <jsp:include page="/ViewTopTags" flush="true"></jsp:include>
      <div style="float: right;">
       <br>View the top trending tags! <br>
      <c:forEach items="${toptags}" var="tag">
      <a href="http://localhost:8080/TechQuo/SearchQuestionServlet?tag=<c:out value="${tag}"/>"><c:out value="${tag}"></c:out></a>
      <br>
      </c:forEach>
      </div>
      
     <jsp:include page="footer.jsp"></jsp:include>
      
 
  </body>
</html>