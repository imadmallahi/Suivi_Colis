<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Mise à jours du profil</title>
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
	<c:import url="../Navs/NavAgent.jsp" />
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
				<a class="navbar-brand" href="#pablo">Mise à jours du compte </a>
		</div>

		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
      <span class="sr-only">Toggle navigation</span>
			<span class="navbar-toggler-icon icon-bar"></span>
			<span class="navbar-toggler-icon icon-bar"></span>
			<span class="navbar-toggler-icon icon-bar"></span>
		</button>
	    <div class="collapse navbar-collapse justify-content-end">
	    </div>
	</div>
		</nav><br><br>
		<div class="col-md-8 mr-auto ml-auto">
			<div class="wizard-container">
				<div class="card card-wizard" data-color="green" id="wizardProfile">
					<form action="Servlet" method="post">
						<div class="card-header text-center">
							<h3 class="card-title">Mettre à jours votre profil</h3>
							<h5 class="card-description">Informations</h5>
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
									href="#about" data-toggle="tab" role="tab"> Profil </a></li>
								<li class="nav-item"><a class="nav-link" href="#account"
									data-toggle="tab" role="tab"> Compte </a></li>
								<li class="nav-item"><a class="nav-link" href="#address"
									data-toggle="tab" role="tab"> Autres </a></li>
							</ul>
							<div class="card-body">
								<div class="tab-content">
									<div class="tab-pane active" id="about">
										<h5 class="info-text">Informations courante</h5>
										<div class="row justify-content-center">
											<div class="col-sm-4">
												<div class="picture-container">
													<div class="picture">
														 <c:if	test="${sessionScope.type_account == 'agent' }">
												<c:if test="${sessionScope.profil != null}">
													<img class="img" src="data:image/jpg;base64,${sessionScope.profil}">
												</c:if>												
										</c:if>  
													</div>
													<h6 class="description">Photo de profil</h6>
												</div>
											</div>
											<div class="input-group form-control-lg">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">face</i>
													</span>
												</div>
												<div class="form-group col-sm-4">
													<label for="examplenom" class="bmd-label-floating">Nom
														...</label> <input type="text" class="form-control"
														id="exampleInput1" name="nom" value="${agent.getNom() }">

												</div>
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">email</i>
													</span>
												</div>
												<div class="form-group col-sm-4">
													<label for="examplemail" class="bmd-label-floating">Email
														...</label> <input type="text" class="form-control"
														id="exampleemalil" name="email"
														value="${agent.getEmail() }">
												</div>
											</div>
											<div class="input-group form-control-lg">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">home</i>
													</span>
												</div>
												<div class="form-group col-sm-4">
													<label for="examplepays" class="bmd-label-floating">Pays
														...</label> <input type="text" class="form-control"
														id="exampleemalil" name="pays" value="${agent.getPaye()}">
												</div>
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">home</i>
													</span>
												</div>
												<div class="form-group  col-sm-4">
													<label for="exampleville" class="bmd-label-floating">Ville
														...</label> <input type="text" class="form-control"
														id="exampleemalil" name="ville"
														value="${agent.getVille() }">
												</div>
											</div>
											<div class="input-group form-control-lg">

												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">home</i>
													</span>
												</div>
												<div class="form-group col-sm-4">
													<label for="exampleadress" class="bmd-label-floating">Adresse
														...</label> <input type="text" class="form-control"
														id="exampleemalil" name="adresse"
														value="${agent.getAdresse() }">
												</div>
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">face</i>
													</span>
												</div>
												<div class="form-group  col-sm-4">
													<label for="examplezone" class="bmd-label-floating">Identifiant
														du superviseur ...</label> <input type="number"
														class="form-control" id="exampleemalil" name="superviseur"
														value="${agent.getIdSuperviseur() }" readonly="readonly">
												</div>
											</div>
										</div>
									</div>
									<div class="tab-pane" id="account">
										<h5 class="info-text">Sécurité de votre compte</h5>
										<div class="custom-control custom-checkbox form-group">
											<input type="checkbox" class="custom-control-input"
												id="updateCheckbox" name="updateCheckbox"> <label
												class="custom-control-label" value="1" for="updateCheckbox"
												onclick="displayFormPassword()">Changer Mot de passe</label>
										</div>
										<div id="update_password">
											<div class="input-group form-control-lg">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">https</i>
													</span>
												</div>
												<div class="form-group">
													<label for="exampleInput11" class="bmd-label-floating">Ancien
														mot de passe : </label> <input type="password"
														class="form-control" name="lastpassword" value="*********" />
												</div>
											</div>

											<div class="input-group form-control-lg">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">https</i>
													</span>
												</div>
												<div class="form-group">
													<label for="exampleInput11" class="bmd-label-floating">Mot
														de passe ...</label> <input type="password" class="form-control"
														id="password" name="password" value="*********" />
												</div>
											</div>
											<div class="input-group form-control-lg">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">https</i>
													</span>
												</div>
												<div class="form-group">
													<label for="exampleInput11" class="bmd-label-floating">Confirmation
														de nouveau mot de passe ...</label> <input type="password"
														class="form-control" id="passwordd" name="passwordd" />
												</div>
											</div>
										</div>
									</div>
									<div class="tab-pane" id="address">
										<div class="row justify-content-center">
											<div class="col-sm-12">
												<h5 class="info-text">Information de localisation</h5>
											</div>
											<div class="col-lg-10 mt-3">
												<div class="input-group form-control-lg">
													<div class="input-group-prepend">
														<span class="input-group-text"> <i
															class="material-icons">phone_iphone</i>
														</span>
													</div>
													<div class="form-group">
														<label for="exampleInput1" class="bmd-label-floating">Numéro
															de téléphone ...</label> <input type="text" class="form-control"
															id="exampleInput1" name="tel"
															onkeyup="verif_nombre(this);"
															value="${agent.getNtele() }">
													</div>
												</div>
												<div class="input-group form-control-lg">
													
													<div class="input-group form-control-lg">
														<div class="form-group col-sm-4">
															<input type="hidden" class="form-control" id="lat_agence"
																name="lat_agence" value="${agent.getLat_agence() }">
														</div>
														<div class="form-group col-sm-4">
															<input type="hidden" class="form-control"
																name="zone_agence" value="${agent.getZone() }">
														</div>
														<div class="form-group  col-sm-4">
														
															<input type="hidden" class="form-control" id="long_agence"
																name="long_agence" value="${agent.getLong_agence() }" >
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="card-footer">
								<div class="ml-auto">
									<input type="button"
										class="btn btn-next btn-fill btn-success btn-wd"
										name="Suivant" value="Suivant"> <input type="submit"
										class="btn btn-finish btn-fill btn-success btn-wd"
										name="action" value="updateAgent">
								</div>
								<div class="clearfix"></div>
							</div>
					</form>
				</div>
			</div>
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
	<div></div>
	</div>
