package Packet_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Classes.Employe;
import Controleur.Gestion_employe;

/**
 * Servlet implementation class Modification_servlet
 */
public class Modification_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modification_servlet() {
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
		if(request.getMethod().equals("POST")){
			int matricule=Integer.parseInt(request.getParameter("matricule"));
			String nom=request.getParameter("nom");
			String prenom=request.getParameter("prenom");
			int t_mensuel=Integer.parseInt(request.getParameter("t_mensuel"));
			String affic="";
			try {
				Employe em=new Employe( matricule,nom, prenom, t_mensuel);
				Gestion_employe ge=new Gestion_employe();
				ge.updateEmploye(matricule, em);
				System.out.println("Modification réussit");
				affic="Modification réussit";
			} catch (Exception e) {
				System.out.println(e);
			}
			//response.sendRedirect("/Form_etudiant.jsp");
			request.setAttribute("affic", affic);
			request.getServletContext().getRequestDispatcher("/IndexEmploye.jsp").forward(request,response);
		}
	}

}
