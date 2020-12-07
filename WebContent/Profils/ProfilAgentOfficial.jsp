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
<!-- Favicons -->
<link rel="apple-touch-icon" href="assetss/img/oeil.png">
<link rel="icon" href="assetss/img/oeil.png">
<title><c:if test="${sessionScope.lang == 'en'}"> Profil </c:if>
	<c:if test="${sessionScope.lang == 'ar'}">الملف الشخصي </c:if> <c:if
		test="${sessionScope.lang == 'fr'}"> Profile</c:if> ${agent.getNom()}</title>
<link rel="stylesheet" type="text/css" href="icon/logo.css" />
<link rel="stylesheet"
	href="../../../../maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="assetss/css/material-dashboard.min28b5.css?v=2.0.0">
<link href="assetss/assets-for-demo/demo.css" rel="stylesheet" />
</head>
<body <c:if test="${sessionScope.lang == 'ar'}">class="rtl"</c:if>>
	<c:import url="../Navs/NavAgent.jsp" />
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
					<a class="navbar-brand" href="#pablo">Profil de l'agent </a>
				</div>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navigation" aria-controls="navigation-index"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="sr-only">Toggle navigation</span> <span
						class="navbar-toggler-icon icon-bar"></span> <span
						class="navbar-toggler-icon icon-bar"></span> <span
						class="navbar-toggler-icon icon-bar"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-end"
					id="navigation"></div>
			</div>
		</nav>
		<!-- End Navbar -->
		<div class="content">
			<div class="container-fluid">
				<div class="">
					<div class="container">
						<div class="col-md-10 ml-auto mr-auto">
							<div class="card card-profile text-center card-hidden">
								<div class="card-header ">
									<div class="card-avatar">
										<a href="#pablo">  <c:if	test="${sessionScope.type_account == 'agent' }">
												<c:if test="${sessionScope.profil != null}">
													<img class="img" src="data:image/jpg;base64,${sessionScope.profil}">
												</c:if>												
										</c:if> 										</a>
									</div>
								</div>
								<div class="card-body ">
									<div class="form-group">
										<table id="datatables"
											class="table table-no-bordered table-hover" cellspacing="0"
											width="100%" style="width: 100%">
											<tr>
												<c:if test="${sessionScope.lang == 'en'}">
													<td align="left">ID Agent</td>
													<td align="left">${agent.getIdS()}</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">
													<td align="right">${agent.getIdS()}</td>
													<td align="right">رقم الوكيل</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">
													<td align="left">Numéro de l'agent</td>
													<td align="left">${agent.getIdS()}</td>
												</c:if>
											</tr>
											<tr>
												<c:if test="${sessionScope.lang == 'en'}">
													<td align="left">Name</td>
													<td align="left">${agent.getNom()}</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">
													<td align="right">${agent.getNom()}</td>
													<td align="right">الإ سم</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">
													<td align="left">Nom de l'agent</td>
													<td align="left">${agent.getNom()}</td>
												</c:if>
											</tr>
											<tr>
												<c:if test="${sessionScope.lang == 'en'}">
													<td align="left">Phone number</td>
													<td align="left">${agent.getNtele()}</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">
													<td align="right">${agent.getNtele()}</td>
													<td align="right">رقم الهاتف</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">
													<td align="left">Numéro de téléphone</td>
													<td align="left">${agent.getNtele()}</td>
												</c:if>
											</tr>
											<tr>
												<c:if test="${sessionScope.lang == 'en'}">
													<td align="left">Address</td>
													<td align="left">${agent.getAdresse()}</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">
													<td align="right">${agent.getAdresse()}</td>
													<td align="right">العنوان</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">
													<td align="left">Adresse</td>
													<td align="left">${agent.getAdresse()}</td>
												</c:if>
											</tr>
											<tr>
												<c:if test="${sessionScope.lang == 'en'}">
													<td align="left">City</td>
													<td align="left">${agent.getVille()}</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">
													<td align="right">${agent.getVille()}</td>
													<td align="right">المدينة</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">
													<td align="left">Ville</td>
													<td align="left">${agent.getVille()}</td>
												</c:if>
											</tr>
											<tr>
												<c:if test="${sessionScope.lang == 'en'}">
													<td align="left">Email</td>
													<td align="left">${agent.getEmail()}</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">
													<td align="right">${agent.getEmail()}</td>
													<td align="right">البريد الإلكتروني</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">
													<td align="left">Email</td>
													<td align="left">${agent.getEmail()}</td>
												</c:if>
											</tr>
											<tr>
												<c:if test="${sessionScope.lang == 'en'}">
													<td align="left">ID Supervisor</td>
													<td align="left">${agent.getIdSuperviseur()}</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">
													<td align="right">${agent.getIdSuperviseur()}</td>
													<td align="right">رقم المشرف</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">
													<td align="left">Numéro du Superviseur</td>
													<td align="left">${agent.getIdSuperviseur()}</td>
												</c:if>
											</tr>
											<tr>
												<c:if test="${sessionScope.lang == 'en'}">
													<td align="left">Country</td>
													<td align="left">${agent.getPaye()}</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">
													<td align="right">${agent.getPaye()}</td>
													<td align="right">البلد</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">
													<td align="left">Pays</td>
													<td align="left">${agent.getPaye()}</td>
												</c:if>
											</tr>
											<tr>
												<c:if test="${sessionScope.lang == 'en'}">
													<td align="left">Zone</td>
													<td align="left">${agent.getZone()}</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">
													<td align="right">${agent.getZone()}</td>
													<td align="right">المنطقة</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">
													<td align="left">Zone de l'agence</td>
													<td align="left">${agent.getZone()}</td>
												</c:if>
											</tr>
											<tr>
												<c:if test="${sessionScope.lang == 'en'}">
													<td align="left">Password</td>
													<td align="left">${agent.getPassword()}</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">
													<td align="right">${agent.getPassword()}</td>
													<td align="right">كلمة المرور</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">
													<td align="left">Mot de passe</td>
													<td align="left">${agent.getPassword()}</td>
												</c:if>
											</tr>
											</tbody>
										</table>
										<form method="get" action="Servlet">
											<button class="btn btn-rose btn-round" name="action"
												Value="updateProfileAgent" type="submit">
												<c:if test="${sessionScope.lang == 'en'}">Modify </c:if>
												<c:if test="${sessionScope.lang == 'ar'}"> تعديل  </c:if>
												<c:if test="${sessionScope.lang == 'fr'}"> Modifier les informations du compte</c:if>
											</button>
										</form>
									</div>
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
		</footer>
	</div>
	</div>
