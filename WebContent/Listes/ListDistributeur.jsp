<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">

<head>

<meta charset="utf-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport" />

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<!-- Favicons -->
<link rel="apple-touch-icon" href="assetss/img/apple-icon.png">
<link rel="icon" href="assetss/img/favicon.png">

<title><c:if test="${sessionScope.lang == 'en'}">List of distributors </c:if>
	<c:if test="${sessionScope.lang == 'ar'}">قائمة الموزع</c:if> <c:if
		test="${sessionScope.lang == 'fr'}"> Liste des distributeurs</c:if></title>



<link
	href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"
	rel="stylesheet">
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
			// $(".iframe-extern").remove();
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

	<div class="main-panel">
		<!-- Navbar -->
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
		<!-- End Navbar -->




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
									<c:if test="${sessionScope.lang == 'en'}">List of distributors </c:if>
									<c:if test="${sessionScope.lang == 'ar'}">قائمة الموزع</c:if>
									<c:if test="${sessionScope.lang == 'fr'}"> Liste des distributeurs</c:if>
									
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
														<th>Registration date</th>
														<th>ID supervsor</th>
														<th>Action</th>
													</c:if>
													<c:if test="${sessionScope.lang == 'ar'}">
														<th></th>
														<th>معرف المشرف</th>
														<th>تاريخ التسجيل</th>
														<th>رقم الهاتف</th>
														<th>عنوان</th>
														<th>كلمة السر</th>
														<th>الاسم</th>
														<th>Id</th>
													</c:if>
													<c:if test="${sessionScope.lang == 'fr'}">
														<th>Id</th>
														<th>Nom</th>
														<th>Mot de passe</th>
														<th>Adresse</th>
														<th>Numero de telephone</th>
														<th>Date d'inscription</th>
														<th>ID superviseur</th>
														<th>Action</th>
													</c:if>

												</tr>
											</thead>

											<tbody>
												<c:if test="${sessionScope.lang == 'en'}">
													<c:forEach items="${listDistributeur}" var="d">

														<tr>
															<td>${d.getIdD() }</td>
															<td>${d.getNom()}</td>
															<td>${d.getPassword() }</td>
															<td>${d.getAdresse()  }</td>
															<td>${d.getNtele()}</td>
															<td>${d.getDateInsc() }</td>
															<td>${d.getIdSuperviseur()  }</td>
															<td class="td-actions text-center"><a
																href="Servlet?action=personDistributeurV&amp;ip=${d.getIdD()}">
																	<button type="button" rel="tooltip" name="person"
																		class="btn btn-info">
																		<i class="material-icons">person</i>
																	</button>
															</a> 
																<button type="button" id="${d.getIdD()}"
																	class=" btn btn-danger delete">
																	<i class="material-icons">close</i>
																</button></td>

														</tr>
													</c:forEach>
												</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">
													<c:forEach items="${listDistributeur}" var="d">

														<tr>

															<td class="td-actions text-center"><a
																href="Servlet?action=personDistributeurV&amp;ip=${d.getIdD()}">
																	<button type="button" rel="tooltip" name="person"
																		class="btn btn-info">
																		<i class="material-icons">person</i>
																	</button>
															</a> 
																<button type="button" id="${d.getIdD()}"
																	class=" btn btn-danger delete">
																	<i class="material-icons">close</i>
																</button></td>
															<td>${d.getIdSuperviseur()  }</td>
															<td>${d.getDateInsc() }</td>
															<td>${d.getNtele()}</td>
															<td>${d.getAdresse()  }</td>
															<td>${d.getPassword() }</td>
															<td>${d.getNom()}</td>
															<td>${d.getIdD() }</td>
														</tr>
													</c:forEach>
												</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">
													<c:forEach items="${listDistributeur}" var="d">

														<tr>
															<td>${d.getIdD() }</td>
															<td>${d.getNom()}</td>
															<td>${d.getPassword() }</td>
															<td>${d.getAdresse()  }</td>
															<td>${d.getNtele()}</td>
															<td>${d.getDateInsc() }</td>
															<td>${d.getIdSuperviseur()  }</td>
															<td class="td-actions text-center"><a
																href="Servlet?action=personDistributeurV&amp;ip=${d.getIdD()}">
																	<button type="button" rel="tooltip" name="person"
																		class="btn btn-info">
																		<i class="material-icons">person</i>
																	</button>
															</a>
																<button type="button" id="${d.getIdD()}"
																	class=" btn btn-danger delete">
																	<i class="material-icons">close</i>
																</button></td>

														</tr>
													</c:forEach>
												</c:if>

											</tbody>
										</table>
									</form>
								</div>
							</div>
							<!-- end content-->
						</div>
						<!--  end card  -->
					</div>
					<!-- end col-md-12 -->
				</div>
				<!-- end row -->

			</div>
		</div>

		<footer class="footer ">

			<div class="container">
				<div class="copyright pull-right">
					&copy;
					<script type="text/javascript">
						document.write(new Date().getFullYear())
					</script>
				</div>
			</div>



		</footer>
	</div>






