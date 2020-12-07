<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link
      rel="stylesheet"
      href="https://unpkg.com/leaflet@1.4.0/dist/leaflet.css"
      integrity="sha512-puBpdR0798OZvTTbP4A8Ix/l+A4dHDD0DGqYW6RQ+9jxkRFclaxxQb/SJAWZfWAkuyeQUytO7+7N4QKrDh+drA=="
      crossorigin=""
    />
    <script
      src="https://unpkg.com/leaflet@1.4.0/dist/leaflet.js"
      integrity="sha512-QVftwZFqvtRNi0ZyCtsznlKSWOStnDORoefr1enyq5mVL4tmKB3S/EnC3rRJcxCPavG10IcrVGSmPh6Qw5lwrg=="
      crossorigin=""
    ></script>
    <style>
      #map {
        height: 580px;
        width: 100%;
      }
    </style>
<title><c:if test="${sessionScope.lang == 'en'}"> Registration as Agent </c:if>
	<c:if test="${sessionScope.lang == 'ar'}">تسجيل وكيل </c:if> <c:if
		test="${sessionScope.lang == 'fr'}"> Inscription Agent</c:if></title>




<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css" href="icon/logo.css" />
<link rel="stylesheet"
	href="../../../../maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />


<link rel="stylesheet"
	href="assetss/css/material-dashboard.min28b5.css?v=2.0.0">

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

<link
      rel="stylesheet"
      href="https://unpkg.com/leaflet@1.4.0/dist/leaflet.css"
      integrity="sha512-puBpdR0798OZvTTbP4A8Ix/l+A4dHDD0DGqYW6RQ+9jxkRFclaxxQb/SJAWZfWAkuyeQUytO7+7N4QKrDh+drA=="
      crossorigin=""
    />
    <script
      src="https://unpkg.com/leaflet@1.4.0/dist/leaflet.js"
      integrity="sha512-QVftwZFqvtRNi0ZyCtsznlKSWOStnDORoefr1enyq5mVL4tmKB3S/EnC3rRJcxCPavG10IcrVGSmPh6Qw5lwrg=="
      crossorigin=""
    ></script>
    <style>
      #map {
        height: 580px;
        width: 100%;
      }
    </style>

<body class="">








	<div class="container-fluid">



		<div class="col-md-8 mr-auto ml-auto">
			<!--      Wizard2 container        -->
			<div class="wizard-container">
				<div class="card card-wizard" data-color="green" id="wizardProfile">
					<form action="Servlet" method="post" enctype="multipart/form-data">
						<!--        You can switch " data-color="primary" "  with one of the next bright colors: "green", "orange", "red", "blue"       -->

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
							
						</div>
						<div class="wizard-navigation">
							<ul class="nav nav-pills">
								<c:if test="${sessionScope.lang == 'en'}"> <li class="nav-item" ><a class="nav-link active"
										href="#about" data-toggle="tab" role="tab" > Profil </a></li>
									<li class="nav-item"><a class="nav-link" href="#account"
										data-toggle="tab" role="tab"> Account </a></li>
									<li class="nav-item"><a class="nav-link" href="#address"
										data-toggle="tab" role="tab"> Others </a></li> </c:if>
								<c:if test="${sessionScope.lang == 'ar'}">
								<li class="nav-item" ><a class="nav-link active"
										href="#about" data-toggle="tab" role="tab" > البيانات الشخصية </a></li>
									<li class="nav-item"><a class="nav-link" href="#account"
										data-toggle="tab" role="tab"> الحساب </a></li>
									<li class="nav-item"><a class="nav-link" href="#address"
										data-toggle="tab" role="tab"> أشياء أخرى </a></li>
									
								</c:if>
								<c:if test="${sessionScope.lang == 'fr'}">
									<li class="nav-item"><a class="nav-link active"
										href="#about" data-toggle="tab" role="tab"> Profile </a></li>
									<li class="nav-item"><a class="nav-link" href="#account"
										data-toggle="tab" role="tab"> Compte </a></li>
									<li class="nav-item"><a class="nav-link" href="#address"
										data-toggle="tab" role="tab"> Autres </a></li>
								</c:if>

							</ul>




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
													<h6 class="description"><c:if test="${sessionScope.lang == 'en'}"> Profile picture </c:if>
											<c:if test="${sessionScope.lang == 'ar'}">صورة الملف الشخصي</c:if>
											<c:if test="${sessionScope.lang == 'fr'}"> Photo de profil</c:if>
											</h6>
												</div>
											</div>

										</div>
											


											<div class="input-group form-control-lg">


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
														id="exampleemalil" name="email">
												</div>
												 </c:if>
											<c:if test="${sessionScope.lang == 'ar'}">
											<div class="form-group col-sm-4">
													<label for="examplemail" class="bmd-label-floating" style="float:right;">البريد الإلكتروني
														</label> <input type="text" class="form-control"
														id="exampleemalil" name="email">
												</div>
												
												
											<div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">face</i>
													</span>
												</div>
												<div class="form-group col-sm-4">
													<label for="examplenom" class="bmd-label-floating" style="float:right;">الاسم
														</label> <input type="text" class="form-control"
														id="exampleInput1" name="nom" required>

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
											    <c:if test="${sessionScope.lang == 'en'}"> <div class="input-group-prepend">
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
												</div></c:if>
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
											<c:if test="${sessionScope.lang == 'fr'}"> <div class="input-group-prepend">
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
												</div></c:if>
												
											</div>

											<div class="input-group form-control-lg">
                                                 <c:if test="${sessionScope.lang == 'en'}"> 
                                                 <div class="input-group-prepend">
													<span class="input-group-text"> <i
														class="material-icons">home</i>
													</span>
												</div> 
												<div class="form-group col-sm-8">
													<label for="exampleadress" class="bmd-label-floating" >Address
														...</label> <input type="text" class="form-control"
														id="exampleemalil" name="adresse" required>
												</div>
												</c:if>
											<c:if test="${sessionScope.lang == 'ar'}"><div class="form-group col-sm-8">
													<label for="exampleadress" class="bmd-label-floating" style="float:right;">العنوان
														</label> <input type="text" class="form-control"
														id="exampleemalil" name="adresse" required>
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
													<label for="exampleadress" class="bmd-label-floating" >Adresse
														...</label> <input type="text" class="form-control"
														id="exampleemalil" name="adresse" required>
												</div>
												
											
