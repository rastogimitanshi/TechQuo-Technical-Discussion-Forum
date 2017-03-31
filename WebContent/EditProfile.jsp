<%@ page import ="domain.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">



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

<title>Edit Profile</title>

</head>
<body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
crossorigin="anonymous"></script>

<script type="text/javascript" src="JS/jquery-min.js"> </script>
<script>
function validateEmail(email) {
	  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	  return re.test(email);
	}
	function validate() {
	  $("#result").text("");
	  var email = $("#email").val();
	  if (validateEmail(email)) {
	    $("#result").text(email + " is valid :)");
	    $("#result").css("color", "green");
	  } else {
	    $("#result").text(email + " is not valid :(");
	    $("#result").css("color", "red");
	  }
	  return false;
	}

	$("#validate").bind("click", validate);
	</script>

  <jsp:include page="header.jsp"></jsp:include>
       <jsp:include page="menu.jsp"></jsp:include>

       <%
         	 session=request.getSession(false);
     	if(session.getAttribute("user_details")==null){
     				request.setAttribute("SessionExpired", "Your session has expired. Please log in again.");
     				RequestDispatcher requestDispatcher;
     				requestDispatcher = request.getRequestDispatcher("/login.jsp");
     				requestDispatcher.forward(request,response);
     				return;
     			}

     	User user= (User)session.getAttribute("user_details");%>

      <div class="container">
         <h1>Edit Your Profile</h1>
       	<hr>
     	<div class="row">
           <!-- left column -->
           

           <!-- edit form column -->
           <div class="col-md-9 personal-info">

             <h3>Personal info</h3>

             <form class="form-horizontal" class="login-form"
       				action="UpdateProfile" method="post" enctype="multipart/form-data">
               <div class="form-group">
                 <label class="col-lg-3 control-label">First name:</label>
                 <div class="col-lg-8">
                   <input type="text" name="FirstName" id="FirstName" value="<%=user.getFirstName()%>" autocomplete="on" class="form-control input-md" >
                 </div>
               </div>

               <div class="form-group">
                 <label class="col-lg-3 control-label">Last name:</label>
                 <div class="col-lg-8">
                   <input type="text" name="LastName"
                     id="LastName" value="<%=user.getLastName()%>" autocomplete="on" class="form-control input-md">
                 </div>
               </div>

               <div class="form-group">
                 <label class="col-lg-3 control-label">Email:</label>
                 <div class="col-lg-8">
                   <input type="email" name="EmailId"
                     id="EmailId" value="<%=user.getEmailId()%>" class="form-control input-md" required="">
                     <p>xxxxxx@xxxx.com</p>
                 </div>
               </div>

               <div class="form-group">
                 <label class="col-lg-3 control-label">Country:</label>
                 <div class="col-lg-8">
                   <input type="text" name="Country"
                     id="Country" value="<%=user.getCountry()%>" class="form-control input-md" >
                 </div>
               </div>

               <div class="form-group">
                 <label class="col-lg-3 control-label">City:</label>
                 <div class="col-lg-8">
                   <input type="text" name="City" id="City"
                     value="<%=user.getCity()%>" class="form-control input-md" >
                 </div>
               </div>

               <div class="form-group">
                 <label class="col-lg-3 control-label">Date of birth</label>
                 <div class="col-lg-8">
                   <input type="date" name="DOB"
                     id="DOB" value="<%=user.getDOB()%>" max="1999-01-02" class="form-control input-md" >

                 </div>
               </div>

               <div class="form-group">
                 <label class="col-lg-3 control-label">Job Position:</label>
                 <div class="col-lg-8">
                   <input type="text" name="JobPosition"
                     id="JobPosition" value="<%=user.getJobPosition()%>" class="form-control input-md" >

                 </div>
               </div>

               <script src="addInput.js" language="Javascript" type="text/javascript">
               </script>



               <div class="form-group">
                 <div id="dynamicInput">
                 <label class="col-lg-3 control-label">Your Interests:</label>
                 <div class="col-lg-8">
                   <input type="text" name="myInputs" value=" " class="form-control input-md" >
                   

                 <input type="button" value="Add more interests" onClick="addInput('dynamicInput');" >
                  </div>
                 </div>
               </div>

               <script src="addEducation.js" language="Javascript" type="text/javascript">
           				</script>


               <div class="form-group">
                 <div id="dynamicEducation">
                 <label class="col-lg-3 control-label">Educational Qualifications</label>
                 <div class="col-lg-8">
                   <input type="text"  name="myEducation" value=" " class="form-control input-md" >

                 <input type="button" value="Add more Education" onClick="addEducation('dynamicEducation');">
                  </div>
                 </div>
               </div>
               <div class="col-md-3">
             <div class="text-center">

               <h6>Upload a photo...</h6>

               <input  type="file" name="photo" size="50"/ class="form-control">
             </div>
           </div>


               <div class="form-group">
                 <label class="col-md-3 control-label"></label>
                 <div class="col-md-8">
                
                   <input type="submit" class="btn btn-primary" value="Save Changes">
                   <span></span>
                   <input type="reset" class="btn btn-default" value="Cancel">
                 </div>
               </div>

             </form>
           </div>
       </div>
     </div>
     <hr>

    <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
