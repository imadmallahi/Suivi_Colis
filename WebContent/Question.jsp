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
s

<link rel="stylesheet" type="text/css" href="icon/logo.css" />


<title><c:if test="${sessionScope.lang == 'en'}">  Your Questions ! </c:if>
	<c:if test="${sessionScope.lang == 'fr'}">  Votre Questions ! </c:if> <c:if
		test="${sessionScope.lang == 'ar'}">  أسئلتكم   </c:if></title>


<!-- add link nav bar -->

<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>YAQOUT</title>
<link rel="stylesheet" href="Style/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="Style/styleAcceuil.css">
<link rel="stylesheet" href="Style/css/fixed.css">
<link rel="stylesheet" href="Style/styleAz.css">

<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!-- end link -->
<style>
.xmen {
	margin-left: 200px;
	margin-right: 30px;
}

@media ( max-width : 1200px) {
	.xmen {
		margin-right: 10px;
		margin-left: 10px;
	}
}

.container {
	display: table;
	clear: both;
	width: 100%;
	max-width: 1920px;
	padding-left: 40px;
	padding-right: 40px;
	box-sizing: border-box;
	position: relative;
	margin-left: auto;
	margin-right: auto;
}

.max1280 {
	max-width: 1280px;
	margin-left: auto;
	margin-right: auto;
}

@media ( min-width :1441px) {
	.container {
		padding-left: 80px;
		padding-right: 80px;
	}
}

@media ( max-width :767px) {
	.container {
		padding-left: 30px;
		padding-right: 30px;
	}
}

@media ( max-width :605px) {
	.container {
		padding-left: 20px;
		padding-right: 20px;
	}
}

#relaysearch {
	padding-bottom: 40px;
}

.relayhead {
	font-size: 27px;
	line-height: 27px;
	text-align: center;
	width: 100%;
	padding-bottom: 30px;
	padding-top: 50px;
	font-weight: bold;
	text-transform: uppercase;
}

.relayline {
	height: 5px;
	width: 100px;
	border-radius: 3px;
	background-color: #3ec6f0;
	margin: 0 auto;
	margin-bottom: 30px;
	position: relative;
}

#relaysub {
	text-align: center;
	position: relative;
	margin: 0 auto;
	margin-bottom: 30px;
	line-height: 24px;
	max-width: 1024px;
}

.cblu {
	color: rgb(16, 163, 11);
}

