package Controleur;

import java.sql.ResultSet;

import Classes.Login;
import Connection.Connectiondb;

public class Gestion_login {
	public Connectiondb connex;

    public Gestion_login() throws Exception{
        connex =new Connectiondb();
    }
    
     public void insertLogin( Login obj) throws Exception {
        String query = "INSERT INTO login(email,password) values ( 'admin@gmail.com', '1503')";
        connex.executeUpdate(query);
        connex.close();
     }
     public ResultSet getAllLogin() throws Exception {
        String query = "SELECT * FROM login";
        ResultSet rs = connex.execute(query);
        //connex.close();
        return rs;
    }
     public ResultSet getAllLoginById(int id ) throws Exception {
         String query = "SELECT * FROM login where id="+id+"";
         ResultSet rs = connex.execute(query);
         //connex.close();
         return rs;
     }
}
