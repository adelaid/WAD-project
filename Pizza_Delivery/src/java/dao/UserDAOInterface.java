/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author Adelaid
 */
public interface UserDAOInterface {
   public boolean createUser(String user, String pw,String fname,String lname, String mail,  String tel,String address, String gender,boolean subscribe);
 
    public boolean userExists(String username);
    
    public boolean isPasswordCorrect(String username, String password);
     public int getUserid(String username);
      public boolean isAdmin(String username);
}
