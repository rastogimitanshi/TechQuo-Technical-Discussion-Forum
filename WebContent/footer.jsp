<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!--<link href="faq/style.css" rel="stylesheet">-->


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respon
      d/1.4.2/respond.min.js"></script>
    <![endif]-->

  <style>
  /*.noBullets{
    	list-style:none;
		padding:auto;
	}

	#last-footer h5{
		text-align:center;
	}
	.footlinks li a{
	text-align:center;
	margin-left:5px ;
	}*/

  #footer
{
	background-color: #00547A;
	padding: 20px 0px;
}
.footer-copyright {
    color: #fff;
    line-height: 32px;
    text-align: left;
}
.footer-social
{
	float: right;
}
.footer-social a {
    font-size: 18px;
    color: #fff;
}
.footer-social a :hover{
color: #e5e5f2;
}
.btn-link{
    color: #fff;

}
.btn-link:hover{
  color: #e5e5f2;

}
.modal{
  color: #000;
}

</style>

</head>
<body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
crossorigin="anonymous"></script>

<footer class="" id="footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-7 footer-copyright">
                    © Team- TECHQUO
                    <div class="credits">

                      <button type="button" class="btn btn-link btn-md " data-toggle="modal" data-target="#myModal1">Know More About TECHQUO</button>
                      <!-- Modal -->
                      <div id="myModal1" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                          <!-- Modal content-->
                          <div class="modal-content">
                            <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                              <h4 class="modal-title"> ABOUT US </h4>
                            </div>
                            <div class="modal-body">
                              <p>Tech Quo is a perfect platform to widen one's horizon. Tech Quo is best source of reading and improving one's skills .It enables learning in a fun manner and social networking at the same time. Tech Quo helps sharing knowledge via simple question and answer strategy. When a user posts question, other users engage themselves in answering it. This helps not only the person who posted the question but also hepls the users who gave the answer as they get to know a lot about themselves and boosts their confidence. The best part is that the questions are not restricted to a domain any may belong to any category. It is a perfect place to know other's thought process and get genuine responses. Tech Quo is where you can read important insights that have never been shared anywhere else, from people you could never reach any other way.
<p>
                            </div>

                          </div>

                        </div>
                      </div>
&nbsp; &nbsp; || &nbsp;&nbsp;
                      <button type="button" class="btn btn-link btn-md" data-toggle="modal" data-target="#myModal">FAQ</button>
                      <!-- Modal -->
                      <div id="myModal" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                          <!-- Modal content-->
                          <div class="modal-content">
                            <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                              <h4 class="modal-title">Frequently Asked Questions</h4>
                            </div>
                            <div class="modal-body">
                              <p> <strong> QUES: How do I make an account on Tech Quo?</strong></p>

            <p>"Sign up for TechQuo. Visit the TechQuo creation page. Follow the steps on the screen to complete your account setup. After you've created your TechQuo Account, you can use it to sign in to TechQuo on your computer, phone, or tablet.
            </p> <p> <strong> Ques: How do I change my password? </strong>

            <p>If you know your current password, you can change it:
Click  on change password
Type your current and new passwords
Click Save Changes




            </p> <p> <strong> Ques: How can I alter my answer and delete the previous one? </strong></p><p>
              You can edit the answer you have posted previously quite easily using the answer module.
            </p>


                            </div>

                          </div>

                        </div>
                      </div>
                    </div>
                </div>
                <div class="col-sm-5 footer-social">
                    <div class="pull-right hidden-xs hidden-sm">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-dribbble"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-google-plus"></i></a>
                        <a href="#"><i class="fa fa-pinterest"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </footer>



  </body>
  </html>
