<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link rel="apple-touch-icon" href="assetss/img/apple-icon.png">
<link rel="icon" href="assetss/img/favicon.png">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<title><c:if test="${sessionScope.lang == 'en'}">List of Customers </c:if>
	<c:if test="${sessionScope.lang == 'ar'}">قائمة الزبناء</c:if> <c:if
		test="${sessionScope.lang == 'fr'}"> Liste des clients</c:if></title>
<link rel="stylesheet" type="text/css" href="icon/logo.css" />
<link rel="stylesheet"
	href="../../../../maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="assetss/css/material-dashboard.min28b5.css?v=2.0.0">
<link href="assetss/assets-for-demo/demo.css" rel="stylesheet" />
<script type="text/javascript">
	if (document.readyState === 'complete') {
		if (window.location != window.parent.location) {
			const elements = document.getElementsByClassName("iframe-extern");
			while (elemnts.lenght > 0)
				elements[0].remove();
		}
	};
</script>
</head>
<body <c:if test="${sessionScope.lang == 'ar'}">class="rtl"</c:if>>
	<c:if test="${sessionScope.type_account == 'superviseur' }">
		<c:import url="../Navs/NavSuperviseur.jsp" />
	</c:if>
	<c:if test="${sessionScope.type_account == 'admin'}">
		<c:import url="../Navs/NavAdmin.jsp" />
	</c:if>
	<c:if test="${sessionScope.type_account == 'agent'}">
		<c:import url="../Navs/NavAgent.jsp" />
	</c:if>
	<div class="main-panel">
		<nav
			class="navbar navbar-expand-lg navbar-transparent  navbar-absolute fixed-top">
			<div class="container-fluid">
				<div class="navbar-wrapper">
					<div class="navbar-minimize">
						<button id="minimizeSidebar"
							class="btn btn-just-icon btn-white btn-fab btn-round">
							<i
								class="material-icons text_align-center visible-on-sidebar-regular">more_vert</i>
							<i
								class="material-icons design_bullet-list-67 visible-on-sidebar-mini">view_list</i>
						</button>
					</div>
					<a class="navbar-brand" href="#pablo"></a>
				</div>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navigation" aria-controls="navigation-index"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="sr-only">Toggle navigation</span> <span
						class="navbar-toggler-icon icon-bar"></span> <span
						class="navbar-toggler-icon icon-bar"></span> <span
						class="navbar-toggler-icon icon-bar"></span>
				</button>
			</div>
		</nav>
		<div class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header card-header-warning card-header-icon">
								<div class="card-icon">
									<i class="material-icons">assignment</i>
								</div>
								<h4 class="card-title">
									<c:if test="${sessionScope.lang == 'en'}">List of Customers </c:if>
									<c:if test="${sessionScope.lang == 'ar'}">قائمة الزبناء</c:if>
									<c:if test="${sessionScope.lang == 'fr'}"> Liste des clients</c:if>
								</h4>
							</div>
							<div class="card-body">
								<div class="toolbar">
									<!--        Here you can write extra buttons/actions for the toolbar              -->
								</div>
								<div class="material-datatables">
									<form action="servletCHU" method="get">
										<table id="datatables"
											class="table table-striped table-no-bordered table-hover"
											cellspacing="0" width="100%" style="width: 100%">
											<thead>

												<tr class=" table table-success">
													<c:if test="${sessionScope.lang == 'en'}">
														<th>Id</th>
														<th>Name</th>
														<th>Password</th>
														<th>Address</th>
														<th>Phone</th>
														<th>Email</th>
														<th>City</th>
														<th>Country</th>
														<th>Action</th>
													</c:if>
													<c:if test="${sessionScope.lang == 'ar'}">
														<th>امكانيات</th>
														<th>البلد</th>
														<th>المدينة</th>
														<th>البريد الإلكتروني</th>
														<th>رقم الهاتف</th>
														<th>عنوان</th>
														<th>كلمة السر</th>
														<th>الاسم</th>
														<th>رقم التعريف</th>
													</c:if>
													<c:if test="${sessionScope.lang == 'fr'}">
														<th>Id</th>
														<th>Nom</th>
														<th>Mot de passe</th>
														<th>Adresse</th>
														<th>Numero de telephone</th>
														<th>Email</th>
														<th>Ville</th>
														<th>Pays</th>
														<th>Action</th>
													</c:if>
												</tr>
											</thead>
											<tbody>
												<c:if test="${sessionScope.lang == 'en'}">
													<c:forEach items="${listClient}" var="a">
														<tr>
															<td>${a.getIdC() }</td>
															<td>${a.getNom()}</td>
															<td>${a.getPassword() }</td>
															<td>${a.getAdresse()  }</td>
															<td>${a.getNtele()}</td>
															<td>${a.getEmail()}</td>
															<td>${a.getVille() }</td>
															<td>${a.getPays()  }</td>
															<td class="td-actions text-center"><c:if
																	test="${sessionScope.type_account == 'superviseur' }">
																	<a
																		href="Servlet?action=personClient&amp;ip=${a.getIdC()}">
																		<button type="button" rel="tooltip" name="person"
																			class="btn btn-info">
																			<i class="material-icons">person</i>
																		</button>
																	</a>
																	<button type="button" id="${a.getIdC()}"
																		class=" btn btn-danger delete">
																		<i class="material-icons">close</i>
																	</button>
																</c:if> <c:if test="${sessionScope.type_account == 'admin'}">
																	<a
																		href="Servlet?action=personClient&amp;ip=${a.getIdC()}">
																		<button type="button" rel="tooltip" name="person"
																			class="btn btn-info">
																			<i class="material-icons">person</i>
																		</button>
																	</a>
																	<button type="button" id="${a.getIdC()}"
																		class=" btn btn-danger delete">
																		<i class="material-icons">close</i>
																	</button>
																</c:if> <c:if test="${sessionScope.type_account == 'agent'}">
																	<a
																		href="Servlet?action=personClient&amp;ip=${a.getIdC()}">
																		<button type="button" rel="tooltip" name="person"
																			class="btn btn-info">
																			<i class="material-icons">person</i>
																		</button>
																	</a>
																</c:if></td>
														</tr>
													</c:forEach>
												</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">
													<c:forEach items="${listClient}" var="a">
														<tr>
															<td class="td-actions text-center"><a
																href="Servlet?action=personClient&amp;ip=${a.getIdC()}">
																	<button type="button" rel="tooltip" name="person"
																		class="btn btn-info">
																		<i class="material-icons">person</i>
																	</button>
															</a>
															 <c:if test="${sessionScope.type_account == 'admin'}">
																 <button type="button" id="${a.getIdC()}"
																	class=" btn btn-danger delete">
																	<i class="material-icons">close</i>
																</button></c:if>
																</td>
																 <c:if test="${sessionScope.type_account == 'superviseur'}">
																 <button type="button" id="${a.getIdC()}"
																	class=" btn btn-danger delete">
																	<i class="material-icons">close</i>
																</button></c:if>
																</td>
															<td>${a.getDateInsc()  }</td>
															<td>${a.getVille() }</td>
															<td>${a.getEmail()}</td>
															<td>${a.getNtele()}</td>
															<td>${a.getAdresse()  }</td>
															<td>${a.getPassword() }</td>
															<td>${a.getNom()}</td>
															<td>${a.getIdC() }</td>
														</tr>
													</c:forEach>
												</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">
													<c:forEach items="${listClient}" var="a">
														<tr>
															<td>${a.getIdC()}</td>
															<td>${a.getNom()}</td>
															<td>${a.getPassword() }</td>
															<td>${a.getAdresse()  }</td>
															<td>${a.getNtele()}</td>
															<td>${a.getEmail()}</td>
															<td>${a.getVille() }</td>
															<td>${a.getDateInsc()  }</td>
															<td class="td-actions text-center"><a
																href="Servlet?action=personClient&amp;ip=${a.getIdC()}">
																	<button type="button" rel="tooltip" name="person"
																		class="btn btn-info">
																		<i class="material-icons">person</i>
																	</button>
															</a>
																<c:if test="${sessionScope.type_account == 'admin'}">
																<button type="button" id="${a.getIdC()}"
																	class=" btn btn-danger delete">
																	<i class="material-icons">close</i>
																</button>
																</c:if>
																<c:if test="${sessionScope.type_account == 'superviseur'}">
																 <button type="button" id="${a.getIdC()}"
																	class=" btn btn-danger delete">
																	<i class="material-icons">close</i>
																</button>
																</c:if>
																</td>
														</tr>
													</c:forEach>
												</c:if>
											</tbody>
										</table>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer class="footer ">
			<div class="container">
				<div class="copyright pull-right">
					&copy;
					<script>
						document.write(new Date().getFullYear())
					</script>
				</div>
			</div>
	</div>
	</div>
	<div class="fixed-plugin"></div>
