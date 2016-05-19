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
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.OrderPizza;
import model.Pizza;

/**
 *
 * @author Ada
 */
public class OrderDAOImpl implements DAOOrder {
     private static OrderDAOImpl instance;

    public static OrderDAOImpl getInstance() {
        if (instance == null) {
            instance = new OrderDAOImpl();
        }
        return instance;
    }
    
    
    
     public boolean createOrder(Order o){
      Singleton inst = Singleton.getInstance();
        Connection connection = inst.getCon();
        
        try {
            PreparedStatement prepStmt = connection.prepareStatement("insert into orders values(default,?,?,?,?)");

            prepStmt.setString(1, o.getUser());
            prepStmt.setString(2, o.getDateO());
            prepStmt.setInt(3, o.getQuantity());
            prepStmt.setDouble(4,o.getPrice());
//         
           prepStmt.executeUpdate();
            connection.commit();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
     
     }
     
     public boolean createOrder2(OrderPizza op){
      Singleton inst = Singleton.getInstance();
        Connection connection = inst.getCon();
        
        try {
            PreparedStatement prepStmt = connection.prepareStatement("insert into pizza_orders values(?,?,?,?,?)");

            prepStmt.setInt(1, op.getO().getId());
            prepStmt.setInt(2,op.getUserId());
            prepStmt.setInt(3, op.getP().getId());
            prepStmt.setInt(4, op.getQuantity());
            prepStmt.setDouble(5,op.getPrice());
//         
           prepStmt.executeUpdate();
            connection.commit();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
     
     }
     
       public int getOrderId(String user, String date) {
      Singleton inst = Singleton.getInstance();
    Connection connection = inst.getCon();
      try {
            PreparedStatement prepStmt = 
                    connection.prepareStatement("select id from orders o where o.username = ? and o.date)=?");
             prepStmt.setString(1, user);
             prepStmt.setString(2, date);
            ResultSet rs = prepStmt.executeQuery();
            if (rs.next()) {
               int b=rs.getInt(1);
               System.out.println(rs.getInt(1));
                rs.close();
                  return b;
                 
            } }catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
       
         public List<Order> getOrders(String user) {
     Singleton inst = Singleton.getInstance();
    Connection connection = inst.getCon();
List<Order> orders = new ArrayList<>();
        try {
            PreparedStatement prepStmt = connection.prepareStatement("select  * from orders where username=?");
            prepStmt.setString(1, user);
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                orders.add(new Order(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getDouble(5)));
            }
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return orders;    
    }
         
       
             public List<Pizza> getClientPurchases(String username,int orderId) {
       Singleton inst = Singleton.getInstance();
    Connection connection = inst.getCon();
        ArrayList<Pizza> pizzas = new ArrayList<Pizza>();
        
        try {
            PreparedStatement prepStmt = connection.prepareStatement("select  \n" +
"p.id PizzaId,\n" +
"p.name,\n" +
"p.price\n" +
"from orders o\n" +
"left join pizza_orders mc\n" +
"  on o.id = mc.orderId\n" +
"left join pizza p\n" +
"  on mc.pizzaId = p.id\n" +
"WHERE o.username=? and o.id=?;");
            prepStmt.setString(1, username);
            prepStmt.setInt(2, orderId);
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                Pizza p=ProductDAO_Factory.getProductDAO().getPizza(rs.getInt(1));
               pizzas.add(p);
            }
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return pizzas;
    }
             
             public boolean pizzaBought(Pizza p,int userid){
             Singleton inst = Singleton.getInstance();
    Connection connection = inst.getCon();
      try {
            PreparedStatement prepStmt = 
                    connection.prepareStatement("select pizzaid from pizza_orders o where userid=? and pizzaid=?");
             prepStmt.setInt(1, userid);
             prepStmt.setInt(2, p.getId());
            ResultSet rs = prepStmt.executeQuery();
            if (rs.next()) {
           
              
              return true;
                 
            }
            
      
      }
      
      catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
             }
         
         
//           public List<Integer> getPizzaId(String user) {
//     Singleton inst = Singleton.getInstance();
//    Connection connection = inst.getCon();
//List<Pizza> pizzas = new ArrayList<>();
//        try {
//            PreparedStatement prepStmt = connection.prepareStatement("select  * from orders where username=?");
//            prepStmt.setString(1, user);
//            ResultSet rs = prepStmt.executeQuery();
//            while (rs.next()) {
//                pizzas.add(new P(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getDouble(5)));
//            }
//            prepStmt.close();
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        }
//        return pizzas;    
//    }
    
}
