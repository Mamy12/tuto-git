package Classes;

public class Employe {
	private int matricule;
	private String nom;
	private String prenom;
	private int t_mensuel;
	
	
	public Employe(int matricule, String nom, String prenom, int t_mensuel) {
		super();
		this.matricule = matricule;
		this.nom = nom;
		this.prenom = prenom;
		this.t_mensuel = t_mensuel;
	}

	

	public int getmatricule() {
		return matricule;
	}

	public void setmatricule(int matricule) {
		this.matricule = matricule;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public int gett_mensuel() {
		return t_mensuel;
	}

	public void sett_mensuel(int t_mensuel) {
		this.t_mensuel = t_mensuel;
	}
	
}
