<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="fr">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!-- Favicons -->

<title id="auth">
  <c:choose>
    <c:when test="${sessionScope.lang == 'ar'}">
        تسجيل الدخول 
        
    </c:when>    
    <c:when test="${sessionScope.lang == 'fr'}">
Authentication        
    </c:when> 
    <c:otherwise>
         Log in
       
    </c:otherwise>
</c:choose>
</title>
<!-- Extra details for Live View on GitHub Pages -->
  <!-- Canonical SEO -->

<meta name="keywords" content="material dashboard, bootstrap 4 material admin, bootstrap 4 material dashboard, material design admin, material design, creative tim, html dashboard, html css dashboard, web dashboard, freebie, free bootstrap 4 dashboard, css3 dashboard, bootstrap 4 admin, bootstrap 4 dashboard, frontend, responsive bootstrap 4 dashboard, premium material design admin">

<meta name="description" content="Material Dashboard PRO is a Premium Material Bootstrap 4 Admin with a fresh, new design inspired by Google's Material Design.">

<!--     Fonts and icons     -->

 <link rel="stylesheet" type="text/css" href="icon/logo.css" /> 
<link rel="stylesheet" href="../../../../maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
<link rel="stylesheet" href="assetss/css/material-dashboard.min28b5.css?v=2.0.0">
<!-- Documentation extras -->
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="assetss/assets-for-demo/demo.css" rel="stylesheet"/>
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
</head>
<body>


    <div class="wrapper wrapper-full-page page-header login-page header-filter" style="background-image: url('assetss/img/livr.jpg'); background-size: cover; background-position: top center;">

            <div class="container">
                <div class="col-md-5 col-sm-6 ml-auto mr-auto">
                
                    <form class="form" action="Servlet" method="post">


<div class="card card-login card-hidden">

    <div class="card-header bg-info text-center">

    <h4 class="card-title" id="authTitre">
    <c:choose>
    <c:when test="${sessionScope.lang == 'ar'}">
        تسجيل الدخول 
        
    </c:when>    
    <c:when test="${sessionScope.lang == 'fr'}">
Authentication        
    </c:when> 
    <c:otherwise>
         Log in
       
    </c:otherwise>
</c:choose>
    </h4>

  
   						
    </div>
