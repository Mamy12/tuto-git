package Packet_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
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
 * Servlet implementation class Statistique_servlet
 */
public class Statistique_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Statistique_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String employeQuery ="select COUNT(*) from employe";
        String paiementQuery = "select COUNT(*) from paiement";
        
        Map<String, Object> data = new HashMap<>();
        try {
        	Class.forName("com.mysql.jdbc.Driver");
            Connection con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost/salaire1","root","");
            Statement stat = (Statement)con.createStatement();
            ResultSet rs = stat.executeQuery(employeQuery);
            while (rs.next()) {
                data.put("nb_employe", rs.getInt(1));
            }
            
            stat = (Statement)con.createStatement();
            rs = stat.executeQuery(paiementQuery);
            while (rs.next()) {
                data.put("nb_paiement", rs.getInt(1));
            }
        } catch (Exception e) {
        	System.out.println(e);
            // gérer l'exception
        }
        
        try {
        	request.setAttribute("data", data);
			request.getServletContext().getRequestDispatcher("/Statistique.jsp").forward(request,response);
		} catch (Exception e) {
			System.out.println(e);
		}
        
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
