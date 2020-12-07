<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" type="image/jpg" href="Style/img/image/logo.jpg" />
	<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<meta name="viewport"  content="width=device-width, initial-scale=1">
	<title>YAQOUT</title>
	<link rel="stylesheet" href="Style/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="Style/styleAcceuil.css">
	<link rel="stylesheet" href="Style/css/fixed.css"> 
	<link rel="stylesheet" href="Style/styleAz.css">
	 <link rel="stylesheet" href="Style/slide.css">



<script src='https://kit.fontawesome.com/a076d05399.js'></script>

</head>
<body>

<!--start home section-->
<div id="home" >
<!-- start navbar --><div class="navee">
	<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top" >
		
	<c:choose>
  <c:when test = "${sessionScope.lang == 'en'}">
        <a class="navbar-brand" href="#"><img src="Style/img/image/logo.jpg"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" >
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active">
					<a class="nav-link" href="#"></a>
				</li>
				
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i id="espace" class="fas fa-users"></i>
						Sing in
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="Servlet?action=EspaceClient">Customer </a>
						<a class="dropdown-item" href="Servlet?action=EspaceAgent">Agent </a>
						<a class="dropdown-item" href="Servlet?action=EspaceDistributeur">Driver </a>
						<a class="dropdown-item" href="Servlet?action=EspaceSuperviseur">Supervisor </a>
						<a class="dropdown-item" href="Servlet?action=EspaceAdmin">Admin </a>
				</li>
				
				<li class="nav-item active">
					<a href="#inscrire" class="nav-link" ><i class="fas fa-user-plus"></i> Register</a>
				</li>
				<li class="nav-item active">
					<a href="Servlet?action=Questions" class="nav-link" ><i class="fas fa-question-circle"></i> Questions</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-globe"></i> langue
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a href="Servlet?action=changeLang&lang=en" class="dropdown-item" id="en" >English</a>
						<a href="Servlet?action=changeLang&lang=fr" class="dropdown-item" id="fr" >Français</a>
					    <a href="Servlet?action=changeLang&lang=ar" class="dropdown-item" id="ar" >العربية</a> 
						
					</div>
				</li>	
			</ul>	
		</div>
	 </c:when>
	 <c:when test = "${sessionScope.lang == 'ar'}">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" >
			<span class="navbar-toggler-icon"></span>
		</button>
	 	<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">اللغات<i class="fas fa-globe"></i> 	
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a href="Servlet?action=changeLang&lang=en" class="dropdown-item" id="fr" >English</a>
						<a href="Servlet?action=changeLang&lang=fr" class="dropdown-item" id="fr" >Français</a>
						<a href="Servlet?action=changeLang&lang=ar" class="dropdown-item" id="fr" >العربية</a>
						
					</div>
				</li>
				<li class="nav-item active">
					<a href="#inscrire" class="nav-link" >التسجيل<i class="fas fa-user-plus"></i> </a>
				</li>
				<li class="nav-item active">
					<a href="Servlet?action=Questions" class="nav-link" > أسئلتكم <i class="fas fa-question-circle"></i> </a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					 تسجيل الدخول	 <i id="espace" class="fas fa-users"></i>
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="Servlet?action=EspaceClient">فضاء الزبون</a>
						<a class="dropdown-item" href="Servlet?action=EspaceAgent">فضاء الوكيل</a>
						<a class="dropdown-item" href="Servlet?action=EspaceDistributeur"> فضاء السائق </a>
						<a class="dropdown-item" href="Servlet?action=EspaceSuperviseur">فضاء المشرف </a>
						<a class="dropdown-item" href="Servlet?action=EspaceAdmin">فضاء المدير </a>
				</li>	
			</ul>	
		</div>
		<a class="navbar-brand" href="#"><img src="Style/img/logo.jpeg"></a>
	 </c:when>
	 <c:otherwise> 
	 <a class="navbar-brand" href="#"><img src="Style/img/logo.jpeg"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" >
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">				
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i id="espace" class="fas fa-users"></i>
						Se Connecter
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="Servlet?action=EspaceClient">Espace client</a>
						<a class="dropdown-item" href="Servlet?action=EspaceAgent">Espace agent</a>
						<a class="dropdown-item" href="Servlet?action=EspaceDistributeur">Espace Chauffeur</a>
						<a class="dropdown-item" href="Servlet?action=EspaceSuperviseur">Espace superviseur</a>
						<a class="dropdown-item" href="Servlet?action=EspaceAdmin">Espace Admin</a>
				</li>
				<li class="nav-item active">
					<a href="#inscrire" class="nav-link" ><i class="fas fa-user-plus"></i> S'inscrire</a>
				</li>
				<li class="nav-item active">
					<a href="Servlet?action=Questions" class="nav-link" ><i class="fas fa-question-circle"></i>Questions</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-globe"></i> langue	
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a href="Servlet?action=changeLang&lang=en" class="dropdown-item" id="fr" >English</a>
						<a href="Servlet?action=changeLang&lang=fr" class="dropdown-item" id="fr" >Français</a>
						<a href="Servlet?action=changeLang&lang=ar" class="dropdown-item" id="fr" >العربية</a>
					</div>
				</li>				
			</ul>			
		</div>
	 </c:otherwise>
