/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 *
 * @author Adelaid
 */
public class dbConn {
     private static Connection connection;

    public static Connection getConnection() {
        if (connection == null) {
//            try {
//            String url = "jdbc:mysql://localhost/pizzadelivery";
//            String user = "root";
//            String password = "root";
//           String driver="com.mysql.jdbc.Driver";
//           Class.forName(driver);
//            connection = DriverManager.getConnection(url, user, password);
//           connection.setAutoCommit(false);
//            }
          //  Context ctx;
               try{
                   Context ctx = new InitialContext();
                    DataSource ds =
(DataSource)ctx.lookup("jdbc/myDs");
connection=ds.getConnection();
connection.setAutoCommit(false);
               }
               catch(Exception e){
                   
               }}
               
   
      
return connection;
    

}
}
