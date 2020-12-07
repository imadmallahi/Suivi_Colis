<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://bootstrapcreative.com/wp-bc/wp-content/themes/wp-bootstrap/codepen/bootstrapcreative.js?v=1"></script>

<link rel='stylesheet prefetch'
	href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<script
	src='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js'></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="jumbotron text-xs-center">
		<h1 style="color: red;">
			<i class="far fa-times-circle fa-3x"></i>
		</h1>
		<h1 class="display-3">Attention !</h1>
		<p class="lead">
			<strong>${messageError }</strong>
		</p>

		<c:if test="${sessionScope.type_account == 'agent'}">
			<a href="Servlet?action=homeAgent" class="btn btn-info"> <c:if
					test="${sessionScope.lang == 'en'}">
					<i class="fas fa-home"></i> HOME </c:if> <c:if
					test="${sessionScope.lang == 'ar'}">الصفحة الرئيسية</c:if> <c:if
					test="${sessionScope.lang == 'fr'}"> ACCUEIL</c:if>
			</a>

			<a href="Servlet?action=updateProfileAgent" class="btn btn-warning">
				<i class="fas fa-edit"></i> Try again
			</a>
		</c:if>
		<c:if test="${sessionScope.type_account == 'client'}">
			<a href="Servlet?action=homeClient" class="btn btn-info"> <c:if
					test="${sessionScope.lang == 'en'}">
					<i class="fas fa-home"></i> HOME </c:if> <c:if
					test="${sessionScope.lang == 'ar'}">الصفحة الرئيسية</c:if> <c:if
					test="${sessionScope.lang == 'fr'}"> ACCUEIL</c:if>
			</a>
			<a href="Servlet?action=updateProfileClient" class="btn btn-warning">
				<i class="fas fa-edit"></i> Try again
			</a>
		</c:if>

	</div>
</body>
</html>