</c:choose>
	</nav>
	<!-- END NAVIGATION-->
	
		<!-- Start Slides Section -->
</div>
<div><br><br></div>

<div id="hero" style="background-image: url(Style/img/image/couver1.jpg) ">
                       <div class="herograd"></div>
                    <div class="container wh"> 
                        <div id="herotxt">
                            <c:if test="${sessionScope.lang == 'en'}"><div id="herocap">Let's be part of your success !</div></c:if>
                            <c:if test="${sessionScope.lang == 'fr'}"><div id="herocap">Faisons partie de votre succès !</div></c:if>
                            <c:if test="${sessionScope.lang == 'ar'}"><div id="herocap">! لنكن جزءا من نجاحك </div></c:if>
                            <div id="heroline"></div>
                            <div id="herosearch" class="clearer">
                                <form action="Servlet" method="POST">
                                 	<c:if test="${sessionScope.lang == 'en'}"> <input id="trackid" type="number" name ="ll" placeholder="Enter Tracking Number Here"/></c:if>
                                   <c:if test="${sessionScope.lang == 'fr'}"> <input id="trackid" type="number" name ="ll" placeholder="Saisissez votre numéro d’expédition"/></c:if>
                                   <c:if test="${sessionScope.lang == 'ar'}"> <input id="trackid" type="number"  name ="ll" placeholder="رقم تتبع"/></c:if>
                                   <c:if test="${sessionScope.lang == 'en'}"> <button id ="submit" name="action" value="Track">Track Parcel </button></c:if>
                                   <c:if test="${sessionScope.lang == 'fr'}"> <button id ="submit" name="action" value="Track">Suivre</button></c:if>
                                   <c:if test="${sessionScope.lang == 'ar'}"> <button id ="submit" name="action" value="Track">تتبع</button></c:if>
                                </form>
                            </div>
                            <div id="herohr"></div>
                           
                        </div>
                    </div>
                </div>
              <!--  end EN home-->

			
<!-- End Course Section -->	
</div>
<!--End home section-->

