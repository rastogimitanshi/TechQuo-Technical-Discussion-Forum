<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>   
     <title>Home Page</title>

  </head>
  <body>
 
     <jsp:include page="header.jsp"></jsp:include>
     <jsp:include page="menu.jsp"></jsp:include>
      <h3>Home Page</h3>  
     TechQuo is a technical Discussion Forum! <br><br>
     <form class="login-form" name="myForm" id="myForm" method = "post" action = "HomeServlet">
     	<button id="reg">See posts!</button>
     </form>
        
   	<jsp:include page="footer.jsp"></jsp:include>
 
  </body>
</html>