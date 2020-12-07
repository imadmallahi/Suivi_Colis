<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<title><c:if test="${sessionScope.lang == 'en'}">List of commands </c:if>
	<c:if test="${sessionScope.lang == 'ar'}">قائمة الطلبات</c:if> <c:if
		test="${sessionScope.lang == 'fr'}">Liste des commandes</c:if></title>

<!--  style table  -->
<link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'>
<link rel='stylesheet'
	href='https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css'>
<link rel='stylesheet'
	href='https://cdn.datatables.net/buttons/1.2.2/css/buttons.bootstrap.min.css'>
<!--  style icone  -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">

<link rel="stylesheet" href="Style/styleTable.css">
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css" href="icon/logo.css" />


<link rel="stylesheet"
	href="assetss/css/material-dashboard.min28b5.css?v=2.0.0">


</head>

<body <c:if test="${sessionScope.lang == 'ar'}">class="rtl"</c:if>>

	<c:import url="../Navs/NavClient.jsp"></c:import>
	<div class="main-panel">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header card-header-success card-header-icon">
					<div class="card-header card-header-success card-header-icon">
						<div class="card-icon">
							<i class="material-icons">assignment</i>
						</div>
						<h4 class="card-title">
							<c:if test="${sessionScope.lang == 'en'}">List of commands </c:if>
							<c:if test="${sessionScope.lang == 'ar'}">قائمة الطلبات</c:if>
							<c:if test="${sessionScope.lang == 'fr'}">Liste des commandes</c:if>
						</h4>
					</div>
					<div class="card-body">

						<div class="material-datatables">

							<table id="example"
								class="table  table-dark table-striped table-bordered"
								cellspacing="0" width="100%">
								<thead>
									<tr>
										<c:if test="${sessionScope.lang == 'en'}">
											<th>N° Command</th>
											<th>N°Agent</th>

											<th>total command</th>
											<th>Actions</th>
										</c:if>
										<c:if test="${sessionScope.lang == 'ar'}">
											<th></th>
											<th>الترتيب الكلي</th>

											<th>رقم الوكيل</th>
											<th>رقم الطلب</th>
										</c:if>
									
										<c:if test="${sessionScope.lang == 'fr'}">
											<th>N° Commande</th>
											<th>N° Agent</th>

											<th>total commande</th>
											<th>Actions</th>
										</c:if>

									</tr>
								</thead>
								<tbody>
									<c:if test="${sessionScope.lang == 'en'}">
										<c:forEach items="${listCommande}" var="row">
											<tr>
												<td>${row.getId()}</td>
												<td>${row.getNumAgent()}</td>

												<td>${row.getTotalCommande()  }</td>
												<th><a
													href="Servlet?action=ReadCommande&id=${row.getId()}"><i
														class="far fa-folder-open fa-lg" style="color: green;"></i></a>
													<a href="Servlet?action=UpdateCommande&id=${row.getId()}"><i
														class="far fa-edit fa-lg" style="color: blue;"></i></a> <a
													id="${row.getId()}" href="#" class="delete"><i
														class="material-icons" style="color: red;">close</i></a></th>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${sessionScope.lang == 'ar'}">
										<c:forEach items="${listCommande}" var="row">
											<tr>
												<th><a
													href="Servlet?action=ReadCommande&id=${row.getId()}"><i
														class="far fa-folder-open fa-lg" style="color: green;"></i></a>
													<a href="Servlet?action=UpdateCommande&id=${row.getId()}"><i
														class="far fa-edit fa-lg" style="color: blue;"></i></a> <a
													id="${row.getId()}" href="#" class="delete"><i
														class="material-icons" style="color: red;">close</i></a></th>
												<td>${row.getTotalCommande()  }</td>
												<td>${row.getNumAgent()}</td>
												<td>${row.getId()}</td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${sessionScope.lang == 'fr'}">
										<c:forEach items="${listCommande}" var="row">
											<tr>
												<td>${row.getId()}</td>
												<td>${row.getNumAgent()}</td>

												<td>${row.getTotalCommande()  }</td>
												<th><a
													href="Servlet?action=ReadCommande&id=${row.getId()}"><i
														class="far fa-folder-open fa-lg" style="color: green;"></i></a>
													<a href="Servlet?action=UpdateCommande&id=${row.getId()}"><i
														class="far fa-edit fa-lg" style="color: blue;"></i></a> <a
													id="${row.getId()}" href="#" class="delete"><i
														class="material-icons" style="color: red;">close</i></a></th>
											</tr>
										</c:forEach>
									</c:if>


								</tbody>
							</table>
							<script
								src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
							<script
								src='https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js'></script>
							<script
								src='https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js'></script>
							<script
								src='https://cdn.datatables.net/buttons/1.2.2/js/buttons.colVis.min.js'></script>
							<script
								src='https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js'></script>
							<script
								src='https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js'></script>
							<script
								src='https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js'></script>
							<script
								src='https://cdn.datatables.net/buttons/1.2.2/js/buttons.bootstrap.min.js'></script>
							<script
								src='https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js'></script>
							<script
								src='https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js'></script>
							<script
								src='https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js'></script>
							<script src="Script/scriptTable.js"></script>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
$(document).ready(function() {
// crating new click event for save button
$(".delete").click(function() {
var id = +this.id; 

var r = confirm("Vous voulez supprimer cette commande !");
if (r == true) {
	$.ajax({
		url: "delete_ajax.jsp",
		type: "post",
		data: {
		id : id,
		table : "commande",
		idtable : "id"
		},
		success : function(data){
		alert(data); // alerts the response from jsp
		location.reload(); 
		}
		});
} 
});
});
</script>
</body>
</html>