<!-- Start Course Section -->
<!-- Start Features Section -->
<!--<div id="Features" class="offset">-->
	<!--Start Jumbotron-->
	<div id="inscrire">
	<div class="jumbotron" >	
			<div class="col-12 text-center"><br>
				<c:if test="${sessionScope.lang == 'en'}"><h3 class="heading" >OPEN AN ACCOUNT</h3></c:if>
				<c:if test="${sessionScope.lang == 'fr'}"><h3 class="heading" >Ouvrir un compte</h3></c:if>
				<c:if test="${sessionScope.lang == 'ar'}"><h3 class="heading" id="account"></h3></c:if>
				<div class="heading-underline"></div>
			</div>
			<!-- Start row-->
				<div class="responsivee">
				  <div class="gallery"><a href="Servlet?action=InscriptionClient" >
				      <img src="Style/img/image/client1.jpg" >
				    </a>
				    <div class="desc"  ><a href="Servlet?action=InscriptionClient" style='text-decoration: none;' id="customer_account">Compte Client</a></div>
				  </div>
				</div>
				
				<div class="responsivee">
				  <div class="gallery">
				  <a href="Servlet?action=InscriptionDistributeur">
				      <img src="Style/img/image/carfin.jpg">
				    </a>
				    <div class="desc"  ><a href="Servlet?action=InscriptionDistributeur" style='text-decoration: none;' id="distributor_account" >Compte Chauffeur</a></div>
				  </div>
				</div>
				<div class="responsivee">
				  <div class="gallery">
				    <a href="Servlet?action=InscriptionAgent" >
				      <img src="Style/img/image/agent.jpg">
				    </a>
				    <div class="desc"  style='text-decoration: none;' id="agent_account"> <a href="Servlet?action=InscriptionAgent"> Compte Agent</a></div>
				  </div>
				</div>
							<!-- End row-->
						
					</div>
					</div>
				<a>  .  . </a>
					<!--End Jumbotron-->
	<!--- ********************************************* Advantage ******************************************-->
            
            <div id="adv">
                <c:if test="${sessionScope.lang == 'en'}">  <div id="advh"><a> <span class="corg">YAQOUTE</span> ADVANTAGE</a></div></c:if>
                <c:if test="${sessionScope.lang == 'fr'}">  <div id="advh"><a>L'AVANTAGE <span class="corg">YAQOUTE</span></a></div></c:if>
                <c:if test="${sessionScope.lang == 'ar'}">  <div id="advh"><a>    مميزات   <span class="corg">ياقوت</span></a></div></c:if>
                <div class="clearer">
                    <div id ="box1" class="cont25">
                        <div class="boxhead">
                            <div class="boxico" id="boxico1" style="background-image:url(Style/image_az/icoflexw.svg)"></div>
                           <c:if test="${sessionScope.lang == 'en'}"> <div class="boxheadtxt"><span class="corgw">The Best  </span><br><span class="">Price</span></div></c:if>
                       		<c:if test="${sessionScope.lang == 'fr'}"> <div class="boxheadtxt"><span class="corgw">Le Meilleur </span><br><span class="">Prix</span></div></c:if>
                        	<c:if test="${sessionScope.lang == 'ar'}"><div class="boxheadtxt"><span class="corgw">أفضل </span><br><span class="">الأسعار</span></div></c:if>
                        </div>
                        <div>
                                <ul class="boxlist">
                                  <c:if test="${sessionScope.lang == 'en'}"> <li style="text-align: justify">We offer to our customers the fastest transportation and delivery mechanisms within the global market standards in addition to our keenness to provide offers and discounts to our customers in all countries and regions as we provide many free services that contribute to facilitate the transport and shipping operations as well as the advantage of entrepreneurs guide in Europe and the Arab countries</li></c:if>
                                    
                                    <c:if test="${sessionScope.lang == 'fr'}">  <li style="text-align: justify">Nous offrons à nos clients les mécanismes de transport et de livraison les plus rapides dans les normes du marché mondial, en plus de notre souci d'offrir des offres et des réductions à nos clients dans tous les pays et régions. </li></c:if>
                                 </ul>
                                 <ul class="boxlist_ar">   
                                   <c:if test="${sessionScope.lang == 'ar'}"><li> 
										<table><tr><td align="right">نقدم لعملائنا أسرع اليات النقل والتوصيل ضمن معايير السوق العالمي إضافة الى حرصنا على تقديم العروض والحسومات لعملائنا في جميع الدول والمناطق كما نوفر العديد من الخدمات المجانية التي تساهم في تسهيل عمليات النقل والشحن وكذلك ميزة دليل رواد الاعمال في أوروبا والدول العربية</td></tr></table> 
										
									</li>
									
									</c:if>
                                </ul>
                        </div>
                    </div>
                    <div id ="box2" class="cont25">
                        <div class="boxhead">
                            <div class="boxico" id="boxico2" style="background-image:url(Style/image_az/icofastw.svg)"></div>
                            <c:if test="${sessionScope.lang == 'en'}"><div class="boxheadtxt"><span class="corgw">The FASTER </span><br><span class="">& Closer</span></div></c:if>
                            <c:if test="${sessionScope.lang == 'fr'}"><div class="boxheadtxt"><span class="corgw">Le plus rapide </span><br><span class="">et le plus proche</span></div></c:if>
                            <c:if test="${sessionScope.lang == 'ar'}"><div class="boxheadtxt"><span class="corgw">الأسرع </span><br><span class="">والأقرب</span></div></c:if>
                        </div>
                        <div>
                                <ul class="boxlist">
    					            <c:if test="${sessionScope.lang == 'en'}"> <li style="text-align: justify">What distinguishes our company is always working to develop its services and not only provide services. Since our establishment, our ideas have been aimed at raising the rates of delivery and delivery to the highest levels, especially in commercial transactions and large shipments. 
    					            YAQOUT Cargo relies on covering all regions and regions in Europe and Asia and working on all ideas that help in reducing the obstacles of shipping operations or money transaction.</li></c:if>
                                   <c:if test="${sessionScope.lang == 'fr'}"> <li style="text-align: justify">Ce qui distingue notre entreprise travaille toujours au développement de ses services et pas seulement à ses services. Depuis notre création, nos idées visaient à élever les taux de livraison et de livraison au plus haut niveau, en particulier dans les transactions commerciales et les gros envois. YAQOUT Cargo compte sur toutes les régions d'Europe et d'Asie, ainsi que sur toutes les idées permettant de réduire les obstacles aux opérations d'expédition ou transaction d'argent.</li></c:if>
                                </ul>
                                <ul class="boxlist_ar">   
                                   <c:if test="${sessionScope.lang == 'ar'}"><li  align="right"> 
										ما تتميز به شركتنا هو العمل دائما على تطوير خدماتها وعدم الاكتفاء بتقديم الخدمات وحسب. وقد كانت افكارنا منذ التأسيس تهدف الى رفع معدلات سرعة التوصيل والاستلام الى اعلى مستوياتها لاسيما في التعاملات التجارية والشحنات الكبيرة. تعتمد ياقوت للشحن الى تغطية جميع المناطق والأقاليم في أوروبا واسيا والعمل على جميع الأفكار التي تساعد في الحد من معوقات عمليات الشحن او الحوالات المالية	
									</li>
									
									</c:if>
                                </ul>
                        </div>
                    </div>
                    <div id ="box3" class="cont25">
                        <div class="boxhead">
                            <div class="boxico" id="boxico3" style="background-image:url(Style/image_az/icoecow.svg)"></div>
                            <c:if test="${sessionScope.lang == 'en'}"><div class="boxheadtxt"><span class="corgw">MORE </span><br><span class="">ECONOMICAL</span></div></c:if>
                            <c:if test="${sessionScope.lang == 'fr'}"><div class="boxheadtxt"><span class="corgw">Plus</span><br><span class="">ÉCONOMIQUE</span></div></c:if>
                            <c:if test="${sessionScope.lang == 'ar'}"><div class="boxheadtxt"><span class="corgw">أكثر </span><br><span class=""> اقتصادا </span></div></c:if>
                        </div>
                        <div>
                                <ul class="boxlist">
                                   <c:if test="${sessionScope.lang == 'en'}"> <li style="text-align: justify">Thanks to the mechanization of logistics operations and our economic model, YAQOUT is able to deliver your parcels at very low prices, making the cut cost one of our strongest commitments.</li></c:if>
                                   <c:if test="${sessionScope.lang == 'fr'}"> <li style="text-align: justify">Grâce à la mécanisation des opérations logistiques et à notre modèle économique, YAQOUT est en mesure de vous livrer vos colis à de tout petits prix faisant de l’économie l’un de nos plus forts engagements.</li></c:if>
                                </ul>
                                <ul class="boxlist_ar">   
                                   <c:if test="${sessionScope.lang == 'ar'}"><li  align="right"> 
										    بفضل سيرورة العمليات اللوجستية ونموذج أعمالنا ، فإن شركة ياقوت قادرة على تقديم الطرود الخاصة بك بأسعار منخفضة للغاية ، مما يجعل خفض التكلفة أحد أقوى التزاماتنا	
									</li>							
									</c:if>
                                </ul>
                        </div>
                    </div>
                    <div id ="box4" class="cont25">
                        <div class="boxhead">
                            <div class="boxico" id="boxico4" style="background-image:url(Style/image_az/icosafew.svg)"></div>
                           <c:if test="${sessionScope.lang == 'en'}"> <div class="boxheadtxt"><span class="corgw">MORE </span><br><span class="">SECURE</span></div></c:if>
                           <c:if test="${sessionScope.lang == 'fr'}"> <div class="boxheadtxt"><span class="corgw">PLUS DE</span><br><span class="">SÉCURITÉ</span></div></c:if>
                           <c:if test="${sessionScope.lang == 'ar'}"> <div class="boxheadtxt"><span class="corgw"> أكتر</span><br><span class="">حماية</span></div></c:if>
                        </div>
                        <div>
                                <ul class="boxlist">
                                  <c:if test="${sessionScope.lang == 'en'}">
                                  <li>YAQOUT Shipping Company is your best 
                                  choice in shipping equipment and materials that 
                                  need special attention.</li><li> Our company has dedicated a 
                                  special crew to transport and shipping electronic devices and equipment of commercial and industrial projects to protect them from any damages that may occur with the traditional shipping companies.</li>
                                	</c:if>
                                	<c:if test="${sessionScope.lang== 'fr' }">
                                	<li>YAQOUT Shipping Company est votre meilleur choix pour le matériel 
                                	d’expédition et les matériaux nécessitant une attention particulière.</li>
                                	<li>
                                	 Notre société a affecté une équipe spéciale au transport et à l'expédition
									des appareils électroniques et des équipements de projets commerciaux et industriels afin 
									de les protéger de tout dommage pouvant survenir aux sociétés de transport traditionnelles.</li></c:if>
                                </ul>
                                <ul class="boxlist_ar">   
                                   <c:if test="${sessionScope.lang == 'ar'}"> <li  align="right">
										شركة ياقوت للشحن هي خيارك الأفضل في شحن المعدات والمواد التي تحتاج الى عناية خاصة. خصصت شركتنا طاقما خاصا لنقل وشحن الأجهزة الالكترونية وتجهيزات المشاريع التجارية والصناعية لحمياتها من أي اضرار قد تحصل مع شركات الشحن التقليدية
									</li></c:if>
                                </ul>
                        </div>
                    </div>
                </div>
            </div>
	
	<!--</div>-->	
