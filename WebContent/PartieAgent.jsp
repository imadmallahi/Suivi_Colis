<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">

<title>Agent</title>

<!-- Extra details for Live View on GitHub Pages -->
<!-- Canonical SEO -->
<link rel="canonical"
	href="https://www.creative-tim.com/product/material-dashboard-pro" />

<!--     Fonts and icons     -->
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

<body class="">
	<c:import url="MenuAgent.jsp" />
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
		<!-- End Navbar -->




		<div class="content">
			<div class="container-fluid">
				<div class="">
					<div class="wizard-container">
						<div class="card card-wizard" data-color="rose" id="wizardProfile">
							<form action="servletCHU" method="post">
								<div class="card-header text-center">
									<h3 class="card-title">Nouveau Account</h3>
									<h5 class="card-description">Informations du Account</h5>
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
											href="#about" data-toggle="tab" role="tab"> Generale </a></li>
										<li class="nav-item"><a class="nav-link" href="#account"
											data-toggle="tab" role="tab"> Examen clinique </a></li>
										<li class="nav-item"><a class="nav-link" href="#address"
											data-toggle="tab" role="tab"> Diagnostic </a></li>
										<li class="nav-item"><a class="nav-link" href="#trait"
											data-toggle="tab" role="tab"> Traitement </a></li>
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
															<label for="exampleInput1" class="bmd-label-floating">IP</label>
															<input type="text" class="form-control"
																id="exampleInput1" name="ip"
																onkeyup="verif_nombre(this);">
														</div>
													</div>

													<div class="input-group form-control-lg">
														<div class="input-group-prepend"></div>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Prenom</label>
															<input type="text" class="form-control"
																id="exampleInput11" name="prenom">
														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="input-group form-control-lg">
														<div class="input-group-prepend"></div>
														<div class="form-group">
															<label for="exampleInput1" class="bmd-label-floating">CIN</label>
															<input type="text" class="form-control"
																id="exampleInput1" name="cin">
														</div>
													</div>

													<div class="input-group form-control-lg">
														<div class="input-group-prepend"></div>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Nom</label>
															<input type="text" class="form-control"
																id="exampleInput11" name="nom">
														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="input-group form-control-lg">
														<div class="input-group-prepend"></div>
														<div class="form-group">
															<label for="exampleInput1" class="bmd-label-floating">Telephone</label>
															<input type="text" class="form-control"
																id="exampleInput1" name="numTel">
														</div>
													</div>
													<div class="input-group form-control-lg">
														<div class="input-group-prepend"></div>
														<div class="form-group">

															<select class="selectpicker bmd-label-floating"
																data-size="7" data-style="select-with-transition"
																title="Couverture sociale" name="Couverture">
																<option value="RAMED">RAMED</option>
																<option value="CNOPS">CNOPS</option>
																<option value="CNSS">CNSS</option>
																<option value="Prive">Prive</option>
																<option value="Sans">Sans</option>

															</select>
														</div>
													</div>

												</div>
												<div class="col-sm-6">
													<div class="input-group form-control-lg">
														<div class="input-group-prepend"></div>
														<div class="form-group">
															<label for="exampleInput1" class="bmd-label-floating">Motif</label>
															<input type="text" class="form-control"
																id="exampleInput1" name="motif" list="bo">
															<datalist id="bo">
																<c:forEach items="${motif }" var="p">
																	<option value="${p }">
																</c:forEach>
															</datalist>

														</div>
													</div>

													<div class="input-group form-control-lg">
														<div class="input-group-prepend"></div>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Age</label>
															<input type="text" class="form-control"
																id="exampleInput11" name="age"
																onkeyup="verif_nombre(this);">
														</div>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="input-group form-control-lg">
														<div class="input-group-prepend"></div>
														<div class="form-group">
															<label for="exampleInput1" class="bmd-label-floating">Antecedents
																generaux</label> <input type="text" class="form-control"
																id="exampleInput1" name="aGeneral">
														</div>
													</div>


													<div class="form-check">

														<label for="exampleInput11" class="bmd-label-floating">Sexe
															: </label> <label class="form-check-label"> <input
															class="form-check-input" type="radio" name="sexe"
															value="Homme" checked> Homme <span class="circle">
																<span class="check"></span>
														</span>
														</label> <label class="form-check-label"> <input
															class="form-check-input" type="radio" name="sexe"
															value="Femme"> Femme <span class="circle">
																<span class="check"></span>
														</span>
														</label>
													</div>
												</div>
												<div class="col-sm-6">

													<div class="input-group form-control-lg">
														<div class="input-group-prepend"></div>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Antecedents
																ophtalmologiques </label> <input type="text"
																class="form-control" id="exampleInput11" name="aOphetol">
														</div>
													</div>

												</div>
											</div>
										</div>
										<div class="tab-pane" id="account">
											<h5 class="info-text">Examen clinique</h5>
											<table align="center" width="100%">
												<tr>
													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																droit</label> <input type="text" class="form-control"
																id="exampleInput1" name="avscd">

														</div>
													</td>
													<td align="center">
														<div class="form-group">
															</br> <label for="exampleInput11" class="bmd-label-floating"
																style="color: black;"><h5 class="text-info">
																	Acuite visuelle(sans correction)</h5> </label>
														</div>
													</td>
													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																gauche</label> <input type="text" class="form-control"
																id="exampleInput1" name="avscg">

														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																droit</label> <input type="text" class="form-control"
																id="exampleInput1" name="avsacd">

														</div>
													</td>
													<td align="center">
														<div class="form-group">
															</br> <label for="exampleInput11" class="bmd-label-floating"><h5
																	class="text-info">
																	Acuite visuelle (avec correction)
																	<h5></label>


														</div>
													</td>

													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																gauche</label> <input type="text" class="form-control"
																id="exampleInput1" name="avsacg">

														</div>
													</td>
												</tr>

												<tr>
													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																droit</label> <input type="text" class="form-control"
																id="exampleInput1" name="refrad">

														</div>
													</td>
													<td align="center">
														<div class="form-group ">
															</br> <label for="exampleInput11" class="bmd-label-floating"><h5
																	class="text-info">
																	Refraction
																	<h5></label>


														</div>
													</td>

													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																gauche</label> <input type="text" class="form-control"
																id="exampleInput1" name="refrag">

														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																droit</label> <input type="text" class="form-control"
																id="exampleInput1" name="kerad">

														</div>
													</td>
													<td align="center">
														<div class="form-group">
															</br> <label for="exampleInput11" class="bmd-label-floating"><h5
																	class="text-info">Keratometrie</h5></label>


														</div>
													</td>

													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																gauche</label> <input type="text" class="form-control"
																id="exampleInput1" name="kerag">

														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																droit</label> <input type="text" class="form-control"
																id="exampleInput1" name="annexesd">

														</div>
													</td>
													<td align="center">
														<div class="form-group">
															</br> <label for="exampleInput11" class="bmd-label-floating"><h5
																	class="text-info">Annexes</h5></label>


														</div>
													</td>

													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																gauche</label> <input type="text" class="form-control"
																id="exampleInput1" name="annexesg">

														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																droit</label> <input type="text" class="form-control"
																id="exampleInput1" name="conjond">

														</div>
													</td>
													<td align="center">
														<div class="form-group">
															</br> <label for="exampleInput11" class="bmd-label-floating"><h5
																	class="text-info">Conjonctive</h5></label>


														</div>
													</td>

													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																gauche</label> <input type="text" class="form-control"
																id="exampleInput1" name="conjong">

														</div>
													</td>
												</tr>

												<tr>
													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																droit</label> <input type="text" class="form-control"
																id="exampleInput1" name="corneed">

														</div>
													</td>
													<td align="center">
														<div class="form-group">
															</br> <label for="exampleInput11" class="bmd-label-floating"><h5
																	class="text-info">Cornee</h5></label>


														</div>
													</td>

													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																gauche</label> <input type="text" class="form-control"
																id="exampleInput1" name="corneeg">

														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																droit</label> <input type="text" class="form-control"
																id="exampleInput1" name="chambread">

														</div>
													</td>
													<td align="center">
														<div class="form-group">
															</br> <label for="exampleInput11" class="bmd-label-floating"><h5
																	class="text-info">Chambre Anterieure</h5></label>


														</div>
													</td>

													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																gauche</label> <input type="text" class="form-control"
																id="exampleInput1" name="chambreag">

														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																droit</label> <input type="text" class="form-control"
																id="exampleInput1" name="reflexd">

														</div>
													</td>
													<td align="center">
														<div class="form-group">
															</br> <label for="exampleInput11" class="bmd-label-floating"><h5
																	class="text-info">Reflexe photomoteur</h5></label>


														</div>
													</td>

													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																gauche</label> <input type="text" class="form-control"
																id="exampleInput1" name="reflexg">

														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																droit</label> <input type="text" class="form-control"
																id="exampleInput1" name="cristad">

														</div>
													</td>
													<td align="center">
														<div class="form-group">
															</br> <label for="exampleInput11" class="bmd-label-floating"><h5
																	class="text-info">Cristallin</h5></label>


														</div>
													</td>

													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																gauche</label> <input type="text" class="form-control"
																id="exampleInput1" name="cristag">

														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																droit</label> <input type="text" class="form-control"
																id="exampleInput1" name="tod">

														</div>
													</td>
													<td align="center">
														<div class="form-group">
															</br> <label for="exampleInput11" class="bmd-label-floating"><h5
																	class="text-info">Tonus oculaire</h5></label>


														</div>
													</td>

													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																gauche</label> <input type="text" class="form-control"
																id="exampleInput1" name="tog">

														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																droit</label> <input type="text" class="form-control"
																id="exampleInput1" name="tocd">

														</div>
													</td>
													<td align="center">
														<div class="form-group">
															</br> <label for="exampleInput11" class="bmd-label-floating"><h5
																	class="text-info">Tonus oculaire corrige</h5> </label>


														</div>
													</td>

													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																gauche</label> <input type="text" class="form-control"
																id="exampleInput1" name="tocg">

														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																droit</label> <input type="text" class="form-control"
																id="exampleInput1" name="pachyd">

														</div>
													</td>
													<td align="center">
														<div class="form-group">
															</br> <label for="exampleInput11" class="bmd-label-floating"><h5
																	class="text-info">Pachymetrie</h5></label>


														</div>
													</td>

													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																gauche</label> <input type="text" class="form-control"
																id="exampleInput1" name="pachyg">

														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																droit</label> <input type="text" class="form-control"
																id="exampleInput1" name="gonid">

														</div>
													</td>
													<td align="center">
														<div class="form-group">
															</br> <label for="exampleInput11" class="bmd-label-floating"><h5
																	class="text-info">Gonioscopie</h5></label>


														</div>
													</td>

													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																gauche</label> <input type="text" class="form-control"
																id="exampleInput1" name="gonig">

														</div>
													</td>
												</tr>
												<tr>
													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																droit</label> <input type="text" class="form-control"
																id="exampleInput1" name="fondoeild">

														</div>
													</td>
													<td align="center">
														<div class="form-group">
															</br> <label for="exampleInput11" class="bmd-label-floating"><h5
																	class="text-info">Fond d'oeil</h5> </label>


														</div>
													</td>

													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																gauche</label> <input type="text" class="form-control"
																id="exampleInput1" name="fondoeilg">

														</div>
													</td>
												</tr>
												<tr>
												<tr>
													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																droit</label> <input type="text" class="form-control"
																id="exampleInput1" name="v3md">

														</div>
													</td>
													<td align="center">
														<div class="form-group">
															</br> <label for="exampleInput11" class="bmd-label-floating"><h5
																	class="text-info">Verre à 3 Mirroires</h5></label>


														</div>
													</td>

													<td>
														<div class="form-group">
															<label for="exampleInput11" class="bmd-label-floating">Oeil
																gauche</label> <input type="text" class="form-control"
																id="exampleInput1" name="v3mg">

														</div>
													</td>

												</tr>

											</table>








										</div>
										<div class="tab-pane" id="address">
											<div class="row justify-content-center">
												<div class="col-sm-12">
													<h5 class="info-text">Diagnostic</h5>
												</div>
												<div class="col-lg-10 mt-3">
													<div class="input-group form-control-lg">

														<div class="form-group">
															<label for="exampleInput1" class="bmd-label-floating"
																style="color: black;">Insérer une diagnostic</label>
															<textarea name="ameliorer" id="ameliorer"
																class="form-control" rows="5"></textarea>
														</div>
													</div>

												</div>
											</div>
										</div>
										<div class="tab-pane" id="trait">
											<div class="row justify-content-center">
												<div class="col-sm-12">
													<h5 class="info-text">Traitement</h5>
												</div>
												<div class="col-lg-10 mt-3">
													<div class="input-group form-control-lg">

														<div class="form-group">
															<label for="exampleInput1" class="bmd-label-floating"
																style="color: black;">....</label>
															<textarea name="trait" id="trait" class="form-control"
																rows="5"></textarea>
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
											value="Validerr" style="display: none;">
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

