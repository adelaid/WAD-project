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
public class UserDAOFactory {
     public static UserDAOInterface getUserDAO() { 
       
            return new UserDAO();
       
    }
}
