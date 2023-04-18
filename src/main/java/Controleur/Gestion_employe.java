package Controleur;

import java.sql.ResultSet;

import Classes.Employe;
import Connection.Connectiondb;

public class Gestion_employe {
	public Connectiondb connex;

    public Gestion_employe() throws Exception{
        connex =new Connectiondb();
    }
    
     public void insertEmploye( Employe obj) throws Exception {
        String query = "INSERT INTO employe(matricule,nom,prenom,t_mensuel) values ('" + obj.getmatricule() + "','" + obj.getNom()+"','" + obj.getPrenom()+"','" + obj.gett_mensuel()+"')";
        connex.executeUpdate(query);
        connex.close();
    }
     public void updateEmploye( int matricule , Employe obj) throws Exception {
        String query = "UPDATE employe SET nom='" + obj.getNom()+ "',prenom='" + obj.getPrenom()+ "',t_mensuel='" + obj.gett_mensuel(
        		) + "' WHERE matricule='" + matricule + "'";
        connex.executeUpdate(query);
        connex.close();
    }
     public void deleteEmploye(int matricule) throws Exception {
        String query = "DELETE FROM  employe WHERE matricule=" + matricule + "";
        connex.executeUpdate(query);
        connex.close();
    }
     public ResultSet getAllEmploye() throws Exception {
        String query = "SELECT * FROM employe";
        ResultSet rs = connex.execute(query);
        //connex.close();
        return rs;
    }
     public ResultSet getAllEmployeBymatricule(int matricule ) throws Exception {
         String query = "SELECT * FROM employe where matricule="+matricule+"";
         ResultSet rs = connex.execute(query);
         //connex.close();
         return rs;
     }
}
