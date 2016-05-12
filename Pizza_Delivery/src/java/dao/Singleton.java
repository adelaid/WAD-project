/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.dbConn;

/**
 *
 * @author Adelaid
 */
public class Singleton {
    private static Singleton instance;
private Connection con=null;


 protected Singleton() {

        try {
            if(con == null){
            con = dbConn.getConnection();
            }
        } catch (Exception ex) {
            Logger.getLogger(Singleton.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
 
public static Singleton getInstance(){
if(instance==null){ 
    instance = new Singleton();
            }
return instance;
}
public Connection getCon() {
        return con;
    }
}
