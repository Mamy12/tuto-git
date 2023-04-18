<%@page import="Packet_servlet.Verification1_servlet"%>
<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Map"%>

<%@page import="java.util.List, java.util.Map"%>

<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Form verification</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/fontawesome-free-6.3.0-web/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-vertical-menu.css">

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.13.2/css/dataTables.bootstrap5.min.css">

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

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

		<div class="col-3">


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

		<div class="col-3">

			<h2 style="color: blue; text-align: center">Formulaire de
				verification</h2>
			<form
				action="${pageContext.request.contextPath}/Verification1_servlet"
				method="post">
				<div class="container">

					<div class="form-group">
						<label for="annee">annee:</label> <select id="annee" name="annee"
							class="form-control">
							<option value="2025">2025</option>
							<option value="2024">2024</option>
							<option value="2023" selected>2023</option>
							<option value="2022">2022</option>
							<option value="2021">2021</option>
							<option value="2020">2020</option>
							<option value="2019">2019</option>
							<option value="2018">2018</option>
							<option value="2017">2017</option>
							<option value="2016">2016</option>
							<option value="2015">2015</option>
							<option value="2014">2014</option>
							<option value="2013">2013</option>
						</select>
					</div>
					<div class="form-group">
						<span> <label for="mois">Mois:</label> <select id="mois"
							name="mois" class="form-control">
								<option value="janvier" selected>janvier</option>
								<option value="fevrier">fevrier</option>
								<option value="mars">mars</option>
								<option value="avril">avril</option>
								<option value="mai">mai</option>
								<option value="juin">juin</option>
								<option value="juillet">juillet</option>
								<option value="aout">aout</option>
								<option value="septembre">septembre</option>
								<option value="octobre">octobre</option>
								<option value="novembre">novembre</option>
								<option value="decembre">decembre</option>
						</select>
						</span>
					</div>

					<button type="submit" class="btn btn-primary">
						<i class="fa fa-check"> v e r i f i e r</i>
					</button>
				</div>

			</form>

		</div>
		<div class="col-4">

			<h3 class="text-warning"></h3>
			<div class="container">
				<h2 style="color: red">Listes des paiement durant un mois</h2>
				<table class="table table-light" id="tab">
					<thead>
						<tr style="color: blue">
							<th>matricule</th>
							<th>nom</th>
							<th>prenom</th>
							<th>annee</th>
							<th>mois</th>
							<th>montant</th>
							<th>reste</th>

						</tr>
					</thead>
					<tbody>
						<%
						List<Map<String, Object>> data = (List<Map<String, Object>>) request.getAttribute("data");
						%>
						<%
						if (data != null && !data.isEmpty()) {
							for (Map<String, Object> d : data) {
						%>
						<tr>
							<td><%=d.get("matricule")%></td>
							<td><%=d.get("nom")%></td>
							<td><%=d.get("prenom")%></td>
							<td><%=d.get("annee")%></td>
							<td><%=d.get("mois")%></td>
							<td><%=d.get("montant")%></td>
							<td><%=d.get("reste")%></td>
						</tr>
						<%
						}
						%>

						<%
						} else {
						%>

						<%
						}
						%>
					</tbody>
				</table>
				<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
				<script>
					$(document).ready(function() {
						$.getJSON("RecupererDonneesServlet", function(data) {
							console.log(data);
						});
					});
				</script>


			</div>
		</div>



	</div>



</body>
</html>