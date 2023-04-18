package Packet_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

import Controleur.Gestion_login;

/**
 * Servlet implementation class Login_servlet
 */
public class Login_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Gestion_login ge=new Gestion_login();
			ResultSet rs=ge.getAllLogin();
			request.setAttribute("rs", rs);
			request.getServletContext().getRequestDispatcher("/IndexEmploye.jsp").forward(request,response);
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
			
			String email=request.getParameter("e");
			String password=request.getParameter("p");

			try {
				
				
				if (email.equals("admin@gmail.com") && password.equals("1503")) {
					request.getServletContext().getRequestDispatcher("/IndexEmploye.jsp").forward(request,response);
				}
			
				else {
					request.setAttribute("error" , "Identifiants incorrects");
					request.getServletContext().getRequestDispatcher("/Login.jsp").forward(request,response);
				}
			} catch (Exception e) {
				System.out.println(e);
			}
			
			
		}
	}

}
