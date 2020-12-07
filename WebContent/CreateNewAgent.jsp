
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Create new agent</title>
<link rel="canonical"
	href="https://www.creative-tim.com/product/material-dashboard-pro" />
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
<script type="text/javascript">
	function verif_nombre(champ) {
		var chiffres = new RegExp("[0-9]");
		var verif;
		var points = 0;

		for (x = 0; x < champ.value.length; x++) {
			verif = chiffres.test(champ.value.charAt(x));
			if (champ.value.charAt(x) == ".") {
				points++;
			}
			if (points > 1) {
				verif = false;
				points = 1;
			}
			if (verif == false) {
				champ.value = champ.value.substr(0, x)
						+ champ.value.substr(x + 1, champ.value.length - x + 1);
				x--;
			}
		}
	}
</script>
<style type="text/css">
label.error {
	color: red !important;
	font-weight: normal !important;
}
</style>


</head>

<body <c:if test="${sessionScope.lang == 'ar'}">class="rtl"</c:if>>
	<c:import url="Navs/NavAgent.jsp" />

	<div class="main-panel">
		<nav
			class="navbar navbar-expand-lg navbar-transparent  navbar-absolute fixed-top">
			<div class="container-fluid">
				<div class="navbar-wrapper">
					<div class="navbar-minimize">
						<button id="minimizeSidebar"
							class="btn btn-just-icon btn-white btn-fab btn-round">
							<i
								class="material-icons text_align-center visible-on-sidebar-regular">code</i>
							<i
								class="material-icons design_bullet-list-67 visible-on-sidebar-mini">code</i>
						</button>
					</div>
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
		<div class="content">
			<div class="container-fluid">
				<div class="">
					<div class="wizard-container">
						<div class="card card-wizard" data-color="rose" id="wizardProfile">
							<form action="Servlet" method="post">
								<!--        You can switch " data-color="primary" "  with one of the next bright colors: "green", "orange", "red", "blue"       -->

								<div class="card-header text-center">
									<h3 class="card-title">Nouveau Agent</h3>
									<h5 class="card-description">Informations de l'agent</h5>
									<c:if test="${!empty erreur}">
										<div>
											<h4>
												<p style="color: red">${erreur}
												<h5>
											</h4>
										</div>
									</c:if>
								</div>
								<div class="wizard-navigation">
									<ul class="nav nav-pills">
										<li class="nav-item"><a class="nav-link active"
											href="#forularAgent" data-toggle="tab" role="tab">
												remplir le formulaire suivant pour cree le nouveau agent </a></li>
									</ul>
								</div>
								<div class="card-body">
									<div class="tab-content">
										<div class="tab-pane active" id="about">
											<div class="row justify-content-center">
												<div class="col-sm-6">
													<div class="input-group form-control-lg">
														<div class="input-group-prepend"></div>
														<div class="form-group">
															<label for="exampleInput1" class="bmd-label-floating">Nom</label>
															<input type="text" class="form-control"
																id="exampleInput1" name="name_agent">
														</div>
													</div>

													<div class="input-group form-control-lg">
														<div class="input-group-prepend"></div>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Adresse
																agent</label> <input type="text" class="form-control"
																id="exampleInput11" name="adresse_agent">
														</div>
													</div>
													<div class="input-group form-control-lg">
														<div class="input-group-prepend"></div>
														<div class="form-group">
															<label for="exampleInput1" class="bmd-label-floating">date
																inscription</label> <input type="date" class="form-control"
																id="exampleInput1" name="date_inscription_agent">
														</div>
													</div>
													<div class="input-group form-control-lg">

														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Mot
																de passe ...</label> <input type="password" class="form-control"
																id="password" name="password" />
														</div>
													</div>
													<div class="input-group form-control-lg">

														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Confirmation
																de mot de passe ...</label> <input type="password"
																class="form-control" id="passwordd" name="passwordd" />
														</div>
													</div>
												</div>
												<div class="col-sm-6">


													<div class="input-group form-control-lg">
														<div class="input-group-prepend"></div>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Ville</label>
															<input type="text" class="form-control"
																id="exampleInput11" name="ville_agent">
														</div>
													</div>
													<div class="input-group form-control-lg">
														<div class="input-group-prepend"></div>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Pays</label>
															<input type="text" class="form-control"
																id="exampleInput11" name="pays_agent">
														</div>
													</div>
													<div class="input-group form-control-lg">
														<div class="input-group-prepend"></div>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">N°
																Téléphone</label> <input type="text" class="form-control"
																id="exampleInput11" name="num_tele_agent">
														</div>
													</div>
													<div class="input-group form-control-lg">
														<div class="input-group-prepend"></div>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Zone</label>
															<input type="text" class="form-control"
																id="exampleInput11" name="zone_agent">
														</div>
													</div>
													<div class="input-group form-control-lg">
														<div class="input-group-prepend"></div>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Email</label>
															<input type="text" class="form-control"
																id="exampleInput11" name="email_agent">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="card-footer">


									<div class="mr-auto">
										<input type="button"
											class="btn btn-previous btn-fill btn-default btn-wd disabled"
											name="previous" value="Precedent">
									</div>
									<div class="ml-auto">
										<input type="button"
											class="btn btn-next btn-fill btn-rose btn-wd" name="next"
											value="Suivant"> <input type="submit"
											class="btn btn-finish btn-fill btn-rose btn-wd" name="action"
											value="addNewAgent" style="display: none;">
									</div>
									<div class="clearfix"></div>
								</div>

							</form>
						</div>
					</div>
					<!-- wizard container -->
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
<script src="assetss/js/plugins/jquery-jvectormap.js"></script>
<script src="assetss/js/plugins/nouislider.min.js"></script>
<script src="assetss/js/plugins/jquery.select-bootstrap.js"></script>
<script src="assetss/js/plugins/jquery.datatables.js"></script>
<script src="assetss/js/plugins/sweetalert2.js"></script>
<script src="assetss/js/plugins/jasny-bootstrap.min.js"></script>
<script src="assetss/js/plugins/fullcalendar.min.js"></script>

<!-- demo init -->
<script src="assetss/js/plugins/demo.js"></script>





















<script type="text/javascript">
	$(document).ready(function() {

		//init wizard

		demo.initMaterialWizard();

		// Javascript method's body can be found in assets/js/demos.js
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



<!-- Mirrored from demos.creative-tim.com/material-dashboard-pro/examples/forms/wizard.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 20 Mar 2018 16:01:03 GMT -->
</html>