<!--   Core JS Files   -->
<script src="assetss/js/core/jquery.min.js"></script>
<script src="assetss/js/core/popper.min.js"></script>


<script src="assetss/js/bootstrap-material-design.min.js"></script>


<script src="assetss/js/plugins/perfect-scrollbar.jquery.min.js"></script>



<!--  Google Maps Plugin  -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2Yno10-YTnLjjn_Vtk0V8cdcY5lC4plU"></script>


<!--  Plugin for Date Time Picker and Full Calendar Plugin  -->
<script src="assetss/js/plugins/moment.min.js"></script>

<!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
<script src="assetss/js/plugins/bootstrap-datetimepicker.min.js"></script>

<!--	Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="assetss/js/plugins/nouislider.min.js"></script>



<!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
<script src="assetss/js/plugins/bootstrap-selectpicker.js"></script>

<!--	Plugin for Tags, full documentation here: http://xoxco.com/projects/code/tagsinput/  -->
<script src="assetss/js/plugins/bootstrap-tagsinput.js"></script>

<!--	Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="assetss/js/plugins/jasny-bootstrap.min.js"></script>

<!-- Plugins for presentation and navigation  -->
<script src="assetss/assets-for-demo/js/modernizr.js"></script>




<!-- Material Kit Core initialisations of plugins and Bootstrap Material Design Library -->

