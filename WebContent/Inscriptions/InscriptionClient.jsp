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
<!-- CSS Just for demo purpose, don't include it in your project -->
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body class="">
	<div class="container-fluid">
		<div class="col-md-8 mr-auto ml-auto">
			<div class="wizard-container">
				<div class="card card-wizard" data-color="green" id="wizardProfile">
					<form action="Servlet" method="post" enctype="multipart/form-data">
						<div class="card-header text-center">
							<h3 class="card-title">
								<c:if test="${sessionScope.lang == 'en'}"> Add a new account </c:if>
								<c:if test="${sessionScope.lang == 'ar'}">أضف حساب جديد</c:if>
								<c:if test="${sessionScope.lang == 'fr'}"> Ajouter un nouveau compte</c:if>
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
										href="#about" data-toggle="tab" role="tab"> Profile </a></li>
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
													<img src="assetss/img/default-avatar.png"
															class="picture-src" id="wizardPicturePreview" title=""
															alt="" /> <input type="file" accept="image/*"
															id="wizard-picture" name="profil" onchange="changeImage();" >
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
														id="exampleInput1" name="nom" required>
												</div>
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">email</i>
													</span>
												</div>
												<div class="form-group col-sm-4">
													<label for="examplemail" class="bmd-label-floating">Email
														...</label> <input type="text" class="form-control"
														id="exampleemalil" name="email" >
												</div>
											</c:if>
											<c:if test="${sessionScope.lang == 'ar'}">
												<div class="form-group col-sm-4" style="float:right;">
													<label for="examplemail" class="bmd-label-floating" style="float:right;">البريد
														الإلكتروني </label> <input type="text" class="form-control"
														id="exampleemalil" name="email">
												</div>
												<div class="input-group-prepend">
													<span class="input-group-text"><i
														class="material-icons" style="float:right;">email</i>
													</span>
												</div>
												<div class="form-group col-sm-4">
													<label for="examplenom" class="bmd-label-floating" style="float:right;">الاسم
														</label> <input type="text" class="form-control"
														id="exampleInput1" name="nom" required>
												</div>
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons"style="float:right;">face</i>
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
														id="exampleInput1" name="nom" required>
												</div>
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">email</i>
													</span>
												</div>
												<div class="form-group col-sm-4">
													<label for="examplemail" class="bmd-label-floating">Email
														...</label> <input type="text" class="form-control"
														id="exampleemalil" name="email">
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
														...</label> <select class="form-control" name="pays">
														<c:forEach var="p" items="${ListPays}">
															<option value="${p}">${p}</option>
														</c:forEach>
													</select>
												</div>
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">home</i>
													</span>
												</div>
												<div class="form-group  col-sm-4">
													<label for="exampleville" class="bmd-label-floating">City
														...</label> <select class="form-control" name="ville">
														<c:forEach var="v" items="${ListVille}">
															<option value="${v}">${v}</option>
														</c:forEach>
													</select>
												</div>
											</c:if>
											<c:if test="${sessionScope.lang == 'ar'}">
												<div class="form-group  col-sm-4">
													<label for="exampleville" class="bmd-label-floating" style="float:right;">المدينة
														</label> <select class="form-control" name="ville">
														<c:forEach var="v" items="${ListVille}">
															<option value="${v}">${v}</option>
														</c:forEach>
													</select>
												</div>
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">home</i>
													</span>
												</div>
												<div class="form-group col-sm-4">
													<label for="exampleville" class="bmd-label-floating" style="float:right;">البلد
														</label> <select class="form-control" name="pays">
														<c:forEach var="p" items="${ListPays}">
															<option value="${p}">${p}</option>
														</c:forEach>
													</select>
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
													<label for="exampleville" class="bmd-label-floating">Ville
														...</label> <select class="form-control" name="pays">
														<c:forEach var="p" items="${ListPays}">
															<option value="${p}">${p}</option>
														</c:forEach>
													</select>
												</div>
												<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">home</i>
													</span>
												</div>
												<div class="form-group  col-sm-4">
													<label for="exampleville" class="bmd-label-floating">Ville
														...</label> <select class="form-control" name="ville">
														<c:forEach var="v" items="${ListVille}">
															<option value="${v}">${v}</option>
														</c:forEach>
													</select>
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
													<label for="exampleadress" class="bmd-label-floating">Address
														...</label> <input type="text" class="form-control"
														id="exampleemalil" name="adresse" required>
												</div>
											</c:if>
											<c:if test="${sessionScope.lang == 'ar'}">
												<div class="form-group col-sm-8">
													<label for="exampleadress" class="bmd-label-floating" style="float:right;">العنوان
														</label> <input type="text" class="form-control"
														id="exampleemalil" name="adresse" required >
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
														id="exampleemalil" name="adresse"required>
												</div>
											</c:if>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="account">
									<h5 class="info-text">
										<c:if test="${sessionScope.lang == 'en'}">Account Information </c:if>
										<c:if test="${sessionScope.lang == 'ar'}">معلومات الحساب</c:if>
										<c:if test="${sessionScope.lang == 'fr'}">Informations sur votre compte </c:if>
									</h5>
									<div class="input-group form-control-lg">
										<c:if test="${sessionScope.lang == 'en'}">
											<div class="input-group-prepend">
												<span class="input-group-text"> <i
													class="material-icons">fingerprint</i>
												</span>
											</div>
											<div class="form-group">
												<label for="exampleusername" class="bmd-label-floating">Pseudo
													...</label> <input type="text" class="form-control"
													id="exampleInput1" name="username">
											</div>
										</c:if>
										<c:if test="${sessionScope.lang == 'ar'}">
											<div class="form-group">
												<label for="exampleusername" class="bmd-label-floating" style="float:right;">الكنية
													</label> <input type="text" class="form-control"
													id="exampleInput1" name="username">
											</div>
											<div class="input-group-prepend">
												<span class="input-group-text"> <i
													class="material-icons">fingerprint</i>
												</span>
											</div>
										</c:if>
										<c:if test="${sessionScope.lang == 'fr'}">
											<div class="input-group-prepend">
												<span class="input-group-text"> <i
													class="material-icons">fingerprint</i>
												</span>
											</div>
											<div class="form-group">
												<label for="exampleusername" class="bmd-label-floating">Pseudo
													...</label> <input type="text" class="form-control"
													id="exampleInput1" name="username">
											</div>
										</c:if>
									</div>
									<div class="input-group form-control-lg">
										<c:if test="${sessionScope.lang == 'en'}">
											<div class="input-group-prepend">
												<span class="input-group-text"> <i
													class="material-icons">https</i>
												</span>
											</div>
											<div class="form-group">
												<label for="exampleInput11" class="bmd-label-floating">Password
													...</label> <input type="password" class="form-control"
													id="password" name="password" />
											</div>
										</c:if>
										<c:if test="${sessionScope.lang == 'ar'}">

											<div class="form-group">
												<label for="exampleInput11" class="bmd-label-floating" style="float:right;">كلمة
													السر </label> <input type="password" class="form-control"
													id="password" name="password" />
											</div>
											<div class="input-group-prepend">
												<span class="input-group-text"> <i
													class="material-icons">https</i>
												</span>
											</div>
										</c:if>
										<c:if test="${sessionScope.lang == 'fr'}">
											<div class="input-group-prepend">
												<span class="input-group-text"> <i
													class="material-icons">https</i>
												</span>
											</div>
											<div class="form-group">
												<label for="exampleInput11" class="bmd-label-floating">Mot
													de passe ...</label> <input type="password" class="form-control"
													id="password" name="password" />
											</div>
										</c:if>
									</div>
									<div class="input-group form-control-lg">
										<c:if test="${sessionScope.lang == 'en'}">
											<div class="input-group-prepend">
												<span class="input-group-text"> <i
													class="material-icons">https</i>
												</span>
											</div>
											<div class="form-group">
												<label for="exampleInput11" class="bmd-label-floating">Password
													confirmation ...</label> <input type="password"
													class="form-control" id="passwordd" name="passwordd" />
											</div>
										</c:if>
										<c:if test="${sessionScope.lang == 'ar'}">
											<div class="form-group">
												<label for="exampleInput11" class="bmd-label-floating" style="float:right;">تأكيد
													كلمة المرور</label> <input type="password" class="form-control"
													id="passwordd" name="passwordd" />
											</div>
											<div class="input-group-prepend">
												<span class="input-group-text"> <i
													class="material-icons">https</i>
												</span>
											</div>
										</c:if>
										<c:if test="${sessionScope.lang == 'fr'}">
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
										</c:if>
									</div>
								</div>
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
															onkeyup="verif_nombre(this);">
													</div>
												</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">
													<div class="form-group">
														<label for="exampleInput1" class="bmd-label-floating" style="float:right;">رقم
															الهاتف</label> <input type="text" class="form-control"
															id="exampleInput1" name="tel"
															onkeyup="verif_nombre(this);">
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
															onkeyup="verif_nombre(this);">
													</div>
												</c:if>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="card-footer">
							<div class="ml-auto">
							<c:if test="${sessionScope.lang == 'en'}">
								<button type="submit"
									class="btn btn-next btn-fill btn-success btn-wd" 
									value="Suivant" name="Suivant" onclick="return verification();">Next</button> 
								<button type="submit"
									class="btn btn-finish btn-fill btn-success btn-wd"
									name="action" value="ajoutClient" onclick="return verification();">Register</button> 
							</c:if>
							<c:if test="${sessionScope.lang == 'fr'}">
								<button type="submit"
									class="btn btn-next btn-fill btn-success btn-wd" 
									value="Suivant" name="Suivant" onclick="return verification();">Suivant</button> 

								<button type="submit"
									class="btn btn-finish btn-fill btn-success btn-wd"
									name="action" value="ajoutClient" onclick="return verification();">S'inscrire</button> 
							</c:if>
							<c:if test="${sessionScope.lang == 'ar'}">
								<button type="submit"
									class="btn btn-next btn-fill btn-success btn-wd" 
									value="Suivant" name="Suivant" onclick="return verification();">التالي</button>
									<button type="submit"
										class="btn btn-finish btn-fill btn-success btn-wd"
										name="action" value="ajoutClient"
										onclick="return verification();">تسجيل</button>
								</c:if>
								
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
	
	function verification(){
		 let file = document.getElementById("wizard-picture").files[0];
		 if(file.size>1000000) {alert("La taille de l'image ne doit pas dépasser 1Mo"); return false;} 
		 else return true; 
	}
	
	function changeImage(){
		 let file = document.getElementById("wizard-picture").files[0];
		 
		 if(file.size>1000000) {$('#wizard-picture').val(""); alert("La taille de l'image ne doit pas dépasser 1Mo");} 
	}
		
</script>

<noscript>
	<img height="1" width="1" style="display: none"
		src="https://www.faceamp;noscript=1" alt="" />
</noscript>
</html>
