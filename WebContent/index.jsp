<%@page import="domain.Question"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<!---style type="text/css">
.button {
	border-top: 1px solid #96d1f8;
	background: #65a9d7;
	background: -webkit-gradient(linear, left top, left bottom, from(#3e779d),
		to(#65a9d7) );
	background: -webkit-linear-gradient(top, #3e779d, #65a9d7);
	background: -moz-linear-gradient(top, #3e779d, #65a9d7);
	background: -ms-linear-gradient(top, #3e779d, #65a9d7);
	background: -o-linear-gradient(top, #3e779d, #65a9d7);
	padding: 5px 10px;
	-webkit-border-radius: 8px;
	-moz-border-radius: 8px;
	border-radius: 8px;
	-webkit-box-shadow: rgba(0, 0, 0, 1) 0 1px 0;
	-moz-box-shadow: rgba(0, 0, 0, 1) 0 1px 0;
	box-shadow: rgba(0, 0, 0, 1) 0 1px 0;
	text-shadow: rgba(0, 0, 0, .4) 0 1px 0;
	color: white;
	font-size: 14px;
	font-family: Georgia, serif;
	text-decoration: none;
	vertical-align: middle;
}
.button:hover {
	border-top-color: #28597a;
	background: #28597a;
	color: #ccc;
}
.button:active {
	border-top-color: #1b435e;
	background: #1b435e;
}
</style>-->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pagination-Results</title>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
	<br>
	<c:if test="${not empty list}">

		<div>
			<h4>Page No. ${pageNumber}</h4>

		</div>
		<div class="row">
			<div class="col-md-12">
				<!-- if number size of list is eq to number of news to be displayed in a page button next will not be displayed -->
				<c:if test="${btnPrevious!='' && btnPrevious!='Previous Disabled'}">
				 <form  class="login-form form-horizontal" action="pagination" method="post">
		    <fieldset>
						<input type="hidden" name="action" value="previous">


						<div class="form-group">
							<label class="col-md-3 control-label"></label>
							<div class="col-md-8">
								<input type="submit" class="btn btn-primary" value="${btnPrevious}">
								</div>
						</div>

						</fieldset>
						</form>

				</c:if>
				<c:forEach var="q" items="${list}">
					<hr>
					<a href="QuestionDetails.jsp?QID=<c:out value="${q.getQuesid()}"/>"><c:out value="${q.getQuestion()}"></c:out></a>
					<br>
				</c:forEach>
				<hr>
				<!-- if number size of list is eq to number of news to be displayed in a page button next will not be displayed -->
				<c:if test="${btnNext!=''&& btnNext!='Next Disabled'}">
				
					<form  class="login-form form-horizontal" action="pagination" method="post">
 		    <fieldset>
 						<input type="hidden" name="action" value="next">


 						<div class="form-group">
 							<label class="col-md-3 control-label"></label>
 							<div class="col-md-8">
 								<input type="submit" class="btn btn-primary" value="${btnNext}">
 								</div>
 						</div>
 						</fieldset>
 						</form>
				</c:if>
			</div>
		</div>
		<div class="row"></div>


	</c:if>


</body>
</html>
