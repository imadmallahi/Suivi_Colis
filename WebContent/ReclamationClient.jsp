<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="canonical"
	href="https://www.creative-tim.com/product/material-dashboard-pro" />
<link rel="stylesheet" type="text/css" href="icon/logo.css" />
<link rel="stylesheet"
	href="../../../../maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="assetss/css/material-dashboard.min28b5.css?v=2.0.0">
<link href="assetss/assets-for-demo/demo.css" rel="stylesheet" />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>

<script type="text/javascript">
	if (document.readyState === 'complete') {
		if (window.location != window.parent.location) {
			const elements = document.getElementsByClassName("iframe-extern");
			while (elemnts.lenght > 0)
				elements[0].remove();
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
<!--  style qrcode -->
<style>
#qrcode {
	width: 160px;
	height: 160px;
	margin-top: 15px;
}
</style>
<style>
#buttonNewColis {
	width: 45px;
	height: 45px;
	border-radius: 50%;
	background: #428bca;
	cursor: pointer;
	box-shadow: 0px 2px 5px #666;
	border: none;
	outline: none;
}

.plus {
	color: white;
	top: 0;
	display: block;
	bottom: 0;
	left: 0;
	right: 0;
	text-align: center;
	padding: 0;
	margin: 0;
	line-height: 45px;
	font-size: 28px;
	font-family: 'Roboto';
	font-weight: 300;
}

#buttonNewColis:hover {
	box-shadow: 0 6px 14px 0 #666;
	transform: scale(1.05);
}

.form-item-margin {
	padding-bottom: 20px;
	padding-left: 10px;
	padding-right: 10px;
	margin-right: 10px;
	border-radius: 6px;
}

.form-item-margin {
	border: 2px solid #0E7FC5;
}

legend.scheduler-border {
	width: inherit; /* Or auto */
	padding: 0 10px; /* To give a bit of padding on the left and right */
	border-bottom: none;
}

input:disabled {
	cursor: not-allowed;
	pointer-events: all!impotant;
}

/*style line */
h5 {
	color: black;
	padding: 1em 0;
	text-align: center;
	overflow: hidden;
	font-size: 20px;
	font-family: georgia;
}

h5:before, h5:after {
	content: '';
	width: 21em;
	border-bottom: gray solid;
	display: inline-block;
	vertical-align: middle;
}

h5:before {
	margin-left: -100%;
	margin-right: 3em
}

h5:after {
	margin-right: -100%;
	margin-left: 3em;
}
</style>

<title>Faire une réclamation</title>
</head>
<body <c:if test="${sessionScope.lang == 'ar'}">class="rtl"</c:if>>
	<c:if test="${sessionScope.type_account == 'agent'}">
		<c:import url="Navs/NavAgent.jsp" />
	</c:if>
	<c:if test="${sessionScope.type_account == 'client'}">
		<c:import url="Navs/NavClient.jsp" />
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
				<div class="col-md-12 mr-auto ml-auto">
					<div class="wizard-container">
						<div class="card card-wizard" data-color="green"
							id="wizardProfile">
							<br>
							<center>
								<h3 class="card-title"
									style="font-weight: bold; color: #0E944B;"><c:if test="${sessionScope.lang == 'en'}"> Make a complaint</c:if>
	<c:if test="${sessionScope.lang == 'ar'}">تقديم شكاية </c:if> 
<c:if test="${sessionScope.lang == 'fr'}">Faire une réclamation</c:if></h3>
							</center>
							<form method="post" action="Servlet"
								style="width: 70%; margin-left: 15%">
								<div class="card-body">
									<div class="tab-content">
										<div class="input-group md-form form-sm form-1 pl-0">
											<c:if test="${sessionScope.lang == 'en'}"><textarea class="form-control my-0 py-5" name="rec_client"
												placeholder="Enter your complaint in the next zone"
												aria-label="Search"></textarea> </c:if>
	<c:if test="${sessionScope.lang == 'ar'}"><textarea class="form-control my-0 py-5" name="rec_client"
												placeholder="أدخل شكواك في المنطقة التالية" style="text-align: right;"
												aria-label="Search"></textarea> </c:if> 
<c:if test="${sessionScope.lang == 'fr'}"><textarea class="form-control my-0 py-5" name="rec_client"
												placeholder="Entrer votre réclamation dans la zone suivante"
												aria-label="Search"></textarea></c:if>

											
										</div>
										<br>
										<center>
											<button type="submit" class="btn btn-success"
												title="rechercher" name="action" value="envoyer_reclamation"
												onclick="return confirm('Voulez-vous vraiment envoyer votre réclamation')">
												<c:if test="${sessionScope.lang == 'en'}">Submit complaint </c:if>
												<c:if test="${sessionScope.lang == 'ar'}">تقديم شكوى </c:if> 
												<c:if test="${sessionScope.lang == 'fr'}">Envoyer réclamation</c:if></button>
										</center>
										<br>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div>

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
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='http://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.js'></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
		<script src="assetss/js/core/jquery.min.js">
	</script>
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
	<script type="text/javascript" src="jquery.qrcode.min.js"></script>
</body>
</html>