</c:if>
											
												
												
											</div>




										</div>
									
										<h5 class="info-text">
											<c:if test="${sessionScope.lang == 'en'}"> Position of your agence </c:if>
											<c:if test="${sessionScope.lang == 'ar'}">المعلومات</c:if>
											<c:if test="${sessionScope.lang == 'fr'}">Position de votre ageence</c:if>
											
										</h5>
										
<div class="input-group form-control-lg">
														<div class="form-group col-sm-4">
															
															<c:if test="${sessionScope.lang == 'en'}"><label for="exampleville" class="bmd-label-floating">Agency Latitude </c:if>
											<c:if test="${sessionScope.lang == 'ar'}"><label for="exampleville" class="bmd-label-floating" style="float:right;">خط العرض الوكالة</c:if>
											<c:if test="${sessionScope.lang == 'fr'}"><label for="exampleville" class="bmd-label-floating">Latitude de l'agence </c:if></label> 
											<input type="text" class="form-control"	id="latitude"  name="lat_agence" 
																readonly="readonly">
														</div>
														<div class="form-group col-sm-4">
															
											<c:if test="${sessionScope.lang == 'en'}"><label for="exampleville" class="bmd-label-floating">Name of Agency </c:if>
											<c:if test="${sessionScope.lang == 'ar'}"><label for="exampleville" class="bmd-label-floating"style="float:right;">اسم الوكالة</c:if>
											<c:if test="${sessionScope.lang == 'fr'}"><label for="exampleville" class="bmd-label-floating">Nom de l'agence </c:if>
											                  </label><input type="text" class="form-control"
																name="zone_agence" required="required">
														</div>

														<div class="form-group  col-sm-4">
															
															<c:if test="${sessionScope.lang == 'en'}"><label for="exampleville" class="bmd-label-floating">Agency longitude</c:if>
											<c:if test="${sessionScope.lang == 'ar'}"><label for="exampleville" class="bmd-label-floating" style="float:right;">خط طول الوكالة</c:if>
											<c:if test="${sessionScope.lang == 'fr'}"><label for="exampleville" class="bmd-label-floating">Longitude de l'agence</c:if></label> <input type="text" class="form-control"
																id="longitude" name="long_agence" required
																readonly="readonly">
														</div>
													</div>

													<div class=" input-group justify-content-center ">
										<!-- start maps -->			
														<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link
      rel="stylesheet"
      href="https://unpkg.com/leaflet@1.4.0/dist/leaflet.css"
      integrity="sha512-puBpdR0798OZvTTbP4A8Ix/l+A4dHDD0DGqYW6RQ+9jxkRFclaxxQb/SJAWZfWAkuyeQUytO7+7N4QKrDh+drA=="
      crossorigin=""
    />
    <script
      src="https://unpkg.com/leaflet@1.4.0/dist/leaflet.js"
      integrity="sha512-QVftwZFqvtRNi0ZyCtsznlKSWOStnDORoefr1enyq5mVL4tmKB3S/EnC3rRJcxCPavG10IcrVGSmPh6Qw5lwrg=="
      crossorigin=""
    ></script>
    <style>
      #map {
        height: 400px;
        width: 100%;
      }
    </style>
 
  </head>
