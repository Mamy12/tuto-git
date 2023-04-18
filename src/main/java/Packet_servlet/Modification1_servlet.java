package Packet_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Classes.Paiement;
import Controleur.Gestion_paiement;

/**
 * Servlet implementation class Modification1_servlet
 */
public class Modification1_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modification1_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
			String mois=request.getParameter("mois");
			int jour=Integer.parseInt(request.getParameter("jour"));
			int m_percu=Integer.parseInt(request.getParameter("m_percu"));
			String affic="";
			try {
				Paiement pa=new Paiement(matricule, annee, mois, jour,m_percu);
				Gestion_paiement ge=new Gestion_paiement();
				ge.updatePaiement(matricule, pa);
				System.out.println("Modification réussit");
				affic="Modification réussit";
			} catch (Exception e) {
				System.out.println(e);
			}
			//response.sendRedirect("/Form_etudiant.jsp");
			request.setAttribute("affic", affic);
			request.getServletContext().getRequestDispatcher("/IndexPaiement.jsp").forward(request,response);
		}
	
	}

}
