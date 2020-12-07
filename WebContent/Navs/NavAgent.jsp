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
<title><c:if test="${sessionScope.lang == 'en'}"> Agent Space </c:if>
	<c:if test="${sessionScope.lang == 'ar'}">فضاء الوكيل</c:if> <c:if
		test="${sessionScope.lang == 'fr'}"> Espace Agent</c:if></title>
<style type="text/css">
ul li {
	text-transform: lowercase;
}

ul li:first-letter {
	text-transform: capitalize;
}
</style>
</head>
<body>
	<div class="sidebar" data-color="rose" data-background-color="black"
		data-image="assets/img/sidebar-1.jpg">
		<form class="form" action="servlet" method="get">
			<div class="sidebar" data-color="rose" data-background-color="black"
				data-image="assetss/img/hos-side.jpg">
				<div class="logo">
					<a href="Servlet?action=homeAgent" class="simple-text logo-mini"> <i
						class="material-icons">home</i>
					</a> <a href="Servlet?action=homeAgent" class="simple-text logo-normal">
						<c:if test="${sessionScope.lang == 'en'}"> HOME </c:if> <c:if
							test="${sessionScope.lang == 'ar'}">الصفحة الرئيسية</c:if> <c:if
							test="${sessionScope.lang == 'fr'}"> ACCUEIL</c:if>
					</a>
				</div>
				<div class="sidebar-wrapper">
					<div class="user">
						<div class="photo">
						 <c:if	test="${sessionScope.type_account == 'agent' }">
												<c:if test="${sessionScope.profil != null}">
													<img class="img" src="data:image/jpg;base64,${sessionScope.profil}">
												</c:if>												
										</c:if> 							
						</div>
						<div class="user-info">
							<a data-toggle="collapse" href="#collapseExample"
								class="username"> <span> <c:if
										test="${sessionScope.lang == 'en'}"> Mr </c:if> <c:if
										test="${sessionScope.lang == 'fr'}"> Mr</c:if>
									${sessionScope.name_account} <c:if
										test="${sessionScope.lang == 'ar'}">السيد</c:if> <b
									class="caret"></b>
							</span>
							</a>
							<div class="collapse" id="collapseExample">
								<ul class="nav">
									<li class="nav-item ${active10}"><a class="nav-link"
										href="Servlet?action=profilAgent"> <i
											class="material-icons">face</i> <span class="sidebar-normal">
												<c:if test="${sessionScope.lang == 'en'}"> Profil </c:if> <c:if
													test="${sessionScope.lang == 'ar'}">الملف الشخصي </c:if> <c:if
													test="${sessionScope.lang == 'fr'}"> Mon profil</c:if>
										</span>
									</a></li>
									<li class="nav-item ${active10}"><a class="nav-link"
										href="Servlet?action=updateProfileAgent"> <i
											class="material-icons">system_update_alt</i> <span class="sidebar-normal">
												<c:if test="${sessionScope.lang == 'en'}">Update Profil </c:if>
												<c:if test="${sessionScope.lang == 'ar'}">تحديث الملف الشخصي</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">mettre à jours mon profil </c:if>
										</span>
									</a></li>
									<li class="nav-item"><a class="nav-link"
										href="Servlet?action=deconnecter"> <i
											class="material-icons">power_settings_new</i> <span
											class="sidebar-normal" style="text-transform: lowercase;">
												<c:if test="${sessionScope.lang == 'en'}">Log out</c:if> <c:if
													test="${sessionScope.lang == 'ar'}">تسجيل الخروج</c:if> <c:if
													test="${sessionScope.lang == 'fr'}">Se déconnecter</c:if>
										</span>
									</a></li>
								</ul>
							</div>
						</div>
					</div>
					<ul class="nav">
					<li class="nav-item ${active3 }"><a class="nav-link"
										href="Servlet?action=commandeCreate"> <i
											class="material-icons">playlist_add</i> 
											<p style="text-transform: lowercase;">
												<c:if test="${sessionScope.lang == 'en'}">Add command</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">أضف طلب تصدير</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">Ajouter une commande</c:if>
										    </p>
									</a></li>
											<li class="nav-item ${active6 }"><a class="nav-link"
										href="Servlet?action=ListClient"> <i
											class="material-icons">trending_up</i>
											<p style="text-transform: lowercase;">
												<c:if test="${sessionScope.lang == 'en'}">Customer list</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">قائمة الزبناء</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">Liste de clients</c:if>
											</p>
									</a></li>
						<li class="nav-item  "><a class="nav-link"
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
									<li class="nav-item ${active2 }"><a class="nav-link"
										href="Servlet?action=ListeCommandeForAgent"> <i
											class="material-icons">list</i> <span
											class="sidebar-normal" style="text-transform: lowercase;">
												<c:if test="${sessionScope.lang == 'en'}">List of Commands waiting </c:if>
												<c:if test="${sessionScope.lang == 'ar'}"> قائمة الطلبات في الاتضار</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">Liste des Commandes en attente</c:if>
										</span>
									</a></li>
									
									<li class="nav-item ${active21 } "><a class="nav-link"
										href="Servlet?action=LisCommandeEnRoute"> <i
											class="material-icons">list</i> <span
											class="sidebar-normal" style="text-transform: lowercase;">
												<c:if test="${sessionScope.lang == 'en'}">command list en route</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">قائمة الطلبات في الطريق </c:if>
												<c:if test="${sessionScope.lang == 'fr'}">Liste commandes en route</c:if>
										</span>
									</a></li>
									<li class="nav-item ${active21 } "><a class="nav-link"
										href="Servlet?action=LisCommandeEffectuee"> <i
											class="material-icons">list</i> <span
											class="sidebar-normal" style="text-transform: lowercase;">
												<c:if test="${sessionScope.lang == 'en'}">command list success</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">قائمة الطلبات المكتملة </c:if>
												<c:if test="${sessionScope.lang == 'fr'}">Liste commandes effectuer</c:if>
										</span>
									</a></li>
									<li class="nav-item ${active21 } "><a class="nav-link"
										href="Servlet?action=LisCommandeAllInAgent"> <i
											class="material-icons">list</i> <span
											class="sidebar-normal" style="text-transform: lowercase;">
												<c:if test="${sessionScope.lang == 'en'}">command list all</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">قائمة كل الطلبات  </c:if>
												<c:if test="${sessionScope.lang == 'fr'}">Liste de tous les commandes</c:if>
										</span>
									</a></li>
									<li class="nav-item ${active21 } "><a class="nav-link"
										href="Servlet?action=ListeColisForAgent"> <i
											class="material-icons">view_list</i> <span
											class="sidebar-normal" style="text-transform: lowercase;">
												<c:if test="${sessionScope.lang == 'en'}">List of package</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">قائمة الحزمة</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">Liste de colis</c:if>
										</span>
									</a></li>
								</ul>
							</div></li>
						<li class="nav-item ${active2 } "><a class="nav-link"
							data-toggle="collapse" href="#pagesExamples2"> <i
								class="material-icons">collections_bookmark</i>
								<p style="text-transform: lowercase;">
									<c:if test="${sessionScope.lang == 'en'}">Imports</c:if>
									<c:if test="${sessionScope.lang == 'ar'}">الواردات</c:if>
									<c:if test="${sessionScope.lang == 'fr'}">Importations</c:if>
									<b class="caret"></b>
								</p>
						</a>
							<div class="collapse" id="pagesExamples2">
								<ul class="nav">
									<li class="nav-item ${active10 }"><a class="nav-link"
										href="Servlet?action=liste_commande_en_attente_enter"> <i
											class="material-icons">playlist_add</i>
											<p style="text-transform: lowercase;">
												<c:if test="${sessionScope.lang == 'en'}">Commands pending Imports</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">الطلبات قيد الا نتظار  </c:if>
												<c:if test="${sessionScope.lang == 'fr'}">Commandes en attente entrer </c:if>
											</p>
									</a></li>
									<li class="nav-item ${active10 }"><a class="nav-link"
										href="Servlet?action=liste_commande_effectuee_entrer"> <i
											class="material-icons">playlist_add_check</i>
											<p style="text-transform: lowercase;">
												<c:if test="${sessionScope.lang == 'en'}">Commands Done came</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">الطلبات جائت </c:if>
												<c:if test="${sessionScope.lang == 'fr'}">Commandes reçu  revenue</c:if>
											</p>
									</a></li>
							

									<li class="nav-item ${active10 }"><a class="nav-link"
										href="Servlet?action=liste_all_commande_effectuee_entrer"> <i
											class="material-icons">playlist_add_check</i>
											<p style="text-transform: lowercase;">
												<c:if test="${sessionScope.lang == 'en'}">All incoming Orders </c:if>
												<c:if test="${sessionScope.lang == 'ar'}">جميع الطلبات الواردة</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">tous les Commandes entrantes</c:if>
											</p>
									</a></li>
								</ul>
							</div></li>
					</ul>
				</div>
			</div>
		</form>
	</div>
</body>
</html>