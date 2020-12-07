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
<!-- Documentation extras -->
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="assetss/assets-for-demo/demo.css" rel="stylesheet" />
<!-- iframe removal -->
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

<title>Insert title here</title>
</head>
<body>
	 <c:if test="${sessionScope.type_account == 'agent'}">
    	<c:import url="Navs/NavAgent.jsp" />
    </c:if>
    <c:if test="${sessionScope.type_account == 'superviseur'}">
    	<c:import url="Navs/NavSuperviseur.jsp" />
    </c:if>
    <c:if test="${sessionScope.type_account == 'distributeur'}">
    	<c:import url="Navs/NavDistributeur.jsp" />
    </c:if>
    <c:if test="${sessionScope.type_account == 'client'}">
    	<c:import url="Navs/NavClient.jsp" />
    </c:if>
	<div class="main-panel">
		<!-- Navbar -->
		<nav class="navbar navbar-expand-lg navbar-transparent  navbar-absolute fixed-top">
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
					<!--      Wizard2 container        -->
					<div class="wizard-container">
						<div class="card card-wizard" data-color="green" id="wizardProfile">
							<form  method="post" action="Servlet">
								<div class="card-header text-center">
									<h3 class="card-title">Mettre à jours la commande courante</h3>
									<h6 class="card-description">Commande</h6>
									<c:if test="${!empty erreur}">
										<div>
											<h4>
												<p style="color: red">${erreur}</p>
												<h5></h5>
											</h4>
										</div>
									</c:if>
								</div>
								<div class="wizard-navigation">
									<ul class="nav nav-pills">
										<li class="nav-item"><a class="nav-link active"
											href="#about" data-toggle="tab" role="tab"> Informations de la commande </a></li>
									</ul>
								</div>
								<div class="card-body">
									<div class="tab-content">
										<div class="tab-pane active" id="about">
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="point_depart_commande" class="bmd-label-floating">Point
											de départ</label> <input type="text" class="form-control"
											id="point_depart_commande" name="point_depart_commande" value="${informationCommandeWithAgentAndAdherent.getCommande().getPoint_depart_commande() }">
									</div>
									<div class="form-group col-md-6">
										<label for="zone_point_depart_commande"
											class="bmd-label-floating">Zone point de départ</label> 
											<select
											class="form-control" id="zone_point_depart_commande"
											name="zone_point_depart_commande">
											<c:forEach var="name" items="${requestScope['listeAgent']}">
											 <c:choose>
  <c:when test="${name.idS == informationCommandeWithAgentAndAdherent.getCommande().getNumAgent()}">
    <option value="${name.idS}" selected>${name.zone}</option>
  </c:when>
  <c:otherwise>
    <option value="${name.idS}">${name.zone}</option>
  </c:otherwise>
</c:choose>	
										</c:forEach>
										</select>
									</div>
								</div>				
							<input type="hidden" name="id_commande" value="${informationCommandeWithAgentAndAdherent.getCommande().getId() }">
							<input type="hidden" name="etat_commande" value="${informationCommandeWithAgentAndAdherent.getCommande().getEtat() }">
							<input type="hidden" name="emplacementCommande" value="${commande.getEmplacement() }">
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="num_adherent" class="bmd-label-floating">Numero
											adherent</label> <input type="text" class="form-control"
											id="num_adherent" name="num_adherent" value="${informationCommandeWithAgentAndAdherent.getCommande().getNumAdherent()}">
									</div>
								</div>
							<div class="form-row">
								<div class="form-group col-md-6" id="point_destination_co">
									<label for="point_destination_commande"
										class="bmd-label-floating">Point de destination</label> <input
										type="text" class="form-control"
										id="point_destination_commande"
										name="point_destination_commande" value="${informationCommandeWithAgentAndAdherent.getCommande().getPoint_destination() }">
								</div>
								
								<div class="form-group col-md-6">
									<label for="zone_point_destination_commande"
										class="bmd-label-floating">Zone point de destination</label> <select
										class="form-control" id="zone_point_destination_commande"
										name="zone_point_destination_commande">
										<c:forEach var="name" items="${requestScope['listeAgent']}">
											 <c:choose>
  <c:when test="${name.idS == informationCommandeWithAgentAndAdherent.getCommande().getIdAgentDistination()}">
    <option value="${name.idS}" selected>${name.zone}</option>
  </c:when>
  <c:otherwise>
    <option value="${name.idS}">${name.zone}</option>
  </c:otherwise>
