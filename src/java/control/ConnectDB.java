

package control;
import static java.lang.Character.UnicodeBlock.forName;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Nitish Aryan
 */
public class ConnectDB {
  static   Connection Con;
    public static Connection connect() throws ClassNotFoundException{
        try{
           
            Class.forName("com.mysql.jdbc.Driver");
            Con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
            System.out.println("Done");
  
        }
        catch(SQLException ex){
            System.out.println(ex);
        }
        return Con;
    }
    public static void main(String...s) throws ClassNotFoundException
    {
        connect();
    }
    
}
