package Controleur;

import java.sql.ResultSet;

import Classes.Paiement;

import Connection.Connectiondb;


public class Gestion_Verification {
	
	public Connectiondb connex;

    public Gestion_Verification() throws Exception{
        connex =new Connectiondb();
    }
    
    public ResultSet selectPaiement(Paiement obj) throws Exception {
    	
        String query ="select matricule,nom,prenom,annee,mois,sum(m_percu) as montant,t_mensuel-sum(m_percu) as reste from employe inner join paiement"
		+ " on employe.matricule=paiement.matricule where annee='"+obj.getannee()+"' and mois='"+obj.getmois()+"'"
				+ "group by matricule,annee,mois ";
        ResultSet rs = connex.execute(query);
        return rs;
    }

    public ResultSet getAllPaiement() throws Exception {
        String query = "SELECT * FROM paiement";
        ResultSet rs = connex.execute(query);
        //connex.close();
        return rs;
    }
    
}
