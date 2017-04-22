
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

  <title>Update Password</title>


</head>


<body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
crossorigin="anonymous"></script>

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script type = "text/javascript" src = "JS/jquery-min.js"> </script>
<% String mail = (String)request.getAttribute("Mail"); %>

<form class="login-form form-horizontal" action="UpdatePassword" method="post">
  <fieldset>

  <!-- Form Name -->
  <legend> Update Password </legend>


            <div class="form-group">
              <label class="col-md-4 control-label" >New Password:</label>
              <div class="col-md-4">
                <input type="password" name="npwd" id="npwd" placeholder="Enter New Password" class="form-control input-md" required="">

              </div>
            </div>

            <div class="form-group">
              <label class="col-md-4 control-label" >Confirm Password:</label>
              <div class="col-md-4">
                <input type="password" name="cpwd" id="cpwd" placeholder="Confirm New Password" class="form-control input-md" required="">
                <input type="hidden" name="Mail" value="<%=mail%>" />
              </div>
            </div>

          

            <div class="form-group">
              <label class="col-md-4 control-label" for="confirmation"></label>
              <div class="col-md-4">
                <button id="reg" class="btn btn-primary">Submit</button>

              </div>
            </div>


</fieldset>
</form>
</body>
</html>
