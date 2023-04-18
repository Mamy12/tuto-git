package Classes;

public class Paiement {
	private int matricule;
	private int annee;
	private String mois ;
	private int jour;	
	private int m_percu;
	
	public Paiement( int matricule,int annee, String mois, int jour , int m_percu) {
		super();
		this.matricule = matricule;
		this.annee = annee;
		this.mois = mois;
		this.jour = jour;
		this.m_percu = m_percu;
	}
	
	public int getmatricule() {
		return matricule;
	}

	public void setidemp(int matricule) {
		this.matricule = matricule;
	}

	public int getannee() {
		return annee;
	}
	
	public void setannee(int annee) {
		this.annee = annee;
	}
	public String getmois() {
		return mois;
    }

	public void setmois(String mois) {
		this.mois = mois;	
	}

	public int getjour() {
		return jour;
	}
	
	public void setjour(int jour) {
		this.jour = jour;
	}
	
	
	
	
	public int getm_percu() {
		return m_percu;
	}
	
	public void setm_percu(int m_percu) {
		this.m_percu = m_percu;
	}
}
