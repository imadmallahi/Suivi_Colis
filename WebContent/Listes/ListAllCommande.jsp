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
<title>Liste des Commandes entrante</title>
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
	<c:if test="${sessionScope.type_account == 'agent'}">
		<c:import url="../Navs/NavAgent.jsp" />

	</c:if>
	<c:if test="${sessionScope.type_account == 'superviseur'}">
		<c:import url="../Navs/NavSuperviseur.jsp" />
	</c:if>
	<c:if test="${sessionScope.type_account == 'distributeur'}">
		<c:import url="../Navs/NavDistributeur.jsp" />
	</c:if>
	<c:if test="${sessionScope.type_account == 'client'}">
		<c:import url="../Navs/NavClient.jsp" />

	</c:if>
	<c:if test="${sessionScope.type_account == 'admin'}">
		<c:import url="../Navs/NavAdmin.jsp" />
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
					<a class="navbar-brand" href="#pablo">Liste des commandes </a>
				</div>

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navigation" aria-controls="navigation-index"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="sr-only">Toggle navigation</span> <span
						class="navbar-toggler-icon icon-bar"></span> <span
						class="navbar-toggler-icon icon-bar"></span> <span
						class="navbar-toggler-icon icon-bar"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-end"></div>
			</div>
		</nav>
		<div class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header card-header-primary card-header-icon">
								<div class="card-icon">
									<i class="material-icons">assignment</i>
								</div>
								<h4 class="card-title">Commandes</h4>
							</div>
							<div class="card-body">
								<div class="toolbar">
									<!--        Here you can write extra buttons/actions for the toolbar              -->
								</div>
								<div class="material-datatables">

									<table id="datatables"
										class="table table-striped table-no-bordered table-hover"
										cellspacing="0" width="100%" style="width: 100%">
										<thead>
											<tr>
												<th>de la Commande</th>
												
												
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${listCommande}" var="row">
												<tr>
													<td>${row.toString()}</td>
													<!-- 
													
													commande.setNumAdherent(resultatStatement.getString(3));
				commande.setNumAgent(resultatStatement.getString(2));
				commande.setTotalCommande(resultatStatement.getString(4));
				commande.setIdSuperviseur(resultatStatement.getInt(6));
				commande.setIdDistributeur(resultatStatement.getInt(7));
				commande.setEtat(resultatStatement.getString(5));
				commande.setId(resultatStatement.getInt(1));
				commande.setIdAgentDistination(resultatStatement.getInt(8)); -->
											</c:forEach>
										</tbody>
									</table>
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
	</div>
	</div>
</body>
<!--   Core JS Files   -->
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
		// crating new click event for save button
		$(".delete").click(function() {
			var id = +this.id;

			var r = confirm("Vous voulez supprimer ce agent !");
			if (r == true) {
				$.ajax({
					url : "delete_ajax.jsp",
					type : "post",
					data : {
						id : id,
						table : "commande",
						idtable : "id"
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
<script src="assetss/assets-for-demo/js/jquery.sharrre.js">
	
</script>
<script>
	$(document)
			.ready(
					function() {
						$('#twitter')
								.sharrre(
										{
											share : {
												twitter : true
											},
											enableHover : false,
											enableTracking : false,
											enableCounter : false,
											buttons : {
												twitter : {
													via : 'CreativeTim'
												}
											},
											click : function(api, options) {
												api.simulateClick();
												api.openPopup('twitter');
											},
											template : '<i class="fa fa-twitter"></i> Twitter',
											url : 'http://demos.creative-tim.com/material-kit-pro/presentation.html'
										});

						$('#facebook')
								.sharrre(
										{
											share : {
												facebook : true
											},
											enableHover : false,
											enableTracking : false,
											enableCounter : false,
											click : function(api, options) {
												api.simulateClick();
												api.openPopup('facebook');
											},
											template : '<i class="fa fa-facebook-square"></i> Facebook',
											url : 'http://demos.creative-tim.com/material-kit-pro/presentation.html'
										});

						$('#google')
								.sharrre(
										{
											share : {
												googlePlus : true
											},
											enableCounter : false,
											enableHover : false,
											enableTracking : true,
											click : function(api, options) {
												api.simulateClick();
												api.openPopup('googlePlus');
											},
											template : '<i class="fa fa-google-plus"></i> Google',
											url : 'http://demos.creative-tim.com/material-kit-pro/presentation.html'
										});
					});

	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'UA-46172202-1' ]);
	_gaq.push([ '_trackPageview' ]);

	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();

	// Facebook Pixel Code Don't Delete
	!function(f, b, e, v, n, t, s) {
		if (f.fbq)
			return;
		n = f.fbq = function() {
			n.callMethod ? n.callMethod.apply(n, arguments) : n.queue
					.push(arguments)
		};
		if (!f._fbq)
			f._fbq = n;
		n.push = n;
		n.loaded = !0;
		n.version = '2.0';
		n.queue = [];
		t = b.createElement(e);
		t.async = !0;
		t.src = v;
		s = b.getElementsByTagName(e)[0];
		s.parentNode.insertBefore(t, s)
	}(window, document, 'script',
			'../../../../connect.facebook.net/en_US/fbevents.js');

	try {
		fbq('init', '111649226022273');
		fbq('track', "PageView");

	} catch (err) {
		console.log('Facebook Track Error:', err);
	}
</script>

<noscript>
	<img height="1" width="1" style="display: none"
		src="https://www.facebook.com/tr?id=111649226022273&amp;ev=PageView&amp;noscript=1" />
</noscript>
</html>
