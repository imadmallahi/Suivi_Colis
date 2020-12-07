<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Detail Command</title>
<style>
@page { @bottom-right { content:counter(page)" of "counter(pages);
	
}

}
h4 {
	color: #195FCA;
	font-style: italic;
}
</style>
</head>
<body>
	<div class="container" style="page-break-before: always;">
		<div class="row"></div>
		<h4>

			<c:choose>
				<c:when test="${sessionScope.lang == 'ar'}">معلومات حول الطلب</c:when>
				<c:when test="${sessionScope.lang == 'fr'}">Informations de la commande</c:when>
				<c:otherwise>  command of information</c:otherwise>
			</c:choose>
			</h4>
		<table class="table table-bordered table-condensed">
			<tbody>
				<tr>
					<td>
						<h6>
							<strong>
							<c:choose>
							<c:when test="${sessionScope.lang == 'ar'}">رقم الطلب</c:when>
							<c:when test="${sessionScope.lang == 'fr'}">Numéro de la commande</c:when>
							<c:otherwise>command number</c:otherwise>
						</c:choose>
							</strong>
						</h6> <span>${informationCommandeWithAgentAndAdherent.getCommande().getId()}</span>
					</td>
				</tr>
				<tr>
					<td>
						<h6>
							<strong>
							<c:choose>
							<c:when test="${sessionScope.lang == 'ar'}">حالة الطلب</c:when>
							<c:when test="${sessionScope.lang == 'fr'}">Etat de la commande</c:when>
							<c:otherwise>Order status</c:otherwise>
						</c:choose></strong>
						</h6> <span>${informationCommandeWithAgentAndAdherent.getCommande().getEtat()}</span>
					</td>
				</tr>
				<tr>

					<td>
						<h6>
							<strong>
							<c:choose>
							<c:when test="${sessionScope.lang == 'ar'}"> الموقع</c:when>
							<c:when test="${sessionScope.lang == 'fr'}">Emplacement de la commande</c:when>
							<c:otherwise>Order Location</c:otherwise>
						</c:choose>
							</strong>
						</h6> <span>${informationCommandeWithAgentAndAdherent.getCommande().getEmplacement()}</span>
					</td>
				</tr>
				<tr>
					<td>
						<h6>
							<strong>
							<c:choose>
							<c:when test="${sessionScope.lang == 'ar'}">تاريخ إنشاء الطلب</c:when>
							<c:when test="${sessionScope.lang == 'fr'}">Date de création de la commande</c:when>
							<c:otherwise>Creation date of the order</c:otherwise>
						</c:choose>
							</strong>
						</h6> <span>${informationCommandeWithAgentAndAdherent.getCommande().getDate_creation()}</span>
					</td>
				</tr>
				<c:if test="${sessionScope.type_account != 'client'}">
					<tr>
						<td>
							<h6>

								<strong>
								<c:choose>
							<c:when test="${sessionScope.lang == 'ar'}">اسم المشرف</c:when>
							<c:when test="${sessionScope.lang == 'fr'}">Nom superviseur</c:when>
							<c:otherwise>Supervisor name</c:otherwise>
						</c:choose>
								</strong>
							</h6> <span>${informationCommandeWithAgentAndAdherent.getNomSuperviseur()}</span>
						</td>
					</tr>
				</c:if>
				<tr>
					<td>
						<h6>
							<strong>
							<c:choose>
							<c:when test="${sessionScope.lang == 'ar'}">اسم العميل (صاحب الطلب)</c:when>
							<c:when test="${sessionScope.lang == 'fr'}">Nom du client (propriétaire de la commande)</c:when>
							<c:otherwise>Customer name (owner of the order)</c:otherwise>
						</c:choose>
							</strong>
						</h6> <span>${informationCommandeWithAgentAndAdherent.getClient().getNom()}</span>
					</td>
				</tr>
			</tbody>
		</table>
		<br>
		<h4>
		<c:choose>
							<c:when test="${sessionScope.lang == 'ar'}">معلومات عن نقطة المغادرة</c:when>
							<c:when test="${sessionScope.lang == 'fr'}">Informations sur le point de départ de la commande</c:when>
							<c:otherwise>Information on the point of departure</c:otherwise>
						</c:choose>
		</h4>
		<table class="table table-bordered table-condensed">
			<tbody>
				<tr>
					<td>
						<h6>
							<strong>
							<c:choose>
							<c:when test="${sessionScope.lang == 'ar'}">نقطة المغادرة</c:when>
							<c:when test="${sessionScope.lang == 'fr'}">Point de départ de la commande</c:when>
							<c:otherwise>Departure point</c:otherwise>
						</c:choose>
							</strong>
						</h6> <span>${informationCommandeWithAgentAndAdherent.getCommande().getPoint_depart_commande()}</span>
					</td>
				</tr>
				<tr>

					<td>
						<h6>
							<strong>
							<c:choose>
							<c:when test="${sessionScope.lang == 'ar'}">منطقة وكالة المغادرة</c:when>
							<c:when test="${sessionScope.lang == 'fr'}">Zone de l'agence de départ</c:when>
							<c:otherwise>Zone of the departure agency</c:otherwise>
						</c:choose>
							</strong>
						</h6> <span>${informationCommandeWithAgentAndAdherent.getAgent().getZone()}</span>
					</td>
				</tr>
			</tbody>
		</table>
		<br>
		<h4>
		<c:choose>
							<c:when test="${sessionScope.lang == 'ar'}"> معلومات حول الوجهة</c:when>
							<c:when test="${sessionScope.lang == 'fr'}">Informations sur le point de destination de la commande</c:when>
							<c:otherwise>Destination point information</c:otherwise>
						</c:choose>
		</h4>
		<table class="table table-bordered table-condensed">
			<tbody>
				<tr>
					<td>
						<h6>
							<strong>
							<c:choose>
							<c:when test="${sessionScope.lang == 'ar'}">نقطة الوصول</c:when>
							<c:when test="${sessionScope.lang == 'fr'}">Point de destination de la commande</c:when>
							<c:otherwise>Destination point</c:otherwise>
						</c:choose>
							</strong>
						</h6> <span>${informationCommandeWithAgentAndAdherent.getCommande().getPoint_destination()}</span>
					</td>
				</tr>
				<tr>

					<td>
						<h6>
							<strong>
							<c:choose>
							<c:when test="${sessionScope.lang == 'ar'}">منطقة وكالة الوجهة</c:when>
							<c:when test="${sessionScope.lang == 'fr'}">Zone de l'agence de destination</c:when>
							<c:otherwise>Destination Agency Area</c:otherwise>
						</c:choose>
							</strong>
						</h6> <span>${informationCommandeWithAgentAndAdherent.getZoneAgenceDestination()}</span>
					</td>
				</tr>
			</tbody>
		</table>
		<br>
		<h4>
		<c:choose>
							<c:when test="${sessionScope.lang == 'ar'}">معلومات نقطة الوجهة</c:when>
							<c:when test="${sessionScope.lang == 'fr'}">Informations sur le point de destination de la commande</c:when>
							<c:otherwise>Destination point information</c:otherwise>
						</c:choose>
		</h4>
		<table class="table table-bordered table-condensed">
			<tbody>
				<tr>
					<td>
						<h6>
							<strong>
							<c:choose>
							<c:when test="${sessionScope.lang == 'ar'}">نقطة الوجهة</c:when>
							<c:when test="${sessionScope.lang == 'fr'}">Point de destination de la commande</c:when>
							<c:otherwise>Point of destination</c:otherwise>
						</c:choose>
							</strong>
						</h6> <span>${informationCommandeWithAgentAndAdherent.getCommande().getPoint_destination()}</span>
					</td>
				</tr>
				<tr>

					<td>
						<h6>
							<strong>
							<c:choose>
							<c:when test="${sessionScope.lang == 'ar'}">منطقة وكالة الوجهة</c:when>
							<c:when test="${sessionScope.lang == 'fr'}">Zone de l'agence de destination</c:when>
							<c:otherwise>Destination Agency Area</c:otherwise>
						</c:choose>
							</strong>
						</h6> <span>${informationCommandeWithAgentAndAdherent.getZoneAgenceDestination()}</span>
					</td>
				</tr>
			</tbody>
		</table>
		<br>
		<h4>
		<c:choose>
							<c:when test="${sessionScope.lang == 'ar'}">معلومات المستلم</c:when>
							<c:when test="${sessionScope.lang == 'fr'}">Informations du destinataire</c:when>
							<c:otherwise>Recipient Information</c:otherwise>
						</c:choose>
		</h4>
		<table class="table table-bordered table-condensed">
			<tbody>
				<tr>
					<td>
						<h6>
							<strong><c:choose>
							<c:when test="${sessionScope.lang == 'ar'}">اسم المستلم</c:when>
							<c:when test="${sessionScope.lang == 'fr'}">Nom  du destinataire</c:when>
							<c:otherwise>Nom  of Recipient</c:otherwise>
						</c:choose>
							</strong>
						</h6> <span>${informationCommandeWithAgentAndAdherent.getCommande().getNom_prenom_destinataire()}</span>
					</td>
				</tr>
				<tr>

					<td>
						<h6>
							<strong>
							<c:choose>
							<c:when test="${sessionScope.lang == 'ar'}">ب ت و ط </c:when>
							<c:when test="${sessionScope.lang == 'fr'}">CIN de destinataire</c:when>
							<c:otherwise> CIN of Recipient</c:otherwise>
						</c:choose>
							 </strong>
						</h6> <span>${informationCommandeWithAgentAndAdherent.getCommande().getCin_destinataire()}</span>
					</td>
				</tr>
				<tr>
					<td>
						<h6>
							<strong>
							<c:choose>
							<c:when test="${sessionScope.lang == 'ar'}">Phone number</c:when>
							<c:when test="${sessionScope.lang == 'fr'}">Numéro de téléphone du destinataire</c:when>
							<c:otherwise>Phone number</c:otherwise>
						</c:choose>
							</strong>
						</h6> <span>${informationCommandeWithAgentAndAdherent.getCommande().getNum_telephone_destinataire()}</span>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<br>
	<h4>
	<c:choose>
							<c:when test="${sessionScope.lang == 'ar'}">قائمة الطرود</c:when>
							<c:when test="${sessionScope.lang == 'fr'}">Liste des colis</c:when>
							<c:otherwise> Package of list</c:otherwise>
						</c:choose>
	</h4>
	<table id="datatables" class="table table-no-bordered table-hover"
		cellspacing="0" width="100%" style="width: 100%">
		<tbody>
			<tr>
				<td style="color: red;">
				<c:choose>
							<c:when test="${sessionScope.lang == 'ar'}">الطبيعة</c:when>
							<c:when test="${sessionScope.lang == 'fr'}">Nature</c:when>
							<c:otherwise>Nature</c:otherwise>
						</c:choose>
						</td>
				<td style="color: red;">
				<c:choose>
							<c:when test="${sessionScope.lang == 'ar'}">الوزن / المبلغ</c:when>
							<c:when test="${sessionScope.lang == 'fr'}">Poids / Montant</c:when>
							<c:otherwise>Weight/ Cost</c:otherwise>
						</c:choose>
				</td>
			</tr>
			<c:forEach items="${listeColis}" var="row">
				<tr>
					<td>${row.getNature()}</td>
					<td>${row.getPoids() }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<h3 style="border: 2px;">
		<c:if test="${informationCommandeWithAgentAndAdherent.getCommande().getTotalCommande() != -1}">
		<c:choose>
				<c:when test="${sessionScope.lang == 'ar'}">  المبلغ الإجمالي</c:when>
				<c:when test="${sessionScope.lang == 'fr'}">Montant totale de la commande :</c:when>
				<c:otherwise>Total amount :</c:otherwise>
			</c:choose>
						 <strong style="color: red;">${informationCommandeWithAgentAndAdherent.getCommande().getTotalCommande()}
				${informationCommandeWithAgentAndAdherent.getCommande().getMonnaie_total_commande()}</strong>
		</c:if>
		<c:if
			test="${informationCommandeWithAgentAndAdherent.getCommande().getTotalCommande() == -1}">
		<c:choose>
							<c:when test="${sessionScope.lang == 'ar'}"> : المبلغ الإجمالي</c:when>
							<c:when test="${sessionScope.lang == 'fr'}">Montant totale de la commande :</c:when>
							<c:otherwise>Total amount :</c:otherwise>
						</c:choose>
		  <strong style="color: red;">
				... </strong>
		</c:if>
	</h3>
	<br>

</body>
</html>