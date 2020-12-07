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
<link rel="apple-touch-icon" href="assetss/img/apple-icon.png">
<link rel="icon" href="assetss/img/favicon.png">
<title>Liste des Commandes</title>
<link
	href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="icon/logo.css" />
<link rel="stylesheet"
	href="../../../../maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="assetss/css/material-dashboard.min28b5.css?v=2.0.0">
<link href="assetss/assets-for-demo/demo.css" rel="stylesheet" />
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
<body <c:if test="${sessionScope.lang == 'ar'}">class="rtl"</c:if>>
	<c:if test="${sessionScope.type_account == 'agent'}">
		<c:import url="../Navs/NavAgent.jsp" />
	</c:if>
	<c:if test="${sessionScope.type_account == 'superviseur'}">
		<c:import url="../Navs/NavSuperviseur.jsp" />
	</c:if>
	<c:if test="${sessionScope.type_account == 'distributeur'}">
		<c:import url="../Navs/NavDistributeur.jsp" />
	</c:if>
	<c:if test="${sessionScope.type_account == 'client'}">
		<c:import url="../Navs/NavClient.jsp" />
	</c:if>
	<c:if test="${sessionScope.type_account == 'admin'}">
		<c:import url="../Navs/NavAdmin.jsp" />
	</c:if>
	
	<c:if test="${sessionScope.lang == 'en'}">
	<div class="main-panel">
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
					<a class="navbar-brand" href="#pablo">Command List </a>
				</div>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navigation" aria-controls="navigation-index"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="sr-only">Toggle navigation</span> <span
						class="navbar-toggler-icon icon-bar"></span> <span
						class="navbar-toggler-icon icon-bar"></span> <span
						class="navbar-toggler-icon icon-bar"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-end"></div>
			</div>
		</nav>
		<div class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header card-header-primary card-header-icon">
								<div class="card-icon">
									<i class="material-icons">assignment</i>
								</div>
								<h4 class="card-title">Commands</h4>
							</div>
							<div class="card-body">
								<div class="toolbar"></div>
								<div class="material-datatables">
									<table id="datatables"
										class="table table-striped table-no-bordered table-hover"
										cellspacing="0" width="100%" style="width: 100%">
										<thead>
											<tr>
												<th># of the Command</th>
												<th>Name of the responsible Agent</th>
												<th>Client name</th>
												<th>Total command</th>
												<th>State</th>
												<c:if test="${sessionScope.type_account == 'agent'}">
													<th>Add parcel</th>
												</c:if>
												<c:if test="${sessionScope.type_account == 'client'}">
													<th>Add parcel</th>
												</c:if>

												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${listCommande}" var="row">
												<tr>
													<td>${row.getCommande().getId()}</td>
													<td>${row.getAgent().getZone()}</td>
													<td>${row.getClient().getNom() }</td>
													<td>${row.getCommande().getTotalCommande()  }</td>
													<td><c:if
															test="${row.getCommande().getEtat() == 'en route'}">
															<button type="button" class="btn btn-warning btn-sm">On the way</button>
														</c:if> <c:if
															test="${row.getCommande().getEtat() == 'en attente'}">
															<button type="button" class="btn btn-danger btn-sm">Waiting</button>
														</c:if> <c:if test="${row.getCommande().getEtat() == 'effectue'}">
															<button type="button" class="btn btn-success btn-sm">Done</button>
														</c:if></td>
													<c:if test="${sessionScope.type_account == 'agent'}">
														<td><c:if
																test="${row.getCommande().getEtat() == 'en attente'}">
																<button type="button" class="btn btn-info"
																	data-toggle="modal" data-target="#exampleModal"
																	onclick="ajouterIdCommande(${row.getCommande().getId()})">
																	Add</button>
															</c:if></td>
													</c:if>
													<c:if test="${sessionScope.type_account == 'client'}">
														<td><c:if
																test="${row.getCommande().getEtat() == 'en attente'}">
																<button type="button" class="btn btn-info" data-toggle="modal" data-target="#exampleModal"
																	onclick="ajouterIdCommande(${row.getCommande().getId()})">
																	Add</button>
															</c:if></td>
													</c:if>

								
													<td><c:if
															test="${sessionScope.type_account == 'agent'}">
															<a
																href="Servlet?action=ReadCommande&id=${row.getCommande().getId()}"><i
																class="material-icons" style="color: green;">chrome_reader_mode</i></a>
															<a
																href="Servlet?action=UpdateCommande&id=${row.getCommande().getId()}"><i
																class="material-icons">update</i></a>
															<a id="${row.getCommande().getId()}" href="#"
																class="delete"><i class="material-icons"
																style="color: red;">close</i></a>
														</c:if> <c:if
															test="${sessionScope.type_account == 'superviseur'}">
															<a
																href="Servlet?action=ReadCommande&id=${row.getCommande().getId()}"><i
																class="material-icons" style="color: green;">chrome_reader_mode</i></a>
															<a
																href="Servlet?action=DeleteCommande&id=${row.getCommande().getId()}"><i
																class="material-icons" style="color: red;">close</i></a>
														</c:if> <c:if test="${sessionScope.type_account == 'admin'}">
															<a
																href="Servlet?action=ReadCommande&id=${row.getCommande().getId()}"><i
																class="material-icons" style="color: green;">chrome_reader_mode</i></a>
															<a
																href="Servlet?action=DeleteCommande&id=${row.getCommande().getId()}"><i
																class="material-icons" style="color: red;">close</i></a>
														</c:if> <c:if
															test="${sessionScope.type_account == 'distributeur'}">
															<c:if test="${row.getCommande().getEtat() == 'en route'}">
																<a
																	href="Servlet?action=ReadCommande&id=${row.getCommande().getId()}"><i
																	class="material-icons" style="color: green;">chrome_reader_mode</i></a>

															</c:if>
															<c:if
																test="${row.getCommande().getEtat() == 'en attente'}">
																<a
																	href="Servlet?action=ReadCommande&id=${row.getCommande().getId()}"><i
																	class="material-icons" style="color: green;">chrome_reader_mode</i></a>
																<a
																	href="Servlet?action=prendreCommande&id=${row.getCommande().getId()}"><i
																	class="material-icons">check</i></a>
															</c:if>
															<c:if test="${row.getCommande().getEtat() == 'effectue'}">
																<a
																	href="Servlet?action=ReadCommande&id=${row.getCommande().getId()}"><i
																	class="material-icons" style="color: green;">chrome_reader_mode</i></a>

															</c:if>

														</c:if> <c:if test="${sessionScope.type_account == 'client'}">
														<c:if
																test="${row.getCommande().getEtat() == 'en attente'}">
															<a
																href="Servlet?action=ReadCommande&id=${row.getCommande().getId()}"><i
																class="material-icons" style="color: green;">chrome_reader_mode</i></a>
															<a
																href="Servlet?action=UpdateCommande&id=${row.getCommande().getId()}"><i
																class="material-icons">update</i></a>
															</c:if>
															<c:if test="${row.getCommande().getEtat() == 'effectue'}">
																<a
																href="Servlet?action=ReadCommande&id=${row.getCommande().getId()}"><i
																class="material-icons" style="color: green;">chrome_reader_mode</i></a>
															</c:if>
															<c:if test="${row.getCommande().getEtat() == 'en route'}">
															<a
																href="Servlet?action=ReadCommande&id=${row.getCommande().getId()}"><i
																class="material-icons" style="color: green;">chrome_reader_mode</i></a>
															</c:if>
														</c:if></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- end content-->
						</div>
						<!--  end card  -->
					</div>
					<!-- end col-md-12 -->
				</div>
				<!-- end row -->
			</div>
		</div>
	</div>
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">New parcel</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form method="post" action="Servlet">
				<div class="modal-body">
					
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="nom_prenom_destinataire" class="bmd-label-floating">Type of parcel </label> <label for="natureColis" class="bmd-label-floating">Nature</label>
								<select class="form-control" id="natureColis"
									name="nature_colis">
									<option value="Argent">Money</option>
									<option value="Colis">Parcel</option>
								</select>
							</div>
							<div class="form-group col-md-6">
								<label for="cin_destinataire" class="bmd-label-floating">Weight or amount of money</label> <input type="text" class="form-control"
									id="cin_destinataire" name="poids_colis">
							</div>
							<input type="hidden" name="id_commande" id="id_commande_modal">
						</div>
						
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-success" name="action"
						value="ajouter_colis_commande"
						onclick="return confirm('Voulez-vous vraiment ajouter ce colis')">Add parcel</button>
					
				</div>
				</form>
			</div>
		</div>
	</div>
	 </c:if>
	<c:if test="${sessionScope.lang == 'ar'}">
	<div class="main-panel">
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
					<a class="navbar-brand" href="#pablo">قائمة الطلبات </a>
				</div>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navigation" aria-controls="navigation-index"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="sr-only">Toggle navigation</span> <span
						class="navbar-toggler-icon icon-bar"></span> <span
						class="navbar-toggler-icon icon-bar"></span> <span
						class="navbar-toggler-icon icon-bar"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-end"></div>
			</div>
		</nav>
		<div class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header card-header-primary card-header-icon">
								<div class="card-icon">
									<i class="material-icons">assignment</i>
								</div>
								<h4 class="card-title">الطلبات</h4>
							</div>
							<div class="card-body">
								<div class="toolbar"></div>
								<div class="material-datatables">
									<table id="datatables"
										class="table table-striped table-no-bordered table-hover"
										cellspacing="0" width="100%" style="width: 100%">
										<thead>
											<tr>
												<th>الطلب # </th>
												<th>اسم الوكيل المسؤول</th>
												<th>اسم الزبون</th>
												<th>الطلب الكلي</th>
												<th>الحالة</th>
												<c:if test="${sessionScope.type_account == 'agent'}">
													<th>إضافة حزمة</th>
												</c:if>
												<c:if test="${sessionScope.type_account == 'client'}">
													<th>إضافة حزمة</th>
												</c:if>

												<th>إجراءات</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${listCommande}" var="row">
												<tr>
													<td>${row.getCommande().getId()}</td>
													<td>${row.getAgent().getZone()}</td>
													<td>${row.getClient().getNom() }</td>
													<td>${row.getCommande().getTotalCommande()  }</td>
													<td><c:if
															test="${row.getCommande().getEtat() == 'en route'}">
															<button type="button" class="btn btn-warning btn-sm">في الطريق</button>
														</c:if> <c:if
															test="${row.getCommande().getEtat() == 'en attente'}">
															<button type="button" class="btn btn-danger btn-sm">في الانتظار</button>
														</c:if> <c:if test="${row.getCommande().getEtat() == 'effectue'}">
															<button type="button" class="btn btn-success btn-sm">نفذ</button>
														</c:if></td>
													<c:if test="${sessionScope.type_account == 'agent'}">
														<td><c:if
																test="${row.getCommande().getEtat() == 'en attente'}">
																<button type="button" class="btn btn-info"
																	data-toggle="modal" data-target="#exampleModal"
																	onclick="ajouterIdCommande(${row.getCommande().getId()})">
																	Ajouter</button>
															</c:if></td>
													</c:if>
													<c:if test="${sessionScope.type_account == 'client'}">
														<td><c:if
																test="${row.getCommande().getEtat() == 'en attente'}">
																<button type="button" class="btn btn-info" data-toggle="modal" data-target="#exampleModal"
																	onclick="ajouterIdCommande(${row.getCommande().getId()})">
																	Ajouter</button>
															</c:if></td>
													</c:if>

								
													<td><c:if
															test="${sessionScope.type_account == 'agent'}">
															<a
																href="Servlet?action=ReadCommande&id=${row.getCommande().getId()}"><i
																class="material-icons" style="color: green;">chrome_reader_mode</i></a>
															<a
																href="Servlet?action=UpdateCommande&id=${row.getCommande().getId()}"><i
																class="material-icons">update</i></a>
															<a id="${row.getCommande().getId()}" href="#"
																class="delete"><i class="material-icons"
																style="color: red;">close</i></a>
														</c:if> <c:if
															test="${sessionScope.type_account == 'superviseur'}">
															<a
																href="Servlet?action=ReadCommande&id=${row.getCommande().getId()}"><i
																class="material-icons" style="color: green;">chrome_reader_mode</i></a>
															<a
																href="Servlet?action=DeleteCommande&id=${row.getCommande().getId()}"><i
																class="material-icons" style="color: red;">close</i></a>
														</c:if> <c:if test="${sessionScope.type_account == 'admin'}">
															<a
																href="Servlet?action=ReadCommande&id=${row.getCommande().getId()}"><i
																class="material-icons" style="color: green;">chrome_reader_mode</i></a>
															<a
																href="Servlet?action=DeleteCommande&id=${row.getCommande().getId()}"><i
																class="material-icons" style="color: red;">close</i></a>
														</c:if> <c:if
															test="${sessionScope.type_account == 'distributeur'}">
															<c:if test="${row.getCommande().getEtat() == 'en route'}">
																<a
																	href="Servlet?action=ReadCommande&id=${row.getCommande().getId()}"><i
																	class="material-icons" style="color: green;">chrome_reader_mode</i></a>

															</c:if>
															<c:if
																test="${row.getCommande().getEtat() == 'en attente'}">
																<a
																	href="Servlet?action=ReadCommande&id=${row.getCommande().getId()}"><i
																	class="material-icons" style="color: green;">chrome_reader_mode</i></a>
																<a
																	href="Servlet?action=prendreCommande&id=${row.getCommande().getId()}"><i
																	class="material-icons">check</i></a>
															</c:if>
															<c:if test="${row.getCommande().getEtat() == 'effectue'}">
																<a
																	href="Servlet?action=ReadCommande&id=${row.getCommande().getId()}"><i
																	class="material-icons" style="color: green;">chrome_reader_mode</i></a>

															</c:if>

														</c:if> <c:if test="${sessionScope.type_account == 'client'}">
															<a
																href="Servlet?action=ReadCommande&id=${row.getCommande().getId()}"><i
																class="material-icons" style="color: green;">chrome_reader_mode</i></a>
															<a
																href="Servlet?action=UpdateCommande&id=${row.getCommande().getId()}"><i
																class="material-icons">update</i></a>
														</c:if></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- end content-->
						</div>
						<!--  end card  -->
					</div>
					<!-- end col-md-12 -->
				</div>
				<!-- end row -->
			</div>
		</div>
	</div>
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Nouveau colis</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form method="post" action="Servlet">
				<div class="modal-body">
					
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="nom_prenom_destinataire" class="bmd-label-floating">Type
									du colis </label> <label for="natureColis" class="bmd-label-floating">Nature</label>
								<select class="form-control" id="natureColis"
									name="nature_colis">
									<option value="Argent">Argent</option>
									<option value="Colis">Colis</option>
								</select>
							</div>
							<div class="form-group col-md-6">
								<label for="cin_destinataire" class="bmd-label-floating">Poids
									ou montant de l'argent</label> <input type="text" class="form-control"
									id="cin_destinataire" name="poids_colis">
							</div>
							<input type="hidden" name="id_commande" id="id_commande_modal">
						</div>
						
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fermer</button>
					<button type="submit" class="btn btn-success" name="action"
						value="ajouter_colis_commande"
						onclick="return confirm('Voulez-vous vraiment ajouter ce colis')">Ajouter
						colis</button>
					
				</div>
				</form>
			</div>
		</div>
	</div>
	 </c:if> 
