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
<title><c:if test="${sessionScope.lang == 'en'}"> Supervisor Space </c:if>
	<c:if test="${sessionScope.lang == 'ar'}"> فضاء المشرف</c:if> <c:if
		test="${sessionScope.lang == 'fr'}"> Espace Superviseur</c:if></title>
<style type="text/css">
ul li {
	text-transform: lowercase;
}

ul li:first-letter {
	text-transform: capitalize;
}
</style>
</head>
<body class="widget">


	<div class="sidebar" data-color="green" data-background-color="black"
		data-image="assets/img/sidebar-1.jpg">



		<div class="logo">
			<a href="Servlet?action=sup" class="simple-text logo-mini"> <i
				class="material-icons">home</i>
			</a> <a href="Servlet?action=sup" class="simple-text logo-normal"> <c:if
					test="${sessionScope.lang == 'en'}"> HOME </c:if> <c:if
					test="${sessionScope.lang == 'ar'}">الصفحة الرئيسية</c:if> <c:if
					test="${sessionScope.lang == 'fr'}"> ACCUEIL</c:if>
			</a>

		</div>

		<div class="sidebar-wrapper">
			<div class="user">
				<div class="photo">
					<c:if test="${sessionScope.type_account == 'superviseur' }">
						<c:if test="${sessionScope.profil != null}">
							<img class="img"
								src="data:image/jpg;base64,${sessionScope.profil}">
						</c:if>
					</c:if>
				</div>
				<div class="user-info">
					<a data-toggle="collapse" href="#collapseExample" class="username">
						<span> <c:if test="${sessionScope.lang == 'en'}"> Mr </c:if>

							<c:if test="${sessionScope.lang == 'fr'}"> Mr</c:if>

							${sessionScope.name_account} <c:if
								test="${sessionScope.lang == 'ar'}">السيد</c:if> <b
							class="caret"></b>
					</span>
					</a>
					<div class="collapse" id="collapseExample">
						<ul class="nav">
							<li class="nav-item ${active1}"><a class="nav-link"
								href="Servlet?action=profilUser"> <i class="material-icons">face</i>
									<span class="sidebar-normal"> <c:if
											test="${sessionScope.lang == 'en'}"> Profile </c:if> <c:if
											test="${sessionScope.lang == 'ar'}">الملف الشخصي </c:if> <c:if
											test="${sessionScope.lang == 'fr'}"> Profil</c:if>

								</span>
							</a></li>
							<li class="nav-item"><a class="nav-link"
								href="Servlet?action=deconnecter"> <i class="material-icons">power_settings_new</i>
									<span class="sidebar-normal" style="text-transform: lowercase;">
										<c:if test="${sessionScope.lang == 'en'}">Log out</c:if> <c:if
											test="${sessionScope.lang == 'ar'}">سجيل الخروج</c:if> <c:if
											test="${sessionScope.lang == 'fr'}">Déconnecter</c:if>

								</span>
							</a></li>

						</ul>
					</div>
				</div>
			</div>

			<ul class="nav">




				<li class="nav-item ${active2 } "><a class="nav-link"
					data-toggle="collapse" href="#pagesExamples"> <i
						class="material-icons">next_week</i>
						<p style="text-transform: lowercase;">

							<c:if test="${sessionScope.lang == 'en'}">Commands</c:if>
							<c:if test="${sessionScope.lang == 'ar'}">الطلبات</c:if>
							<c:if test="${sessionScope.lang == 'fr'}">Commandes</c:if>
							<b class="caret"></b>
						</p>
				</a>

					<div class="collapse" id="pagesExamples">
						<ul class="nav">
							<li class="nav-item ${active21}"><a class="nav-link"
								href="Servlet?action=ListeCommande"> <i
									class="material-icons">attachment</i> <span
									class="sidebar-normal" style="text-transform: lowercase;">
										<c:if test="${sessionScope.lang == 'en'}">List of Commands </c:if>
										<c:if test="${sessionScope.lang == 'ar'}">قائمة الطلبات</c:if>
										<c:if test="${sessionScope.lang == 'fr'}">Liste des Commandes </c:if>
								</span>
							</a></li>
							<li class="nav-item ${active22 } "><a class="nav-link"
								href="Servlet?action=ListeColis"> <i class="material-icons">attachment</i>
									<span class="sidebar-normal" style="text-transform: lowercase;">
										<c:if test="${sessionScope.lang == 'en'}">List of package</c:if>
										<c:if test="${sessionScope.lang == 'ar'}">قائمة الحزمة</c:if>
										<c:if test="${sessionScope.lang == 'fr'}">Liste de colis</c:if>

								</span>
							</a></li>



						</ul>
					</div></li>

				<li class="nav-item ${active2 } "><a class="nav-link"
					data-toggle="collapse" href="#RH"> <i class="material-icons">collections_bookmark</i>
						<p style="text-transform: lowercase;">
							<c:if test="${sessionScope.lang == 'en'}">Human Resources</c:if>
							<c:if test="${sessionScope.lang == 'ar'}">الموارد البشرية</c:if>
							<c:if test="${sessionScope.lang == 'fr'}">Ressources Humaines</c:if>
							<b class="caret"></b>
						</p>
				</a>

					<div class="collapse" id="RH">
						<ul class="nav">

							<li class="nav-item ${active3 }"><a class="nav-link "
								href="Servlet?action=ListAgent"> <i class="material-icons">list</i>
									<p style="text-transform: lowercase;">
										<c:if test="${sessionScope.lang == 'en'}">Agents List  </c:if>
										<c:if test="${sessionScope.lang == 'ar'}">قائمة الوكلاء</c:if>
										<c:if test="${sessionScope.lang == 'fr'}">Liste des Agents</c:if>
									</p>
							</a></li>



							<li class="nav-item ${active4 }"><a class="nav-link"
								href="Servlet?action=ListDistributeur"> <i
									class="material-icons">list</i>
									<p style="text-transform: lowercase;">
										<c:if test="${sessionScope.lang == 'en'}"> Distributors List </c:if>
										<c:if test="${sessionScope.lang == 'ar'}">قائمة الموزعين</c:if>
										<c:if test="${sessionScope.lang == 'fr'}">Liste des Distributeurs</c:if>

									</p>
							</a></li>


							<li class="nav-item ${active6 }"><a class="nav-link"
								href="Servlet?action=ListClient"> <i class="material-icons">trending_up</i>
									<p style="text-transform: lowercase;">
										<c:if test="${sessionScope.lang == 'en'}">Customer list</c:if>
										<c:if test="${sessionScope.lang == 'ar'}">قائمة الزبناء</c:if>
										<c:if test="${sessionScope.lang == 'fr'}">Liste de clients</c:if>
									</p>
							</a></li>

							<li class="nav-item ${active5 }"><a class="nav-link"
								href="Servlet?action=ListAtt"> <i class="material-icons">list</i>
									<p style="text-transform: lowercase;">
										<c:if test="${sessionScope.lang == 'en'}">Waiting list</c:if>
										<c:if test="${sessionScope.lang == 'ar'}">لائحة الإنتظار</c:if>
										<c:if test="${sessionScope.lang == 'fr'}">Liste d'attente</c:if>
									</p>
							</a></li>
						</ul>
					</div></li>

				<li class="nav-item ${active41 }"><a class="nav-link"
					href="Servlet?action=MapsAgent"> <i class="material-icons">maps</i>
						<p style="text-transform: lowercase;">
							<c:if test="${sessionScope.lang == 'en'}">Agents Location Map</c:if>
							<c:if test="${sessionScope.lang == 'ar'}">خريطة موقع الوكلاء</c:if>
							<c:if test="${sessionScope.lang == 'fr'}">Carte de localisation des agents</c:if>

						</p>
				</a></li>
			</ul>
		</div>
	</div>

	<div></div>
	<div></div>

</body>
</html>