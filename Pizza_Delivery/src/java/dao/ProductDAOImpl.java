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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Crust;
import model.Ingredient;
import model.Pizza;

import model.Sauce;

/**
 *
 * @author Adelaid
 */
public class ProductDAOImpl implements DAOProduct {

    private static ProductDAOImpl instance;

    public static ProductDAOImpl getInstance() {
        if (instance == null) {
            instance = new ProductDAOImpl();
        }
        return instance;
    }
    
    
    
    public boolean updatePizza(String pizzaName,String imgPath){
    
   // UPDATE `pizzadelivery`.`pizza` SET `img`='./img/pizza80.png' WHERE `id`='1';
 Singleton inst = Singleton.getInstance();
        Connection connection = inst.getCon();
        
        try {
            PreparedStatement prepStmt = connection.prepareStatement("update pizza set img=? where name=?" );

            prepStmt.setString(1, imgPath);
            prepStmt.setString(2, pizzaName);
          
//            if(p.isCheese()){
//            prepStmt.setInt(5, 1);
//            }
//            else{
//            prepStmt.setInt(5, 0);
//        
           prepStmt.executeUpdate();
            //connection.commit();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
//    
//    public String getImgPizza(String name){
//     Singleton inst = Singleton.getInstance();
//        Connection connection = inst.getCon();
//        String imagine="";
//        try {
//             PreparedStatement prepStmt = connection.prepareStatement("select img from pizza where name=?");
//
//            prepStmt.setString(1, name);
//            ResultSet rs = prepStmt.executeQuery();
//            while (rs.next()) {
//                imagine=rs.getString(1);
//            }
//            prepStmt.close();
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        }
//        return imagine;
//    
//    }
    
    
      public List<Pizza> getPizza() {
        Singleton inst = Singleton.getInstance();
        Connection connection = inst.getCon();
        List<Pizza> pizzas = new ArrayList<>();
        try {
            PreparedStatement prepStmt = connection.prepareStatement("select * from pizza");
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                boolean b=false;
                if(rs.getInt(6)==1){
                b=true;
                }
                else{
                b=false;
                }
                pizzas.add(new Pizza(rs.getInt(1), rs.getString(2), rs.getString(3), getCrust(rs.getString(4)), getSauce(rs.getString(5)),b,rs.getDouble(7),rs.getString(8)));
            }
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return pizzas;
    }
      public List<Ingredient> getIngredient(Pizza p){
       Singleton inst = Singleton.getInstance();
        Connection connection = inst.getCon();
        List<Ingredient> ingredients = new ArrayList<Ingredient>();
        try {
            PreparedStatement prepStmt = connection.prepareStatement("select  * from pizza_ingredients where pizza_id=?");
            prepStmt.setInt(1, p.getId());
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                ingredients.add(getIngredient(rs.getInt(3)));
            }
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ingredients;
      
      }
    
    

    @Override
    public List<Crust> getCrust() {
        Singleton inst = Singleton.getInstance();
        Connection connection = inst.getCon();
        List<Crust> crusts = new ArrayList<>();
        try {
            PreparedStatement prepStmt = connection.prepareStatement("select  * from crust");
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                crusts.add(new Crust(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5)));
            }
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return crusts;
    }