<c:if test="${sessionScope.lang == 'fr'}">
<div class="main-panel">
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
					<a class="navbar-brand" href="#pablo">Liste des commandes </a>
				</div>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navigation" aria-controls="navigation-index"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="sr-only">Toggle navigation</span> <span
						class="navbar-toggler-icon icon-bar"></span> <span
						class="navbar-toggler-icon icon-bar"></span> <span
						class="navbar-toggler-icon icon-bar"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-end"></div>
			</div>
		</nav>
		<div class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header card-header-primary card-header-icon">
								<div class="card-icon">
									<i class="material-icons">assignment</i>
								</div>
								<h4 class="card-title">Commandes</h4>
							</div>
							<div class="card-body">
								<div class="toolbar"></div>
								<div class="material-datatables">
									<table id="datatables"
										class="table table-striped table-no-bordered table-hover"
										cellspacing="0" width="100%" style="width: 100%">
										<thead>
											<tr>
											<c:if test="${sessionScope.lang == 'fr'}">
												<th># de la Commande</th>
												<th>Nom de l'Agent responsable</th>
												<th>Nom du client</th>
												<th>Total de la commande</th>
												<th>Etat</th>
												<c:if test="${sessionScope.type_account == 'agent'}">
													<th>Ajouter Colis</th>
												</c:if>
												<c:if test="${sessionScope.type_account == 'client'}">
													<th>Ajouter Colis</th>
												</c:if>

												<th>Action</th>
												</c:if>
												<c:if test="${sessionScope.lang == 'en'}">
												<th> Command</th>
												<th>Agent responsible</th>
												<th>Customer</th>
												<th>Total </th>
												<th>State</th>
												<c:if test="${sessionScope.type_account == 'agent'}">
													<th>Ajouter Colis</th>
												</c:if>
												<c:if test="${sessionScope.type_account == 'client'}">
													<th>Ajouter Colis</th>
												</c:if>

												<th>Action</th>
												</c:if>
												<c:if test="${sessionScope.lang == 'ar'}">
												<th>رقم الطلب</th>
												<th>الوكيل المسؤول</th>
												<th>الزبون</th>
												<th>التكلفة</th>
												<th>الحالة</th>
												<c:if test="${sessionScope.type_account == 'agent'}">
													<th>Ajouter Colis</th>
												</c:if>
												<c:if test="${sessionScope.type_account == 'client'}">
													<th>Ajouter Colis</th>
												</c:if>

												<th>امكانيات</th>
												</c:if>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${listCommande}" var="row">
												<tr>
													<td>${row.getCommande().getId()}</td>
													<td>${row.getAgent().getZone()}</td>
													<td>${row.getClient().getNom() }</td>
													<td>${row.getCommande().getTotalCommande()  }</td>
													<td><c:if
															test="${row.getCommande().getEtat() == 'en route'}">
															<button type="button" class="btn btn-warning btn-sm">En
																route</button>
														</c:if> <c:if
															test="${row.getCommande().getEtat() == 'en attente'}">
															<button type="button" class="btn btn-danger btn-sm">En
																attente</button>
														</c:if> <c:if test="${row.getCommande().getEtat() == 'effectue'}">
															<button type="button" class="btn btn-success btn-sm">Effectuee</button>
														</c:if></td>
													<c:if test="${sessionScope.type_account == 'agent'}">
														<td><c:if
																test="${row.getCommande().getEtat() == 'en attente'}">
																<button type="button" class="btn btn-info btn-sm"
																	data-toggle="modal" data-target="#exampleModal"
																	onclick="ajouterIdCommande(${row.getCommande().getId()})">
																	Ajouter</button>
															</c:if></td>
													</c:if>
													<c:if test="${sessionScope.type_account == 'client'}">
														<td><c:if
																test="${row.getCommande().getEtat() == 'en attente'}">
																<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#exampleModal"
																	onclick="ajouterIdCommande(${row.getCommande().getId()})">
																	Ajouter</button>
															</c:if></td>
													</c:if>

								
													<td><c:if
															test="${sessionScope.type_account == 'agent'}">
															<a
																href="Servlet?action=ReadCommande&id=${row.getCommande().getId()}"><i
																class="material-icons" style="color: green;">chrome_reader_mode</i></a>
															<a
																href="Servlet?action=UpdateCommande&id=${row.getCommande().getId()}"><i
																class="material-icons">update</i></a>
															<a id="${row.getCommande().getId()}" href="#"
																class="delete"><i class="material-icons"
																style="color: red;">close</i></a>
														</c:if> <c:if
															test="${sessionScope.type_account == 'superviseur'}">
															<a
																href="Servlet?action=ReadCommande&id=${row.getCommande().getId()}"><i
																class="material-icons" style="color: green;">chrome_reader_mode</i></a>
															<a
																href="Servlet?action=DeleteCommande&id=${row.getCommande().getId()}"><i
																class="material-icons" style="color: red;">close</i></a>
														</c:if> <c:if test="${sessionScope.type_account == 'admin'}">
															<a
																href="Servlet?action=ReadCommande&id=${row.getCommande().getId()}"><i
																class="material-icons" style="color: green;">chrome_reader_mode</i></a>
															<a
																href="Servlet?action=DeleteCommande&id=${row.getCommande().getId()}"><i
																class="material-icons" style="color: red;">close</i></a>
														</c:if> <c:if
															test="${sessionScope.type_account == 'distributeur'}">
															<c:if test="${row.getCommande().getEtat() == 'en route'}">
																<a
																	href="Servlet?action=ReadCommande&id=${row.getCommande().getId()}"><i
																	class="material-icons" style="color: green;">chrome_reader_mode</i></a>

															</c:if>
															<c:if
																test="${row.getCommande().getEtat() == 'en attente'}">
																<a
																	href="Servlet?action=ReadCommande&id=${row.getCommande().getId()}"><i
																	class="material-icons" style="color: green;">chrome_reader_mode</i></a>
																<a
																	href="Servlet?action=prendreCommande&id=${row.getCommande().getId()}"><i
																	class="material-icons">check</i></a>
															</c:if>
															<c:if test="${row.getCommande().getEtat() == 'effectue'}">
																<a
																	href="Servlet?action=ReadCommande&id=${row.getCommande().getId()}"><i
																	class="material-icons" style="color: green;">chrome_reader_mode</i></a>

															</c:if>

														</c:if> <c:if test="${sessionScope.type_account == 'client'}">
															<a
																href="Servlet?action=ReadCommande&id=${row.getCommande().getId()}"><i
																class="material-icons" style="color: green;">chrome_reader_mode</i></a>
															<a
																href="Servlet?action=UpdateCommande&id=${row.getCommande().getId()}"><i
																class="material-icons">update</i></a>
														</c:if></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- end content-->
						</div>
						<!--  end card  -->
					</div>
					<!-- end col-md-12 -->
				</div>
				<!-- end row -->
			</div>
		</div>
	</div>
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Nouveau colis</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form method="post" action="Servlet">
				<div class="modal-body">
					
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="nom_prenom_destinataire" class="bmd-label-floating">Type
									du colis </label> <label for="natureColis" class="bmd-label-floating">Nature</label>
								<select class="form-control" id="natureColis"
									name="nature_colis">
									<option value="Argent">Argent</option>
									<option value="Colis">Colis</option>
								</select>
							</div>
							<div class="form-group col-md-6">
								<label for="cin_destinataire" class="bmd-label-floating">Poids
									ou montant de l'argent</label> <input type="text" class="form-control"
									id="cin_destinataire" name="poids_colis">
							</div>
							<input type="hidden" name="id_commande" id="id_commande_modal">
						</div>
						
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fermer</button>
					<button type="submit" class="btn btn-success" name="action"
						value="ajouter_colis_commande"
						onclick="return confirm('Voulez-vous vraiment ajouter ce colis')">Ajouter
						colis</button>
					
				</div>
				</form>
			</div>
		</div>
	</div>
	</c:if>
	