<script src="assetss/js/material-dashboard28b5.js?v=2.0.0"></script>



<!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
<script
	src="../../../../cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>

<!-- Library for adding dinamically elements -->
<script src="assetss/js/plugins/arrive.min.js" type="text/javascript"></script>

<!-- Forms Validations Plugin -->
<script src="assetss/js/plugins/jquery.validate.min.js"></script>

<!--  Charts Plugin, full documentation here: https://gionkunz.github.io/chartist-js/ -->
<script src="assetss/js/plugins/chartist.min.js"></script>

<!--  Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
<script src="assetss/js/plugins/jquery.bootstrap-wizard.js"></script>

<!--  Notifications Plugin, full documentation here: http://bootstrap-notify.remabledesigns.com/    -->
<script src="assetss/js/plugins/bootstrap-notify.js"></script>

<!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
<script src="assetss/js/plugins/jquery-jvectormap.js"></script>

<!-- Sliders Plugin, full documentation here: https://refreshless.com/nouislider/ -->
<script src="assetss/js/plugins/nouislider.min.js"></script>

<!--  Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
<script src="assetss/js/plugins/jquery.select-bootstrap.js"></script>

<!--  DataTables.net Plugin, full documentation here: https://datatables.net/    -->
<script src="assetss/js/plugins/jquery.datatables.js"></script>

<!-- Sweet Alert 2 plugin, full documentation here: https://limonte.github.io/sweetalert2/ -->
<script src="assetss/js/plugins/sweetalert2.js"></script>

<!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="assetss/js/plugins/jasny-bootstrap.min.js"></script>

<!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
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

<noscript>
	<img height="1" width="1" style="display: none"
		src="https://www.facebook.com/tr?id=111649226022273&amp;ev=PageView&amp;noscript=1" />
</noscript>



<!-- Mirrored from demos.creative-tim.com/material-dashboard-pro/examples/forms/wizard.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 20 Mar 2018 16:01:03 GMT -->
</html>
