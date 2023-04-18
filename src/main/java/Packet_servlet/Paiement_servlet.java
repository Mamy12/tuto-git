package Packet_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

import Classes.Paiement;
import Controleur.Gestion_paiement;

/**
 * Servlet implementation class Paiement_servlet
 */
public class Paiement_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Paiement_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Gestion_paiement ge=new Gestion_paiement();
			ResultSet rs=ge.getAllPaiement();
			request.setAttribute("rs", rs);
			request.getServletContext().getRequestDispatcher("/IndexPaiement.jsp").forward(request,response);
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
		if(request.getMethod().equals("POST")){
			int matricule=Integer.parseInt(request.getParameter("matricule"));
			int annee=Integer.parseInt(request.getParameter("annee"));
			String mois = request.getParameter("mois");
			int jour=Integer.parseInt(request.getParameter("jour"));
			int m_percu=Integer.parseInt(request.getParameter("m_percu"));
			
		
			
			String affic="";
			try {
				Paiement pa=new Paiement(matricule,annee, mois,jour,m_percu);
				Gestion_paiement ge=new Gestion_paiement();
				ge.insertPaiement(pa);
				affic="Ajout réussit";
			} catch (Exception e) {
				System.out.println(e);
			}
			
			request.setAttribute("affic", affic);
			request.getServletContext().getRequestDispatcher("/IndexPaiement.jsp").forward(request,response);
		}
	}

}
