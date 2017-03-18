<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
     <meta charset="UTF-8">
     <title>Home Page</title>
     <script type="text/javascript" src="JS/jquery-3.2.0.min.js"></script>
     <script type="text/javascript">
     $(document).ready(function() {
     $('#ibutton').click(function(e) {
     $("#myDiv").hide()
     e.preventDefault();
     var ajaxdata = $("#ibutton").val();
     var value ='ibutton='+ajaxdata;
      
     $.ajax({
     url: "HomeServlet",
     //type: "post",
     data: value,
     cache: false,
     success: function(data) {
         $("#ibutton").val('');
         $("#message").html(data).slideDown('slow');
         }
     });
	 });
	 });
	 </script>
  </head>
  <body>
 
     <jsp:include page="header.jsp"></jsp:include>
     <jsp:include page="menu.jsp"></jsp:include>
    
      <h3>Home Page</h3>
      
     TechQuo is a technical Discussion Forum! <br><br>
     <div id = "myDiv">
     <form class="login-form" name="myForm" id="myForm" method = "post" action = "HomeServlet">
     	<button id="ibutton">See posts!</button>
     </form>
     </div>
     <div id="message"></div></font>
     <jsp:include page="footer.jsp"></jsp:include>
 
  </body>
</html>