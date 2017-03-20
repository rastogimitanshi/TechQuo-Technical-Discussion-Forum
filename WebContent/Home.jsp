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
     <jsp:include page="menu.jsp"></jsp:include>
    
    
      <h3>Home Page</h3>
      
     TechQuo is a technical Discussion Forum! <br>
     <%
     session=request.getSession(false);
     if(session.getAttribute("user_details")!=null)
     {
   %>
    
     <br>View the top 20 Posts! <br>
 
      <jsp:include page="/LoadPosts" flush="true"></jsp:include>
      <c:forEach items="${quesList}" var="q">
    
      <a href="QuestionDetails.jsp?QID=<c:out value="${q.getQuesid()}"/>"><c:out value="${q.getQuestion()}"></c:out></a>
      <br>
      
      </c:forEach>
      <%
      }%>
     <jsp:include page="footer.jsp"></jsp:include>
      
 
  </body>
</html>