.trackdate .cblu, .trackdate2 .cblu {
	color: white;
}
</style>
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

							<li class="nav-item active"><a href="Servlet?#inscrire"
								class="nav-link"><i class="fas fa-user-plus"></i> register</a></li>
							<li class="nav-item active"><a
								href="Servlet?action=Questions" class="nav-link"><i
									class="fa fa-question-circle"></i> Your Questions</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"><i class="fas fa-globe"></i> language
							</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a href="Servlet?action=changeLangq&lang=en"
										class="dropdown-item" id="en">English</a> <a
										href="Servlet?action=changeLangq&lang=fr"
										class="dropdown-item" id="fr">Français</a> <a
										href="Servlet?action=changeLangq&lang=ar"
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
								aria-expanded="false">اللغات <i class="fas fa-globe"></i>
							</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a href="Servlet?action=changeLangq&lang=en"
										class="dropdown-item" id="fr">English</a> <a
										href="Servlet?action=changeLangq&lang=fr"
										class="dropdown-item" id="fr">Français</a> <a
										href="Servlet?action=changeLangq&lang=ar"
										class="dropdown-item" id="fr">العربية</a>

								</div></li>
							<li class="nav-item active"><a href="Servlet?#inscrire"
								class="nav-link">التسجيل <i class="fas fa-user-plus"></i>
							</a></li>
							<li class="nav-item active"><a
								href="Servlet?action=Questions" class="nav-link"> أسئلتكم <i
									class="fa fa-question-circle"></i>
							</a></li>
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
							<li class="nav-item active"><a href="Servlet?#inscrire"
								class="nav-link"><i class="fas fa-user-plus"></i> S'inscrire</a></li>
							<li class="nav-item active"><a
								href="Servlet?action=Questions" class="nav-link"><i
									class="fa fa-question-circle"></i> Vos Questions</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"><i class="fas fa-globe"></i> langage </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a href="Servlet?action=changeLangq&lang=en"
										class="dropdown-item" id="fr">English</a> <a
										href="Servlet?action=changeLangq&lang=fr"
										class="dropdown-item" id="fr">Français</a> <a
										href="Servlet?action=changeLangq&lang=ar"
										class="dropdown-item" id="fr">العربية</a>
								</div></li>
						</ul>
					</div>
				</c:otherwise>
			</c:choose>
		</nav>
		<!-- END NAVIGATION-->
		<div class="xmen">
			<div class="row">
				<div class="col-md-10">

					<div id="relaysearch" class="container max1280">

						<c:if test="${sessionScope.lang == 'en'}">
							<div class="relayhead">
								Your <span class="cblu">Questions</span>
							</div>
						</c:if>
						<c:if test="${sessionScope.lang == 'fr'}">
							<div class="relayhead">
								Votre <span class="cblu">Questions</span>
							</div>
						</c:if>
						<c:if test="${sessionScope.lang == 'ar'}">
							<div class="relayhead">
								<span class="cblu">أسئلتكم</span>
							</div>
						</c:if>
						<div class="relayline"></div>

						<div class="card">

							<div class="card-body">
								<div id="accordion" role="tablist">
									<div class="card-collapse">
										<div class="card-header"
											style="cursor: pointer; background: #F4F7F9" role="tab"
											id="headingOne">
											<h5 class="mb-0">

												<c:if test="${sessionScope.lang == 'ar'}">
													<p data-toggle="collapse" href="#collapseOne"
														aria-expanded="false" aria-controls="collapseOne"
														class="collapsed" style="text-align: right;">
														<i class="material-icons">keyboard_arrow_down</i> كيف
														يمكنني تسليم الطرود الخاصة بي باستخدام خدمة ؟
												</c:if>
												<c:if test="${sessionScope.lang == 'en'}">
													<p data-toggle="collapse" href="#collapseOne"
														aria-expanded="false" aria-controls="collapseOne"
														class="collapsed">
														How can I get my parcel delivered using the YAQOUT
														service? <i class="material-icons">keyboard_arrow_down</i>
												</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">
													<p data-toggle="collapse" href="#collapseOne"
														aria-expanded="false" aria-controls="collapseOne"
														class="collapsed">
														Comment puis-je me faire livrer mon colis en utilisant le
														service YAQOUT ? <i class="material-icons">keyboard_arrow_down</i>
												</c:if>

												</p>
											</h5>
										</div>
										<div id="collapseOne" class="collapse" role="tabpanel"
											aria-labelledby="headingOne" data-parent="#accordion"
											style="">

											<c:if test="${sessionScope.lang == 'ar'}">
												<div class="card-body" style="text-align: right;">تحقق
													مما إذا كان موقع التاجر الخاص بك يقدم خدمة التوصيل YAQOUT
													Relay Point. ستلاحظ ظهور شعار YAQOUT في زاوية لافتة منصة
													التجارة الإلكترونية. إذا كان الأمر كذلك ، عليك فقط إجراء
													عمليات الشراء كما تفعل عادةً. في نهاية طلبك ، وبوضع اللمسات
													الأخيرة على سلة التسوق الخاصة بك ، سيُعرض عليك تسليم نقطة
													ترحيل. انت هناك! ابحث عن نقطة الترحيل المناسبة لك عن طريق
													إدخال الرمز البريدي أو اسم مدينتك.
											</c:if>
											<c:if test="${sessionScope.lang == 'en'}">
												<div class="card-body">Verify if your merchant site
													offers the delivery service YAQOUT Relay Point. You will
													notice the YAQOUT logo placed at the corner of the banner
													of the e-commerce platform. If so, you just have to make
													your purchases as you usually do. At the end of your order,
													and by finalizing your basket, you will be offered to have
													a relay point delivery. You are there! Just find the Relay
													Point that's suitable for you by entering your zip code or
													your city name.
											</c:if>
											<c:if test="${sessionScope.lang == 'fr'}">
												<div class="card-body">Vérifiez que votre site
													marchand propose le service de livraison en Point Relais
													YAQOUT. Vous remarquerez le logo de YAQOUT placé au coin de
													la bannière de la plateforme e-commerce. Si c’est le cas,
													vous n’avez qu’à opérer vos achats comme vous avez
													l’habitude de le faire. À la fin de votre commande, et en
													finalisant votre panier, il vous sera proposé de vous faire
													livrer en point relais. Vous y êtes ! Il vous suffit de
													déterminer le Point Relais qui vous convient en entrant
													votre code postal ou le nom de votre ville.
											</c:if>
										</div>
									</div>
								</div>
								<div class="card-collapse">
									<div class="card-header"
										style="cursor: pointer; background: #F4F7F9" role="tab"
										id="headingTwo">
										<h5 class="mb-0">

											<c:if test="${sessionScope.lang == 'ar'}">
												<p class="collapsed" data-toggle="collapse"
													style="text-align: right;" href="#collapseTwo"
													aria-expanded="false" aria-controls="collapseTwo">
													<i class="material-icons">keyboard_arrow_down</i> كيف
													يمكنني تتبع الطرد الخاصة بي ؟
											</c:if>
											<c:if test="${sessionScope.lang == 'en'}">
												<p class="collapsed" data-toggle="collapse"
													href="#collapseTwo" aria-expanded="false"
													aria-controls="collapseTwo">
													How can I track my package? <i class="material-icons">keyboard_arrow_down</i>
											</c:if>
											<c:if test="${sessionScope.lang == 'fr'}">
												<p class="collapsed" data-toggle="collapse"
													href="#collapseTwo" aria-expanded="false"
													aria-controls="collapseTwo">
													Comment puis-je suivre mon colis ? <i
														class="material-icons">keyboard_arrow_down</i>
											</c:if>

											</p>
										</h5>
									</div>
									<div id="collapseTwo" class="collapse" role="tabpanel"
										aria-labelledby="headingTwo" data-parent="#accordion">

										<c:if test="${sessionScope.lang == 'ar'}">
											<div class="card-body" style="text-align: right;">
												بمجرد الانتهاء من الطلب واختيار نقطة الترحيل ، ستتلقى ،
												كخطوة أولى ، رسالة نصية قصيرة تعلمك برحيل طلبك من
												مستودعاتنا. يرجى الاحتفاظ بهذه الرسائل القصيرة لأنها تحتوي
												على رقم التتبع الخاص بك. بمجرد استلام هذا الرقم ، سيكون عليك
												فقط إدخاله في قائمة "تتبع الطرود". سترى تقدم طلبك على
												الدائرة الرقمية ، وسوف تعرف بالضبط أين هو ومتى يصل إلى
												وجهته.
										</c:if>
										<c:if test="${sessionScope.lang == 'en'}">
											<div class="card-body">Once the order is finalized and
												the chosen Relay Point, you will receive, as a first step,
												an SMS informing you of the departure of your order from our
												warehouses. Please keep this SMS as it contains your
												tracking number for your parcel. Once this number has been
												received, you will only have to enter it in the "Parcel
												tracking" menu. You will see the progress of your order on
												the digital circuit, and will know exactly where it is and
												when it arrives at its destination.
										</c:if>
										<c:if test="${sessionScope.lang == 'fr'}">
											<div class="card-body">Une fois la commande finalisée
												et le Point Relais choisi, vous recevrez, dans un premier
												temps, un SMS vous informant du départ de votre commande
												depuis nos entrepôts. Veuillez à préserver ce SMS puisqu’il
												contient votre numéro de suivi de votre colis. Une fois ce
												numéro reçu, vous n’aurez plus qu’à le saisir dans le menu «
												Suivi de colis ». Vous visualiserez la progression de votre
												commande sur le circuit digital, et saurez exactement où
												elle se trouve et quand elle arrivera à destination.
										</c:if>
									</div>
								</div>
							</div>
							<div class="card-collapse">
								<div class="card-header"
									style="cursor: pointer; background: #F4F7F9" role="tab"
									id="headingThree">
									<h5 class="mb-0">

										<c:if test="${sessionScope.lang == 'ar'}">
											<p class="collapsed" data-toggle="collapse"
												style="text-align: right;" href="#collapseThree"
												aria-expanded="false" aria-controls="collapseThree">
												<i class="material-icons">keyboard_arrow_down</i> ماذا تعني
												عبارة "حالة / حالة" الطرد الخاص بي؟
										</c:if>
										<c:if test="${sessionScope.lang == 'en'}">
											<p class="collapsed" data-toggle="collapse"
												href="#collapseThree" aria-expanded="false"
												aria-controls="collapseThree">
												What does the mention "status / status" of my package mean?
												<i class="material-icons">keyboard_arrow_down</i>
										</c:if>
										<c:if test="${sessionScope.lang == 'fr'}">
											<p class="collapsed" data-toggle="collapse"
												href="#collapseThree" aria-expanded="false"
												aria-controls="collapseThree">
												Que veut dire la mention « état/statut » de mon colis ? <i
													class="material-icons">keyboard_arrow_down</i>
										</c:if>

										</p>
									</h5>
								</div>
								<div id="collapseThree" class="collapse" role="tabpanel"
									aria-labelledby="headingThree" data-parent="#accordion">

									<c:if test="${sessionScope.lang == 'ar'}">
										<div class="card-body" style="text-align: right;">تعني
											بيانات الحالة أو الحالة المرحلة التي تكون فيها الحزمة الخاصة
											بك في الدائرة اللوجستية. يسمح لك بتصور التقدم المحرز في توجيه
											طلبك ، وتقدير تاريخ وصوله.
									</c:if>
									<c:if test="${sessionScope.lang == 'en'}">
										<div class="card-body">The status or status statements
											mean the stage at which your package is on the logistics
											circuit. It allows you to visualize the progress of the
											routing of your order, and estimate its date of arrival.
									</c:if>
									<c:if test="${sessionScope.lang == 'fr'}">
										<div class="card-body">Les mentions état ou statut
											signifient l’étape au niveau de laquelle votre colis se
											trouve sur le circuit logistique. Elle vous permet de
											visualiser la progression de l’acheminement de votre
											commande, et estimer son arrivée à destination.
									</c:if>
								</div>
							</div>
						</div>
						<div class="card-collapse">
							<div class="card-header"
								style="cursor: pointer; background: #F4F7F9" role="tab"
								id="headingOne">
								<h5 class="mb-0">

									<c:if test="${sessionScope.lang == 'ar'}">
										<p data-toggle="collapse" style="text-align: right;"
											href="#collapse3" aria-expanded="false"
											aria-controls="collapseOne" class="collapsed">
											<i class="material-icons">keyboard_arrow_down</i> كيف أعرف ما
											إذا كانت الحزمة الخاصة بي قد وصلت إلى نقطة الترحيل التي
											اخترتها؟
									</c:if>
									<c:if test="${sessionScope.lang == 'en'}">
										<p data-toggle="collapse" href="#collapse3"
											aria-expanded="false" aria-controls="collapseOne"
											class="collapsed">
											How to know if my package has arrived at the Relay Point I
											choosed? <i class="material-icons">keyboard_arrow_down</i>
									</c:if>
									<c:if test="${sessionScope.lang == 'fr'}">
										<p data-toggle="collapse" href="#collapse3"
											aria-expanded="false" aria-controls="collapseOne"
											class="collapsed">
											Comment savoir si mon colis est bien arrivé au Point Relais
											que j'ai choisi ? <i class="material-icons">keyboard_arrow_down</i>
									</c:if>
									<i class="material-icons"></i>
									</p>
								</h5>
							</div>
							<div id="collapse3" class="collapse" role="tabpanel"
								aria-labelledby="headingOne" data-parent="#accordion" style="">

								<c:if test="${sessionScope.lang == 'ar'}">
									<div class="card-body" style="text-align: right;">
										<i class="material-icons">keyboard_arrow_down</i> بمجرد وصولك
										إلى وجهتك ، ستتلقى رسالة نصية قصيرة تلقائيًا تخبرك بأن الحزمة
										الخاصة بك في نقطة الترحيل التي حددتها. يمكنك إما التحقق من
										نظام تتبع تكنولوجيا المعلومات أن طلبك موجود بالفعل في الموقع
										المشار إليه ، أو يمكنك استلامه مباشرة عندما تريد.
								</c:if>
								<c:if test="${sessionScope.lang == 'en'}">
									<div class="card-body">
										Once at your destination, you will automatically receive an
										SMS telling you that your package is at the Relay Point you
										selected. You can either check on the IT tracking platform
										that your order is actually at the indicated location, or you
										can directly pick it up when you want. <i
											class="material-icons">keyboard_arrow_down</i>
								</c:if>
								<c:if test="${sessionScope.lang == 'fr'}">
									<div class="card-body">
										Une fois arrivé à destination, vous recevrez automatiquement
										un SMS vous indiquant que votre colis est au Point Relais que
										vous avez sélectionné. Vous pouvez soit vérifier sur la
										plateforme de suivi IT que votre commande est effectivement à
										l’endroit indiqué, ou alors passer directement la récupérer
										quand vous le souhaiterez. <i class="material-icons">keyboard_arrow_down</i>
								</c:if>
							</div>
						</div>
					</div>
					<div class="card-collapse">
						<div class="card-header"
							style="cursor: pointer; background: #F4F7F9" role="tab"
							id="headingOne">
							<h5 class="mb-0">

								<c:if test="${sessionScope.lang == 'ar'}">
									<p data-toggle="collapse" href="#collapse4"
										style="text-align: right;" aria-expanded="false"
										aria-controls="collapseOne" class="collapsed">
										<i class="material-icons">keyboard_arrow_down</i> ؟ YAQOUTما
										المنتجات التي يمكنني طلبها عبر
								</c:if>
								<c:if test="${sessionScope.lang == 'en'}">
									<p data-toggle="collapse" href="#collapse4"
										aria-expanded="false" aria-controls="collapseOne"
										class="collapsed">
										What products can I order via YAQOUT? <i
											class="material-icons">keyboard_arrow_down</i>
								</c:if>
								<c:if test="${sessionScope.lang == 'fr'}">
									<p data-toggle="collapse" href="#collapse4"
										aria-expanded="false" aria-controls="collapseOne"
										class="collapsed">
										Quels produits puis-je me faire livrer via YAQOUT? <i
											class="material-icons">keyboard_arrow_down</i>
								</c:if>

								</p>
							</h5>
						</div>
						<div id="collapse4" class="collapse" role="tabpanel"
							aria-labelledby="headingOne" data-parent="#accordion" style="">

							<c:if test="${sessionScope.lang == 'ar'}">
								<div class="card-body" style="text-align: right;">لن تدعم
									YAQOUT: منتجات قابلة للتلف تتطلب تغليفًا متساوي الحرارة ؛
									البضائع الخاضعة للوائح الوطنية والدولية بشأن المنتجات الخطرة
									مثل المواد القابلة للاشتعال أو المشعة أو السامة. بصرف النظر عن
									هذه الشحنات الحساسة ، يمكن إدارة جميع الطلبات الأخرى بواسطة
									YAQOUT ، والاستفادة من مجموعة كاملة من الخدمات التي يقدمها
									الحل.
							</c:if>
							<c:if test="${sessionScope.lang == 'en'}">
								<div class="card-body">YAQOUT will not support: perishable
									products requiring isothermal packaging; goods subject to
									national and international regulations on dangerous products
									such as flammable, radioactive or toxic materials. Aside from
									these delicate cargoes, all other orders can be managed by
									YAQOUT, and benefit from the full range of services that the
									solution offers.
							</c:if>
							<c:if test="${sessionScope.lang == 'fr'}">
								<div class="card-body">YAQOUT ne prendra pas en charge :
									les produits périssables nécessitant un conditionnement
									isotherme ; les marchandises relevant des réglementations
									nationales et internationales sur les produits dangereux comme
									les matières inflammables, radioactives ou toxiques. Mis à part
									ces cargaisons délicates, toutes les autres commandes peuvent
									être gérées par YAQOUT, et bénéficier de toute la gamme de
									services que la solution propose.
							</c:if>
						</div>
					</div>
				</div>
				<div class="card-collapse">
					<div class="card-header"
						style="cursor: pointer; background: #F4F7F9" role="tab"
						id="headingOne">
						<h5 class="mb-0">

							<c:if test="${sessionScope.lang == 'ar'}">
								<p data-toggle="collapse" href="#collapse5"
									style="text-align: right;" aria-expanded="false"
									aria-controls="collapseOne" class="collapsed">
									<i class="material-icons">keyboard_arrow_down</i> وصلت الحزمة
									الخاصة بي إلى الوكالة ، لكنني لا أريد جمعها ، فماذا أفعل؟
							</c:if>
							<c:if test="${sessionScope.lang == 'en'}">
								<p data-toggle="collapse" href="#collapse5"
									aria-expanded="false" aria-controls="collapseOne"
									class="collapsed">
									My package has arrived in Relay Point, but I do not want to
									collect it, what should I do? <i class="material-icons">keyboard_arrow_down</i>
							</c:if>
							<c:if test="${sessionScope.lang == 'fr'}">
								<p data-toggle="collapse" href="#collapse5"
									aria-expanded="false" aria-controls="collapseOne"
									class="collapsed">
									Mon colis est bien arrivé en Point Relais, mais je ne veux plus
									le récupérer, que dois-je faire ? <i class="material-icons">keyboard_arrow_down</i>
							</c:if>
							</p>
						</h5>
					</div>
					<div id="collapse5" class="collapse" role="tabpanel"
						aria-labelledby="headingOne" data-parent="#accordion" style="">

						<c:if test="${sessionScope.lang == 'ar'}">
							<div class="card-body" style="text-align: right;">في حالة
								الانسحاب أو تغيير رأيك في اللحظة الأخيرة ، يتوفر حلان لك: إما أن
								تترك الحزمة الخاصة بك في نقطة الترحيل حتى تنقضي فترة الحجز
								المقررة (سيتم ذلك تلقائيًا من الطلب إلى تاجرك) الموقع) ، أو تذهب
								إلى نقطة الترحيل المعينة وترفض استلام الحزمة الخاصة بك. نوصي
								بهذا الحل الثاني حتى يتم إخطار موقع التاجر الخاص بك في أقرب وقت
								ممكن برفضك ، والمتابعة ، في أقرب وقت ممكن ، للتبادل أو
								الاسترداد.
						</c:if>
						<c:if test="${sessionScope.lang == 'en'}">
							<div class="card-body">In case of withdrawal or change of
								mind at the last minute, two solutions are available to you:
								either you leave your package at the Relay Point until the
								planned period of custody has elapsed (it will be done automatic
								return from the order to your merchant site), or you go to the
								designated relay point and refuse to receive your package. We
								recommend this second solution so that your merchant site is
								notified as soon as possible of your refusal, and proceed, as
								soon as possible, to exchange or refund.
						</c:if>
						<c:if test="${sessionScope.lang == 'fr'}">
							<div class="card-body">En cas de désistement ou de
								changement d’avis à la dernière minute, deux solutions s’offrent
								à vous : soit vous laissez votre colis au Point Relais jusqu’à
								ce que le délai de garde prévu soit écoulé (il sera procédé au
								renvoi automatique de la commande à votre site marchand), soit
								vous vous rendez au point relais désigné et refusez de
								réceptionner votre colis. Nous recommandons cette deuxième
								solution afin que votre site marchand soit notifié au plus vite
								de votre refus, et procéder, dans les meilleurs délais, à
								l’échange ou au remboursement.
						</c:if>
					</div>
				</div>
			</div>
			<div class="card-collapse">
				<div class="card-header"
					style="cursor: pointer; background: #F4F7F9" role="tab"
					id="headingOne">
					<h5 class="mb-0">

						<c:if test="${sessionScope.lang == 'ar'}">
							<p data-toggle="collapse" href="#collapse6"
								style="text-align: right;" aria-expanded="false"
								aria-controls="collapseOne" class="collapsed">
								<i class="material-icons">keyboard_arrow_down</i> هل يجب أن أدفع
								مقابل الطرد الذي طلبته خلال عملية الاسترداد في نقطة الترحيل؟
						</c:if>
						<c:if test="${sessionScope.lang == 'en'}">
							<p data-toggle="collapse" href="#collapse6" aria-expanded="false"
								aria-controls="collapseOne" class="collapsed">
								Do I have to pay for the parcel I ordered during the recovery in
								the Relay Point? <i class="material-icons">keyboard_arrow_down</i>
						</c:if>
						<c:if test="${sessionScope.lang == 'fr'}">
							<p data-toggle="collapse" href="#collapse6" aria-expanded="false"
								aria-controls="collapseOne" class="collapsed">
								Dois-je payer le colis que j’ai commandé lors de la récupération
								en Point Relais ? <i class="material-icons">keyboard_arrow_down</i>
						</c:if>
						</p>
					</h5>
				</div>
				<div id="collapse6" class="collapse" role="tabpanel"
					aria-labelledby="headingOne" data-parent="#accordion" style="">

					<c:if test="${sessionScope.lang == 'ar'}">
						<div class="card-body" style="text-align: right;">عند
							الانتهاء من سلة التسوق الخاصة بك في موقع التاجر الذي قمت بشرائه ،
							يمكنك اختيار إجراء الدفع في نقطة الترحيل المختارة. سيتم إخطار
							الفرق الموجودة في الموقع باختيارك ، وتنتقل إلى استلام الطرد الخاص
							بك وتسليمه. من ناحية أخرى ، إذا كنت قد قمت بالدفع عبر الإنترنت في
							موقع التاجر الخاص بك ، فسيتم أيضًا إخطار الفرق في نقطة الترحيل
							المختارة ولن يتم طلب أي شيء عند استرداد الطرد.
					</c:if>
					<c:if test="${sessionScope.lang == 'en'}">
						<div class="card-body">When you finalize your shopping cart
							at the merchant site where you made your purchase, you can choose
							to make a payment at the chosen Relay Point. On-site teams will
							be notified of your choice, and proceed to the collection and
							delivery of your package. On the other hand, if you have made the
							online payment at your merchant site, the teams at the chosen
							Relay Point will also be notified, and nothing will be asked when
							the parcel is recovered.
					</c:if>
					<c:if test="${sessionScope.lang == 'fr'}">
						<div class="card-body">Au moment de finaliser votre panier
							au niveau du site marchand où vous avez effectué votre achat,
							vous pouvez choisir d’effectuer un paiement au niveau du Point
							Relais sélectionné. Les équipes sur place seront notifiées de
							votre choix, et procéderont à l’encaissement et à la remise de
							votre colis. Par contre, si vous avez effectué le paiement en
							ligne chez votre site marchand, les équipes au niveau du Point
							Relais choisi seront également notifiées, et rien ne vous sera
							demandé lors de la récupération du colis.
					</c:if>
				</div>
			</div>
		</div>
		<div class="card-collapse">
			<div class="card-header" style="cursor: pointer; background: #F4F7F9"
				role="tab" id="headingOne">
				<h5 class="mb-0">

					<c:if test="${sessionScope.lang == 'ar'}">
						<p data-toggle="collapse" style="text-align: right;"
							href="#collapse7" aria-expanded="false"
							aria-controls="collapseOne" class="collapsed">
							<i class="material-icons">keyboard_arrow_down</i> ما طريقة الدفع
							التي يمكنني استخدامها في وقت التسليم؟
					</c:if>
					<c:if test="${sessionScope.lang == 'en'}">
						<p data-toggle="collapse" href="#collapse7" aria-expanded="false"
							aria-controls="collapseOne" class="collapsed">
							What payment method can I use at the time of delivery? <i
								class="material-icons">keyboard_arrow_down</i>
					</c:if>
					<c:if test="${sessionScope.lang == 'fr'}">
						<p data-toggle="collapse" href="#collapse7" aria-expanded="false"
							aria-controls="collapseOne" class="collapsed">
							Quel moyen de paiement puis-je utiliser au moment de la livraison
							? <i class="material-icons">keyboard_arrow_down</i>
					</c:if>

					</p>
				</h5>
			</div>
			<div id="collapse7" class="collapse" role="tabpanel"
				aria-labelledby="headingOne" data-parent="#accordion" style="">

				<c:if test="${sessionScope.lang == 'ar'}">
					<div class="card-body" style="text-align: right;">يتم تحديد
						وسائل الدفع من خلال الاتفاقات المبرمة مع الشبكات الشريكة. على سبيل
						المثال ، قد تتم مطالبتك بالدفع نظير طلبك فقط نقدًا أو بشيك أو
						كليهما في نفس الوقت.
				</c:if>
				<c:if test="${sessionScope.lang == 'en'}">
					<div class="card-body">The means of payment are determined by
						the agreements made with the partner networks. For example, you
						may be required to pay for your order only in cash, or by check,
						or both at the same time.
				</c:if>
				<c:if test="${sessionScope.lang == 'fr'}">
					<div class="card-body">Les moyens de paiements sont
						déterminés par les accords passés avec les réseaux partenaires. Il
						pourrait vous être demandé, par exemple, de ne régler votre
						commande qu’en espèces, ou que par chèques, ou voire les deux
						simultanément.
				</c:if>
			</div>
		</div>
	</div>
	<div class="card-collapse">
		<div class="card-header" style="cursor: pointer; background: #F4F7F9"
			role="tab" id="headingOne">
			<h5 class="mb-0">

				<c:if test="${sessionScope.lang == 'ar'}">
					<p data-toggle="collapse" style="text-align: right;"
						href="#collapse8" aria-expanded="false"
						aria-controls="collapseOne" class="collapsed">
						<i class="material-icons">keyboard_arrow_down</i> يمكن لشخص آخر
						التقاط الطرود الخاصة بي في مكاني؟
				</c:if>
				<c:if test="${sessionScope.lang == 'en'}">
					<p data-toggle="collapse" href="#collapse8" aria-expanded="false"
						aria-controls="collapseOne" class="collapsed">
						Can someone else pick up my parcel in my place? <i
							class="material-icons">keyboard_arrow_down</i>
				</c:if>
				<c:if test="${sessionScope.lang == 'fr'}">
					<p data-toggle="collapse" href="#collapse8" aria-expanded="false"
						aria-controls="collapseOne" class="collapsed">
						Est-ce qu’une autre personne peut récupérer mon colis à ma place ?
						<i class="material-icons">keyboard_arrow_down</i>
				</c:if>
				<i class="material-icons"></i>
				</p>
			</h5>
		</div>
		<div id="collapse8" class="collapse" role="tabpanel"
			aria-labelledby="headingOne" data-parent="#accordion" style="">

			<c:if test="${sessionScope.lang == 'ar'}">
				<div class="card-body" style="text-align: right;">إذا لم تتمكن
					، لأي سبب من الأسباب ، من الانتقال إلى نقطة الترحيل المختارة
					لاستلام الحزمة الخاصة بك ، يمكنك إرسال طرف ثالث لاستلامها نيابة
					عنك. ومع ذلك ، يجب أن يكون لدى هذا الشخص بطاقة هويته وبطاقتك.
			</c:if>
			<c:if test="${sessionScope.lang == 'en'}">
				<div class="card-body">If, for any reason, you can not go to
					the chosen Relay Point to pick up your package, you can send a
					third party to pick it up on your behalf. However, this person must
					have their identity card and yours.
			</c:if>
			<c:if test="${sessionScope.lang == 'fr'}">
				<div class="card-body">Si, pour une raison quelconque, vous ne
					pouvez pas vous rendre au Point Relais choisi pour récupérer votre
					colis, vous pouvez envoyer une tierce personne le récupérer en
					votre nom. Cette personne doit toutefois être munie de sa pièce
					d’identité ainsi que de la vôtre.
			</c:if>
		</div>
	</div>
	</div>
	<div class="card-collapse">
		<div class="card-header" style="cursor: pointer; background: #F4F7F9"
			role="tab" id="headingOne">
			<h5 class="mb-0">

				<c:if test="${sessionScope.lang == 'ar'}">
					<p data-toggle="collapse" style="text-align: right;"
						href="#collapse9" aria-expanded="false"
						aria-controls="collapseOne" class="collapsed">
						<i class="material-icons">keyboard_arrow_down</i> لم أتلق إشعارًا
						بشأن حالة توجيه الطرود الخاصة بي ، فماذا أفعل؟
				</c:if>
				<c:if test="${sessionScope.lang == 'en'}">
					<p data-toggle="collapse" href="#collapse9" aria-expanded="false"
						aria-controls="collapseOne" class="collapsed">
						I have not received a notification on the state of routing of my
						parcel, what should I do? <i class="material-icons">keyboard_arrow_down</i>
				</c:if>
				<c:if test="${sessionScope.lang == 'fr'}">
					<p data-toggle="collapse" href="#collapse9" aria-expanded="false"
						aria-controls="collapseOne" class="collapsed">
						Je n’ai pas reçu de notification sur l’état d’acheminement de mon
						colis, que dois-je faire ? <i class="material-icons">keyboard_arrow_down</i>
				</c:if>
				</p>
			</h5>
		</div>
		<div id="collapse9" class="collapse" role="tabpanel"
			aria-labelledby="headingOne" data-parent="#accordion" style="">

			<c:if test="${sessionScope.lang == 'ar'}">
				<div class="card-body" style="text-align: right;">إذا واجهت
					عملية التسليم التي تقوم بها وكالة YAQOUT عطلًا يعني أنك لم تتلق
					إخطارًا بشأن إرسال طلبك ، فنحن ندعوك إلى الاتصال بموقع التاجر الخاص
					بك لتقديم المعلومات المتعلقة بهذا الخلل ، وإجراء التعديلات اللازمة
					لذلك أن يتم تفسير طلبك بشكل صحيح من خلال خدماتنا.
			</c:if>
			<c:if test="${sessionScope.lang == 'en'}">
				<div class="card-body">If your delivery operation by Relay
					Point YAQOUT encounters a malfunction that has meant that you have
					not received a notification concerning the sending of your order,
					we invite you to contact your merchant site to provide the
					information relating to this malfunction, and make the necessary
					adjustments so that your order is correctly interpreted by our
					services.
			</c:if>
			<c:if test="${sessionScope.lang == 'fr'}">
				<div class="card-body">Si votre opération de livraison par
					Point Relais YAQOUT rencontre un dysfonctionnement qui a fait que
					vous n’avez pas reçu de notification concernant l’envoi de votre
					commande, nous vous invitons à contacter votre site marchand pour
					fournir les informations relatives à ce dysfonctionnement, et
					procéder aux ajustements nécessaires afin que votre commande soit
					correctement interprétée par nos services.
			</c:if>

		</div>
	</div>
	</div>
	<div class="card-collapse">
		<div class="card-header" style="cursor: pointer; background: #F4F7F9"
			role="tab" id="headingOne">
			<h5 class="mb-0">

				<c:if test="${sessionScope.lang == 'ar'}">
					<p data-toggle="collapse" style="text-align: right;"
						href="#collapse10" aria-expanded="false"
						aria-controls="collapseOne" class="collapsed">
						<i class="material-icons">keyboard_arrow_down</i> طلبي غير مكتمل ،
						ماذا علي أن أفعل؟
				</c:if>
				<c:if test="${sessionScope.lang == 'en'}">
					<p data-toggle="collapse" href="#collapse10" aria-expanded="false"
						aria-controls="collapseOne" class="collapsed">
						My order is incomplete, what should I do? <i
							class="material-icons">keyboard_arrow_down</i>
				</c:if>
				<c:if test="${sessionScope.lang == 'fr'}">
					<p data-toggle="collapse" href="#collapse10" aria-expanded="false"
						aria-controls="collapseOne" class="collapsed">
						Ma commande est incomplète, que dois-je faire ? <i
							class="material-icons">keyboard_arrow_down</i>
				</c:if>
				<i class="material-icons"></i>
				</p>
			</h5>
		</div>
		<div id="collapse10" class="collapse" role="tabpanel"
			aria-labelledby="headingOne" data-parent="#accordion" style="">

			<c:if test="${sessionScope.lang == 'ar'}">
				<div class="card-body" style="text-align: right;">أول ما عليك
					فعله هو الاتصال بموقع التاجر الخاص بك وتقديم جميع التفاصيل اللازمة
					لحل المشكلة. إذا وجدت في مجموعة الطرود الخاصة بك في الوكالة أن
					الحزمة الخاصة بك مفتوحة ، نوصيك بالتحقق من المحتويات قبل الموافقة
					على استلامها.
			</c:if>
			<c:if test="${sessionScope.lang == 'en'}">
				<div class="card-body">The first thing to do is to contact
					your merchant site and provide all the necessary details to solve
					the problem. If at the collection of your parcel at the Relay Point
					you find that your package is open, we recommend that you check the
					contents before accepting to receive it.
			</c:if>
			<c:if test="${sessionScope.lang == 'fr'}">
				<div class="card-body">La première chose à faire est de
					prendre contact avec votre site marchand et lui apporter toutes les
					précisions nécessaires à la résorption du problème. Si à la
					récupération de votre colis en Point Relais vous constatez que
					votre colis est ouvert, nous vous recommandons d’en vérifier le
					contenu avant d’accepter de le réceptionner.
			</c:if>
		</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
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
					<div id="footdesc">YAQOUT, Morocco's leading Pick-up &amp; Go
						store network, is the most complete, fastest, easiest and most
						economical delivery solution. Make your purchases online and have
						it delivered where you choose, without having to move to receive
						your parcels.</div>
				</div>
				<div class="container clearer" style="margin-top: 40px;">
					<ul id="fmenud">
						<li class="pageid1"><a href="#">Your space</a></li>
						<li class="pageid2"><a href="track.html">Track Parcel</a></li>
						<a href="track.html"> </a>
						<li class="pageid4"><a href="#"></a><a
							href="Servlet?action=Questions">Your Questions</a></li>
						<a href="Servlet?action=Questions"> </a>
						<li class="pageid5"><a href="Servlet?action=Questions"></a><a
							href="#">Contact</a></li>
						<a href="#"> </a>
					</ul>
					<div style="display: inline-block; vertical-align: top"
						class="ficos">
						<div class="finfo">
							<div class="ficon clock"
								style="background-image: url(Style/image_az/clock.svg)"></div>
							<div class="finfotext">
								<span style="color: #444">Open 6 Days a Week9am to 9:30pm</span><br>
								<span style="letter-spacing: 0px;">De 9h à 21h30</span>
							</div>
						</div>
						<div class="finfo">
							<div class="ficon address"
								style="background-image: url(Style/image_az/address.svg)"></div>
							<div class="finfotext">
								<span style="color: #444">Adresse</span><br> <span
									style="letter-spacing: 0px;">Plateforme logistique ONCF
									mita - Bd mouley ismail 20000, Aïn Sebaâ - Casablanca</span>
							</div>
						</div>
						<div class="breaker"></div>
						<div class="finfo">
							<div class="ficon email"
								style="background-image: url(Style/image_az/email.svg)"></div>
							<a href="#"><div class="finfotext">
									<span style="color: #444">Email</span><br> <span
										style="letter-spacing: 0px;">contact@YAQOUT.ma</span>
								</div></a>
						</div>
						<div class="finfo">
							<div class="ficon phone"
								style="background-image: url(Style/image_az/phone.svg)"></div>
							<div class="finfotext">
								<span style="color: #444">Mobile</span><br> <a
									href="tel:2120522224041"><span style="letter-spacing: 0px;">(212)
										06 69 18 37 70 </span></a>
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
						livraison la plus simple, économique et rapide. Faites vous livrer
						au plus près de chez vous ou de votre bureau grâce a notre réseau
						qui couvre tout le territoire national, tout en bénéficiant d’une
						large amplitude horaire.</div>
				</div>
				<div class="container clearer" style="margin-top: 40px;">
					<ul id="fmenud">
						<li class="pageid1"><a href="#">Votre espace</a></li>
						<li class="pageid2"><a href="track.html">SUIVI DE COLIS</a></li>
						<a href="track.html"> </a>
						<li class="pageid4"><a href="#"></a><a
							href="Servlet?action=Questions">Vos Questions</a></li>
						<a href="Servlet?action=Questions"> </a>
						<li class="pageid5"><a href="Servlet?action=Questions"></a><a
							href="#">Contact</a></li>
						<a href="#"> </a>
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
								<span style="color: #444">Adresse</span><br> <span
									style="letter-spacing: 0px;">Plateforme logistique ONCF
									mita - Bd mouley ismail 20000, Aïn Sebaâ - Casablanca</span>
							</div>
						</div>
						<div class="breaker"></div>
						<div class="finfo">
							<div class="ficon email"
								style="background-image: url(Style/image_az/email.svg)"></div>
							<a href="#"><div class="finfotext">
									<span style="color: #444">Email</span><br> <span
										style="letter-spacing: 0px;">contact@YAQOUT.ma</span>
								</div></a>
						</div>
						<div class="finfo">
							<div class="ficon phone"
								style="background-image: url(Style/image_az/phone.svg)"></div>
							<div class="finfotext">
								<span style="color: #444">Mobile</span><br> <a
									href="tel:2120522224041"><span style="letter-spacing: 0px;">(212)
										06 69 18 34 70 </span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="footer" class="container">
				© Copyrights <span id="fyear">2019</span> YAQOUT. Toutes les marques
				de commerce, marques de service, noms commerciaux, présentations
				commerciales, noms de produits et logos apparaissant sur le site
				sont la propriété de leurs propriétaires respectifs.<br> Tous
				les droits non expressément accordés ici sont réservés.
			</div>
		</c:when>
		<c:when test="${sessionScope.lang == 'ar'}">
			<div id="footm" style="background-color: #F4F7F9">
				<div class="container clearer">
					<div id="footlogo"
						style="background-color: #DCDCDC; background-image: url(Style/image_az/logo.jpeg);"></div>
					<div id="footdesc" style="text-align: right;">YAQOUT هي أول
						شبكة ترحيل في المغرب. للتسوق عبر الإنترنت ، YAQOUT هو الحل الأكثر
						بساطة واقتصادية وسريعة التسليم. احصل على توصيلك أقرب إلى المنزل أو
						مكتبك بفضل شبكتنا التي تغطي كامل الأراضي الوطنية ، بينما تتمتع
						بمجموعة واسعة من الساعات.</div>
				</div>
				<div class="container clearer" style="margin-top: 40px;">
					<ul id="fmenud">
						<li class="pageid1"><a href="#"> الفضاء الخاص بك </a></li>
						<li class="pageid2"><a href="track.html">تتبع طلبك</a></li>
						<a href="track.html"> </a>
						<li class="pageid4"><a href="#"></a><a
							href="Servlet?action=Questions">أسئلتكم</a></li>
						<a href="Servlet?action=Questions"> </a>
						<li class="pageid5"><a href="Servlet?action=Questions"></a><a
							href="#">تواصل معنا</a></li>
						<a href="#"> </a>
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
								<span style="color: #444">عنوان</span><br> <span
									style="letter-spacing: 0px;">منصة الخدمات اللوجستية ONCF
									ميتا عين السبع - الدار البيضاء</span>
							</div>
						</div>
						<div class="breaker"></div>
						<div class="finfo">
							<div class="ficon email"
								style="background-image: url(Style/image_az/email.svg)"></div>
							<a href="#"><div class="finfotext">
									<span style="color: #444">البريد الإلكتروني </span><br> <span
										style="letter-spacing: 0px;">contact@YAQOUT.ma</span>
								</div></a>
						</div>
						<div class="finfo">
							<div class="ficon phone"
								style="background-image: url(Style/image_az/phone.svg)"></div>
							<div class="finfotext">
								<span style="color: #444">هاتف</span><br> <a
									href="tel:2120522224041"><span style="letter-spacing: 0px;">(212)
										06 69 18 37 70 </span></a>
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


	<!--- End of Script Source Files -->

</body>
<!--   Core JS Files   -->
<script src="assetss/js/core/jquery.min.js"></script>
<script src="assetss/js/core/popper.min.js"></script>
<script src="assetss/js/bootstrap-material-design.min.js"></script>
<!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
</html>