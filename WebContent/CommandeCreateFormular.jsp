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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
		<c:if test="${sessionScope.lang == 'en'}">
			<div class="content">
				<div class="container-fluid">
					<div class="col-md-12 mr-auto ml-auto">
						<div class="wizard-container">
							<div class="card card-wizard" data-color="green"
								id="wizardProfile">
								<form method="post" action="Servlet">
									<div class="card-header text-center">
										<h3 class="card-title">Add a new command</h3>
										<h6 class="card-description">Command</h6>
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
												href="#about" data-toggle="tab" role="tab"> Command
													informations </a></li>
										</ul>
									</div>
									<div class="card-body">
										<div class="tab-content">
											<div class="tab-pane active" id="about">
												<c:if test="${sessionScope.type_account == 'client'}">
													<div class="form-row">
														<div class="form-group col-md-6">
															<label for="point_depart_commande"
																class="bmd-label-floating">Starting point</label> <input
																type="text" class="form-control"
																id="point_depart_commande" name="point_depart_commande"
																required="required">
														</div>

														<div class="form-group col-md-6">
															<label for="zone_point_depart_commande"
																class="bmd-label-floating">Zone starting point</label> <select
																class="form-control selectpicker"
																id="zone_point_depart_commande" data-size="7"
																data-style="select-with-transition"
																title="Single Select" name="zone_point_depart_commande">
																<c:forEach var="name"
																	items="${requestScope['listeAgent']}">
																	<option value="${name.idS}">${name.zone}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</c:if>
												<c:if test="${sessionScope.type_account == 'agent'}">
													<div class="form-row">
														<div class="form-group col-md-6">
															<label for="num_adherent" class="bmd-label-floating">Membership
																number</label> <select id="num_adherent" name="num_adherent"
																class="form-control selectpicker" data-size="7"
																data-style="select-with-transition"
																title="Single Select" name="zone_point_depart_commande">
																<c:forEach var="name" items="${listeCodeClient}">
																	<option value="${name.getIdC()}">${name.getIdC()}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</c:if>
												<div class="form-row">
													<div class="form-group col-md-6">
														<label for="type_point_dest" class="bmd-label-floating">Type
															of the point of destination</label> <select class="form-control"
															id="type_point_dest" name="type_point_destination">
															<option disabled selected>Select the type of the
																point of arrival</option>
															<option value="maison">House</option>
															<option value="agence">Agency</option>
														</select>
													</div>
												</div>
												<div class="form-row">
													<div class="form-group col-md-6">
														<label for="zone_point_destination_commande"
															class="bmd-label-floating">Destination point area</label>
														<select class="form-control selectpicker" data-size="7"
															data-style="select-with-transition"
															id="zone_point_destination_commande"
															name="zone_point_destination_commande">
															<c:forEach var="name"
																items="${requestScope['listeAgent']}">
																<option value="${name.idS}">${name.adresse}</option>
															</c:forEach>
														</select>
													</div>
													<div class="form-group col-md-6" id="point_destination_co">
														<label for="point_destination_commande"
															class="bmd-label-floating">Address of the point
															of destination</label> <input type="text" class="form-control"
															id="point_destination_commande"
															name="point_destination_commande" required="required">
													</div>
												</div>
												<br />
												<h5>Information about the packages of the command</h5>
												<fieldset class="form-item-margin"
													id="favorite-movie-optionstest"
													style="border-radius: 12px; padding-left: 20px;">
													<legend class="scheduler-border">Parcel list :</legend>
													<div id="formularColis1">
														<div class="form-row">
															<div class="form-group col-md-6">
																<label for="natureColis" class="bmd-label-floating">Nature</label>
																<select class="form-control" id="natureColis"
																	name="nature_colis[]">
																	<option disabled selected value="null">Select
																		the nature of the package</option>
																	<option value="Argent">Money</option>
																	<option value="Colis">Parcel</option>
																</select>
															</div>
															<div class="form-group col-md-6" id="poidsormontant">
																<label for="inputPassword4" class="bmd-label-floating"><span
																	id="name_poid_or_argent"></span></label> <input type="text"
																	class="form-control" name="poids_colis[]"
																	id="poidscolis">
															</div>
														</div>

														<div name="buttonNewColis[]" id="buttonplus">
															<center>
																<button id="buttonNewColis" name="ajouterSession[]"
																	type="button" onclick="nouvelleColis();">
																	<p class="plus">+</p>
																</button>
															</center>
														</div>
														<hr style="width: 50%;" solid></hr>
													</div>
												</fieldset>
												<br> <br>
												<c:if test="${sessionScope.type_account != 'client'}">
													<div class="form-row">
														<div class="form-group col-md-6">
															<label for="Montant_total" class="bmd-label-floating">Total
																amount of the command </label> <input type="number"
																class="form-control" id="Montant_total"
																name="montantCommande" required>
														</div>
														<div class="form-group col-md-6">
															<label for="monnaie_total_commande"
																class="bmd-label-floating"> The currency of the
																total to pay</label> <select name="monnaie_total_commande"
																id="monnaie_total_commande" class="form-control selectpicker" data-size="7"
																data-style="select-with-transition">
																<option value="Turkish lira">Turkish lira</option>
																<option value="Syrian lira">Syrian lira</option>
																<option value="Dollar">Dollar</option>
																<option value="Euro">Euro</option>
															</select>
														</div>
													</div>
												</c:if>
												<h5>Recipient Information</h5>
												<div class="form-row">
													<div class="form-group col-md-6">
														<label for="nom_prenom_destinataire"
															class="bmd-label-floating">Name of the recipient</label>
														<input type="text" class="form-control"
															id="nom_prenom_destinataire"
															name="nom_prenom_destinataire" required>
													</div>
													<div class="form-group col-md-6">
														<label for="cin_destinataire" class="bmd-label-floating">N°
															CIN of the recipient</label> <input type="text"
															class="form-control" id="cin_destinataire"
															name="cin_destinataire" required>
													</div>
												</div>
												<div class="form-row">
													<div class="form-group col-md-6">
														<label for="num_tele_destinataire"
															class="bmd-label-floating"># Number phone of the
															recipient</label> <input type="text" class="form-control"
															id="num_tele_destinataire" name="num_tele_destinataire"
															required>
													</div>
												</div>
												<center>
													<button type="button" class="btn btn-success"
														onclick="printRecu()">Print the receipt</button>
												</center>
											</div>
										</div>
									</div>
									<div class="card-footer">
										<div class="ml-auto">
											<button type="submit" class="btn btn-primary" name="action"
												value="saveCommandeClient"
												onclick="return verificationCommande();">Save the
												Command</button>
										</div>
										<div class="clearfix"></div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

		</c:if>
		<c:if test="${sessionScope.lang == 'ar'}">
			<div class="content">
				<div class="container-fluid">
					<div class="col-md-12 mr-auto ml-auto">
						<div class="wizard-container">
							<div class="card card-wizard" data-color="green"
								id="wizardProfile">
								<form method="post" action="Servlet">
									<div class="card-header text-center">
										<h3 class="card-title">أضف طلب جديد</h3>
										<h6 class="card-description">طلب</h6>
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
												href="#about" data-toggle="tab" role="tab"> معلومات
													الطلب </a></li>
										</ul>
									</div>
									<div class="card-body">
										<div class="tab-content">
											<div class="tab-pane active" id="about">
												<c:if test="${sessionScope.type_account == 'client'}">
													<div class="form-row">
														<div class="form-group col-md-6">
															<label for="point_depart_commande"
																class="bmd-label-floating" style="float: right;">نقطة
																البداية</label> <input type="text" class="form-control"
																id="point_depart_commande" name="point_depart_commande"
																required="required">
														</div>
														<div class="form-group col-md-6">
															<label for="zone_point_depart_commande"
																class="bmd-label-floating"> منطقة نقطة انطلاق </label> <select
																class="form-control selectpicker"
																id="zone_point_depart_commande" data-size="7"
																data-style="select-with-transition"
																title="Single Select" name="zone_point_depart_commande">
																<c:forEach var="name"
																	items="${requestScope['listeAgent']}">
																	<option value="${name.idS}">${name.zone}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</c:if>
												<c:if test="${sessionScope.type_account == 'agent'}">
													<div class="form-row">
														<div class="form-group col-md-6">
															<label for="num_adherent" class="bmd-label-floating">رقم
																العضوية</label> <select id="num_adherent" name="num_adherent"
																class="form-control selectpicker" data-size="7"
																data-style="select-with-transition"
																title="Single Select" name="zone_point_depart_commande">
																<c:forEach var="name" items="${listeCodeClient}">
																	<option value="${name.getIdC()}">${name.getIdC()}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</c:if>
												<div class="form-row">
													<div class="form-group col-md-6">
														<label for="type_point_dest" class="bmd-label-floating">نوع
															نقطة الوجهة</label> <select class="form-control"
															id="type_point_dest" name="type_point_destination">
															<option disabled selected>حدد نوع نقطة الوصول</option>
															<option value="maison">المنزل</option>
															<option value="agence">الوكالة</option>
														</select>
													</div>
												</div>
												<div class="form-row">
													<div class="form-group col-md-6">
														<label for="zone_point_destination_commande"
															class="bmd-label-floating">منطقة نقطة الوجهة</label> <select
															class="form-control" id="zone_point_destination_commande"
															name="zone_point_destination_commande">
															<c:forEach var="name"
																items="${requestScope['listeAgent']}">
																<option value="${name.idS}">${name.adresse}</option>
															</c:forEach>
														</select>
													</div>
													<div class="form-group col-md-6" id="point_destination_co">
														<label for="point_destination_commande"
															class="bmd-label-floating">عنوان نقطة الوجهة </label> <input
															type="text" class="form-control"
															id="point_destination_commande"
															name="point_destination_commande" required="required">
													</div>
												</div>
												<br />
												<h5>معلومات حول حزم الطلب</h5>
												<fieldset class="form-item-margin"
													id="favorite-movie-optionstest"
													style="border-radius: 12px; padding-left: 20px;">
													<legend class="scheduler-border">قائمة الطرود</legend>
													<div id="formularColis1">
														<div class="form-row">
															<div class="form-group col-md-6">
																<label for="natureColis" class="bmd-label-floating">الطبيعة</label>
																<select class="form-control" id="natureColis"
																	name="nature_colis[]">
																	<option disabled selected value="null">حدد
																		طبيعة الحزمة</option>
																	<option value="Argent">نقود</option>
																	<option value="Colis">الطرود</option>
																</select>
															</div>
															<div class="form-group col-md-6" id="poidsormontant">
																<label for="inputPassword4" class="bmd-label-floating"><span
																	id="name_poid_or_argent"></span></label> <input type="text"
																	class="form-control" name="poids_colis[]"
																	id="poidscolis">
															</div>
														</div>

														<div name="buttonNewColis[]" id="buttonplus">
															<center>
																<button id="buttonNewColis" name="ajouterSession[]"
																	type="button" onclick="nouvelleColis();">
																	<p class="plus">+</p>
																</button>
															</center>
														</div>
														<hr style="width: 50%;" solid></hr>
													</div>
												</fieldset>
												<br> <br>
												<c:if test="${sessionScope.type_account != 'client'}">
													<div class="form-row">
														<div class="form-group col-md-6">
															<label for="Montant_total" class="bmd-label-floating">المبلغ
																الإجمالي للطلب </label> <input type="number"
																class="form-control" id="Montant_total"
																name="montantCommande">
														</div>
														<div class="form-group col-md-6">
															<label for="monnaie_total_commande"
																class="bmd-label-floating"> عملة المجموع للدفعr</label>
															<select name="monnaie_total_commande"
																id="monnaie_total_commande" class="form-control selectpicker" data-size="7"
																data-style="select-with-transition">
																<option value="Livre turque">لیرة تركیة</option>
																<option value="Livre syrienne">لیرة سوریة</option>
																<option value="Dollar">دولار</option>
																<option value="Euro">اورو</option>
															</select>
														</div>
													</div>
												</c:if>
												<h5>معلومات المستلم</h5>
												<div class="form-row">
													<div class="form-group col-md-6">
														<label for="nom_prenom_destinataire"
															class="bmd-label-floating">اسم المستلم</label> <input
															type="text" class="form-control"
															id="nom_prenom_destinataire"
															name="nom_prenom_destinataire">
													</div>
													<div class="form-group col-md-6">
														<label for="cin_destinataire" class="bmd-label-floating">رقم
															CIN</label> <input type="text" class="form-control"
															id="cin_destinataire" name="cin_destinataire">
													</div>
												</div>
												<div class="form-row">
													<div class="form-group col-md-6">
														<label for="num_tele_destinataire"
															class="bmd-label-floating"># هاتف المستلم</label> <input
															type="text" class="form-control"
															id="num_tele_destinataire" name="num_tele_destinataire">
													</div>
												</div>
												<center>
													<button type="button" class="btn btn-success"
														onclick="printRecu()">تلقى الطباعة</button>
												</center>
											</div>
										</div>
									</div>
									<div class="card-footer">
										<div class="ml-auto">
											<button type="submit" class="btn btn-primary" name="action"
												value="saveCommandeClient">سجل الطلب</button>
										</div>
										<div class="clearfix"></div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${sessionScope.lang == 'fr'}">
			<div class="content">
				<div class="container-fluid">
					<div class="col-md-12 mr-auto ml-auto">
						<div class="wizard-container">
							<div class="card card-wizard" data-color="green"
								id="wizardProfile">
								<form method="post" action="Servlet">
									<div class="card-header text-center">
										<h3 class="card-title">Ajouter une nouvelle commande</h3>
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
												href="#about" data-toggle="tab" role="tab"> Informations
													sur la commande </a></li>
										</ul>
									</div>
									<div class="card-body">
										<div class="tab-content">
											<div class="tab-pane active" id="about">
												<c:if test="${sessionScope.type_account == 'client'}">
													<div class="form-row">
														<div class="form-group col-md-6">
															<label for="point_depart_commande"
																class="bmd-label-floating">Point de départ</label> <input
																type="text" class="form-control"
																id="point_depart_commande" name="point_depart_commande"
																required="required">
														</div>
														<div class="form-group col-md-6">
															<label for="zone_point_depart_commande"
																class="bmd-label-floating">Zone point de départ</label>
															<select class="form-control selectpicker"
																id="zone_point_depart_commande" data-size="7"
																data-style="select-with-transition"
																title="Single Select" name="zone_point_depart_commande">
																<c:forEach var="name"
																	items="${requestScope['listeAgent']}">
																	<option value="${name.idS}">${name.zone}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</c:if>
												<c:if test="${sessionScope.type_account == 'agent'}">
													<div class="form-row">
														<div class="form-group col-md-6">
															<label for="num_adherent" class="bmd-label-floating">Numéro
																adhérent</label> <select id="num_adherent" name="num_adherent"
																class="form-control selectpicker" data-size="7"
																data-style="select-with-transition"
																title="Single Select" name="zone_point_depart_commande">
																<c:forEach var="name" items="${listeCodeClient}">
																	<option value="${name.getIdC()}">${name.getIdC()}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</c:if>
												<div class="form-row">
													<div class="form-group col-md-6">
														<label for="type_point_dest" class="bmd-label-floating">Type
															du point de destination</label> <select class="form-control"
															id="type_point_dest" name="type_point_destination">
															<option disabled selected>Selectionner le type
																du point d'arrivée</option>
															<option value="maison">Maison</option>
															<option value="agence">Agence</option>
														</select>
													</div>
												</div>
												<div class="form-row">
													<div class="form-group col-md-6">
														<label for="zone_point_destination_commande"
															class="bmd-label-floating">Zone du point de
															destination</label> <select class="form-control"
															id="zone_point_destination_commande"
															name="zone_point_destination_commande">
															<c:forEach var="name"
																items="${requestScope['listeAgent']}">
																<option value="${name.idS}">${name.adresse}</option>
															</c:forEach>
														</select>
													</div>
													<div class="form-group col-md-6" id="point_destination_co">
														<label for="point_destination_commande"
															class="bmd-label-floating">Adresse du point de
															destination</label> <input type="text" class="form-control"
															id="point_destination_commande"
															name="point_destination_commande" required="required">
													</div>
												</div>
												<br />
												<h5>Informations sur les colis de la commande</h5>
												<fieldset class="form-item-margin"
													id="favorite-movie-optionstest"
													style="border-radius: 12px; padding-left: 20px;">
													<legend class="scheduler-border">Liste des colis :</legend>
													<div id="formularColis1">
														<div class="form-row">
															<div class="form-group col-md-6">
																<label for="natureColis" class="bmd-label-floating">Nature</label>
																<select class="form-control" id="natureColis"
																	name="nature_colis[]">
																	<option disabled selected value="null">Selectionner
																		la nature du colis</option>
																	<option value="Argent">Argent</option>
																	<option value="Colis">Colis</option>
																</select>
															</div>
															<div class="form-group col-md-6" id="poidsormontant">
																<label for="inputPassword4" class="bmd-label-floating"><span
																	id="name_poid_or_argent"></span></label> <input type="text"
																	class="form-control" name="poids_colis[]"
																	id="poidscolis">
															</div>
														</div>

														<div name="buttonNewColis[]" id="buttonplus">
															<center>
																<button id="buttonNewColis" name="ajouterSession[]"
																	type="button" onclick="nouvelleColis();">
																	<p class="plus">+</p>
																</button>
															</center>
														</div>
														<hr style="width: 50%;" solid></hr>
													</div>
												</fieldset>
												<br> <br>
												<c:if test="${sessionScope.type_account != 'client'}">
													<div class="form-row">
														<div class="form-group col-md-6">
															<label for="Montant_total" class="bmd-label-floating">Montant
																total de la commande</label> <input type="number"
																class="form-control" id="Montant_total"
																name="montantCommande">
														</div>
														<div class="form-group col-md-6">
															<label for="monnaie_total_commande"
																class="bmd-label-floating"> La monnaie du total
																à payer</label> <select name="monnaie_total_commande"
																id="monnaie_total_commande" class="form-control selectpicker" data-size="7"
																data-style="select-with-transition">
																<option value="Livre turque">Livre turque</option>
																<option value="Livre syrienne">Livre syrienne</option>
																<option value="Dollar">Dollar</option>
																<option value="Euro">Euro</option>
															</select>
														</div>
													</div>
												</c:if>
												<h5>Information destinataire</h5>
												<div class="form-row">
													<div class="form-group col-md-6">
														<label for="nom_prenom_destinataire"
															class="bmd-label-floating">Nom et prenom
															destinataire</label> <input type="text" class="form-control"
															id="nom_prenom_destinataire"
															name="nom_prenom_destinataire">
													</div>
													<div class="form-group col-md-6">
														<label for="cin_destinataire" class="bmd-label-floating">N°
															CIN destinataire</label> <input type="text" class="form-control"
															id="cin_destinataire" name="cin_destinataire">
													</div>
												</div>
												<div class="form-row">
													<div class="form-group col-md-6">
														<label for="num_tele_destinataire"
															class="bmd-label-floating"># téléphone
															destinataire</label> <input type="text" class="form-control"
															id="num_tele_destinataire" name="num_tele_destinataire">
													</div>
												</div>
												<center>
													<button type="button" class="btn btn-success"
														onclick="printRecu()">Imprimer reçu</button>
												</center>
											</div>
										</div>
									</div>
									<div class="card-footer">
										<div class="ml-auto">
											<button type="submit" class="btn btn-primary" name="action"
												value="saveCommandeClient">Enregistrer Commande</button>
										</div>
										<div class="clearfix"></div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>

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
		$nombredecolisCree = 1;
		function nouvelleColis() {
			select2 = document.getElementById("natureColis");
			choice2 = select2.selectedIndex; // Récupération de l'index du <option> choisi
			valeur_cherchee2 = select2.options[choice2].value;
			$nombredecolisCree = $nombredecolisCree + 1;
			var sessions = document.querySelector('#formularColis1');
			sessions.parentNode.appendChild(sessions.cloneNode(true));
			$('select[name="nature_colis[]"]').eq($nombredecolisCree-1).val(
					valeur_cherchee2);
			$('#formularColis1:last-child div[name="buttonNewColis[]"').css("display","none");
			$('#poidsormontant').css("display", "none");
			$('select[name="nature_colis[]"]').eq(0).val("null");
		}
	</script>
	<!-- qr code 2 -->
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
	<script type="text/javascript">
		$('#point_destination_co').css("display", "none");
		$('#poidsormontant').css("display", "none");
		$('#natureColis').on('change', function() {
			var selectedNature = $(this).children("option:selected").val();
			if (selectedNature == 'Argent') {
				$('#name_poid_or_argent').html("Cost");
				$('#poidsormontant').css("display", "inline");
			} else if (selectedNature == 'Colis') {
				$('#name_poid_or_argent').html("weight (Kg)");
				$('#poidsormontant').css("display", "inline");
			}
		});
		$('#type_point_dest').on('change', function() {
			var selectedNature = $(this).children("option:selected").val();
			if (selectedNature == 'maison') {
				$('#point_destination_co').css("display", "inline");

			} else if (selectedNature == 'agence') {
				$('#point_destination_co').css("display", "none");
			}
		});

		function printRecu() {
			var newWin = window.open('', 'Print-Window');
			newWin.document.open();
			codeQr = document.getElementById("qrCodeInPagePrint"); 
				<c:if test="${sessionScope.type_account == 'agent'}">
					num_adherent_print = $('#num_adherent').val();  
				</c:if>
				<c:if test="${sessionScope.type_account == 'client'}">
					num_adherent_print = ${sessionScope.idClient}; 
				</c:if>
				
				<c:if test="${sessionScope.type_account == 'agent'}">
					num_agence_print = '${sessionScope.zone_agent}';  
				</c:if>
				<c:if test="${sessionScope.type_account == 'client'}">
					num_agence_print = $('#zone_point_depart_commande').find(":selected").text();  
				</c:if>
				//point de depart 
				<c:if test="${sessionScope.type_account == 'agent'}">
					point_depart_print = '${sessionScope.zone_agent} (agence)';  
				</c:if>
				<c:if test="${sessionScope.type_account == 'client'}">
				 	point_depart_print= $('#point_depart_commande').val();// 
				 	point_depart_print = point_depart_print + ' (maison)'; 
				</c:if>
				//point de destination
					if($('#type_point_dest').children("option:selected").val() == "maison")
						point_destination_print = $('#point_destination_commande').val() + ' (maison)'; 
					else
						point_destination_print = $('#zone_point_destination_commande').find(":selected").text() + ' (agence)';   
					montant_total_a_payer = " ... "; 
					<c:if test="${sessionScope.type_account == 'agent'}">
						montant_total_a_payer = $('#Montant_total').val(); 
					</c:if>
					cin_destinatiare = $('#cin_destinataire').val(); 
					num_tel_destinataire=$('#num_tele_destinataire').val(); 
					nom_prenom_destinataire=$('#nom_prenom_destinataire').val(); 
			message_to_print = '<html><body onload="window.print()" style="size: A4 landscape;margin:0.5cm;"><p style="float=left;"> Fait à : ......... </p><a class="navbar-brand" href="#" ><img src="Style/img/logo.jpeg" style="width:150px; float:right;"></a><br><br><center><h1 style="color:#50750A;">Reçu de la commande</h1></center><div style="font-size: 22px;  line-height: 2em;float:left;margin-left:50px;"><label>Numero adherent : <strong>'+num_adherent_print+'</strong> </label><br/><label>La zone de l\'agence la plus proche : <strong>'+num_agence_print+'</strong></label><br/><label>Point de départ : <strong>'+point_depart_print+' </strong></label><br/><label>Point de destination : <strong>'+point_destination_print+'</strong></label><br/><label>Nombres Colis : <strong>'+$nombredecolisCree+'</strong></label><br/><hr><label>N° de la CIN du destinataire : <strong>'+cin_destinatiare+'</strong></label><br><label>Nom et prénom du destinataire : <strong>'+nom_prenom_destinataire+'</strong></label><br><label>Numéro de téléphone du destinataire : <strong>'+num_tel_destinataire+'</strong></label><br><br><center style="color : #F57A70; font-size:26px; margin-left:150px;"><label><strong>Montant total à payer : '+montant_total_a_payer+'</strong></label></center><br/><center>'+codeQr.innerHTML+'</center></div></body></html>';
			newWin.document.write(message_to_print);
			//'+jquery('#qrcode').qrcode("this plugin is great")+'
			newWin.document.close();
			setTimeout(function() {
				newWin.close();
			}, 10);
		}
		// qr code
		var qrcode = new QRCode("qrcode");