<!-- End Course Section -->
<div id="content-slider">
  <div class="wrap-slider">	

    <h1 class="main-title" id="parcours">Le parcours de votre Colis</h1>

    <!-- ===== Thumbnail ControlNav ======= -->			
    <input type="radio" id="a-1" name="a" >			
    <input type="radio" id="a-2" name="a" >			
    <input type="radio" id="a-3" name="a" >
    <input type="radio" id="a-4" name="a" >

    <nav id="main">
      <label for="a-1" class="first"></label>
      <label for="a-2" class="first"></label>
      <label for="a-3" class="first"></label>
      <label for="a-4" class="first"></label>
    </nav>

    <!-- =================================== -->	
    <nav id="control">
      <label for="a-1"></label>
      <label for="a-2"></label>
      <label for="a-3"></label>
      <label for="a-4"></label>
    </nav>

<div class="slider">
    <div class="inset">

      <figure>
        <figcaption class="title-1">
          <h1 id="parcours_1_title"></h1>
          <p id="parcours_1_text"></p>
        
        </figcaption>
        <img src="Style/img/image/step1.png" alt="" id="i-1" class="f">						
      </figure>

      <figure>
        <figcaption class="title-2">
          <h1 id="parcours_2_title"></h1>
          <p id="parcours_2_text"></p>
          
        </figcaption>
        <img src="Style/img/image/step2.png" alt="" id="i-2" class="f">						
      </figure>

      <figure>
        <figcaption class="title-3">
          <h1 id="parcours_3_title"></h1> 
          <p id="parcours_3_text"></p> 
          
        </figcaption>
        <img src="Style/img/image/step3.jpg" alt="" id="i-3" class="f">						
      </figure>

      <figure>
        <figcaption class="title-4">
          <h1 id="parcours_4_title"></h1>
          <p id="parcours_4_text"></p>
          
        </figcaption>
        <img src="Style/img/image/step4.png" alt="" id="i-4" class="f">						
      </figure>	
      <figure>
        <figcaption class="title-4">
          <h1 id="parcours_4_title"></h1>
          <p id="parcours_4_text"></p>
          
        </figcaption>
        <img src="Style/img/image/step1.png" alt="" id="i-4" class="f">						
      </figure>	
	
    </div>
  </div>					