</body>
<script src="assetss/js/core/jquery.min.js"></script>
<script src="assetss/js/core/popper.min.js"></script>
<script src="assetss/js/bootstrap-material-design.min.js"></script>
<script src="assetss/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<script src="assetss/js/plugins/moment.min.js"></script>
<script src="assetss/js/plugins/bootstrap-datetimepicker.min.js"></script>
<script src="assetss/js/plugins/nouislider.min.js"></script>
<script src="assetss/js/plugins/bootstrap-selectpicker.js"></script>
<script src="assetss/js/plugins/bootstrap-tagsinput.js"></script>
<script src="assetss/js/plugins/jasny-bootstrap.min.js"></script>
<script src="assetss/assets-for-demo/js/modernizr.js"></script>
<script src="assetss/js/material-dashboard28b5.js?v=2.0.0"></script>
<script src="assetss/js/plugins/arrive.min.js" type="text/javascript"></script>
<script src="assetss/js/plugins/jquery.validate.min.js"></script>
<script src="assetss/js/plugins/chartist.min.js"></script>
<script src="assetss/js/plugins/jquery.bootstrap-wizard.js"></script>
<script src="assetss/js/plugins/bootstrap-notify.js"></script>
<script src="assetss/js/plugins/jquery-jvectormap.js"></script>
<script src="assetss/js/plugins/nouislider.min.js"></script>
<script src="assetss/js/plugins/jquery.select-bootstrap.js"></script>
<script src="assetss/js/plugins/jquery.datatables.js"></script>
<script src="assetss/js/plugins/sweetalert2.js"></script>
<script src="assetss/js/plugins/jasny-bootstrap.min.js"></script>
<script src="assetss/js/plugins/fullcalendar.min.js"></script>
<script src="assetss/js/plugins/demo.js"></script>
<script>
$(document).ready(function() {
// crating new click event for save button
$(".delete").click(function() {
var id = +this.id; 
var r = confirm("Vous voulez supprimer ce agent !");
if (r == true) {
	$.ajax({
		url: "delete_ajax.jsp",
		type: "post",
		data: {
		id : id,
		table : "commande",
		idtable : "id"
		},
		success : function(data){
		alert(data); // alerts the response from jsp
		location.reload(); 
		}
		});
} 
});
});
</script>
<script type="text/javascript">
$(document).ready(function() {
    $('#datatables').DataTable({
        "pagingType": "full_numbers",
        "lengthMenu": [
            [10, 25, 50, -1],
            [10, 25, 50, "All"]
        ],
        responsive: true,
        language: {
            search: "_INPUT_",
            searchPlaceholder: "Search records",
        }

    });
    var table = $('#datatables').DataTable();
    table.on('click', '.edit', function() {
        $tr = $(this).closest('tr');

        var data = table.row($tr).data();
        alert('You press on Row: ' + data[0] + ' ' + data[1] + ' ' + data[2] + '\'s row.');
    });
    table.on('click', '.remove', function(e) {
        $tr = $(this).closest('tr');
        table.row($tr).remove().draw();
        e.preventDefault();
    });
    table.on('click', '.like', function() {
        alert('You clicked on Like button');
    });

    $('.card .material-datatables label').addClass('form-group');
});
</script>
<script src="assetss/assets-for-demo/js/jquery.sharrre.js">
</script>
<script type="text/javascript">
 function ajouterIdCommande(id_commande){
	 document.getElementById("id_commande_modal").value=id_commande;
 }
