package Controleur;

import java.sql.ResultSet;

import Classes.Paiement;
import Connection.Connectiondb;

public class Gestion_paiement {
	public Connectiondb connex;

    public Gestion_paiement() throws Exception{
        connex =new Connectiondb();
    }
    
    public void insertPaiement(Paiement obj) throws Exception {
        String query = "INSERT INTO Paiement(matricule,annee,mois,jour,m_percu) values ('" +  obj.getmatricule() + "','" + obj.getannee()+"','" + obj.getmois()+"','" + obj.getjour()+"','" + obj.getm_percu()+"')";
        connex.executeUpdate(query);
        connex.close();
    }
    
    public void updatePaiement(int matricule, Paiement obj) throws Exception {
        String query = "UPDATE paiement SET paiement.matricule='" + obj.getmatricule()+ "',annee='" + obj.getannee()+ "',mois='" + obj.getmois()+ "',jour='" + obj.getjour()+ "',m_percu='" + obj.getm_percu(
        		) + "'";
        connex.executeUpdate(query);
        connex.close();
    }
    
    public void deletePaiement(int matricule) throws Exception {
        String query = "DELETE FROM  paiement WHERE matricule=" + matricule + "";
        connex.executeUpdate(query);
        connex.close();
    }
    
    public ResultSet getAllPaiement() throws Exception {
        String query = "SELECT * FROM paiement";
        ResultSet rs = connex.execute(query);
        //connex.close();
        return rs;
    }
     public ResultSet getAllPaiementBymatricule(int matricule) throws Exception {
         String query = "SELECT * FROM paiement where matricule="+matricule+"";
         ResultSet rs = connex.execute(query);
         //connex.close();
         return rs;
     }
}
