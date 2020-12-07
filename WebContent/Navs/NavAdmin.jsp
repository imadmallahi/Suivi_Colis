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
<title><c:if test="${sessionScope.lang == 'en'}"> Admin Space </c:if>
	<c:if test="${sessionScope.lang == 'ar'}"> فضاء المدير</c:if> <c:if
		test="${sessionScope.lang == 'fr'}"> Espace Admin</c:if></title>
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
		<!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
    -->





		<div class="logo">
			<a href="Servlet?action=Admin" class="simple-text logo-mini"> <i
				class="material-icons">home</i>
			</a> <a href="Servlet?action=Admin" class="simple-text logo-normal"> <c:if
					test="${sessionScope.lang == 'en'}"> HOME </c:if> <c:if
					test="${sessionScope.lang == 'ar'}">الصفحة الرئيسية</c:if> <c:if
					test="${sessionScope.lang == 'fr'}"> ACCUEIL</c:if>
			</a>

		</div>

		<div class="sidebar-wrapper">
			<div class="user">
				<div class="photo">
					<img src="assetss/img/faces/marc.jpg" alt="" />
				</div>
				<div class="user-info">
					<a data-toggle="collapse" href="#collapseExample" class="username">
						<span> <c:if test="${sessionScope.lang == 'en'}"> Mr Admin </c:if>

							<c:if test="${sessionScope.lang == 'fr'}"> Mr Admin</c:if> <c:if
								test="${sessionScope.lang == 'ar'}">السيد االمدير</c:if> <b
							class="caret"></b>
					</span>
					</a>
					<div class="collapse" id="collapseExample">
						<ul class="nav">

							<li class="nav-item"><a class="nav-link"
								href="Servlet?action=deconnecter"> <i class="material-icons">power_settings_new</i>
									<span class="sidebar-normal" style="text-transform: lowercase;">
										<c:if test="${sessionScope.lang == 'en'}">Log out</c:if> <c:if
											test="${sessionScope.lang == 'ar'}">تسجيل الخروج</c:if> <c:if
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
							<li class="nav-item ${active21 }  "><a class="nav-link"
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
										<c:if test="${sessionScope.lang == 'en'}">List of Agents</c:if>
										<c:if test="${sessionScope.lang == 'ar'}">قائمة الوكلاء</c:if>
										<c:if test="${sessionScope.lang == 'fr'}">Liste des Agents</c:if>
									</p>
							</a></li>

							<li class="nav-item ${active312}"><a class="nav-link "
								href="Servlet?action=ListSuperviseur"> <i
									class="material-icons">list</i>
									<p style="text-transform: lowercase;">
										<c:if test="${sessionScope.lang == 'en'}">List of Supervisor</c:if>
										<c:if test="${sessionScope.lang == 'ar'}"> قائمة المشرفين </c:if>
										<c:if test="${sessionScope.lang == 'fr'}">Liste des superviseurs</c:if>
									</p>
							</a></li>


							<li class="nav-item ${active4 }"><a class="nav-link"
								href="Servlet?action=ListDistributeur"> <i
									class="material-icons">list</i>
									<p style="text-transform: lowercase;">
										<c:if test="${sessionScope.lang == 'en'}">List of Distributors</c:if>
										<c:if test="${sessionScope.lang == 'ar'}">قائمة الموزعين</c:if>
										<c:if test="${sessionScope.lang == 'fr'}">Liste des Distributeurs</c:if>

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


							<li class="nav-item ${active6 }"><a class="nav-link"
								href="Servlet?action=ListClient"> <i class="material-icons">list</i>
									<p style="text-transform: lowercase;">
										<c:if test="${sessionScope.lang == 'en'}">Customer list</c:if>
										<c:if test="${sessionScope.lang == 'ar'}">قائمة الزبناء</c:if>
										<c:if test="${sessionScope.lang == 'fr'}">Liste de clients</c:if>
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




				<li class="nav-item ${active7 }"><a class="nav-link"
					href="Servlet?action=adduser"> <i class="material-icons">control_point</i>

						<p style="text-transform: lowercase;">
							<c:if test="${sessionScope.lang == 'en'}">Add new account</c:if>

							<c:if test="${sessionScope.lang == 'ar'}">إضافة حساب جديد</c:if>
							<c:if test="${sessionScope.lang == 'fr'}">Ajouter un nouveau compte</c:if>
						</p>
				</a></li>

				<li  class="nav-item ${active71 }"><a class="nav-link "
						href="Servlet?action=reclamation_admin"> <i class="material-icons">warning</i>
							<p style="text-transform: lowercase;">
							<c:if test="${sessionScope.lang == 'en'}">Claim </c:if>
											<c:if test="${sessionScope.lang == 'ar'}">شكايات</c:if>
											<c:if test="${sessionScope.lang == 'fr'}">Réclamation </c:if> </p>
					</a></li>
					
			</ul>
		</div>

	</div>

	<div></div>
	<div></div>

</body>
</html>