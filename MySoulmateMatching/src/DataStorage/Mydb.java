/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datastorage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author asus
 */
public class Mydb {
      String url="jdbc:mysql://localhost:3306/mysoulmate";
     String login="root";
     String pwd="";
 public  Connection cnx;
 private static Mydb instance=null;
private Mydb()  {
         try {
             cnx=DriverManager.getConnection(url,login,pwd);
         } catch (SQLException ex) {
             Logger.getLogger(Mydb.class.getName()).log(Level.SEVERE, null, ex);
         }
                 
}

public static Mydb getinstance(){
if ( instance == null ) 
    instance = new Mydb();
    return instance;
}

    public Connection getCnx() {
        return cnx;
    }


}
