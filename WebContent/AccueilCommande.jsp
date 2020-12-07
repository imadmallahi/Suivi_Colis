<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<title>Commande</title>
</head>
<body  <c:if test="${sessionScope.lang == 'ar'}">class="rtl"</c:if>>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark"> <!-- Brand -->
	<a class="navbar-brand" href="#">Home</a> <!-- Links -->
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link"
			href="Servlet?action=commandeCreate">Create commande</a></li>
		<li class="nav-item"><a class="nav-link"
			href="Servlet?action=ListeCommande">Liste commande</a></li>
		<li class="nav-item"><a class="nav-link"
			href="Servlet?action=ListeColis">Liste colis</a></li>
		<!-- Dropdown -->
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" id="navbardrop" data-toggle="dropdown"> Dropdown link </a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="#">Link 1</a> <a
					class="dropdown-item" href="#">Link 2</a> <a class="dropdown-item"
					href="#">Link 3</a>
			</div></li>
	</ul>
	</nav>
	<p>Accueil</p>
</body>
</html>