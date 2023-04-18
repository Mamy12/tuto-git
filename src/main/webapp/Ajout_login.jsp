<%@page import="Controleur.Gestion_login"%>
<%@page import="Classes.Login"%>

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
		
		String email=request.getParameter("email");
		String  password=request.getParameter("password");
		
		try {
	Login em=new Login(email,password);
	Gestion_login ge=new Gestion_login();
	ge.insertLogin(em);
	affic="Ajout réussit";
	
		} catch (Exception e) {
	System.out.println(e);
	
		}
%>
<%	
	
		request.setAttribute("affic", affic);
		request.getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
	}
	%>
</body>
</html>