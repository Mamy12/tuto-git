<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DateFormatSymbols"%>
<%@page import="java.util.Locale"%>
<%@page import="Controleur.Gestion_paiement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modification paiement</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/fontawesome-free-6.3.0-web/css/all.min.css">
</head>
<body>
	<h2>Modification Paiement</h2>
	<form action="${pageContext.request.contextPath}/Modification1_servlet"
		method="post">
		<%
		try {
			ResultSet res1 = (ResultSet) request.getAttribute("rs");
			while (res1.next()) {
		%>
		<div class="container">
			<div class="form-group">
				<label for="pwd">matricule:</label> <input type="text"
					class="form-control" id="matricule"
					placeholder="Enter votre matricule" name="matricule"
					value="<%=res1.getString("matricule")%>" required>

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
				<span> <label for="mois">Mois:</label>
				
				<%-- <select id="mois" name="mois" class="form-control">
				  <%
				  Locale francais = new Locale("fr", "FR");
				  	DateFormatSymbols dfs = new DateFormatSymbols(francais);
				  String[] nomMois = dfs.getMonths();
				  	ArrayList<String> listeMois = new ArrayList<String>();
				  	
				  	for (String mois : nomMois) {
				  		if (!mois.isEmpty()) {
				  			listeMois.add(mois);
				  		}
				  	}
				  
				  	
				    for (int h = 0; h <= listeMois.size(); h++) {
				    	System.out.println(listeMois.get(h));
				      String currentOption = res1.getString("mois");
				      if (currentOption.equals(listeMois.get(h))) {
				        %><option value="<%=currentOption%>" selected="selected"><%=currentOption%></option><%
				      } else {
				        %><option value="<%=listeMois.get(h)%>"><%=listeMois.get(h)%></option><%
				      }
				    }
				  %>
				</select> --%>
				
				
				<select id="mois" name="mois" class="form-control">
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
			<div class="form-group">
				<span> <label for="jour">jour:</label>
				
				<select id="jour" name="jour" class="form-control">
				  <%
				    for (int i = 1; i <= 31; i++) {
				      String currentOption = res1.getString("jour");
				      String j = String.format("%02d", i);
				      if (currentOption.equals(j)) {
				        %><option value="<%=currentOption%>" selected="selected"><%=currentOption%></option><%
				      } else {
				        %><option value="<%=currentOption%>"><%=currentOption%></option><%
				      }
				    }
				  %>
				</select>
				
				</span>
			</div>
			<div class="form-group">
				<label for="pwd">m_percu:</label> <input type="number"
					class="form-control" id="m_percu" placeholder="Enter  m_percu"
					name="m_percu" value="<%=res1.getString("m_percu")%>" required>
			</div>
			<button type="submit" class="btn btn-primary">
				<i class="fa-solid fa-pen-to-square"> u p d a t e</i>
			</button>
		</div>
		<%
		}

		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</form>

</body>
</html>