<body>
    <div id="map"></div>
    <script>
      if ('geolocation' in navigator) {
        console.log('geolocation available');
        navigator.geolocation.getCurrentPosition(position => {
          lat = position.coords.latitude;
          lon = position.coords.longitude;
          console.log(lat, lon);
          document.getElementById('latitude').textContent = lat;
          document.getElementById('longitude').textContent = lon;

          const map = L.map('map').setView([lat, lon], 15);
          const attribution =
            '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors';
          const tileUrl = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
          const tiles = L.tileLayer(tileUrl, { attribution });
          tiles.addTo(map);
          const marker = L.circleMarker([lat, lon]).addTo(map);
          marker.bindPopup('Your position');

          ///for add a listener marker
          var theMarker = {};

          map.on('click',function(e){
            lat = e.latlng.lat;
            lon = e.latlng.lng;
            document.getElementById('latitude').value = lat;
            document.getElementById('longitude').value = lon;
            //alert("You clicked the map at LAT: "+ lat+" and LONG: "+lon );
            //Clear existing marker, 

                if (theMarker != undefined) {
                      map.removeLayer(theMarker);
                };

            //Add a marker to show where you clicked.
             theMarker = L.marker([lat,lon]).addTo(map);  
             theMarker.bindPopup('<p>Your agence</p>').openPopup();
        }); 
        });
      } else {
        console.log('geolocation not available');
      }
    </script>
  </body>
														
														<!--  end maps-->
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
												<label for="exampleInput11" class="bmd-label-floating">Password ...</label> <input type="password" class="form-control"
													id="password" name="password" />
											</div>
									  </c:if>
											<c:if test="${sessionScope.lang == 'ar'}">
											
											<div class="form-group">
												<label for="exampleInput11" class="bmd-label-floating"style="float:right;">كلمة السر</label> <input type="password" class="form-control"
													id="password" name="password" />
											</div>
											<div class="input-group-prepend">
												<span class="input-group-text"> <i
													class="material-icons">https</i>
												</span>
											</div>
											</c:if>
											<c:if test="${sessionScope.lang == 'fr'}"><div class="input-group-prepend">
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
												<label for="exampleInput11" class="bmd-label-floating">Password confirmation ...</label> <input type="password"
													class="form-control" id="passwordd" name="passwordd" />
											</div>
										</c:if>
											<c:if test="${sessionScope.lang == 'ar'}">
											<div class="form-group">
												<label for="exampleInput11" class="bmd-label-floating" style="float:right;">تأكيد كلمة المرور</label> <input type="password"
													class="form-control" id="passwordd" name="passwordd" />
											</div>
											<div class="input-group-prepend">
												<span class="input-group-text"> <i
													class="material-icons">https</i>
												</span>
											</div>
											</c:if>
											<c:if test="${sessionScope.lang == 'fr'}"><div class="input-group-prepend">
												<span class="input-group-text"> <i
													class="material-icons">https</i>
												</span>
											</div>
											<div class="form-group">
												<label for="exampleInput11" class="bmd-label-floating">Confirmation de mot de passe ...</label> <input type="password"
													class="form-control" id="passwordd" name="passwordd" />
											</div> </c:if>
											
										</div>

									</div>
									<div class="tab-pane" id="address">
										<div class="row justify-content-center">
											<div class="col-sm-12">
												<h5 class="info-text">
												<c:if test="${sessionScope.lang == 'en'}">Other information</c:if>
											<c:if test="${sessionScope.lang == 'ar'}">معلومات أخرى</c:if>
											<c:if test="${sessionScope.lang == 'fr'}">Autres informations </c:if>
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
														<label for="exampleInput1" class="bmd-label-floating">Phone Number...</label> <input type="text" class="form-control"
															id="exampleInput1" name="tel"
															onkeyup="verif_nombre(this);">
													</div>
												</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">
													
													<div class="form-group">
														<label for="exampleInput1" class="bmd-label-floating"style="float:right;">رقم الهاتف</label> <input type="text" class="form-control"
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

								<c:if test="${sessionScope.lang == 'en'}"><input type="submit"
										class="btn btn-next btn-fill btn-success btn-wd"
										name="Next" value="Suivant" onclick="return verification();"> 
										<input type="submit" class="btn btn-finish btn-fill btn-success btn-wd"	name="action" value="ajoutAgent" onclick="return verification();"> </c:if>
											<c:if test="${sessionScope.lang == 'ar'}"><input type="submit"
										class="btn btn-next btn-fill btn-success btn-wd"
										name="Suivant" value="التالي" onclick="return verification();"> <input type="button"
										class="btn btn-finish btn-fill btn-success btn-wd"
										name="action" value="ajoutAgent" onclick="return verification();"></c:if>
											<c:if test="${sessionScope.lang == 'fr'}"><input type="submit"
										class="btn btn-next btn-fill btn-success btn-wd"
										name="Suivant" value="Suivant" onclick="return verification();"> <input type="button"
										class="btn btn-finish btn-fill btn-success btn-wd"
										name="action" value="ajoutAgent" onclick="return verification();"> </c:if>

									
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

