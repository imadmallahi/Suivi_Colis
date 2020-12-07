<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport" />

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>
<c:if test="${sessionScope.lang == 'en'}"> Distributor Space </c:if>
<c:if test="${sessionScope.lang == 'ar'}">فضاء الموزع</c:if>
<c:if test="${sessionScope.lang == 'fr'}"> Espace Distributeur</c:if>
</title>
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
<%
Cookie[] array= request.getCookies(); 
for(int i=0; i<array.length; i++)
{


//Deleting the cookie
array[i].setMaxAge(0);
response.addCookie(array[i]); //After this, although cookie will be not be visible from browser's memory
			      //but Cookie data will still be visible until you refresh this page.


}


%>

	<div class="sidebar" data-color="green" data-background-color="black"
		data-image="assets/img/sidebar-1.jpg">
	

			<div class="logo">
				<a href="Servlet" class="simple-text logo-mini">
            		<i class="material-icons">home</i>
       				 </a>
       			 <a href="Servlet" class="simple-text logo-normal">
             <c:if test="${sessionScope.lang == 'en'}"> HOME </c:if>
							<c:if test="${sessionScope.lang == 'ar'}">الصفحة الرئيسية</c:if>
							<c:if test="${sessionScope.lang == 'fr'}"> ACCUEIL</c:if>
        </a>

			</div>

			<div class="sidebar-wrapper">
				<div class="user">
					<div class="photo">
 <c:if	test="${sessionScope.type_account == 'distributeur' }">
												<c:if test="${sessionScope.profil != null}">
													<img class="img" src="data:image/jpg;base64,${sessionScope.profil}">
												</c:if>												
										</c:if> 
											</div>
					<div class="user-info">
						<a data-toggle="collapse" href="#collapseExample" class="username">
							<span> 	<c:if test="${sessionScope.lang == 'en'}"> Mr </c:if>
							<c:if test="${sessionScope.lang == 'ar'}">السيد</c:if>
							<c:if test="${sessionScope.lang == 'fr'}"> Mr</c:if>
								 
								 ${sessionScope.name_account} <b class="caret"></b>
						</span>
						</a>
						<div class="collapse" id="collapseExample">
							<ul class="nav">
								<li class="nav-item ${active1}"><a class="nav-link"
									href="Servlet?action=personDistributeur"> <i class="material-icons">face</i>
										<span class="sidebar-normal"> 
											<c:if test="${sessionScope.lang == 'en'}"> Profile </c:if>
											<c:if test="${sessionScope.lang == 'ar'}">الملف الشخصي </c:if>
											<c:if test="${sessionScope.lang == 'fr'}"> Profil</c:if>
												
												 </span>
								</a></li>
								 <li class="nav-item ${active10}"><a class="nav-link"
										href="Servlet?action=updateProfileDistributeur"> <i class="material-icons">face</i>
											<span class="sidebar-normal">
											<c:if test="${sessionScope.lang == 'en'}">Update Profile </c:if>
											<c:if test="${sessionScope.lang == 'ar'}">تحديث الملف الشخصي</c:if>
											<c:if test="${sessionScope.lang == 'fr'}">mise à jour de Profil </c:if>
											  </span>
									</a></li>
								<li class="nav-item"><a class="nav-link"
									href="Servlet?action=deconnecter"> <i
										class="material-icons">power_settings_new</i> <span
										class="sidebar-normal" style="text-transform: lowercase;">
											<c:if test="${sessionScope.lang == 'en'}">Log out</c:if>
											<c:if test="${sessionScope.lang == 'ar'}">سجيل الخروج</c:if>
											<c:if test="${sessionScope.lang == 'fr'}">Déconnecter</c:if>
											 </span>
								</a></li>

							</ul>
						</div>
					</div>
				</div>

				<ul class="nav">
				
				
					<li  class="nav-item ${active10 }" ><a
						class="nav-link" href="Servlet?action=liste_commande_en_attenteD"> <i
							class="material-icons">playlist_add</i>
							<p style="text-transform: lowercase;">
							<c:if test="${sessionScope.lang == 'en'}">List commands pending</c:if>
											<c:if test="${sessionScope.lang == 'ar'}">قائمة الطلبات في الانتظار</c:if>
											<c:if test="${sessionScope.lang == 'fr'}">Liste des commandes en attente</c:if>
											</p>
					</a></li>
					<li  class="nav-item ${active10 }" ><a
						class="nav-link" href="Servlet?action=liste_commande_en_routeD"> <i
							class="material-icons">playlist_play</i>
							<p style="text-transform: lowercase;">
							<c:if test="${sessionScope.lang == 'en'}">List commands personalized</c:if>
											<c:if test="${sessionScope.lang == 'ar'}">قائمة الطلبات الشخصية</c:if>
											<c:if test="${sessionScope.lang == 'fr'}">Liste des commandes personnalisées</c:if>
											</p>
					</a></li>
					<li  class="nav-item ${active10 }" ><a
						class="nav-link" href="Servlet?action=liste_commande_effectueeD"> <i
							class="material-icons">playlist_add_check</i>
							<p style="text-transform: lowercase;">
							<c:if test="${sessionScope.lang == 'en'}">List commands done</c:if>
											<c:if test="${sessionScope.lang == 'ar'}">قائمة الطلبات المقدمة</c:if>
											<c:if test="${sessionScope.lang == 'fr'}">Liste des commandes effectuées</c:if>
											</p>
					</a></li>

     				
					<li  class="nav-item ${active41 }"><a class="nav-link"
						href="Servlet?action=MapsAgent"> <i
							class="material-icons">maps</i>
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