</body>
<script src="assetss/js/core/jquery.min.js" type="text/javascript"></script>
<script src="assetss/js/core/popper.min.js" type="text/javascript"></script>
<script src="assetss/js/bootstrap-material-design.min.js"
	type="text/javascript"></script>
<script src="assetss/js/plugins/perfect-scrollbar.jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2Yno10-YTnLjjn_Vtk0V8cdcY5lC4plU"></script>
<script src="assetss/js/plugins/moment.min.js" type="text/javascript"></script>
<script src="assetss/js/plugins/bootstrap-datetimepicker.min.js"
	type="text/javascript"></script>
<script src="assetss/js/plugins/nouislider.min.js"
	type="text/javascript"></script>
<script src="assetss/js/plugins/bootstrap-selectpicker.js"
	type="text/javascript"></script>
<script src="assetss/js/plugins/bootstrap-tagsinput.js"
	type="text/javascript"></script>
<script src="assetss/js/plugins/jasny-bootstrap.min.js"
	type="text/javascript"></script>
<script src="assetss/assets-for-demo/js/modernizr.js"
	type="text/javascript"></script>
<script src="assetss/js/material-dashboard28b5.js?v=2.0.0"
	type="text/javascript"></script>
<script
	src="../../../../cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"
	type="text/javascript"></script>
<script src="assetss/js/plugins/arrive.min.js" type="text/javascript"></script>
<script src="assetss/js/plugins/jquery.validate.min.js"
	type="text/javascript"></script>
<script src="assetss/js/plugins/chartist.min.js" type="text/javascript"></script>
<script src="assetss/js/plugins/jquery.bootstrap-wizard.js"
	type="text/javascript"></script>
<script src="assetss/js/plugins/bootstrap-notify.js"
	type="text/javascript"></script>
<script src="assetss/js/plugins/jquery-jvectormap.js"
	type="text/javascript"></script>
<script src="assetss/js/plugins/nouislider.min.js"
	type="text/javascript"></script>
<script src="assetss/js/plugins/jquery.select-bootstrap.js"
	type="text/javascript"></script>
<script src="assetss/js/plugins/jquery.datatables.js"
	type="text/javascript"></script>
<script src="assetss/js/plugins/sweetalert2.js" type="text/javascript"></script>
<script src="assetss/js/plugins/jasny-bootstrap.min.js"
	type="text/javascript"></script>
<script src="assetss/js/plugins/fullcalendar.min.js"
	type="text/javascript"></script>
<script src="assetss/js/plugins/demo.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		demo.initMaterialWizard();
		demo.initDashboardPageCharts();
		demo.initCharts();
	});
</script>
<script>
	$('#update_password').css("display", "none");
	function displayFormPassword() {
		if (document.getElementById("updateCheckbox").checked == false) {
			$('#update_password').css("display", "inline");
			$('#update_password').css("visibility", "visible");
		} else {
			$('#update_password').css("display", "none");
			$('#update_password').css("visibility", "none");
		}
	}
</script>
<script src="assetss/assets-for-demo/js/jquery.sharrre.js"
	type="text/javascript">
	
</script>
<noscript>
	<img height="1" width="1" style="display: none"
		src="https://www.facebook.com/tr?id=111649226022273&amp;ev=PageView&amp;noscript=1"
		alt="" />
</noscript>
</html>
