<%@page import="Controleur.Gestion_employe"%>
<%@page import="Controleur.Gestion_paiement"%>
<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Form ajout employe</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/fontawesome-free-6.3.0-web/css/all.min.css">



</head>
<body>



	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">

		<div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
			<div class="full">
				<div class="center-desk">
					<div class="logo" style="color: white; font-weight: bold;">
						<i class="fa fa-fw fa-lg fa-home"></i>
						<h5>S A L A I R E__E M P L O Y E</h5>
					</div>
				</div>
			</div>
		</div>
		<form class="form-inline ml-auto" action="/action_page.php">
			<input class="form-control mr-sm-2" type="text" placeholder="Search"
				style="border-radius: 25px">
			<button class="btn btn-primary my-2 my-sm-0" type="submit"
				style="border-radius: 25px">
				<i class="fa fa-fw fa-lg fa-search"></i>Search
			</button>
		</form>

	</nav>

	<div class="row">


		<div class="col-2">


			<nav class="navbar navbar-expand-lg navbar-dark bg-dark"
				style="height: 420px; font-weight: bold; margin-bottom: 10px;">

				<div class="collapse navbar-collapse" id="navbarNav"
					style="margin-bottom: 100px;">
					<ul class="navbar-nav flex-column">
						<li class="nav-item mx-2 my-2"><a class="nav-link"
							href="${pageContext.request.contextPath}/IndexEmploye.jsp"><i
								class="fa fa-fw fa-lg fa-address-book"></i>EMPLOYER</a></li>
						<li class="nav-item mx-2 my-2"><a class="nav-link"
							href="${pageContext.request.contextPath}/IndexPaiement.jsp"><i
								class="fa fa-fw fa-lg fa-money-bill"></i>PAIEMENT</a></li>
						<li class="nav-item mx-2 my-2"><a class="nav-link"
							href="${pageContext.request.contextPath}/Verification1.jsp">PAIEMENT/MOIS</a></li>
						<li class="nav-item mx-2 my-2"><a class="nav-link"
							href="${pageContext.request.contextPath}/Verification2.jsp">HISTORIQUE/MOIS</a></li>
						<li class="nav-item mx-2 my-2"><a class="nav-link"
							href="${pageContext.request.contextPath}/Statistique_servlet">STATISTIQUES</a></li>

						<li class="nav-item mx-2 my-4"><a class="nav-link"
							href="${pageContext.request.contextPath}/Login.jsp"><i
								class="fa fa-fw fa-lg fa-sign-out"></i>LOGOUT</a></li>
					</ul>
				</div>
			</nav>


		</div>


		<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
		<script>
			$(document).ready(function() {
				$('a').click(function(event) {
					$('a').removeClass('selected');
					$(this).addClass('selected');
					event.preventDefault();
				})
			});
		</script>



		<div class="col-4">

			<h2 style="color: blue; text-align: center">Formulaire employe</h2>
			<form action="${pageContext.request.contextPath}/Employe_servlet"
				method="post">
				<div class="container">

					<div class="form-group">
						<label for="pwd">matricule:</label> <input type="text"
							class="form-control" id="matricule"
							placeholder="Enter votre matricule" name="matricule" required>
					</div>

					<div class="form-group">
						<label for="pwd">Nom:</label> <input type="text"
							class="form-control" id="nom" placeholder="Enter votre nom"
							name="nom" required>
					</div>

					<div class="form-group">
						<label for="pwd">Prenom:</label> <input type="text"
							class="form-control" id="prenom" placeholder="Enter prenom"
							name="prenom" required>
					</div>
					<div class="form-group">
						<label for="pwd">t_mensuel:</label> <input type="number"
							class="form-control" id="t_mensuel"
							placeholder="Enter  votre salaire" name="t_mensuel" required>
					</div>
					<button type="submit" class="btn btn-primary">
						<i class="fa fa-save"> a d d</i>
					</button>
				</div>

			</form>

		</div>
		<div class="col-4">

			<h3 class="text-warning"></h3>
			<div class="container">
				<h2 style="color: red">Listes des employés</h2>
				<table class="table table-light" id="tab">
					<thead>
						<tr style="color: blue">
							<th>matricule</th>
							<th>nom</th>
							<th>Prenom</th>
							<th>t_mensuel</th>
							<th>Modifier</th>
							<th>Supprimer</th>
						</tr>
						<%
						try {
							//if(request.getAttribute("etudiants")!=null){
							Gestion_employe ge = new Gestion_employe();
							ResultSet res = ge.getAllEmploye();
							while (res.next()) {
						%>
						<tr>
							<td><%=res.getString("matricule")%></td>
							<td><%=res.getString("nom")%></td>
							<td><%=res.getString("prenom")%></td>
							<td><%=res.getString("t_mensuel")%></td>
							<td><a
								href="AfficheEmpModif?matricule=<%=res.getString("matricule")%>"
								class="btn btn-warning"
								style="width: 95px; color: white; border-radius: 25px;"><i
									class="fa-solid fa-pen-to-square"></i></a></td>
							<td><a
								href="DeleteEmp?matricule=<%=res.getString("matricule")%>"
								class="btn btn-danger"
								style="width: 95px; color: white; border-radius: 25px;"><i
									class="fa fa-trash"></i></a></td>
						</tr>
						<%
						}
						//}
						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
					
				</table>
			</div>
		</div>
	</div>



</body>
</html>