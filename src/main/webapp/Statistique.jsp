<%@page import="Controleur.Gestion_employe"%>
<%@page import="Controleur.Gestion_paiement"%>
<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Statistiques</title>
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


		<div class="col-10">
			<p align="center"><h2>Statistiques</h2></p>


			<div class="d-flex flex-row gap-4 justify-content-center">
				<%
				Map<String, Object> data = (Map<String, Object>) request.getAttribute("data");
				%>
				<div class="card mx-4 mt-4" style="width: 18rem;">
					<img class="card-image-top" src="img/employe.jpg">
					<div class="card-body">
						<p class="card-text">
							<span style="font-size: 22px;">Nombre d'employés :</span><br>
							<strong style="font-size: 34px;"><%=data.get("nb_employe")%></strong>
						</p>
					</div>
				</div>
				<div class="card mx-4 mt-4" style="width: 18rem;">
					<img class="card-image-top" src="img/paiement.jpg">
					<div class="card-body">
						<p class="card-text">
							<span style="font-size: 22px;">Nombre de personnels payés
								:</span><br> <strong style="font-size: 34px;"><%=data.get("nb_paiement")%></strong>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>




</body>
</html>