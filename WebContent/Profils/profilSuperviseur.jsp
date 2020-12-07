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


<title><c:if test="${sessionScope.lang == 'en'}"> Profile </c:if>
	<c:if test="${sessionScope.lang == 'ar'}">الملف الشخصي </c:if> <c:if
		test="${sessionScope.lang == 'fr'}"> Profil</c:if> ${p.getNom()}</title>




<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css" href="icon/logo.css" />
<link rel="stylesheet"	href="../../../../maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
<link rel="stylesheet" href="assetss/css/material-dashboard.min28b5.css?v=2.0.0">
<link href="assetss/assets-for-demo/demo.css" rel="stylesheet" />


</head>

<body <c:if test="${sessionScope.lang == 'ar'}">class="rtl"</c:if>>
	<c:if test="${sessionScope.type_account == 'superviseur' }">
    	<c:import url="../Navs/NavSuperviseur.jsp" />
    </c:if>
    
    <c:if test="${sessionScope.type_account == 'admin'}">
    	<c:import url="../Navs/NavAdmin.jsp" />
    </c:if>


	<div class="main-panel">
		<!-- Navbar -->
		<nav
			class="navbar navbar-expand-lg navbar-transparent  navbar-absolute fixed-top">
			<div class="container-fluid">
				<div class="navbar-wrapper">
					<div class="navbar-minimize">
						<button id="minimizeSidebar"
							class="btn btn-just-icon btn-white btn-fab btn-round">
							<i
								class="material-icons text_align-center visible-on-sidebar-regular">more_vert</i>
							<i
								class="material-icons design_bullet-list-67 visible-on-sidebar-mini">view_list</i>
						</button>
					</div>
				</div>

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navigation" aria-controls="navigation-index"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="sr-only">Toggle navigation</span> <span
						class="navbar-toggler-icon icon-bar"></span> <span
						class="navbar-toggler-icon icon-bar"></span> <span
						class="navbar-toggler-icon icon-bar"></span>
				</button>

				<div class="collapse navbar-collapse justify-content-end"
					id="navigation"></div>
			</div>
		</nav>


		<div class="content">
			<div class="container-fluid">



				<div class="">
					<!--      Wizard container        -->
					<div class="container">
						<div class="col-md-10 ml-auto mr-auto">


							<div class="card card-profile text-center card-hidden">

								<div class="card-header ">
									<div class="card-avatar">
										<a href="#pablo">
										 <c:if	test="${sessionScope.type_account == 'superviseur' }">
												<c:if test="${sessionScope.profil != null}">
													<img class="img" src="data:image/jpg;base64,${sessionScope.profil}">
												</c:if>												
										</c:if> 
										<c:if test="${sessionScope.type_account == 'admin'}">
												<c:if test="${p.base64Image != null}">
													<img class="img" src="data:image/jpg;base64,${p.base64Image}">
												</c:if>	
										</c:if> 
										

										</a>

									</div>
									<h3>
										<c:if test="${sessionScope.lang == 'en'}"> Mr </c:if>
										
										<c:if test="${sessionScope.lang == 'fr'}"> Mr</c:if>
										${p.getNom()}
										<c:if test="${sessionScope.lang == 'ar'}">السيد</c:if>
									</h3>
								</div>

								<div class="card-body ">













									<div class="form-group">

										<table id="datatables"
											class="table table-no-bordered table-hover" cellspacing="0"
											width="100%" style="width: 100%">




											<tr>
												<c:if test="${sessionScope.lang == 'en'}">
													<td align="left">Name</td>
													<td align="left">${p.getNom()}</td>
													<td align="right"></td>
												</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">
													
													<td align="right">${p.getNom()}</td>
													<td align="right">الاسم</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">
													<td align="left">Nom</td>
													<td align="left">${p.getNom()}</td>
													<td align="right"></td>
												</c:if>

											</tr>


											<tr>
												<c:if test="${sessionScope.lang == 'en'}">
													<td align="left">Number phone</td>
													<td align="left">${p.getNtele()}</td>
													<td align="right"></td>
												</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">
													
													<td align="right">${p.getNtele()}</td>
													<td align="right">رقم الهاتف</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">
													<td align="left">Numéro de téléphone</td>
													<td align="left">${p.getNtele()}</td>
													<td align="right"></td>
												</c:if>

											</tr>
											<tr>
												<c:if test="${sessionScope.lang == 'en'}">
													<td align="left">Country</td>
													<td align="left">${p.getCountry()}</td>
													<td align="right"></td>
												</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">
													
													<td align="right">${p.getCountry()}</td>
													<td align="right">البلد</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">
													<td align="left">Pays</td>
													<td align="left">${p.getCountry()}</td>
													<td align="right"></td>
												</c:if>

											</tr>
											<tr>
												<c:if test="${sessionScope.lang == 'en'}">
													<td align="left">City</td>
													<td align="left">${p.getVille()}</td>
													<td align="right"></td>
												</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">
													
													<td align="right">${p.getVille()}</td>
													<td align="right">المدينة</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">
													<td align="left">Ville</td>
													<td align="left">${p.getVille()}</td>
													<td align="right"></td>
												</c:if>

											</tr>
											<tr>
												<c:if test="${sessionScope.lang == 'en'}">
													<td align="left">Registration date</td>
													<td align="left">${p.getDateInsc()}</td>
													<td align="right"></td>
												</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">
													
													<td align="right">${p.getDateInsc()}</td>
													<td align="right">تاريخ التسجيل</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">
													<td align="left">date d'inscription</td>
													<td align="left">${p.getDateInsc()}</td>
													<td align="right"></td>
												</c:if>

											</tr>
											<tr>
												
													<c:if test="${sessionScope.lang == 'en'}">
													<td align="left">Adress</td>
												<td align="left">${p.getAdresse()}</td>
												
												
												</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">
													
													<td align="right">${p.getAdresse()}</td>
													<td align="right">العنوان</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">
													<td align="left">Adresse</td>
												<td align="left">${p.getAdresse()}</td>
												<td align="left">
												</c:if>

											</tr>
											<tr>
												<c:if test="${sessionScope.lang == 'en'}">
													<td align="left">Password</td>
													<td align="left">${p.getPassword()}</td>
													<td align="right"></td>
												</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">
													
													<td align="right">${p.getPassword()}</td>
													<td align="right">كلمة السر</td>
												</c:if>
												<c:if test="${sessionScope.lang == 'fr'}">
													<td align="left">Mot de passe</td>
													<td align="left">${p.getPassword()}</td>
													<td align="right"></td>
												</c:if>

											</tr>




											<tbody></tbody>
										</table>
									</div>



								</div>

							</div>

						</div>
					</div>
				</div>

			</div>
		</div>

		<footer class="footer ">

			<div class="container">

				<div class="copyright pull-right">
					&copy;
					<script type="text/javascript">
						document.write(new Date().getFullYear())
					</script>
				</div>
			</div>



		</footer>


	</div>


</body>

<script>
	$(document).ready(function() {
		// crating new click event for save button
		$(".delete").click(function() {
			var id = +this.id;

			var r = confirm("Vous voulez supprimer  !");
			if (r == true) {
				$.ajax({
					url : "delete_ajax.jsp",
					type : "post",
					data : {
						id : id,
						table : "superviser",
						idtable : "idSuperviser"
					},
					success : function(data) {
						alert(data); // alerts the response from jsp
						location.reload();
					}
				});
			}
		});
	});
</script>

<!--   Core JS Files   -->
<script src="assetss/js/core/jquery.min.js" type="text/javascript"></script>
<script src="assetss/js/core/popper.min.js" type="text/javascript"></script>


<script src="assetss/js/bootstrap-material-design.min.js"
	type="text/javascript"></script>


<script src="assetss/js/plugins/perfect-scrollbar.jquery.min.js"
	type="text/javascript"></script>




<!-- Material Kit Core initialisations of plugins and Bootstrap Material Design Library -->

<script src="assetss/js/material-dashboard28b5.js?v=2.0.0"
	type="text/javascript"></script>




</html>
