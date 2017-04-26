<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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



    </head>


    <body>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
    integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
    crossorigin="anonymous"></script>

    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

    <script type = "text/javascript" src = "JS/jquery-min.js"> </script>

    <%
	session=request.getSession(false);
	if(session.getAttribute("user_details")==null){
	request.setAttribute("SessionExpired", "Your session has expired. Please log in again.");
	RequestDispatcher requestDispatcher;
	requestDispatcher = request.getRequestDispatcher("/login.jsp");
	requestDispatcher.forward(request,response);
	return;
}
	Integer quesid=Integer.parseInt(request.getParameter("qid"));
 	User user= (User)session.getAttribute("user_details");
%>

    <jsp:include page="header.jsp"></jsp:include>
    <!--Form Begins-->
    <br>
    <br>
    <br>

    <div class="container">
     <div class="row">


       <form  class="login-form form-horizontal" action="EnterAnswer">
    <fieldset>

    <!-- Form Name -->
    <br>
    <br>

    <legend> Post your Answer! </legend>


              <div class="form-group">
                <label class="col-md-4 control-label" > </label>
                <div class="col-md-4">
                    <textarea class="form-control" name="ans" rows="4" cols="50" required="">
                    </textarea>

                </div>
              </div>

              <input type="hidden" name="qid" value="<%=quesid%>">

              <input type="hidden" name="uid" value="<%=user.getUserId()%>">

              <div class="form-group">
                <label class="col-md-3 control-label"></label>
                <div class="col-md-8">
                  <input type="submit" class="btn btn-primary" value="Submit this Answer">
                  <span></span>
                  <input type="reset" class="btn btn-default" value="Cancel">
                </div>
              </div>

              </fieldset>
              </form>

              	</div>
              </div>


    	</body>
    </html>