<!--   Core JS Files   -->
<script src="assetss/js/core/jquery.min.js" type="text/javascript"></script>
<script src="assetss/js/core/popper.min.js" type="text/javascript"></script>


<script src="assetss/js/bootstrap-material-design.min.js"
	type="text/javascript"></script>


<script src="assetss/js/plugins/perfect-scrollbar.jquery.min.js"
	type="text/javascript"></script>




<!--  Plugin for Date Time Picker and Full Calendar Plugin  -->
<script src="assetss/js/plugins/moment.min.js" type="text/javascript"></script>

<!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
<script src="assetss/js/plugins/bootstrap-datetimepicker.min.js"
	type="text/javascript"></script>

<!--	Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="assetss/js/plugins/nouislider.min.js"
	type="text/javascript"></script>



<!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
<script src="assetss/js/plugins/bootstrap-selectpicker.js"
	type="text/javascript"></script>

<!--	Plugin for Tags, full documentation here: http://xoxco.com/projects/code/tagsinput/  -->
<script src="assetss/js/plugins/bootstrap-tagsinput.js"
	type="text/javascript"></script>

<!--	Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="assetss/js/plugins/jasny-bootstrap.min.js"
	type="text/javascript"></script>

<!-- Plugins for presentation and navigation  -->
<script src="assetss/assets-for-demo/js/modernizr.js"
	type="text/javascript"></script>




<!-- Library for adding dinamically elements -->
<script src="assetss/js/plugins/arrive.min.js" type="text/javascript"></script>

<!-- Forms Validations Plugin -->
<script src="assetss/js/plugins/jquery.validate.min.js"
	type="text/javascript"></script>

<!--  Charts Plugin, full documentation here: https://gionkunz.github.io/chartist-js/ -->
<script src="assetss/js/plugins/chartist.min.js" type="text/javascript"></script>

<!--  Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
<script src="assetss/js/plugins/jquery.bootstrap-wizard.js"
	type="text/javascript"></script>

<!--  Notifications Plugin, full documentation here: http://bootstrap-notify.remabledesigns.com/    -->
<script src="assetss/js/plugins/bootstrap-notify.js"
	type="text/javascript"></script>



<!-- Sliders Plugin, full documentation here: https://refreshless.com/nouislider/ -->
<script src="assetss/js/plugins/nouislider.min.js"
	type="text/javascript"></script>

<!--  Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
<script src="assetss/js/plugins/jquery.select-bootstrap.js"
	type="text/javascript"></script>

<!--  DataTables.net Plugin, full documentation here: https://datatables.net/    -->
<script src="assetss/js/plugins/jquery.datatables.js"
	type="text/javascript"></script>

<!-- Sweet Alert 2 plugin, full documentation here: https://limonte.github.io/sweetalert2/ -->
<script src="assetss/js/plugins/sweetalert2.js" type="text/javascript"></script>

<!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="assetss/js/plugins/jasny-bootstrap.min.js"
	type="text/javascript"></script>

<!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
<script src="assetss/js/plugins/fullcalendar.min.js"
	type="text/javascript"></script>

<!-- demo init -->
<script src="assetss/js/plugins/demo.js" type="text/javascript"></script>





















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
		
		function verification(){
			 let file = document.getElementById("wizard-picture").files[0];
			 if(file.size>1097152) {alert("La taille de l'image ne doit pas dépasser 1Mo"); return false;} 
			 else return true; 
		}
		
		function changeImage(){
			 let file = document.getElementById("wizard-picture").files[0];
			 if(file.size>1097152) {alert("La taille de l'image ne doit pas dépasser 1Mo");} 
		}
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
<script type="text/javascript">
function verification(){
	 let file = document.getElementById("wizard-picture").files[0];
	 if(file.size>1000000) {alert("La taille de l'image ne doit pas dépasser 1Mo"); return false;} 
	 else return true; 
}

function changeImage(){
	 let file = document.getElementById("wizard-picture").files[0];
	 
	 if(file.size>1000000) {$('#wizard-picture').val(""); alert("La taille de l'image ne doit pas dépasser 1Mo");} 
}</script>

<noscript>
	<img height="1" width="1" style="display: none"
		src="https://www.faceamp;noscript=1" alt="" />
</noscript>



</html>
