package Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class Connectiondb {
	public Connection con;
    public  Statement stat;

    public Connectiondb(Connection con, Statement stat) {
        this.con = con;
        this.stat = stat;
    }
    
    public Connectiondb() throws Exception{
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con =  (Connection) DriverManager.getConnection(Constantes.URL,Constantes.USER,Constantes.PASSWD);
            stat = (Statement) con.createStatement();
    
    
        }catch (SQLException e) {
            e.printStackTrace();
        }catch(ClassNotFoundException e){
           System.err.println("une erreur est survenu,class not found");  
        }
    }
        public ResultSet execute (String query) throws Exception{
        ResultSet res=null;
        res=stat.executeQuery(query);
        return(res);
        }
        
        public int executeUpdate (String query) throws Exception{
        int res=0;
        res=stat.executeUpdate(query);
        return(res);
    }

    public void close() throws Exception{
            stat.close();
            con.close();
    }
}