    public List<Sauce> getSauce() {
        Singleton inst = Singleton.getInstance();
        Connection connection = inst.getCon();
        List<Sauce> sauces = new ArrayList<>();
        try {
            PreparedStatement prepStmt = connection.prepareStatement("select  * from sauce");
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                sauces.add(new Sauce(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5)));
            }
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return sauces;
    }

    public List<Ingredient> getIngredient(String type) {
        Singleton inst = Singleton.getInstance();
        Connection connection = inst.getCon();
        List<Ingredient> ingredients = new ArrayList<>();
        try {
            PreparedStatement prepStmt = connection.prepareStatement("select  * from ingredients where type=?");

            prepStmt.setString(1, type);
            ResultSet rs = prepStmt.executeQuery();

            //  con.commit();
            while (rs.next()) {
                ingredients.add(new Ingredient(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5)));
            }
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ingredients;
    }

    public Ingredient getIngredient(int id) {
        Singleton inst = Singleton.getInstance();
        Connection connection = inst.getCon();
        Ingredient i = null;
        try {
            PreparedStatement prepStmt = connection.prepareStatement("select  * from ingredients where id=?");

            prepStmt.setInt(1, id);
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                i = new Ingredient(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5));
                return i;
            }
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return i;
    }

    public Crust getCrust(int id) {
        Singleton inst = Singleton.getInstance();
        Connection connection = inst.getCon();
        Crust c = null;
        try {
            PreparedStatement prepStmt = connection.prepareStatement("select  * from crust where id=?");

            prepStmt.setInt(1, id);
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                c = new Crust(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5));
                return c;
            }
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return c;
    }

    public Sauce getSauce(int id) {
        Singleton inst = Singleton.getInstance();
        Connection connection = inst.getCon();
        Sauce s = null;
        try {
            PreparedStatement prepStmt = connection.prepareStatement("select * from sauce where id=?");

            prepStmt.setInt(1, id); 
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                s = new Sauce(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5));
                return s;
            }
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return s;
    }

    public ArrayList<Integer> getPizzaIds() {
        Singleton inst = Singleton.getInstance();
        Connection connection = inst.getCon();
        ArrayList<Integer> ids = new ArrayList<Integer>();
        try {
            PreparedStatement prepStmt = connection.prepareStatement("select  id from pizza");

            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                ids.add(rs.getInt(1));

            }
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ids;
    }

    public boolean insertPizza(Pizza p) {
        Singleton inst = Singleton.getInstance();
        Connection connection = inst.getCon();
        
        try {
            PreparedStatement prepStmt = connection.prepareStatement("insert into pizza values(default,?,?,?,?,?,?,?)");

            prepStmt.setString(1, p.getName());
            prepStmt.setString(2, p.getSize());
            prepStmt.setString(3, p.getCrust().getName());
            prepStmt.setString(4, p.getSauce().getName());
//            if(p.isCheese()){
//            prepStmt.setInt(5, 1);
//            }
//            else{
//            prepStmt.setInt(5, 0);
//            }
            prepStmt.setInt(5, p.isCheese() ? 1 : 0);
            prepStmt.setDouble(6, p.getPrice());
            prepStmt.setString(7, p.getImage());
           prepStmt.executeUpdate();
            connection.commit();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    public boolean insertIngredient(int pizzaId,int ingredientId){
    Singleton inst = Singleton.getInstance();
        Connection connection = inst.getCon();
        
        try {
            PreparedStatement prepStmt = connection.prepareStatement("insert into pizza_ingredients values(default,?,?)");

            prepStmt.setInt(1, pizzaId);
            prepStmt.setInt(2, ingredientId);
            
           prepStmt.executeUpdate();
            connection.commit();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    
    }

    @Override
    public Crust getCrust(String name) {
    Singleton inst = Singleton.getInstance();
        Connection connection = inst.getCon();
        Crust c = null;
        try {
            PreparedStatement prepStmt = connection.prepareStatement("select  * from crust where name=?");

            prepStmt.setString(1, name);
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                c = new Crust(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5));
                return c;
            }
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return c;   
    
    }

    @Override
    public Sauce getSauce(String name) {
      Singleton inst = Singleton.getInstance();
        Connection connection = inst.getCon();
        Sauce s = null;
        try {
            PreparedStatement prepStmt = connection.prepareStatement("select * from sauce where name=?");

            prepStmt.setString(1, name); 
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                s = new Sauce(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5));
                return s;
            }
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return s;    
    
    }

    @Override
    public Pizza getPizza(int id) {
     Singleton inst = Singleton.getInstance();
        Connection connection = inst.getCon();
        Pizza p = null;
        try {
            PreparedStatement prepStmt = connection.prepareStatement("select  * from pizza where id=?");

            prepStmt.setInt(1, id);
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                boolean b=false;
                if(rs.getInt(6)==1){
                b=true;
                }
                p = new Pizza(rs.getInt(1), rs.getString(2), rs.getString(3), getCrust(rs.getString(4)), getSauce(rs.getString(5)),b,rs.getDouble(7),rs.getString(8));
                return p;
            }
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return p;   
    }
    
    
    public boolean insertCrust(Crust c){
     Singleton inst = Singleton.getInstance();
        Connection connection = inst.getCon();
        
        try {
            PreparedStatement prepStmt = connection.prepareStatement("insert into crust values(default,?,?,?,?)");

            prepStmt.setString(1, c.getName());
            prepStmt.setDouble(2, c.getPrice());
            prepStmt.setString(3,c.getDescription());
            prepStmt.setString(4, c.getImage());
//            if(p.isCheese()){
//            prepStmt.setInt(5, 1);
//            }
//            else{
//            prepStmt.setInt(5, 0);
//            }
            
           prepStmt.executeUpdate();
            connection.commit();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    
     public boolean insertSauce(Sauce s){
     Singleton inst = Singleton.getInstance();
        Connection connection = inst.getCon();
        
        try {
            PreparedStatement prepStmt = connection.prepareStatement("insert into sauce values(default,?,?,?,?)");

            prepStmt.setString(1, s.getName());
            prepStmt.setDouble(2, s.getPrice());
            prepStmt.setString(3,s.getDescription());
            prepStmt.setString(4, s.getImage());
//            if(p.isCheese()){
//            prepStmt.setInt(5, 1);
//            }
//            else{
//            prepStmt.setInt(5, 0);
//            }
            
           prepStmt.executeUpdate();
            connection.commit();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
     
     
     
//     public boolean insertIngredient(Ingredient i){
//      Singleton inst = Singleton.getInstance();
//        Connection connection = inst.getCon();
//        
//        try {
//            PreparedStatement prepStmt = connection.prepareStatement("insert into ingredients values(default,?,?,?,?)");
//
//            prepStmt.setString(1, i.getName());
//            prepStmt.setString(2,i.getType());
//            prepStmt.setDouble(3, i.getPrice());
//            
//            prepStmt.setString(4, i.getImage());
////            if(p.isCheese()){
////            prepStmt.setInt(5, 1);
////            }
////            else{
////            prepStmt.setInt(5, 0);
////            }
//            
//           prepStmt.executeUpdate();
//            connection.commit();
//            return true;
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        }
//        return false;
//     
//     }
    
    
}
