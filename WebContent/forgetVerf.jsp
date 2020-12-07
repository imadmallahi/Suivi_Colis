<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport" />

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<!-- Favicons -->
<link rel="apple-touch-icon" href="assetsss/img/apple-icon.png">
<link rel="icon" href="assetsss/img/favicon.png">
<link rel="stylesheet" type="text/css" href="icon/logo.css" />


<title><c:choose>
		<c:when test="${sessionScope.lang == 'en'}"> Forget </c:when>
		<c:when test="${sessionScope.lang == 'fr'}"> Oublier </c:when>
		<c:otherwise> نسيت   </c:otherwise>
	</c:choose></title>


<!-- add link nav bar -->

<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="Style/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="Style/styleAcceuil.css">
<link rel="stylesheet" href="Style/css/fixed.css">
<link rel="stylesheet" href="Style/styleAz.css">

<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<!-- end link -->

</head>

<body style="background: white">

	<!--start home section-->
	<div id="home">
		<!-- start navbar -->
		<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">

			<c:choose>
				<c:when test="${sessionScope.lang == 'en'}">
					<a class="navbar-brand" href="Servlet"><img src="Style/img/logo.jpeg"></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarResponsive">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarResponsive">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item active"><a class="nav-link" href="#"></a>
							</li>

							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"><i id="espace" class="fas fa-users"></i>
									your space </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="Servlet?action=EspaceClient">Customer
									</a> <a class="dropdown-item" href="Servlet?action=EspaceAgent">Agent
									</a> <a class="dropdown-item"
										href="Servlet?action=EspaceDistributeur">Distributor </a> <a
										class="dropdown-item" href="Servlet?action=EspaceSuperviseur">Supervisor
									</a> <a class="dropdown-item" href="Servlet?action=EspaceAdmin">Admin
									</a></li>

							<li class="nav-item active"><a href="Servlet@action=Acceuil"
								class="nav-link"><i class="fas fa-user-plus"></i> register</a>
							</li>
							<li class="nav-item active"><a
								href="Servlet?action=Questions" class="nav-link"><i
									class="fas fa-question-circle-o"></i>Your Questions</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"><i class="fas fa-globe"></i> language
							</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a href="Servlet?action=changelangt&lang=en"
										class="dropdown-item" id="en">English</a> <a
										href="Servlet?action=changelangt&lang=fr"
										class="dropdown-item" id="fr">Français</a> <a
										href="Servlet?action=changelangt&lang=ar"
										class="dropdown-item" id="ar">العربية</a>

								</div></li>
						</ul>
					</div>
				</c:when>
				<c:when test="${sessionScope.lang == 'ar'}">
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarResponsive">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarResponsive">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">اللغات<i class="fas fa-globe"></i>
							</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a href="Servlet?action=changelangt&lang=en"
										class="dropdown-item" id="fr">English</a> <a
										href="Servlet?action=changelangt&lang=fr"
										class="dropdown-item" id="fr">Français</a> <a
										href="Servlet?action=changelangt&lang=ar"
										class="dropdown-item" id="fr">العربية</a>

								</div></li>
							<li class="nav-item active"><a href="#inscrire"
								class="nav-link">التسجيل<i class="fas fa-user-plus"></i>
							</a></li>
							<li class="nav-item active"><a
								href="Servlet?action=Questions" class="nav-link"><i
									class="fas fa-question-circle-o"></i>أسئلتكم </a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> الفضاء الخاص بك <i id="espace"
									class="fas fa-users"></i>
							</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="Servlet?action=EspaceClient">فضاء
										الزبون</a> <a class="dropdown-item"
										href="Servlet?action=EspaceAgent">فضاء الوكيل</a> <a
										class="dropdown-item" href="Servlet?action=EspaceDistributeur">
										فضاء الموزع </a> <a class="dropdown-item"
										href="Servlet?action=EspaceSuperviseur">فضاء المشرف </a> <a
										class="dropdown-item" href="Servlet?action=EspaceAdmin">فضاء
										المدير </a></li>
						</ul>
					</div>
					<a class="navbar-brand" href="Servlet"><img src="Style/img/logo.jpeg"></a>
				</c:when>
				<c:otherwise>
					<a class="navbar-brand" href="Servlet"><img src="Style/img/logo.jpeg"></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarResponsive">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarResponsive">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"><i id="espace" class="fas fa-users"></i>
									votre espace </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="Servlet?action=EspaceClient">Espace
										client</a> <a class="dropdown-item"
										href="Servlet?action=EspaceAgent">Espace agent</a> <a
										class="dropdown-item" href="Servlet?action=EspaceDistributeur">Espace
										distributeur</a> <a class="dropdown-item"
										href="Servlet?action=EspaceSuperviseur">Espace superviseur</a>
									<a class="dropdown-item" href="Servlet?action=EspaceAdmin">Espace
										Admin</a></li>
							<li class="nav-item active"><a href="#inscrire"
								class="nav-link"><i class="fas fa-user-plus"></i>
									S'inscrire</a></li>
							<li class="nav-item active"><a
								href="Servlet?action=Questions" class="nav-link"><i
									class="fas fa-question-circle-o"></i>Vos Questions</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"><i class="fas fa-globe"></i> langage </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a href="Servlet?action=changelangt&lang=en"
										class="dropdown-item" id="fr">English</a> <a
										href="Servlet?action=changelangt&lang=fr"
										class="dropdown-item" id="fr">Français</a> <a
										href="Servlet?action=changelangt&lang=ar"
										class="dropdown-item" id="fr">العربية</a>
								</div></li>
						</ul>
					</div>
				</c:otherwise>
			</c:choose>
		</nav>

		<!--********************************************* Search ******************************************-->

		<div id="relaysearch" class="container">
			<br> <br>
			<c:choose>
				<c:when test="${sessionScope.lang == 'en'}">
					<div class="relayhead">
						<span class="cblu">Forget </span> the account
					</div>
				</c:when>
				<c:when test="${sessionScope.lang == 'fr'}">
					<div class="relayhead">
						Oublier <span class="cblu">le Compte</span>
					</div>
				</c:when>
				<c:otherwise>
					<div class="relayhead">
						نسيت<span class="cblu"> الحساب</span>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="relayline"></div>
			<section class="book_appointment">
				<div class="col-md-12 col-sm-12 appblack"
					style="margin-bottom: 15px;">
					<div class="trackingform">
						<form action="Servlet" method="POST">
							<div class="form_top">
								<div class="">
									<c:choose>
										<c:when test="${sessionScope.lang == 'en'}">
											<div id="tracktxt">Enter code (check your Email !)</div>
										</c:when>
										<c:when test="${sessionScope.lang == 'fr'}">
											<div id="tracktxt">Saisissez le code (verfier  votre Email !)</div>
										</c:when>
										<c:otherwise>
											<div id="tracktxt">أدخل ريدك الرمز المرسل اليك </div>
										</c:otherwise>
									</c:choose>


									<input type="number" name="number" 
										placeholder="number"  required>
									<input type="password" id="psw" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
									
								</div>
								
								<c:choose>
									<c:when test="${sessionScope.lang == 'en'}">
										<button id="suivre" name="action" value="sendV">Send</button>
									</c:when>
									<c:when test="${sessionScope.lang == 'fr'}">
										<button id="suivre" name="action" value="sendV">Envoyer</button>
									</c:when>
									<c:otherwise>
										<button id="suivre" name="action" value="sendV">ارسال</button>
									</c:otherwise>
								</c:choose>
								<br>
								<c:if test="${etat != null}">
									<center>
										<p style="color: #7E097E; font-size: 20px; font-weight: bold;">
											<c:if test="${sessionScope.lang == 'en'}">  ${message}  </c:if>
											<c:if test="${sessionScope.lang == 'ar'}"> ${message}  </c:if>
											<c:if test="${sessionScope.lang == 'fr'}">  ${message} </c:if>
										</p>
									</center>
								</c:if>
							</div>
						</form>
					</div>
				</div>
			</section>
		</div>
		<!--********************************************* Search Results ******************************************-->
		<div id="trackresults">
			<div class="container" style="background-color: #052e56;">
				<div id="pnum">
					Package Number <span id="num" class="cblu"></span>
				</div>
			</div>
			<div id="timeline" class="clearer">
				<div class="tbar"></div>
				<div class="cont20 tpen" id="track1">
					<div class="tdl">
						<div class="tstep">Step 1</div>
					</div>

					<div class="tdr" style="padding-top: 22px;">
						<div class="trackstatus">Boutique</div>
						<div class="trackdate">
							Shipped : <span class="cblu">2/22/17</span>
						</div>
						<div class="trackdate2">
							Delivered : <span class="cblu">2/22/17</span>
						</div>
						<div class="trackstat">Pending</div>
					</div>
				</div>




				<div class="errordesc">Something went wrong</div>
			</div>
		</div>

		<!--	<div id="footer" class="offset">-->


		<c:choose>
			<c:when test="${sessionScope.lang == 'en'}">
				<!-- footer en -->

				<div id="footm" style="background-color: #F4F7F9">
					<div class="container clearer">
						<div id="footlogo"
							style="background-color: #DCDCDC; background-image: url(Style/image_az/logo.jpeg)"></div>
						<div id="footdesc">YAQOUT, Morocco's leading Pick-up &amp;
							Go store network, is the most complete, fastest, easiest and most
							economical delivery solution. Make your purchases online and have
							it delivered where you choose, without having to move to receive
							your parcels.</div>
					</div>
					<div class="container clearer" style="margin-top: 40px;">
						<ul id="fmenud">
							<li class="pageid1"><a href="#">Your space</a></li>
							<li class="pageid2"><a href="#">Track Parcel</a></li>
							
							<li class="pageid4"><a href="#"></a><a
								href="Servlet?action=Questions">Your Questions</a></li>
							
							<li class="pageid5"><a	href="#">Contact</a></li>
							
						</ul>
						<div style="display: inline-block; vertical-align: top"
							class="ficos">
							<div class="finfo">
								<div class="ficon clock"
									style="background-image: url(Style/image_az/clock.svg)"></div>
								<div class="finfotext">
									<span style="color: #444">Open 6 Days a Week9am to
										9:30pm</span><br>
									<span style="letter-spacing: 0px;">De 9h à 21h30</span>
								</div>
							</div>
							<div class="finfo">
								<div class="ficon address"
									style="background-image: url(Style/image_az/address.svg)"></div>
								<div class="finfotext">
									<span style="color: #444">Adresse</span><br>
									<span style="letter-spacing: 0px;">Plateforme logistique
										ONCF mita - Bd mouley ismail 20000, Aïn Sebaâ - Casablanca</span>
								</div>
							</div>
							<div class="breaker"></div>
							<div class="finfo">
								<div class="ficon email"
									style="background-image: url(Style/image_az/email.svg)"></div>
								<a href="Servlet"><div class="finfotext">
										<span style="color: #444">Email</span><br>
										<span style="letter-spacing: 0px;">contact@YAQOUT.ma</span>
									</div></a>
							</div>
							<div class="finfo">
								<div class="ficon phone"
									style="background-image: url(Style/image_az/phone.svg)"></div>
								<div class="finfotext">
									<span style="color: #444">Mobile</span><br>
									<a href="tel:2120522224041"><span
										style="letter-spacing: 0px;">(212) 06 69 18 37 70 </span></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="footer" class="container">
					© Copyrights <span id="fyear"> 2019</span> YAQOUT. All trademarks,
					service marks, trade names, trade dress, product names and logos
					appearing on the site are the property of their respective owners.
					Any rights not expressly granted herein are reserved.
				</div>
			</c:when>
			<c:when test="${sessionScope.lang == 'fr'}">
				<!-- footer-->
				<div id="footm" style="background-color: #F4F7F9">
					<div class="container clearer">
						<div id="footlogo"
							style="background-color: #DCDCDC; background-image: url(Style/image_az/logo.jpeg)"></div>
						<div id="footdesc">YAQOUT est le 1er réseau de Point Relais
							au Maroc. Pour vos achats en ligne, YAQOUT est la solution de
							livraison la plus simple, économique et rapide. Faites vous
							livrer au plus près de chez vous ou de votre bureau grâce a notre
							réseau qui couvre tout le territoire national, tout en
							bénéficiant d’une large amplitude horaire.</div>
					</div>
					<div class="container clearer" style="margin-top: 40px;">
						<ul id="fmenud">
							<li class="pageid1"><a href="#">Votre espace</a></li>
							<li class="pageid2"><a href="Servlet">SUIVI DE COLIS</a></li>
							
							<li class="pageid4"><a href="#"></a><a
								href="Servlet?action=Questions">Vos Questions</a></li>
							
							<li class="pageid5"><a href="Servlet?action=Questions"></a><a
								href="Servlet">Contact</a></li>
							
						</ul>
						<div style="display: inline-block; vertical-align: top"
							class="ficos">
							<div class="finfo">
								<div class="ficon clock"
									style="background-image: url(Style/image_az/clock.svg)"></div>
								<div class="finfotext">
									<span style="color: #444">Ouvert 6 Jours Par Semaine</span><br>
									<span style="letter-spacing: 0px;">De 9h à 21h30</span>
								</div>
							</div>
							<div class="finfo">
								<div class="ficon address"
									style="background-image: url(Style/image_az/address.svg)"></div>
								<div class="finfotext">
									<span style="color: #444">Adresse</span><br>
									<span style="letter-spacing: 0px;">Plateforme logistique
										ONCF mita - Bd mouley ismail 20000, Aïn Sebaâ - Casablanca</span>
								</div>
							</div>
							<div class="breaker"></div>
							<div class="finfo">
								<div class="ficon email"
									style="background-image: url(Style/image_az/email.svg)"></div>
								<a href="Servlet"><div class="finfotext">
										<span style="color: #444">Email</span><br>
										<span style="letter-spacing: 0px;">contact@YAQOUT.ma</span>
									</div></a>
							</div>
							<div class="finfo">
								<div class="ficon phone"
									style="background-image: url(Style/image_az/phone.svg)"></div>
								<div class="finfotext">
									<span style="color: #444">Mobile</span><br>
									<a href="tel:2120522224041"><span
										style="letter-spacing: 0px;">(212) 06 69 18 34 70 </span></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="footer" class="container">
					© Copyrights <span id="fyear">2019</span> YAQOUT. Toutes les
					marques de commerce, marques de service, noms commerciaux,
					présentations commerciales, noms de produits et logos apparaissant
					sur le site sont la propriété de leurs propriétaires respectifs.<br>
					Tous les droits non expressément accordés ici sont réservés.
				</div>
			</c:when>
			<c:when test="${sessionScope.lang == 'ar'}">
				<div id="footm" style="background-color: #F4F7F9">
					<div class="container clearer">
						<div id="footlogo"
							style="background-color: #DCDCDC; background-image: url(Style/image_az/logo.jpeg);"></div>
						<div id="footdesc">YAQOUT هي أول شبكة ترحيل في المغرب.
							للتسوق عبر الإنترنت ، YAQOUT هو الحل الأكثر بساطة واقتصادية
							وسريعة التسليم. احصل على توصيلك أقرب إلى المنزل أو مكتبك بفضل
							شبكتنا التي تغطي كامل الأراضي الوطنية ، بينما تتمتع بمجموعة واسعة
							من الساعات.</div>
					</div>
					<div class="container clearer" style="margin-top: 40px;">
						<ul id="fmenud">
							<li class="pageid1"><a href="#"> الفضاء الخاص بك </a></li>
							<li class="pageid2"><a href="#">تتبع طلبك</a></li>
							
							<li class="pageid4"><a href="#"></a><a
								href="Servlet?action=Questions">أسئلتكم</a></li>
							
							<li class="pageid5"><a href="Servlet?action=Questions"></a><a
								href="Servlet">تواصل معنا</a></li>
							
						</ul>
						<div style="display: inline-block; vertical-align: top"
							class="ficos">
							<div class="finfo">
								<div class="ficon clock"
									style="background-image: url(Style/image_az/clock.svg)"></div>
								<div class="finfotext">
									<span style="color: #444">مفتوح 6 أيام في أسبوع </span><br>
									<span style="letter-spacing: 0px;">من 9 صباحا إلى 9 مساء
									</span>
								</div>
							</div>
							<div class="finfo">
								<div class="ficon address"
									style="background-image: url(Style/image_az/address.svg)"></div>
								<div class="finfotext">
									<span style="color: #444">عنوان</span><br>
									<span style="letter-spacing: 0px;">منصة الخدمات
										اللوجستية ONCF ميتا عين السبع - الدار البيضاء</span>
								</div>
							</div>
							<div class="breaker"></div>
							<div class="finfo">
								<div class="ficon email"
									style="background-image: url(Style/image_az/email.svg)"></div>
								<a href="Servlet"><div class="finfotext">
										<span style="color: #444">البريد الإلكتروني </span><br>
										<span style="letter-spacing: 0px;">contact@YAQOUT.ma</span>
									</div></a>
							</div>
							<div class="finfo">
								<div class="ficon phone"
									style="background-image: url(Style/image_az/phone.svg)"></div>
								<div class="finfotext">
									<span style="color: #444">هاتف</span><br>
									<a href="tel:2120522224041"><span
										style="letter-spacing: 0px;">(212) 06 69 18 37 70 </span></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="footer" class="container" style="float: right">
					© حقوق النشر <span id="fyear"> 2019 </span> YAQOUT. جميع العلامات
					التجارية وعلامات الخدمة والأسماء التجارية والملابس الرسمية وأسماء
					المنتجات والشعارات التي تظهر على الموقع هي ملك لأصحابها المعنيين.
					محجوزة أي حقوق لا الممنوحة صراحة فيه.
				</div>
			</c:when>
		</c:choose>
		<!-- End footer Section -->
		<!--- Script Source Files -->
		<script src="Style/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="Style/js/track.js"></script>
		<script src="Style/bootstrap/js/bootstrap.min.js"></script>
		<script src="https://use.fontawesome.com/releases/v5.5.0/js/all.js"></script>

		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
		<c:if test="${sessionScope.lang == 'en'}">
			<script src="Style/js/scriptLangEn.js"></script>
		</c:if>
		<c:if test="${sessionScope.lang == 'ar'}">
			<script src="Style/js/scriptLangAr.js"></script>
		</c:if>


		<!--- End of Script Source Files -->
</body>
</html>