</div>		
</div>



	<c:choose>
  <c:when test = "${sessionScope.lang == 'en'}">
<!-- footer en -->

<div id="footm" style="background-color:	#F4F7F9">
	<div class="container clearer">
    	<div id="footlogo" style=" background-color:#DCDCDC ;background-image:url(Style/image_az/logo.jpeg)"></div>
        <div id="footdesc">
        YAQOUT company is your best choice in shipping. YAQOUT relies on covering all regions and regions in Europe and Asia and working on all ideas that help in reducing shipping obstacles.
        Also YAQOUT is the most simple, economical and fast delivery solution
        </div>
    </div>
    <div class="container clearer" style="margin-top:40px;">
    		<ul id="fmenud">
    			<li class="pageid1"><a href="#inscrire">Your space</a></li>
                <li class="pageid2"><a href="Servlet?action=track">Track Parcel</a></li><a href="Servlet?action=track">
                </a><li class="pageid4"><a href="Servlet?action=Questions">Your Questions</a></li><a href="Servlet?action=Questions">
                </a><li class="pageid5"><a href="#">Contact</a></li><a href="#">
                </a>
            </ul>
             <div style="display:inline-block;vertical-align:top" class="ficos">
                <div class="finfo"><div class="ficon address" style="background-image:url(Style/image_az/address.svg)"></div><div class="finfotext"><span style="color:#444">Adresse</span><br><span style="letter-spacing:0px;">Plateforme logistique YAQOUT</span></div></div><div class="breaker"></div>
                <div class="finfo"><div class="ficon email" style="background-image:url(Style/image_az/email.svg)"></div><a href="#"><div class="finfotext"><span style="color:#444">Email</span><br><span style="letter-spacing:0px;">info@yaqoutcargo.com</span></div></a></div>
                <div class="finfo"><div class="ficon phone" style="background-image:url(Style/image_az/phone.svg)"></div><div class="finfotext"><span style="color:#444">Mobile</span><br><a href="tel:2120522224041"><span style="letter-spacing:0px;">+90 552 6303 063 </span></a></div></div>
                 <div class="finfo" ><a href="https://www.facebook.com/pg/Yaqoutforcargo/posts/" ><i class="fab fa-facebook-square fa-3x"></i></a></div>
                <div class="finfo"><a href="https://www.instagram.com/yaqoutcargo/" ><i class="fab fa-instagram fa-3x" ></i></a></div>
                <div class="finfo"><a href="https://www.youtube.com/channel/UCD6Lq5tcO4SC4FTI5uOZLtA?view_as=subscriber" ><i class="fab fa-youtube fa-3x"></i></a></div>  
                </div>
    </div>