function makeCode () {		
	var elText = document.getElementById("text");
	
	if (!elText.value) {
		alert("Input a text");
		elText.focus();
		return;
	}
	
	qrcode.makeCode(elText.value);
}

makeCode();
	</script>
	<script>
$requete_success = false ; 

	$('#num_adherent').on("blur", function(e){
		var url = window.location.href;
		 var port = window.location.port;
		 var array=url.split('/');
		 var arr=array.split(':');
		url_test = 'https://localhost:8080/Servlet?action=verificationClient&idClient='+$('#num_adherent').val(); 
		
		$.ajax({
			url : url_test,
			success : function(response) {
				if(response == "success"){
					$('#message_errpr_or_validation_client').html("<i class='fas fa-check'></i> customer exists"); 
					$('#message_errpr_or_validation_client').css("color", "green"); 
					$requete_success = true; 
				}
				else {
					$requete_success = false; 
					$('#message_errpr_or_validation_client').html("<i class='fas fa-times'></i> customer does not exist");
					$('#message_errpr_or_validation_client').css("color", "red"); 
				}
				$requetefinish = true ;
			}
		}); 
	});
	/*
 function verificationCommande() {
	 
	 
	 if($requete_success == false){
		 alert('Customer does not exist'); 
		 return false; 
	 }else 
	return confirm('do you really want to add this command') ; 
}*/
</script>
</body>
</html>