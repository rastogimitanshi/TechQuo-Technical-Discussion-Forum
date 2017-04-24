<%@ page import="domain.User"%>
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

  <title>Edit Password</title>
  

</head>


<body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
crossorigin="anonymous"></script>

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script type = "text/javascript" src = "JS/jquery-min.js"> </script>


<script>
$(document).ready(function() {
$("#CurrPass").blur(function(){
    Pass= $("#Pass").val();
    CurrPass= $("#CurrPass").val();
    if(CurrPass==null || CurrPass==""){
       $("#CurrPass").attr("placeholder", "Please enter Current Password");
      return false;
    }

    if(Pass!=CurrPass){
       $("#CurrPass").val('');
       $("#CurrPass").attr("placeholder", "Incorrect Current Password");
      return false;
    }
    return false;
    });




  $("#submit").click(function() {
    Pass= $("#Pass").val();
    CurrPass= $("#CurrPass").val();
    NewPass= $("#NewPass").val();
    ConPass= $("#ConPass").val();


        $("#CurrPass").attr("placeholder", "Current Password");
    $("#NewPass").attr("placeholder", "New Password.");
    $("#ConPass").attr("placeholder", "Re-enter new Password.");

        if(CurrPass == "" || CurrPass == null) {
      $("#CurrPass").attr("placeholder", "Please enter current Password");
           return false;
        }
        if(NewPass==null || NewPass==""){
      $("#NewPass").attr("placeholder", "Please enter new Password");
      return false;
    }
        if(ConPass==null || ConPass==""){
      $("#ConPass").attr("placeholder", "Please re-enter new Password");
      return false;
    }
        if(NewPass!=ConPass){
      $("#CurrPass").val('CurrPass');
      $("#NewPass").val('');
      $("#ConPass").val('');
      $("#NewPass").attr("placeholder", "Passwords do not match");
      return false;
    }


 $.ajax({
       type : "POST",
       url : "UpdatePassword",
       data : "CurrPass=" + CurrPass + "&NewPass=" + NewPass + "&ConPass" + ConPass,
       success : function(data) {

             if(data.toString().indexOf("admin") != -1) {   // means if the message received from servlet in form of out.print.ln contains invalid or not
              alert("Password Updated successfully.");
                  $(location).attr('href',"Admin.jsp");

             }
             else if(data.toString().indexOf("user") != -1) {   // means if the message received from servlet in form of out.print.ln contains invalid or not
                alert("Password Updated successfully.");
                $(location).attr('href',"Home.jsp");

           }
          else if(data.toString().indexOf("admine") != -1) {
              alert("Some unexpected error has occured. Please try again later.")
              $(location).attr('href',"Admin.jsp");
        }
          else if(data.toString().indexOf("usere") != -1) {
              alert("Some unexpected error has occured. Please try again later.")
              $(location).attr('href',"Home.jsp");
        }
     },
   error: function(data) {
     alert("Some unexpected error has occured. Please try again later.")
     $(location).attr('href',"LogOut");
   }
   });
return false;
});



});
</script>

<%		session=request.getSession(false);
		if(session.getAttribute("user_details")==null){
			request.setAttribute("SessionExpired", "Your session has expired. Please log in again.");
			RequestDispatcher requestDispatcher;
			requestDispatcher = request.getRequestDispatcher("/login.jsp");
			requestDispatcher.forward(request,response);
			return;
		}
%>


<!--Form Begins-->
<br>
<br>
<br>
<%
  User user= (User)session.getAttribute("user_details");
%>
<div class="container">
 <div class="row">


   <form  class="login-form form-horizontal" action = "UpdatePassword" method="post" onsubmit="return CurrentPassword();">
<fieldset>

<!-- Form Name -->
<legend> Edit Password </legend>


          <div class="form-group">
            <label class="col-md-4 control-label" > Current Password</label>
            <div class="col-md-4">
              <input type="password" id ="CurrPass" name ="CurrPass" placeholder="Current Password" class="form-control input-md" required="">

            </div>
          </div>

          <div class="form-group">
            <label class="col-md-4 control-label">New Password</label>
            <div class="col-md-4">
              <input type="password" id ="NewPass" name="NewPass" placeholder="New Password" class="form-control input-md" required="">

            </div>
          </div>

          <div class="form-group">
            <label class="col-md-4 control-label" >Confirm Password</label>
            <div class="col-md-4">
              <input type="password" type="password" id="ConPass" name="ConPass" placeholder="Re-enter New Password" class="form-control input-md" required="">

            </div>
          </div>


          <!-- Button -->
          <div class="form-group">
            <label class="col-md-4 control-label" for="confirmation"></label>
            <div class="col-md-4">
              <button id="submit" class="btn btn-primary">Submit</button>
              <input type="hidden" id="Pass" name="Pass" value="<%= user.getPassword() %>">
            </div>
          </div>

          </fieldset>
          </form>

          	</div>
          </div>
          <div class="form-group">
            <label class="col-md-4 control-label" for="confirmation"></label>
          <div class="btn-group" role="group">
  <a href ="LogOut">  <button id="btnLogout" class="btn btn-outline-secondary">Logout</button></a>
  <a href ="Home.jsp">  <button  class="btn btn-outline-secondary">Back</button></a>
  <a href ="EditPassword.jsp">  <button  class="btn btn-outline-secondary">Reset</button></a>
</div>
  </div>

	</body>
</html>
