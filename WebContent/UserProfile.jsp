<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="domain.User" %>

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

  <title>Profile</title>

	<style>

	.container{
		margin-left: 340px;

	}

	input.hidden {
    position: absolute;
    left: -9999px;
}

#profile-image1 {
    cursor: pointer;

     width: 100px;
    height: 100px;
	border:2px solid #03b1ce ;}
	.tital{ font-size:16px; font-weight:500;}
	 .bot-border{ border-bottom:1px #f8f8f8 solid;  margin:5px 0  5px 0}
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


<div class="container">
	<div class="row">
		<% 	User user =(User)request.getAttribute("UserDetails");
			String Interests =(String)request.getAttribute("Interests");
			String Education =(String)request.getAttribute("Education");
			Integer profileV =(Integer)request.getAttribute("ProfileViews");

				%>

       <div class="col-md-7 ">

<div class="panel panel-default">
  <div class="panel-heading">  <h4 > Profile</h4></div>
   <div class="panel-body">

    <div class="box box-info">

            <div class="box-body">
                     <div class="col-sm-6">
                     <div  align="center"> <img alt="User Pic" src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg" id="profile-image1" class="img-circle img-responsive">

                <input id="profile-image-upload" class="hidden" type="file">
<div style="color:#999;" ></div>

                     </div>

              <br>
							<div class="col-sm-6">
					 <h4 style="color:#00b1b1;"> <%
 						out.println("<BR>: " + user.getFirstName()); %></h4></span>
						 <span><p><% out.println("<BR>: " + user.getJobPosition()); %></p></span>
					 </div>
              <!-- /input-group -->
            </div>

            <div class="clearfix"></div>
            <hr style="margin:5px 0 5px 0;">


<div class="col-sm-5 col-xs-6 tital " >First Name:</div><div class="col-sm-7 col-xs-6 "><%
	out.println("<BR>: " + user.getFirstName());%> </div>
     <div class="clearfix"></div>
<div class="bot-border"></div>



<div class="col-sm-5 col-xs-6 tital " >Last Name:</div><div class="col-sm-7"><% out.println("<BR>: " + user.getLastName());%></div>
  <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Email ID:</div><div class="col-sm-7"><% out.println("<BR>: " + user.getEmailId()); %> </div>

  <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Country: </div><div class="col-sm-7"><% out.println("<BR>: " + user.getCountry()); %></div>

  <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >City: </div><div class="col-sm-7"> <%out.println("<BR>: " + user.getCity()); %> </div>

 <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Date of Birth: </div><div class="col-sm-7"><% out.println("<BR>: " + user.getDOB()); %></div>

 <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Interests</div><div class="col-sm-7"><% out.println("<BR>: " + Interests); %></div>

<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Educations</div><div class="col-sm-7"><% out.println("<BR>: "+ Education); %></div>

<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Profile Views</div><div class="col-sm-7"><% out.println("<BR>: "+ profileV); %></div>

<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Questions Posted</div><div class="col-sm-7"><% out.println("<BR>: "+ user.getQuestionsPosted()); %></div>

<div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Questions Answered</div><div class="col-sm-7"><% out.println("<BR>: "+ user.getAnswersAnswered()); %></div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

        </div>


    </div>
    </div>
</div>


   </div>
</div>



</body>
</html>
