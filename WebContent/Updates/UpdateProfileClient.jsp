<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css" href="icon/logo.css" />
<link rel="stylesheet"
	href="../../../../maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
<title><c:if test="${sessionScope.lang == 'en'}"> Registration as Customer </c:if>
	<c:if test="${sessionScope.lang == 'ar'}">تسجيل زبون </c:if> <c:if
		test="${sessionScope.lang == 'fr'}"> Inscription Client</c:if></title>
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
<body class="">
<c:if test="${sessionScope.type_account == 'superviseur' }">
		<c:import url="../Navs/NavSuperviseur.jsp" />
	</c:if>
	<c:if test="${sessionScope.type_account == 'admin'}">
		<c:import url="../Navs/NavAdmin.jsp" />
	</c:if>
	<c:if test="${sessionScope.type_account == 'client'}">
		<c:import url="../Navs/NavClient.jsp" />
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
					<a class="navbar-brand" href="#pablo">Profil du client </a>
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
					<form action="Servlet" method="post">
						<div class="card-header text-center">
							<h3 class="card-title">
								<c:if test="${sessionScope.lang == 'en'}"> Update your account</c:if>
								<c:if test="${sessionScope.lang == 'ar'}">أضف تعديلات على الحساب</c:if>
								<c:if test="${sessionScope.lang == 'fr'}"> Mise à jours du compte</c:if>
							</h3>
							<h5 class="card-description">
								<c:if test="${sessionScope.lang == 'en'}"> Informations </c:if>
								<c:if test="${sessionScope.lang == 'ar'}">المعلومات</c:if>
								<c:if test="${sessionScope.lang == 'fr'}"> Informations</c:if>
							</h5>
							<c:if test="${!empty erreur}">
								<div>
									<h4>
										<p style="color: red">${erreur}</p>
									</h4>
								</div>
							</c:if>
						</div>
						<div class="wizard-navigation">
							<ul class="nav nav-pills">
								<c:if test="${sessionScope.lang == 'en'}">
									<li class="nav-item"><a class="nav-link active"
										href="#about" data-toggle="tab" role="tab"> Profil </a></li>
									<li class="nav-item"><a class="nav-link" href="#account"
										data-toggle="tab" role="tab"> Account </a></li>
									<li class="nav-item"><a class="nav-link" href="#address"
										data-toggle="tab" role="tab"> Verification </a></li>
								</c:if>
								<c:if test="${sessionScope.lang == 'ar'}">
									<li class="nav-item"><a class="nav-link active"
										href="#about" data-toggle="tab" role="tab"> البيانات
											الشخصية </a></li>
									<li class="nav-item"><a class="nav-link" href="#account"
										data-toggle="tab" role="tab"> الحساب </a></li>
									<li class="nav-item"><a class="nav-link" href="#address"
										data-toggle="tab" role="tab"> التحقق </a></li>

								</c:if>
								<c:if test="${sessionScope.lang == 'fr'}">
									<li class="nav-item"><a class="nav-link active"
										href="#about" data-toggle="tab" role="tab"> Profil </a></li>
									<li class="nav-item"><a class="nav-link" href="#account"
										data-toggle="tab" role="tab"> Compte </a></li>
									<li class="nav-item"><a class="nav-link" href="#address"
										data-toggle="tab" role="tab"> Vérification </a></li>
								</c:if>
							</ul>
						</div>
						<div class="card-body">
							<div class="tab-content">
								<div class="tab-pane active" id="about">
									<h5 class="info-text">
										<c:if test="${sessionScope.lang == 'en'}"> Informations </c:if>
										<c:if test="${sessionScope.lang == 'ar'}">المعلومات</c:if>
										<c:if test="${sessionScope.lang == 'fr'}"> Informations</c:if>
									</h5>
									<div class="row justify-content-center">
										<div class="col-sm-4">
											<div class="picture-container">
												<div class="picture">
												 <c:if	test="${sessionScope.type_account == 'client' }">
												<c:if test="${sessionScope.profil != null}">
													<img class="img" src="data:image/jpg;base64,${sessionScope.profil}">
												</c:if>												
										</c:if> 
													 
												</div>
												<h6 class="description">
													<c:if test="${sessionScope.lang == 'en'}"> Profile picture </c:if>
													<c:if test="${sessionScope.lang == 'ar'}">صورة الملف الشخصي</c:if>
													<c:if test="${sessionScope.lang == 'fr'}"> Photo de profil</c:if>
												</h6>
											</div>
										</div>
										<div class="input-group form-control-lg">
											<c:if test="${sessionScope.lang == 'en'}">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">face</i>
													</span>
												</div>
												<div class="form-group col-sm-4">
													<label for="examplenom" class="bmd-label-floating">Name
														...</label> <input type="text" class="form-control"
														id="exampleInput1" name="nom" value="${client.getNom() }" required>
												</div>
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">email</i>
													</span>
												</div>
												<div class="form-group col-sm-4">
													<label for="examplemail" class="bmd-label-floating">Email
														...</label> <input type="text" class="form-control"
														id="exampleemalil" name="email" value="${client.getEmail() }" readonly="readonly">
												</div>
											</c:if>
											<c:if test="${sessionScope.lang == 'ar'}">
												<div class="form-group col-sm-4">
													<label for="examplemail" class="bmd-label-floating" style="float:right;">البريد
														الإلكتروني</label> <input type="text" class="form-control"
														id="exampleemalil" name="email" value="${client.getEmail() }" readonly="readonly">
												</div>
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">face</i>
													</span>
												</div>
												<div class="form-group col-sm-4">
													<label for="examplenom" class="bmd-label-floating" style="float:right;">الاسم
														</label> <input type="text" class="form-control"
														id="exampleInput1" name="nom" value="${client.getNom() }" required>
												</div>
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">email</i>
													</span>
												</div>
											</c:if>
											<c:if test="${sessionScope.lang == 'fr'}">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">face</i>
													</span>
												</div>
												<div class="form-group col-sm-4">
													<label for="examplenom" class="bmd-label-floating">Nom
														...</label> <input type="text" class="form-control"
														id="exampleInput1" name="nom" value="${client.getNom() }" required>
												</div>
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">email</i>
													</span>
												</div>
												<div class="form-group col-sm-4">
													<label for="examplemail" class="bmd-label-floating">Email
														...</label> <input type="text" class="form-control"
														id="exampleemalil" name="email" value="${client.getEmail() }" readonly="readonly">
												</div>
											</c:if>
										</div>
										<div class="input-group form-control-lg">
											<c:if test="${sessionScope.lang == 'en'}">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">home</i>
													</span>
												</div>
												<div class="form-group col-sm-4">
													<label for="exampleville" class="bmd-label-floating">Country
														...</label> <input type="text" class="form-control"
														id="exampleemalil" name="pays" value="${client.getPays() }">
												</div>
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">home</i>
													</span>
												</div>
												<div class="form-group  col-sm-4">
													<label for="exampleville" class="bmd-label-floating">City
														...</label> <input type="text" class="form-control"
														id="exampleemalil" name="ville" value="${client.getVille() }">
												</div>
											</c:if>
											<c:if test="${sessionScope.lang == 'ar'}">
												<div class="form-group  col-sm-4">
													<label for="exampleville" class="bmd-label-floating" style="float:right;">المدينة
												</label> <input type="text" class="form-control"
														id="exampleemalil" name="ville" value="${client.getVille() }">
												</div>
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">home</i>
													</span>
												</div>
												<div class="form-group col-sm-4">
													<label for="exampleville" class="bmd-label-floating" style="float:right;">البلد
														</label> <input type="text" class="form-control"
														id="exampleemalil" name="pays" value="${client.getPays() }">
												</div>
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">home</i>
													</span>
												</div>
											</c:if>
											<c:if test="${sessionScope.lang == 'fr'}">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">home</i>
													</span>
												</div>
												<div class="form-group col-sm-4">
													<label for="exampleville" class="bmd-label-floating">Pays
														...</label> <input type="text" class="form-control"
														id="exampleemalil" name="pays" value="${client.getPays() }">
												</div>
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">home</i>
													</span>
												</div>
												<div class="form-group  col-sm-4">
													<label for="exampleville" class="bmd-label-floating">Ville
														...</label> <input type="text" class="form-control"
														id="exampleemalil" name="ville" value="${client.getVille() }">
												</div>
											</c:if>
										</div>
										<div class="input-group form-control-lg">
											<c:if test="${sessionScope.lang == 'en'}">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">home</i>
													</span>
												</div>
												<div class="form-group col-sm-8">
													<label for="exampleadress" class="bmd-label-floating">address
														...</label> <input type="text" class="form-control"
														id="exampleemalil" name="adresse" value="${client.getAdresse() }">
												</div>
											</c:if>
											<c:if test="${sessionScope.lang == 'ar'}">
												<div class="form-group col-sm-8">
													<label for="exampleadress" class="bmd-label-floating" style="float:right;">العنوان
														</label> <input type="text" class="form-control"
														id="exampleemalil" name="adresse" value="${client.getAdresse() }">
												</div>
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">home</i>
													</span>
												</div>
											</c:if>
											<c:if test="${sessionScope.lang == 'fr'}">
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">home</i>
													</span>
												</div>
												<div class="form-group col-sm-8">
													<label for="exampleadress" class="bmd-label-floating">Adresse
														...</label> <input type="text" class="form-control"
														id="exampleemalil" name="adresse" value="${client.getAdresse() }">
												</div>
											</c:if>
										</div>
									</div>
								</div>
								<c:if test="${sessionScope.lang == 'en'}">
								<div class="tab-pane" id="account">
											<h5 class="info-text">Security of your account</h5>
											<div class="custom-control custom-checkbox form-group">
												<input type="checkbox" class="custom-control-input"
													id="updateCheckbox" name="updateCheckbox"> <label
													class="custom-control-label" value="1" for="updateCheckbox"
													onclick="displayFormPassword()">Change the password</label>
											</div>
											<div id="update_password">
												<div class="input-group form-control-lg">
													<div class="input-group-prepend">
														<span class="input-group-text"> <i
															class="material-icons">https</i>
														</span>
													</div>
													<div class="form-group">
														<label for="exampleInput11" class="bmd-label-floating">old
															password : </label> <input type="password"
															class="form-control" name="lastpassword"
															placeholder="*********" />
													</div>
												</div>

												<div class="input-group form-control-lg">
													<div class="input-group-prepend">
														<span class="input-group-text"> <i
															class="material-icons">https</i>
														</span>
													</div>
													<div class="form-group">
														<label for="exampleInput11" class="bmd-label-floating">Password ...</label> <input type="password" class="form-control"
															id="password" name="password" placeholder="*********" />
													</div>
												</div>
												<div class="input-group form-control-lg">
													<div class="input-group-prepend">
														<span class="input-group-text"> <i
															class="material-icons">https</i>
														</span>
													</div>
													<div class="form-group">
														<label for="exampleInput11" class="bmd-label-floating">Password confirmation ...</label> <input type="password"
															class="form-control" id="passwordd" name="passwordd" />
													</div>
												</div>
											</div>
										</div>
									
								</c:if>
								<c:if test="${sessionScope.lang == 'ar'}">
								<div class="tab-pane" id="account">
											<h5 class="info-text">أمان حسابك</h5>
											<div class="custom-control custom-checkbox form-group">
												 <input type="checkbox" class="custom-control-input"
													id="updateCheckbox" name="updateCheckbox" style="float:right;"><label
													class="custom-control-label" value="1" for="updateCheckbox"
													onclick="displayFormPassword()" style="float:right;">تغيير كلمة المرور</label>
													
											</div>
											<div id="update_password">
												<div class="input-group form-control-lg">
													
													<div class="form-group">
														<label for="exampleInput11" class="bmd-label-floating" style="float:right;">كلمة المرور القديمة </label> <input type="password"
															class="form-control" name="lastpassword"
															placeholder="*********" />
													</div>
													<div class="input-group-prepend">
														<span class="input-group-text"> <i
															class="material-icons">https</i>
														</span>
													</div>
												</div>

												<div class="input-group form-control-lg">
													
													<div class="form-group">
														<label for="exampleInput11" class="bmd-label-floating" style="float:right;">كلمة السر</label> <input type="password" class="form-control"
															id="password" name="password" placeholder="*********" />
													</div>
													<div class="input-group-prepend">
														<span class="input-group-text"> <i
															class="material-icons">https</i>
														</span>
													</div>
												</div>
												<div class="input-group form-control-lg">
													
													<div class="form-group">
														<label for="exampleInput11" class="bmd-label-floating" style="float:right;">تأكيد كلمة المرور</label> <input type="password"
															class="form-control" id="passwordd" name="passwordd" />
													</div>
													<div class="input-group-prepend">
														<span class="input-group-text"> <i
															class="material-icons">https</i>
														</span>
													</div>
												</div>
											</div>
										</div>
									
								</c:if>
								<c:if test="${sessionScope.lang == 'fr'}">
								<div class="tab-pane" id="account">
											<h5 class="info-text">Sécurité de votre compte</h5>
											<div class="custom-control custom-checkbox form-group">
												<input type="checkbox" class="custom-control-input"
													id="updateCheckbox" name="updateCheckbox"> <label
													class="custom-control-label" value="1" for="updateCheckbox"
													onclick="displayFormPassword()">Changer Mot de
													passe</label>
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
															class="form-control" name="lastpassword"
															placeholder="*********" />
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
															id="password" name="password" placeholder="*********" />
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
															de mot de passe ...</label> <input type="password"
															class="form-control" id="passwordd" name="passwordd" />
													</div>
												</div>
											</div>
										</div>
									
								 </c:if>
								
								
								<div class="tab-pane" id="address">
									<div class="row justify-content-center">
										<div class="col-sm-12">
											<h5 class="info-text">
												<c:if test="${sessionScope.lang == 'en'}">Verification </c:if>
												<c:if test="${sessionScope.lang == 'ar'}">التحقق</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">Vérification </c:if>
											</h5>
										</div>
										<div class="col-lg-10 mt-3">
											<div class="input-group form-control-lg">
												<c:if test="${sessionScope.lang == 'en'}">
													<div class="input-group-prepend">
														<span class="input-group-text"> <i
															class="material-icons">phone_iphone</i>
														</span>
													</div>
													<div class="form-group">
														<label for="exampleInput1" class="bmd-label-floating">Phone
															Number...</label> <input type="text" class="form-control"
															id="exampleInput1" name="tel"
															onkeyup="verif_nombre(this);" value="${client.getNtele() }" readonly="readonly">
													</div>
												</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">
													<div class="form-group">
														<label for="exampleInput1" class="bmd-label-floating" style="float:right;">رقم
															الهاتف</label> <input type="text" class="form-control"
															id="exampleInput1" name="tel"
															onkeyup="verif_nombre(this);" value="${client.getNtele() }" readonly="readonly">
													</div>
													<div class="input-group-prepend">
														<span class="input-group-text"> <i
															class="material-icons">phone_iphone</i>
														</span>
													</div>
												</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">
													<div class="input-group-prepend">
														<span class="input-group-text"> <i
															class="material-icons">phone_iphone</i>
														</span>
													</div>
													<div class="form-group">
														<label for="exampleInput1" class="bmd-label-floating">Numéro
															de téléphone ...</label> <input type="text" class="form-control"
															id="exampleInput1" name="tel"
															onkeyup="verif_nombre(this);" value="${client.getNtele() }" readonly="readonly">
													</div>
												</c:if>
												<input type="hidden" name="id_client" value="${client.getIdC() }">
											</div>
										</div>
									</div>
									
								</div>
							</div>
						</div>
						<div class="card-footer">
							<div class="ml-auto">
							
								<input type="button"
									class="btn btn-next btn-fill btn-success btn-wd" name="Suivant"
									value="Suivant" >
								<button type="submit"
									class="btn btn-finish btn-fill btn-success btn-wd"
									name="action" value="updateDataClient">Enregistrer les modifications </button>
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
<script src="assetss/assets-for-demo/js/jquery.sharrre.js"
	type="text/javascript">
	
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#twitter').sharrre({
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
			url : 'http://demoentation.html'
		});

		$('#facebook').sharrre({
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
			url : 'http://demos.crion.html'
		});

		$('#google').sharrre({
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
			url : 'http://deon.html'
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
				+ '.googljs';
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
	}(window, document, 'script', '../../../../connect.s.js');

	try {
		fbq('init', '111649226022273');
		fbq('track', "PageView");

	} catch (err) {
		console.log('Facebook Track Error:', err);
	}
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

<noscript>
	<img height="1" width="1" style="display: none"
		src="https://www.faceamp;noscript=1" alt="" />
</noscript>
</html>
