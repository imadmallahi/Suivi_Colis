<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<title>Client</title>
</head>
<body>
<%
Cookie[] array= request.getCookies(); 
for(int i=0; i<array.length; i++)
{
if(array[i].getName().equals("Name"))
{
out.println("<br/>");
out.println("Name of the cookie : " + array[i].getName() + "<br/>");
out.println("Value in cookie : " + array[i].getValue());

//Deleting the cookie
array[i].setMaxAge(0);
response.addCookie(array[i]); //After this, although cookie will be not be visible from browser's memory
			      //but Cookie data will still be visible until you refresh this page.

} 
}
%>

<form class="fr" action="Servlet" method="post">

	
 <table>
 <tr>
 <td>Saisir ID Client</td>
 <td><input type="text" class=" from form-control" name="idC"></td>
 </tr>
 <tr>
 
 <tr>
<td>Liste de votre commande</td>
<td>  <button type="submit" class="btn btn-primary" name="action" value="listCommandeClient">liste commande</button>
   </td>
 </tr>
 <tr>
 <td>Saisir le code de suivi de votre colis</td>
 <td><input type="text" class=" from form-control" name="code"></td>
 <td>  <button type="submit" class="btn btn-primary" name="action" value="AfficherColis">colis</button>
   </td>
 </tr>
 <button type="submit" class="btn btn-primary" name="action" value="Maps">maps</button>
 </table>
 </form>

</body>
</html>