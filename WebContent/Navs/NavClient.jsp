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
<c:if test="${sessionScope.lang == 'en'}"> Customer Space </c:if>
<c:if test="${sessionScope.lang == 'ar'}">فضاء الزبون</c:if>
<c:if test="${sessionScope.lang == 'fr'}"> Espace Client</c:if>
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
	<div class="sidebar" data-color="green" data-background-color="black"
		data-image="assets/img/sidebar-1.jpg">
			<div class="logo">
				<a href="Servlet?action=homeClient" class="simple-text logo-mini">
            		<i class="material-icons">home</i>
       				 </a>
       			 <a href="Servlet?action=homeClient" class="simple-text logo-normal">
             <c:if test="${sessionScope.lang == 'en'}"> HOME </c:if>
							<c:if test="${sessionScope.lang == 'ar'}">الصفحة الرئيسية</c:if>
							<c:if test="${sessionScope.lang == 'fr'}"> ACCUEIL</c:if>
       			 </a>
			</div>
			<div class="sidebar-wrapper">
				<div class="user">
					<div class="photo">
						 <c:if	test="${sessionScope.type_account == 'client' }">
												<c:if test="${sessionScope.profil != null}">
													<img class="img" src="data:image/jpg;base64,${sessionScope.profil}">
												</c:if>												
										</c:if> 
					</div>
					<div class="user-info">
						<a data-toggle="collapse" href="#collapseExample" class="username">
							<span> <c:if test="${sessionScope.lang == 'en'}"> Mr </c:if>
							<c:if test="${sessionScope.lang == 'fr'}"> Mr</c:if>
								 ${sessionScope.name_account} 
								 <c:if test="${sessionScope.lang == 'ar'}">السيد</c:if><b
									class="caret"></b>
						</span>
						</a>
						<div class="collapse" id="collapseExample">
							<ul class="nav">
								<li class="nav-item ${active1}"><a class="nav-link"
									href="Servlet?action=profilClient"> <i class="material-icons">face</i>
										<span class="sidebar-normal">
										    <c:if test="${sessionScope.lang == 'en'}"> Profile </c:if>
											<c:if test="${sessionScope.lang == 'ar'}">الملف الشخصي </c:if>
											<c:if test="${sessionScope.lang == 'fr'}"> Profil</c:if>
												 </span>
								</a></li>
								<li class="nav-item ${active10}"><a class="nav-link"
										href="Servlet?action=updateProfileClient"> <i
											class="material-icons">system_update_alt</i> <span class="sidebar-normal">
												<c:if test="${sessionScope.lang == 'en'}">Update Profil </c:if>
												<c:if test="${sessionScope.lang == 'ar'}">تحديث الملف الشخصي</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">Mettre à jours mon profil </c:if>
										</span>
									</a></li>
								<li class="nav-item"><a class="nav-link"
									href="Servlet?action=deconnecter"> <i
										class="material-icons">power_settings_new</i> <span
										class="sidebar-normal" style="text-transform: lowercase;">
											<c:if test="${sessionScope.lang == 'en'}">Log out</c:if>
											<c:if test="${sessionScope.lang == 'ar'}">سجيل الخروج</c:if>
											<c:if test="${sessionScope.lang == 'fr'}">Se déconnecter</c:if>
											 </span>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
				<ul class="nav">
					<li  class="nav-item ${active3 }"><a class="nav-link "
						href="Servlet?action=commandeCreate"> <i class="material-icons">playlist_add</i>
							<p style="text-transform: lowercase;">
							<c:if test="${sessionScope.lang == 'en'}">Add Command</c:if>
								<c:if test="${sessionScope.lang == 'ar'}">أضف طلب</c:if>
								<c:if test="${sessionScope.lang == 'fr'}">Ajouter une Commande</c:if>
									</p>
					</a></li>
					<li  class="nav-item ${active3 }"><a class="nav-link "
						href="Servlet?action=listCommandeClient"> <i class="material-icons">list</i>
							<p style="text-transform: lowercase;">
							                <c:if test="${sessionScope.lang == 'en'}">List of Commands </c:if>
											<c:if test="${sessionScope.lang == 'ar'}">قائمة الطلبات</c:if>
											<c:if test="${sessionScope.lang == 'fr'}">Liste des Commandes </c:if>
					</p>
					</a></li>
					<li  class="nav-item ${active3 }"><a class="nav-link "
						href="Servlet?action=suivreCommande"> <i class="material-icons">track_changes</i>
							<p style="text-transform: lowercase;">
							<c:if test="${sessionScope.lang == 'en'}">Tracking a command</c:if>
											<c:if test="${sessionScope.lang == 'ar'}">تتبع الطلب</c:if>
											<c:if test="${sessionScope.lang == 'fr'}">Suivre une commande</c:if>
												</p>
					</a></li>
					<li  class="nav-item ${active3 }"><a class="nav-link "
						href="Servlet?action=reclamation_client"> <i class="material-icons">warning</i>
							<p style="text-transform: lowercase;">
							<c:if test="${sessionScope.lang == 'en'}">claim </c:if>
											<c:if test="${sessionScope.lang == 'ar'}">شكايات</c:if>
											<c:if test="${sessionScope.lang == 'fr'}">Réclamation </c:if> </p>
					</a></li>
				</ul>
			</div>
		</form>
	</div>
	
	<div></div>
	<div></div>

</body>
</html>