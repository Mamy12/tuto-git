<%@page import="Controleur.Gestion_employe"%>
<%@page import="Classes.Employe"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
<%
String affic="";
	if(request.getMethod().equals("POST")){
		int matricule=Integer.parseInt(request.getParameter("matricule"));
		String nom=request.getParameter("nom");
		String  prenom=request.getParameter("prenom");
		int t_mensuel=Integer.parseInt(request.getParameter("t_mensuel"));
		try {
	Employe em=new Employe(matricule,nom,prenom,t_mensuel);
	Gestion_employe ge=new Gestion_employe();
	ge.insertEmploye(em);
	affic="Ajout réussit";
	
		} catch (Exception e) {
	System.out.println(e);
	
		}
%>
<%	
	
		request.setAttribute("affic", affic);
		request.getServletContext().getRequestDispatcher("/IndexEmploye.jsp").forward(request,response);
	}
	%>
</body>
</html>