</body>
<script src="assetss/js/core/jquery.min.js"></script>
<script src="assetss/js/core/popper.min.js"></script>
<script src="assetss/js/bootstrap-material-design.min.js"></script>
<script src="assetss/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2Yno10-YTnLjjn_Vtk0V8cdcY5lC4plU"></script>
<script src="assetss/js/plugins/moment.min.js"></script>
<script src="assetss/js/plugins/bootstrap-datetimepicker.min.js"></script>
<script src="assetss/js/plugins/nouislider.min.js"></script>
<script src="assetss/js/plugins/bootstrap-selectpicker.js"></script>
<script src="assetss/js/plugins/bootstrap-tagsinput.js"></script>
<script src="assetss/js/plugins/jasny-bootstrap.min.js"></script>
<script src="assetss/assets-for-demo/js/modernizr.js"></script>
<script src="assetss/js/material-dashboard28b5.js?v=2.0.0"></script>
<script
	src="../../../../cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
<script src="assetss/js/plugins/arrive.min.js" type="text/javascript"></script>
<script src="assetss/js/plugins/jquery.validate.min.js"></script>
<script src="assetss/js/plugins/chartist.min.js"></script>
<script src="assetss/js/plugins/jquery.bootstrap-wizard.js"></script>
<script src="assetss/js/plugins/bootstrap-notify.js"></script>
<script src="assetss/js/plugins/nouislider.min.js"></script>
<script src="assetss/js/plugins/jquery.select-bootstrap.js"></script>
<script src="assetss/js/plugins/jquery.datatables.js"></script>
<script src="assetss/js/plugins/sweetalert2.js"></script>
<script src="assetss/js/plugins/jasny-bootstrap.min.js"></script>
<script src="assetss/js/plugins/fullcalendar.min.js"></script>
<script src="assetss/js/plugins/demo.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		demo.initMaterialWizard();
		demo.initDashboardPageCharts();
		demo.initCharts();
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