<div class="text-center ">
    <c:if test ="${!empty erreur}">
   <div class ="danger-text">
    <p style="color: red">${erreur}</p>
  </div>
   </c:if></div>
    <c:choose>
    <c:when test="${sessionScope.lang == 'ar'}">    <div class="card-body ">
    
                              <span class="bmd-form-group">    	
                                <div class="input-group">
                                <input type="text" class="form-control" id="nomUtii" placeholder="رقم الهاتف " style= "text-align:right;"name="username" required="required" oninvalid="this.setCustomValidity('رقم الهتف من فضلك')" oninput="this.setCustomValidity('')">
                                  <div class="input-group-prepend">
                                  
                                    <span class="input-group-text">
                  										<i class="material-icons">face</i>
                  					</span>
                                  </div>
              			              
                                </div>
                              </span>
              								<span class="bmd-form-group">
                                <div class="input-group">
                                  
                									<input type="password" class="form-control" placeholder="كلمة السر" style= "text-align:right;"name="password" required="required" oninvalid="this.setCustomValidity('رمز المرور')" oninput="this.setCustomValidity('')">
                									<input type="hidden" name="oky" value="oky">
              								<div class="input-group-prepend">
                                    <span class="input-group-text">
                                      <i class="material-icons">lock_outline</i>
                                    </span>
                                  </div>
                                  </div>
                            </span>

			

    </div>    </c:when>    
    <c:when test="${sessionScope.lang == 'fr'}"><div class="card-body ">
    
                              <span class="bmd-form-group">    	
                                <div class="input-group">
                                  <div class="input-group-prepend">
                                  
                                    <span class="input-group-text">
                  										<i class="material-icons">face</i>
                  					</span>
                                  </div>
              			              <input type="text" class="form-control" id="nomUtii" placeholder="Numéro de téléphone ..." name="username" required="required" oninvalid="this.setCustomValidity('Entrez le nom d\'utilisateur svp!')" oninput="this.setCustomValidity('')">
                                </div>
                              </span>
              								<span class="bmd-form-group">
                                <div class="input-group">
                                  <div class="input-group-prepend">
                                    <span class="input-group-text">
                                      <i class="material-icons">lock_outline</i>
                                    </span>
                                  </div>
                									<input type="password" class="form-control" placeholder="Mot de passe..." name="password" required="required" oninvalid="this.setCustomValidity('Entrez le mot de passe svp!')" oninput="this.setCustomValidity('')">
                									<input type="hidden" name="oky" value="oky">
              								</div>
                            </span>

			

    </div>  </c:when> 
       <c:otherwise>    <div class="card-body ">
    
                              <span class="bmd-form-group">    	
                                <div class="input-group">
                                  <div class="input-group-prepend">
                                  
                                    <span class="input-group-text">
                  										<i class="material-icons">face</i>
                  					</span>
                                  </div>
              			              <input type="text" class="form-control" id="nomUtii" placeholder="Number phone ..." name="username" required="required" oninvalid="this.setCustomValidity('Entre Number phone please !')" oninput="this.setCustomValidity('')">
                                </div>
                              </span>
              								<span class="bmd-form-group">
                                <div class="input-group">
                                  <div class="input-group-prepend">
                                    <span class="input-group-text">
                                      <i class="material-icons">lock_outline</i>
                                    </span>
                                  </div>
                									<input type="password" class="form-control" placeholder="Password..." name="password" required="required" oninvalid="this.setCustomValidity('Entrez password please !')" oninput="this.setCustomValidity('')">
                									<input type="hidden" name="oky" value="oky">
              								</div>
                            </span>

			

    </div>   </c:otherwise>
       </c:choose>
  
    
    		<span class="bmd-form-group">
                                <div >
                                  
              			              <center><a href="Servlet?action=forget" ><br><font color="gray" id="mdpOublie">َMot de passe oublié ?
    
              			             
              			              </font></a></center>

              			             
                                </div>
                              </span>
				
				
    <div class="card-footer justify-content-center">

        <button type="submit" class="btn btn-info btn-round" name="action" id="connexion" value="ConnecterDistributeur">
       <c:choose>
    <c:when test="${sessionScope.lang == 'ar'}">    تسجيل الدخول    </c:when>    
    <c:when test="${sessionScope.lang == 'fr'}">Connexion   </c:when> 
       <c:otherwise>     Log in    </c:otherwise>
       </c:choose>
</button>

        
    </div>

</div>




                    </form>
                </div>
            </div>
           

    </div>

    </div>

</body>

<script src="Style/js/scriptLangAr.js"></script>

    <!--   Core JS Files   -->
<script src="assetss/js/core/jquery.min.js"></script>
<script src="assetss/js/core/popper.min.js"></script>


<script src="assetss/js/bootstrap-material-design.min.js"></script>


<script src="assetss/js/plugins/perfect-scrollbar.jquery.min.js"></script>
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
    $().ready(function(){
        demo.checkFullPageBackgroundImage();

        setTimeout(function(){
            // after 1000 ms we add the class animated to the login/register card
            $('.card').removeClass('card-hidden');
        }, 700)
    });
</script>
<c:if test="${sessionScope.lang == 'en'}"> <script src="Style/js/scriptLangEn.js"></script></c:if>
    <c:if test="${sessionScope.lang == 'ar'}">ن<script src="Style/js/scriptLangAr.js"></script></c:if>
    <c:if test="${sessionScope.lang == 'fr'}"><script src="Style/js/scriptLangFr.js"></script></c:if>
 
<!-- Mirrored from demos.creative-tim.com/material-dashboard-pro/examples/pages/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 20 Mar 2018 16:01:01 GMT -->
</html>