<%@page import="java.sql.ResultSet"%>
<%@page import="Controleur.Gestion_employe"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modification employe</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/fontawesome-free-6.3.0-web/css/all.min.css">
</head>
<body>
	<h2>Modification Employe</h2>
<form action="${pageContext.request.contextPath}/Modification_servlet" method="post">
<%
          	try{
          			ResultSet res1=(ResultSet) request.getAttribute("rs");
          			while(res1.next()){
          				%>
    <div class="container">
    <div class="form-group">
      <label for="pwd">matricule:</label>
      <input type="text" class="form-control" id="matricule" placeholder="Enter votre matricule" name="matricule" value="<%=res1.getString("matricule")%>" required>
    </div>
    <div class="form-group">
      <label for="email">nom:</label>
      <input type="text" class="form-control" id="nom" placeholder="Enter nom" name="nom" value="<%=res1.getString("nom")%>" required>
    </div>
    <div class="form-group">
      <label for="pwd">Prenom:</label>
      <input type="text" class="form-control" id="prenom" placeholder="Enter prenom" name="prenom" value="<%=res1.getString("prenom")%>" required>
    </div>
    <div class="form-group">
      <label for="pwd">t_mensuel:</label>
      <input type="number" class="form-control" id="t_mensuel" placeholder="Enter  votre salaire" name="t_mensuel" value="<%=res1.getString("t_mensuel")%>" required>
    </div>
    <button type="submit" class="btn btn-primary" ><i class="fa-solid fa-pen-to-square"> u p d a t e</i></button>
    </div>
    <%
          			}
          		
          	}catch(Exception e){
          		e.printStackTrace();
          	}
          	%>
   </form>
   
</body>
</html>