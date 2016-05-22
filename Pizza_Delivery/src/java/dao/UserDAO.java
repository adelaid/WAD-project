/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.Hash;

/**
 *
 * @author Adelaid
 */
public class UserDAO implements UserDAOInterface{
private static UserDAO instance;

    public static UserDAO getInstance() {
        if (instance == null) {
            instance = new UserDAO();
        }
        return instance;
    }
    @Override
    public boolean createUser(String user, String pw, String fname, String lname, String mail, String tel, String address, String gender, boolean subscribe) {
     Singleton inst = Singleton.getInstance();
    Connection con = inst.getCon();
    try {
            PreparedStatement stmt = 
                    con.prepareStatement("insert into users values (default, ?, ?, ?, ? ,?, ? ,?,?,?)");
            stmt.setString(1, user);
            stmt.setString(2, Hash.getHash(pw));
            stmt.setString(3, fname);
            stmt.setString(4, lname);
            stmt.setString(5, mail);
            stmt.setString(6, tel);
            stmt.setString(7, address);
            stmt.setString(8, "" + gender);
            
            stmt.setInt(9, subscribe ? 1 : 0);
            stmt.executeUpdate();
            con.commit();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;   
    }

    @Override
    public boolean userExists(String username) {
    Singleton inst = Singleton.getInstance();
    Connection connection = inst.getCon();
         try {
            PreparedStatement prepStmt = 
                    connection.prepareStatement("SELECT * from users u where u.username = ?");
            prepStmt.setString(1, username);
            ResultSet rs = prepStmt.executeQuery();
            //result set is empty if there are no users with the same username
            if (rs.next()) {
                rs.close();
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;       
    }
    
     public boolean isPasswordCorrect(String username, String password) {
      Singleton inst = Singleton.getInstance();
    Connection connection = inst.getCon();
        try {
            PreparedStatement prepStmt = 
                    connection.prepareStatement("select * from users u where u.username = ? and u.password = ?");
            prepStmt.setString(1, username);
            prepStmt.setString(2, Hash.getHash(password));
            ResultSet rs = prepStmt.executeQuery();
            if (rs.next()) {
                rs.close();
                  System.out.println("true");
                return true;
              
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
          System.out.println("false");
        return false; 
    }
    
        public int getUserid(String username){
      Singleton inst = Singleton.getInstance();
    Connection connection = inst.getCon();
        try {
            PreparedStatement prepStmt = 
                    connection.prepareStatement("select iduser from users where username = ?");
             prepStmt.setString(1, username);
            ResultSet rs = prepStmt.executeQuery();
            if (rs.next()) {
               int b=rs.getInt(1);
               // System.out.println(rs.getInt(1));
                rs.close();
                  return b;
                 
            } }catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
        
         public boolean isAdmin(String username) {
    Singleton inst = Singleton.getInstance();
    Connection connection = inst.getCon();
         try {
            PreparedStatement prepStmt = 
                    connection.prepareStatement("SELECT usertype from users u where u.username = ?");
            prepStmt.setString(1, username);
            ResultSet rs = prepStmt.executeQuery();
            //result set is empty if there are no users with the same username
            if (rs.next()) {
                String a=rs.getString(1);
                rs.close();
                if(a.equals("admin")){
                    return true;
                }
                else {
                return false;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;    
    }
    
        
}