</script>
<script>

$(document).ready(function(){
    $('#twitter').sharrre({
      share: {
        twitter: true
      },
      enableHover: false,
      enableTracking: false,
      enableCounter: false,
      buttons: { twitter: {via: 'CreativeTim'}},
      click: function(api, options){
        api.simulateClick();
        api.openPopup('twitter');
      },
      template: '<i class="fa fa-twitter"></i> Twitter',
      url: 'http://demos.creative-tim.com/material-kit-pro/presentation.html'
    });

    $('#facebook').sharrre({
      share: {
        facebook: true
      },
      enableHover: false,
      enableTracking: false,
      enableCounter: false,
      click: function(api, options){
        api.simulateClick();
        api.openPopup('facebook');
      },
      template: '<i class="fa fa-facebook-square"></i> Facebook',
      url: 'http://demos.creative-tim.com/material-kit-pro/presentation.html'
    });

    $('#google').sharrre({
      share: {
        googlePlus: true
      },
      enableCounter: false,
      enableHover: false,
      enableTracking: true,
      click: function(api, options){
        api.simulateClick();
        api.openPopup('googlePlus');
      },
      template: '<i class="fa fa-google-plus"></i> Google',
      url: 'http://demos.creative-tim.com/material-kit-pro/presentation.html'
    });
});

var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-46172202-1']);
_gaq.push(['_trackPageview']);

(function() {
    var ga = document.createElement('script');
    ga.type = 'text/javascript';
    ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(ga, s);
})();

// Facebook Pixel Code Don't Delete
!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
document,'script','../../../../connect.facebook.net/en_US/fbevents.js');

try{
	fbq('init', '111649226022273');
	fbq('track', "PageView");

}catch(err) {
	console.log('Facebook Track Error:', err);
}

</script>

<noscript>
	<img height="1" width="1" style="display: none"
		src="https://www.facebook.com/tr?id=111649226022273&amp;ev=PageView&amp;noscript=1" />
</noscript>
</html>
