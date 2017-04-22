<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="ISO-8859-1">
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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

  <title>Forgot Password</title>


<body>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
  integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
  crossorigin="anonymous"></script>

  <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

  <script type = "text/javascript" src = "JS/jquery-min.js"> </script>


  <form class="login-form form-horizontal" action="ForgotPassword" method="post">
    <fieldset>

    <!-- Form Name -->
    <legend> Request New Password </legend>


              <div class="form-group">
                <label class="col-md-4 control-label" > E-Mail ID</label>
                <div class="col-md-4">
                  <input type="text" id ="CurrPass" name ="mailid" placeholder="Your Email ID" class="form-control input-md" required="">

                </div>
              </div>

              <div class="form-group">
                <label class="col-md-4 control-label">Choose Secuirity Question</label>
                <div class="col-md-5">

                  <select name="Q1" id="Q2" class="form-control">
                          <option value="-1">Select</option>
                          <option value="1">What is your favourite colour?</option>
              						<option value="2">What is your Pokémon of choice?</option>
              						<option value="3">A word that rhymes with time.</option>
              						<option value="4">What is your pet peeve?</option>
                          <div class="col-md-4">
                            <input type="text" name="Answer" id = "Answer" placeholder="Enter Answer" class="form-control input-md" required="">

                          </div>
                </div>
              </div>

              <div class="form-group">
                <label class="col-md-4 control-label" for="confirmation"></label>
                <div class="col-md-4">
                  <button type="submit" id="reg" class="btn btn-primary">Submit</button>

                </div>
              </div>

		
  </fieldset>
  </form>
</body>
</html>
