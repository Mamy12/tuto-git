<%@page import="Controleur.Gestion_paiement"%>
<%@page import="Classes.Paiement"%>

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
		int annee=Integer.parseInt(request.getParameter("annee"));
		String  mois=request.getParameter("mois");
		int jour=Integer.parseInt(request.getParameter("jour"));
		int m_percu=Integer.parseInt(request.getParameter("m_percu"));
		try {
	Paiement pa=new Paiement(matricule,annee,mois,jour,m_percu);
	Gestion_paiement ge=new Gestion_paiement();
	ge.insertPaiement(pa);
	affic="Ajout réussit";
	
		} catch (Exception e) {
	System.out.println(e);
	
		}
%>
<%	
	
		request.setAttribute("affic", affic);
		request.getServletContext().getRequestDispatcher("/IndexPaiement.jsp").forward(request,response);
	}
	%>
</body>
</html>