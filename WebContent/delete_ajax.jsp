<%@page import="metier.SingletonConnexion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("id");
String table=request.getParameter("table");
String idtable=request.getParameter("idtable");
try
{
Class.forName("com.mysql.jdbc.Driver");
 			Connection conn = SingletonConnexion.getCon();
Statement st=conn.createStatement();


int i=st.executeUpdate("DELETE FROM "+table+" WHERE "+idtable+"="+id);
out.println("Est bien supprimer !");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>