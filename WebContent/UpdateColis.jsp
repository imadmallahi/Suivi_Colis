<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Colis</title>
</head>
<body>
	<form method="post" action="Servlet">
		<input type="text" value="${colis.getId() }" name="id_colis_update">
		<div id="formularColis">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputEmail4">Nature</label> <input type="text"
						class="form-control" name="nature_colis"
						value="${colis.getNature()}">
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4">Poids</label> <input type="text"
						class="form-control" name="poids_colis"
						value="${colis.getPoids()}">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputEmail4">Point de départ</label> <input type="text"
						class="form-control" name="depart_colis"
						value="${colis.getPointsDepart()}">
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4">point d'arrivée</label> <input
						type="text" class="form-control" name="destinatison_colis"
						value="${colis.getPointDestination()}">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputEmail4">Code de suivi</label> <input type="text"
						class="form-control" name="code_suivi_colis"
						value="${colis.getCodeSuivi()}">
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4">Etat</label> <input type="text"
						class="form-control" name="etat" value="${colis.getEtat()}">
				</div>
			</div>
			<select name="id_commande">
				<c:forEach items="${listCommande}" var="row">
					<c:choose>
						<c:when test="${row.getId() == colis.getId_commande()}">
							<option value="${row.getId()}" selected>${row.getId()}</option>
						</c:when>
						<c:otherwise>
							<option value="${row.getId()}">${row.getId()}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>

			</select>
			<button type="submit" class="btn btn-primary" name="action"
				value="updateColis">Submit</button>
		</div>
	</form>
</body>
</html>