</body>
<script>
	$(document).ready(function() {
		// crating new click event for save button
		$(".delete").click(function() {
			var id = +this.id;
			var r = confirm("Vous voulez supprimer  !");
			if (r == true) {
				$.ajax({
					url : "delete_ajax.jsp",
					type : "post",
					data : {
						id : id,
						table : "client",
						idtable : "idC"
					},
					success : function(data) {
						alert(data); // alerts the response from jsp
						location.reload();
					}
				});
			}
		});
	});
</script>
<script src="assetss/js/core/jquery.min.js"></script>
<script src="assetss/js/core/popper.min.js"></script>
<script src="assetss/js/bootstrap-material-design.min.js"></script>
<script src="assetss/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<script src="assetss/js/plugins/moment.min.js"></script>
<script src="assetss/js/plugins/bootstrap-datetimepicker.min.js"></script>
<script src="assetss/js/plugins/nouislider.min.js"></script>
<script src="assetss/js/plugins/bootstrap-selectpicker.js"></script>
<script src="assetss/js/plugins/bootstrap-tagsinput.js"></script>
<script src="assetss/js/plugins/jasny-bootstrap.min.js"></script>
<script src="assetss/assets-for-demo/js/modernizr.js"></script>
<script src="assetss/js/material-dashboard28b5.js?v=2.0.0"></script>
<script src="assetss/js/plugins/arrive.min.js" type="text/javascript"></script>
<script src="assetss/js/plugins/jquery.validate.min.js"></script>
<script src="assetss/js/plugins/chartist.min.js"></script>
<script src="assetss/js/plugins/jquery.bootstrap-wizard.js"></script>
<script src="assetss/js/plugins/bootstrap-notify.js"></script>
<script src="assetss/js/plugins/jquery-jvectormap.js"></script>
<script src="assetss/js/plugins/nouislider.min.js"></script>
<script src="assetss/js/plugins/jquery.select-bootstrap.js"></script>
<script src="assetss/js/plugins/jquery.datatables.js"></script>
<script src="assetss/js/plugins/sweetalert2.js"></script>
<script src="assetss/js/plugins/jasny-bootstrap.min.js"></script>
<script src="assetss/js/plugins/fullcalendar.min.js"></script>
<script src="assetss/js/plugins/demo.js"></script>
<script>
	$(document).ready(function() {
		$(".delete").click(function() {
			var id = +this.id;
			var r = confirm("Vous voulez supprimer ce agent !");
			if (r == true) {
				$.ajax({
					url : "delete_ajax.jsp",
					type : "post",
					data : {
						id : id,
						table : "client",
						idtable : "idC"
					},
					success : function(data) {
						alert(data); // alerts the response from jsp
						location.reload();
					}
				});
			}
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('#datatables').DataTable(
						{
							"pagingType" : "full_numbers",
							"lengthMenu" : [ [ 10, 25, 50, -1 ],
									[ 10, 25, 50, "All" ] ],
							responsive : true,
							language : {
								search : "_INPUT_",
								searchPlaceholder : "Search records",
							}
						});
				var table = $('#datatables').DataTable();
				table.on('click', '.edit', function() {
					$tr = $(this).closest('tr');

					var data = table.row($tr).data();
					alert('You press on Row: ' + data[0] + ' ' + data[1] + ' '
							+ data[2] + '\'s row.');
				});
				table.on('click', '.remove', function(e) {
					$tr = $(this).closest('tr');
					table.row($tr).remove().draw();
					e.preventDefault();
				});

				table.on('click', '.like', function() {
					alert('You clicked on Like button');
				});
				$('.card .material-datatables label').addClass('form-group');
			});
</script>
<script src="assetss/assets-for-demo/js/jquery.sharrre.js">
	
</script>
<noscript>
	<img height="1" width="1" style="display: none"
		src="https://www.facebook.com/tr?id=111649226022273&amp;ev=PageView&amp;noscript=1" />
</noscript>
</html>
