<%@ page import="domain.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
  integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <!--<link href="faq/style.css" rel="stylesheet">-->
  <style>
  /*FAQS*/
  .faq_question {
      margin: 0px;
      padding: 0px 0px 5px 0px;
      display: inline-block;
      cursor: pointer;
      font-weight: bold;
  }

  .faq_answer_container {
      height: 0px;
      overflow: hidden;
      padding: 0px;
  }
  </style>


  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respon




    d/1.4.2/respond.min.js"></script>
  <![endif]-->

  <title>Change Password</title>
  <style>
  .menu
  {
  background-color: #00547E;
  border-bottom: 4px solid #04A3ED;
  width:100%;
  height: auto;
  padding: 0 10px;
  position: fixed;
  margin: 0px;
  z-index: 1;
  opacity: 0.9;
  }

  .menu  .navbar-nav > .active > a
  {
  background-color : #04A3ED;
  color: white;
  font-weight: bold;
  }

  .menu  .navbar-nav >  li >  a
  {
  font-size: 13px;
  color: white;
  padding: 10px 35px;

  }
  .menu  .navbar-nav >  li >  a:hover
  {
  background-color: #04A3ED;
  }

  .navbar-header > a
  {
  font-family: 'Ubuntu Condensed', sans-serif;
  padding: 0px;
  margin: 0px;
  text-decoration: none;
  color: white;
  font-size: 25px;
  padding: 5px 30px;
  }
  .navbar-header > a:hover
  {
  text-decoration: none;
  color: #04A3ED;
  }
  </style>

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

</script>


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
            data : "&CurrPass=" + CurrPass + "&NewPass=" + NewPass + "&ConPass" + ConPass,
            success : function(data) {

                 if(data.toString().indexOf("admin") != -1) {   // means if the message received from servlet in form of out.print.ln contains invalid or not
                  alert("Password Updated successfully.");
                      $(location).attr('href',"Home.jsp");

                 }
                 else if(data.toString().indexOf("user") != -1) {   // means if the message received from servlet in form of out.print.ln contains invalid or not
                    alert("Password Updated successfully.");
                    $(location).attr('href',"Home.jsp");

                }
              else if(data.toString().indexOf("admine") != -1) {
                  alert("Some unexpected error has occured. Please try again later.")
                  $(location).attr('href',"Home.jsp");
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
   return false;
    });
});
</script>

<div class="menu">
    <div class="container-fluid">
		<div class="navbar-header">
			<a href="#">TechQuo</a>
		</div>
		<div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#" ><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        <li> <form method="post" name="frm" action="SearchQuestionServlet">
          <table>
            <tr><td colspan=2 style="font-size:10pt; padding-top :3px; padding-bottom: 3px; " align="center">
            <tr><td style="font-family: 'Ubuntu Condensed', sans-serif; color: white;
            font-size: 15px;" >TAG</td>
              <td>: <input  type="text" name="tag" id="tag" required>
            </td>
            <td colspan=2 align="center">
            <input  type="submit" name="submit" value="Submit" ></td></tr>
          </table>
        </form> </li>
			</ul>
		</div>
	</div>
</div>
<!--Form Begins-->
<br>
<br>
<br>
<div class="container">
 <div class="row">

<fieldset>

<!-- Form Name -->
<legend> Change Password </legend>



		<% User user= (User)session.getAttribute("user_details"); %>


				<form  class="login-form form-horizontal" action = "UpdatePassword" method="post" onsubmit="return CurrentPassword();">

          <div class="form-group">
            <label class="col-md-4 control-label" > Current Password</label>
            <div class="col-md-4">
              <input type="password" id ="CurrPass" name ="CurrPass" placeholder="Current Password" class="form-control input-md" required="">

            </div>
          </div>

          <div class="form-group">
            <label class="col-md-4 control-label" >New Password</label>
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
              <input type="hidden" id="Pass" name="Pass" value="<%=user.getPassword()%>">
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


            </div>



	</body>
</html>