</div>

<div id="footer" class="container">
© Copyrights <span id="fyear"> 2019</span> YAQOUT. All trademarks, service marks, trade names, trade dress, product names and logos appearing on the site are the property of their respective owners.
Any rights not expressly granted herein are reserved.</div>
	  </c:when>
	  <c:when test = "${sessionScope.lang == 'fr'}">	
			 <!-- footer-->
    <div id="footm" style="background-color:	#F4F7F9 ">
        <div class="container clearer">
            <div id="footlogo" style=" background-color:#DCDCDC; background-image:url(Style/image_az/logo.jpeg)"></div>
            <div id="footdesc">
				YAQOUT est votre meilleur choix pour expédie vos colis. YAQOUT compte couvrir toutes les régions et régions d'Europe et d'Asie et travailler sur toutes les idées permettant de réduire les obstacles au transport.
 				Aussi YAQOUT est la solution de livraison la plus simple, économique et rapide.       
        </div>
        <div class="container clearer" style="margin-top:40px;">
                <ul id="fmenud">
                    <li class="pageid1"><a href="#inscrire">Votre espace</a></li>
                    <li class="pageid2"><a href="Servlet?action=track">SUIVI DE COLIS</a></li><a href="Servlet?action=track">
                    </a><li class="pageid4"><a href="#"></a><a href="Servlet?action=Questions">Vos Questions</a></li><a href="Servlet?action=Questions">
                    </a><li class="pageid5"><a href="Servlet?action=Questions"></a><a href="Servlet">Contact</a></li><a href="#">
                    </a>
                </ul>
                <div style="display:inline-block;vertical-align:top" class="ficos">
                <div class="finfo"><div class="ficon address" style="background-image:url(Style/image_az/address.svg)"></div><div class="finfotext"><span style="color:#444">Adresse</span><br><span style="letter-spacing:0px;">Plateforme logistique ONCF </span></div></div><div class="breaker"></div>
                <div class="finfo"><div class="ficon email" style="background-image:url(Style/image_az/email.svg)"></div><a href="#"><div class="finfotext"><span style="color:#444">Email</span><br><span style="letter-spacing:0px;">info@yaqoutcargo.com</span></div></a></div>
                <div class="finfo"><div class="ficon phone" style="background-image:url(Style/image_az/phone.svg)"></div><div class="finfotext"><span style="color:#444">Mobile</span><br><a href="tel:2120522224041"><span style="letter-spacing:0px;">+90 552 6303 063 </span></a></div></div>
                <div class="finfo" ><a href="https://https://www.facebook.com/pg/Yaqoutforcargo/posts/" ><i class="fab fa-facebook-square fa-3x"></i></a></div>
                <div class="finfo"><a href="https://www.instagram.com/yaqoutcargo/" ><i class="fab fa-instagram fa-3x" ></i></a></div>
                <div class="finfo"><a href="https://www.youtube.com/channel/UCD6Lq5tcO4SC4FTI5uOZLtA?view_as=subscriber" ><i class="fab fa-youtube fa-3x"></i></a></div>  
                
                </div>
        </div>
    </div>
    <div id="footer" class="container">
