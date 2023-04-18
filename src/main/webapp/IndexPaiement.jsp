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
<title>Form ajout paiement</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/fontawesome-free-6.3.0-web/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-vertical-menu.css">


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


		</div>

		<div class="col-3">

			<h2 style="color: blue; text-align: center">Formulaire Paiement</h2>
			<form action="${pageContext.request.contextPath}/Paiement_servlet"
				method="post">
				<div class="container">

					<div class="form-group">
						<label for="pwd">matricule:</label> <input type="text"
							class="form-control" id="matricule"
							placeholder="Enter votre matricule" name="matricule" required>
					</div>
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
								<option value="Janvier" selected>Janvier</option>
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
					<div class="form-group">
						<span> <label for="jour">jour:</label> <select id="jour"
							name="jour" class="form-control">
								<option value="01" selected>01</option>
								<option value="02">02</option>
								<option value="03">03</option>
								<option value="04">04</option>
								<option value="05">05</option>
								<option value="06">06</option>
								<option value="07">07</option>
								<option value="08">08</option>
								<option value="09">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
								<option value="25">25</option>
								<option value="26">26</option>
								<option value="27">27</option>
								<option value="28">28</option>
								<option value="29">29</option>
								<option value="30">30</option>
								<option value="31">31</option>


						</select>
						</span>
					</div>

					<div class="form-group">
						<label for="pwd">m_percu:</label> <input type="number"
							class="form-control" id="m_percu" placeholder="Enter  m_percu"
							name="m_percu" required>
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
				<h2 style="color: red">Listes des personnels payer</h2>
				<table class="table table-light" id="tab">
					<thead>
						<tr style="color: blue">
							<th>matricule</th>
							<th>annee</th>
							<th>mois</th>
							<th>jour</th>
							<th>m_perdu</th>
							<th>Modifier</th>
							<th>Supprimer</th>
						</tr>
						<%
						try {
							//if(request.getAttribute("etudiants")!=null){
							Gestion_paiement ge = new Gestion_paiement();
							ResultSet res = ge.getAllPaiement();
							while (res.next()) {
						%>
						<tr>
							<td><%=res.getString("matricule")%></td>
							<td><%=res.getString("annee")%></td>
							<td><%=res.getString("mois")%></td>
							<td><%=res.getString("jour")%></td>
							<td><%=res.getString("m_percu")%></td>
							<td><a
								href="AffichePaiModif?matricule=<%=res.getString("matricule")%>"
								class="btn btn-warning"
								style="width: 95px; color: white; border-radius: 25px;"><i
									class="fa-solid fa-pen-to-square"></i></a></td>
							<td><a
								href="DeletePai?matricule=<%=res.getString("matricule")%>"
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