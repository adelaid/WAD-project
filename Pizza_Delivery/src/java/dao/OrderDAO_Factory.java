/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author Ada
 */
public class OrderDAO_Factory {
     public static DAOOrder getOrderDAO() { 
       
            return new OrderDAOImpl();
       
    }
}