© Copyrights <span id="fyear">2019</span> YAQOUT. Toutes les marques de commerce, marques de service, noms commerciaux, présentations commerciales, noms de produits et logos apparaissant sur le site sont la propriété de leurs propriétaires respectifs.<br>
Tous les droits non expressément accordés ici sont réservés.</div>
	</c:when>
	 <c:when test = "${sessionScope.lang == 'ar'}">
	     <div id="footm" style="background-color:	#F4F7F9">
        <div class="container clearer">
            <div id="footlogo" style=" background-color: #DCDCDC;background-image:url(Style/image_az/logo.jpeg);"></div>
            <div id="footdesc">
            <div align="right">
          <i style="text-align: right">  شركة    ياقوت  هي خيارك الأفضل في شحن  , تعتمد   شركة    ياقوت    الى تغطية جميع المناطق والأقاليم في أوروبا واسيا والعمل على جميع الأفكار التي تساعد في الحد من معوقات عمليات الشحن </i>
             <i style="text-align: right">  هو الحل الأكثر بسيطة واقتصادية وسريعة التسليم</i>   
            </div></div>
        </div>
        <div class="container clearer" style="margin-top:40px;">
                <ul id="fmenud">
                    <li class="pageid1"><a href="#inscrire"> الفضاء الخاص بك	 </a></li>
                    <li class="pageid2"><a href="Servlet?action=track">تتبع طلبك</a></li>
                    <li class="pageid4"><a href="Servlet?action=Questions">أسئلتكم</a></li>
                    <li class="pageid5"><a href="#">تواصل معنا</a></li>
                </ul>
                <div style="display:inline-block;vertical-align:top" class="ficos">
                <div class="finfo"><div class="ficon address" style="background-image:url(Style/image_az/address.svg)"></div><div class="finfotext"><span style="color:#444">عنوان</span><br><span style="letter-spacing:0px;">منصة الخدمات اللوجستية YAQOUT</span></div></div><div class="breaker"></div>
                <div class="finfo"><div class="ficon email" style="background-image:url(Style/image_az/email.svg)"></div><a href="#"><div class="finfotext"><span style="color:#444">البريد الإلكتروني </span><br><span style="letter-spacing:0px;">info@yaqoutcargo.com</span></div></a></div>
                <div class="finfo"><div class="ficon phone" style="background-image:url(Style/image_az/phone.svg)"></div><div class="finfotext"><span style="color:#444">هاتف</span><br><a href="tel:2120522224041"><span style="letter-spacing:0px;">+90 552 6303 063 </span></a></div></div>
               <!-- Reseaux social -->
                <div class="finfo" ><a href="https://www.facebook.com/pg/Yaqoutforcargo/posts/" ><i class="fab fa-facebook-square fa-3x"></i></a></div>
                <div class="finfo"><a href="https://www.instagram.com/yaqoutcargo/" ><i class="fab fa-instagram fa-3x" ></i></a></div>
                <div class="finfo"><a href="https://www.youtube.com/channel/UCD6Lq5tcO4SC4FTI5uOZLtA?view_as=subscriber" ><i class="fab fa-youtube fa-3x"></i></a></div>  
                
                </div>
        </div>
    </div>
	 <div id="footer" class="container" align="right">
		  .2019 YAQOUT حقوق النشر  © <br>
		 . جميع العلامات التجارية وعلامات الخدمة والأسماء التجارية والملابس الرسمية وأسماء المنتجات والشعارات التي تظهر على الموقع هي ملك لأصحابها المعنيين
</div>
	 </c:when>
</c:choose>
<!-- End footer Section -->
<!--- Script Source Files -->
<script src="Style/js/jquery-3.3.1.min.js"></script>
<script src="Style/bootstrap/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.5.0/js/all.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<c:if test = "${sessionScope.lang == 'en'}">
<script src="Style/js/scriptLangEn.js"></script>
 </c:if>
 <c:if test = "${sessionScope.lang == 'ar'}">
<script src="Style/js/scriptLangAr.js"></script>
 </c:if>
  <c:if test = "${sessionScope.lang == 'fr'}">
<script src="Style/js/scriptLangFr.js"></script>
 </c:if>

<!--- End of Script Source Files -->
<c:if test = "${ok == 'ok'}">
<script type="text/javascript">
	 alert("Create successfully")
</script>
</c:if>

</body>
</html>