</c:choose>	
										</c:forEach>
									</select>
								</div>					
							</div>
							<p>Partie Colis</p>
							<fieldset class="form-item-margin"
								id="favorite-movie-optionstest"
								style="border-radius: 12px; padding-left: 20px;">
								<legend class="scheduler-border">Donnees colis :</legend>
								<c:forEach var="colis" items="${requestScope['listeColis']}">
								<div id="formularColis1"> 
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="natureColis" class="bmd-label-floating">Nature</label>
											<select class="form-control" id=""
												name="nature_colis[]">
												<option disabled  value="null">Selectionner
													la nature du colis</option>
													<c:if test="${colis.nature == 'Argent' }">
												<option value="Argent" selected>Argent</option>
												<option value="Colis" >Colis</option>
												</c:if>
												<c:if test="${colis.nature == 'Colis' }">
												<option value="Argent">Argent</option>
												<option value="Colis" selected>Colis</option>
												</c:if>
											</select>
										</div>
										<div class="form-group col-md-6" id="poidsormontant">
											<label for="inputPassword4" class="bmd-label-floating"><span
												id=""></span></label> <input type="text"
												class="form-control" name="poids_colis[]" id="poidscolis" value="${colis.poids }">
										</div>
									</div>
									<input type="hidden" value="${colis.id}" name="id_colis[]">
									<h5>et</h5>
								</div>
								</c:forEach>
							</fieldset>
							<br><br>
							<div class="form-row">
													<div class="form-group col-md-6">
														<label for="nom_prenom_destinataire" class="bmd-label-floating">Nom et prenom destinataire</label> 
														<input type="text" class="form-control" id="nom_prenom_destinataire" name="nom_prenom_destinataire" value="${informationCommandeWithAgentAndAdherent.getCommande().getNom_prenom_destinataire() }">
													</div>
													<div class="form-group col-md-6">
														<label for="cin_destinataire" class="bmd-label-floating">N° CIN destinataire</label> 
														<input type="text" class="form-control" id="cin_destinataire" name="cin_destinataire" value="${informationCommandeWithAgentAndAdherent.getCommande().getCin_destinataire() }">
													</div>
												</div>
												<div class="form-row">
													<div class="form-group col-md-6">
														<label for="num_tele_destinataire" class="bmd-label-floating"># téléphone destinataire</label> 
														<input type="text" class="form-control" id="num_tele_destinataire" name="num_tele_destinataire" value="${informationCommandeWithAgentAndAdherent.getCommande().getNum_telephone_destinataire() }">
													</div>
												</div>
							
							<br> <br>
							<c:if test="${sessionScope.type_account != 'client'}">
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="Montant_total" class="bmd-label-floating">Montant
											Total</label> <input type="number" class="form-control"
											id="Montant_total" name="montantCommande" value="${informationCommandeWithAgentAndAdherent.getCommande().getTotalCommande() }">
									${informationCommandeWithAgentAndAdherent.getCommande().getMonnaie_total_commande()}
									</div>
								</div>
							</c:if>
											</div>
										</div>
									</div>
								<div class="card-footer">
									<div class="ml-auto">
										<button type="submit" class="btn btn-primary" name="action"
								value="updateDataCommande">Mettre à jours Commande</button>
									</div>
									<div class="clearfix"></div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div>
		<div id="qrCodeInPagePrint" style="display: none;">
			<input id="text" type="hidden" value="https://hogangnono.com"
				style="width: 80%" /><br />
			<div id="qrcode"></div>
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
	<script>
		$nombredecolisCree = 0;
		function nouvelleColis() {
			select2 = document.getElementById("natureColis");
			choice2 = select2.selectedIndex; // Récupération de l'index du <option> choisi
			valeur_cherchee2 = select2.options[choice2].value;
			$nombredecolisCree = $nombredecolisCree + 1;
			var sessions = document.querySelector('#formularColis1');
			sessions.parentNode.appendChild(sessions.cloneNode(true));
			$('select[name="nature_colis[]"]').eq($nombredecolisCree).val(
					valeur_cherchee2);
			$('#poidsormontant').css("display", "none");
			$('select[name="nature_colis[]"]').eq(0).val("null");
		}
	</script>=
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
	<!-- Sharrre libray -->
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
	<script type="text/javascript" src="jquery.qrcode.min.js"></script>
	</body></html>