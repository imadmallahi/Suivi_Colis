<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">

<title>Admin Mr ${NomCompte}</title>


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
	<c:import url="Navs/NavAdmin.jsp" />
	

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
		<!-- End Navbar -->
		<div class="content">
			<div class="container-fluid">
				<div class="">
					<!--      Wizard container        -->
					<c:import url="AcceuilAuthentification.jsp" />
					<!-- wizard container -->
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



<!--  Google Maps Plugin  -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2Yno10-YTnLjjn_Vtk0V8cdcY5lC4plU"></script>


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




<!-- Material Kit Core initialisations of plugins and Bootstrap Material Design Library -->

<script src="assetss/js/material-dashboard28b5.js?v=2.0.0"
	type="text/javascript"></script>



<!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
<script
	src="../../../../cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"
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

<!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
<script src="assetss/js/plugins/jquery-jvectormap.js"
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

$(document).ready(function(){

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

$(document).ready(function(){
    $('#twitter').sharrre({
      share: {
        twitter: true
      },
      enableHover: false,
      enableTracking: false,
      enableCounter: false,
      buttons: { twitter: {via: 'CreativeTim'}},
      click: function(api, options){
        api.simulateClick();
        api.openPopup('twitter');
      },
      template: '<i class="fa fa-twitter"></i> Twitter',
      url: 'http://demos.creative-tim.com/material-kit-pro/presentation.html'
    });

    $('#facebook').sharrre({
      share: {
        facebook: true
      },
      enableHover: false,
      enableTracking: false,
      enableCounter: false,
      click: function(api, options){
        api.simulateClick();
        api.openPopup('facebook');
      },
      template: '<i class="fa fa-facebook-square"></i> Facebook',
      url: 'http://demos.creative-tim.com/material-kit-pro/presentation.html'
    });

    $('#google').sharrre({
      share: {
        googlePlus: true
      },
      enableCounter: false,
      enableHover: false,
      enableTracking: true,
      click: function(api, options){
        api.simulateClick();
        api.openPopup('googlePlus');
      },
      template: '<i class="fa fa-google-plus"></i> Google',
      url: 'http://demos.creative-tim.com/material-kit-pro/presentation.html'
    });
});


var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-46172202-1']);
_gaq.push(['_trackPageview']);

(function() {
    var ga = document.createElement('script');
    ga.type = 'text/javascript';
    ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(ga, s);
})();

// Facebook Pixel Code Don't Delete
!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
document,'script','../../../../connect.facebook.net/en_US/fbevents.js');

try{
	fbq('init', '111649226022273');
	fbq('track', "PageView");

}catch(err) {
	console.log('Facebook Track Error:', err);
}

</script>

<noscript>
	<img height="1" width="1" style="display: none"
		src="https://www.facebook.com/tr?id=111649226022273&amp;ev=PageView&amp;noscript=1"
		alt="" />
</noscript>



<!-- Mirrored from demos.creative-tim.com/material-dashboard-pro/examples/forms/wizard.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 20 Mar 2018 16:01:03 GMT -->
</html>
