<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">

<title><c:if test="${sessionScope.lang == 'en'}"> Maps </c:if>
	<c:if test="${sessionScope.lang == 'ar'}">خريطة</c:if> <c:if
		test="${sessionScope.lang == 'fr'}"> Maps</c:if></title>


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


<script type="text/javascript">
    if (document.readyState === 'complete') {
        if (window.location != window.parent.location) {
          const elements = document.getElementsByClassName("iframe-extern");
          while (elemnts.lenght > 0) elements[0].remove();
            // $(".iframe-extern").remove();
        }
    };
  </script>
<script type="text/javascript">
function verif_nombre(champ)
  {
  var chiffres = new RegExp("[0-9]");
  var verif;
  var points = 0;
 
  for(x = 0; x < champ.value.length; x++)
  {
            verif = chiffres.test(champ.value.charAt(x));
      if(champ.value.charAt(x) == "."){points++;}
            if(points > 1){verif = false; points = 1;}
        if(verif == false){champ.value = champ.value.substr(0,x) + champ.value.substr(x+1,champ.value.length-x+1); x--;}
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

	 <c:if test="${sessionScope.type_account == 'agent'}">
    	<c:import url="Navs/NavAgent.jsp" />
    	
    </c:if>
    <c:if test="${sessionScope.type_account == 'superviseur'}">
    	<c:import url="Navs/NavSuperviseur.jsp" />
    </c:if>
    <c:if test="${sessionScope.type_account == 'distributeur'}">
    	<c:import url="Navs/NavDistributeur.jsp" />
    </c:if>
     <c:if test="${sessionScope.type_account == 'admin'}">
    	<c:import url="Navs/NavAdmin.jsp" />
    </c:if>
	<div class="main-panel">
		                <!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-transparent  navbar-absolute fixed-top">
	<div class="container-fluid">
    <div class="navbar-wrapper">
      <div class="navbar-minimize">
        <button id="minimizeSidebar" class="btn btn-just-icon btn-white btn-fab btn-round">
            <i class="material-icons text_align-center visible-on-sidebar-regular">more_vert</i>
            <i class="material-icons design_bullet-list-67 visible-on-sidebar-mini">view_list</i>
        </button>
      </div>
			<a class="navbar-brand" href="#pablo"></a>
		</div>

		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
      <span class="sr-only">Toggle navigation</span>
			<span class="navbar-toggler-icon icon-bar"></span>
			<span class="navbar-toggler-icon icon-bar"></span>
			<span class="navbar-toggler-icon icon-bar"></span>
		</button>

	    
	</div>
</nav>

		<div class="content">
			<div class="container-fluid">

				<div class="card ">

					<div class="card-header card-header-text">
						<div class="card-text bg-success">
							<h3>
							<c:if test="${sessionScope.lang == 'en'}">Maps YAQOUT Agency</c:if>
							<c:if test="${sessionScope.lang == 'ar'}">وكالات ياقوت</c:if>
							<c:if test="${sessionScope.lang == 'fr'}">Agences YAQOUT</c:if>
							  </h3>
						
						</div>
						<div class="card-body " style="width: 100%;height: 250%">					
						<div id="map"></div>
    
					</div>						
					</div>
					
				</div>


				

			</div>
		</div>

		<footer class="footer ">

			<div class="container">

				<div class="copyright pull-right">
					&copy;
					<script type="text/javascript">document.write(new Date().getFullYear())</script>
				</div>
			</div>



		</footer>


	</div>
	<div></div>

</body>

<!--   Core JS Files   -->
<script src="assetss/js/core/jquery.min.js" type="text/javascript"></script>
<script src="assetss/js/core/popper.min.js" type="text/javascript"></script>


<script src="assetss/js/bootstrap-material-design.min.js"
	type="text/javascript"></script>


<script src="assetss/js/plugins/perfect-scrollbar.jquery.min.js"
	type="text/javascript"></script>



<!-- Material Kit Core initialisations of plugins and Bootstrap Material Design Library -->

<script src="assetss/js/material-dashboard28b5.js?v=2.0.0"
	type="text/javascript"></script>







<script type="text/javascript">

$(document).ready(function(){

  //init wizard

  demo.initMaterialWizard();

  // Javascript method's body can be found in assets/js/demos.js
  demo.initDashboardPageCharts();

  demo.initCharts();

});

</script>

<script>
      if ('geolocation' in navigator) {
        console.log('geolocation available');
        navigator.geolocation.getCurrentPosition(position => {
        	///for add all markers agent
        	var planes =[
        		
        		  <c:forEach var="marker" items="${agences}">
                  [' Agence de ${marker.getZone()} ',  ${marker.getLat_agence()}, ${marker.getLong_agence()} ],
                 </c:forEach>
        	  ];
        	///
          lat = position.coords.latitude;
          lon = position.coords.longitude;
          console.log(lat, lon);
        

          const map = L.map('map').setView([lat, lon], 5);
          const attribution =
            '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors';
          const tileUrl = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
          const tiles = L.tileLayer(tileUrl, { attribution });
          tiles.addTo(map);
          const marker = L.circleMarker([lat, lon]).addTo(map);
          marker.bindPopup('Your position');
          ///for add all markers agent
    		for (var i = 0; i < planes.length; i++) {
    			markers = new L.marker([planes[i][1],planes[i][2]])
    				.bindPopup(planes[i][0])
    				.addTo(map);
    		}
    	///   
          ///for add a listener marker
        
        });
      } else {
        console.log('geolocation not available');
      }
    </script>
</html>
