package Packet_servlet;

import java.sql.DriverManager;
import java.sql.ResultSet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class Verification1_servlet
 */
public class Verification1_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Connection con;
    public  Statement stat;

	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Verification1_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		try {
	
			request.getServletContext().getRequestDispatcher("/Verification1.jsp").forward(request,response);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
    

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String annee = request.getParameter("annee");
        String mois = request.getParameter("mois");
        String query ="select employe.matricule,nom,prenom,annee,mois,sum(m_percu) as montant,t_mensuel-sum(m_percu) as reste from employe inner join paiement"
    			+ " on employe.matricule=paiement.matricule where annee='"+annee+"' and mois='"+mois+"'"
    			+ "group by matricule,annee,mois";
        
        List<Map<String, Object>> data = new ArrayList<>();
        try {
        	Class.forName("com.mysql.jdbc.Driver");
            Connection con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost/salaire1","root","");
            Statement stat = (Statement)con.createStatement();
            ResultSet rs = stat.executeQuery(query);
            while (rs.next()) {
                Map<String, Object> d = new HashMap<>();
                d.put("matricule", rs.getString("matricule"));
                d.put("nom", rs.getString("nom"));
                d.put("prenom", rs.getString("prenom"));
                d.put("annee", rs.getString("annee"));
                d.put("mois", rs.getString("mois"));
                d.put("montant", rs.getString("montant"));
                d.put("reste", rs.getString("reste"));
                data.add(d);
            }
        } catch (Exception e) {
        	System.out.println(e);
            // gérer l'exception
        }
        
        request.setAttribute("data", data);
        RequestDispatcher rd = request.getRequestDispatcher("Verification1.jsp");
        rd.forward(request, response);
    
		
	}

}