</body>

<!--   Core JS Files   -->
<script src="assetss/js/core/jquery.min.js" type="text/javascript"></script>
<script src="assetss/js/core/popper.min.js" type="text/javascript"></script>


<script src="assetss/js/bootstrap-material-design.min.js"
	type="text/javascript"></script>


<script src="assetss/js/plugins/perfect-scrollbar.jquery.min.js"
	type="text/javascript"></script>






<!--  Plugin for Date Time Picker and Full Calendar Plugin  -->
<script src="assetss/js/plugins/moment.min.js" type="text/javascript"></script>

<!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
<script src="assetss/js/plugins/bootstrap-datetimepicker.min.js"
	type="text/javascript"></script>

<!--	Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="assetss/js/plugins/nouislider.min.js"
	type="text/javascript"></script>



<!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
<script src="assetss/js/plugins/bootstrap-selectpicker.js"
	type="text/javascript"></script>

<!--	Plugin for Tags, full documentation here: http://xoxco.com/projects/code/tagsinput/  -->
<script src="assetss/js/plugins/bootstrap-tagsinput.js"
	type="text/javascript"></script>

<!--	Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="assetss/js/plugins/jasny-bootstrap.min.js"
	type="text/javascript"></script>

<!-- Plugins for presentation and navigation  -->
<script src="assetss/assets-for-demo/js/modernizr.js"
	type="text/javascript"></script>




<!-- Material Kit Core initialisations of plugins and Bootstrap Material Design Library -->

<script src="assetss/js/material-dashboard28b5.js?v=2.0.0"
	type="text/javascript"></script>





<!-- Library for adding dinamically elements -->
<script src="assetss/js/plugins/arrive.min.js" type="text/javascript"></script>

<!-- Forms Validations Plugin -->
<script src="assetss/js/plugins/jquery.validate.min.js"
	type="text/javascript"></script>

<!--  Charts Plugin, full documentation here: https://gionkunz.github.io/chartist-js/ -->
<script src="assetss/js/plugins/chartist.min.js" type="text/javascript"></script>

<!--  Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
<script src="assetss/js/plugins/jquery.bootstrap-wizard.js"
	type="text/javascript"></script>

<!--  Notifications Plugin, full documentation here: http://bootstrap-notify.remabledesigns.com/    -->
<script src="assetss/js/plugins/bootstrap-notify.js"
	type="text/javascript"></script>

<!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
<script src="assetss/js/plugins/jquery-jvectormap.js"
	type="text/javascript"></script>

<!-- Sliders Plugin, full documentation here: https://refreshless.com/nouislider/ -->
<script src="assetss/js/plugins/nouislider.min.js"
	type="text/javascript"></script>

<!--  Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
<script src="assetss/js/plugins/jquery.select-bootstrap.js"
	type="text/javascript"></script>

<!--  DataTables.net Plugin, full documentation here: https://datatables.net/    -->
<script src="assetss/js/plugins/jquery.datatables.js"
	type="text/javascript"></script>

<!-- Sweet Alert 2 plugin, full documentation here: https://limonte.github.io/sweetalert2/ -->
<script src="assetss/js/plugins/sweetalert2.js" type="text/javascript"></script>

<!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="assetss/js/plugins/jasny-bootstrap.min.js"
	type="text/javascript"></script>

<!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
<script src="assetss/js/plugins/fullcalendar.min.js"
	type="text/javascript"></script>

<!-- demo init -->
<script src="assetss/js/plugins/demo.js" type="text/javascript"></script>










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
						table : "distributeur",
						idtable : "idD"
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

				// Edit record
				table.on('click', '.edit', function() {
					$tr = $(this).closest('tr');

					var data = table.row($tr).data();
					alert('You press on Row: ' + data[0] + ' ' + data[1] + ' '
							+ data[2] + '\'s row.');
				});

				// Delete a record
				table.on('click', '.remove', function(e) {
					$tr = $(this).closest('tr');
					table.row($tr).remove().draw();
					e.preventDefault();
				});

				//Like record
				table.on('click', '.like', function() {
					alert('You clicked on Like button');
				});

				$('.card .material-datatables label').addClass('form-group');
			});
</script>














<!-- Sharrre libray -->
<script src="assetss/assets-for-demo/js/jquery.sharrre.js"
	type="text/javascript">
	
</script>


<noscript>
	<img height="1" width="1" style="display: none" src="https:ipt=1"
		alt="" />
</noscript>



<!-- Mirrored from demos.creative-tim.com/material-dashboard-pro/examples/tables/datatables.net.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 20 Mar 2018 16:01:04 GMT -->
</html>
