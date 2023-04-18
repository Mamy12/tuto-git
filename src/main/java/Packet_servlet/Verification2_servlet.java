package Packet_servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class Verification2_servlet
 */
public class Verification2_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Verification2_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			request.getServletContext().getRequestDispatcher("/Verification2.jsp").forward(request,response);
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
		int matricule=Integer.parseInt(request.getParameter("matricule"));
		String annee = request.getParameter("annee");
        String mois = request.getParameter("mois");
        String query="select employe.matricule,nom,prenom,annee,mois,jour,m_percu from employe inner join "
        		+ " paiement on employe.matricule = paiement.matricule where employe.matricule='"+matricule+"' and mois='"+mois+"' and annee='"+annee+"'"
        			;
    	 

     List<Map<String, Object>> data = new ArrayList<>();
		
        try {
        	Class.forName("com.mysql.jdbc.Driver");
            Connection con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost/salaire1","root","");
            Statement stat = (Statement)con.createStatement();
            ResultSet rs = stat.executeQuery(query);
            
            while(rs.next()) {
            	Map<String, Object> d = new HashMap<>();
            	   d.put("matricule", rs.getString("matricule"));
                   d.put("nom", rs.getString("nom"));
                   d.put("prenom", rs.getString("prenom"));
                   d.put("annee", rs.getString("annee"));
                   d.put("mois", rs.getString("mois"));
                   d.put("jour", rs.getString("jour"));
                   d.put("m_percu", rs.getString("m_percu"));
                   data.add(d);
            }
            
          
        } catch(Exception e) {
        	System.out.println(e);
        }
        
        request.setAttribute("data", data);
        RequestDispatcher rd = request.getRequestDispatcher("Verification2.jsp");
        rd.forward(request, response);
	}

}
