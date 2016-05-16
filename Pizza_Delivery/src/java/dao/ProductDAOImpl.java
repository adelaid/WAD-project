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
import model.Product;
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

    

    @Override
    public  List<Crust> getCrust() {
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
    
    public  List<Sauce> getSauce() {
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
    
    public  List<Ingredient> getIngredient(String type) {
     Singleton inst = Singleton.getInstance();
    Connection connection = inst.getCon();
        List<Ingredient> ingredients = new ArrayList<>();
        try {
            PreparedStatement prepStmt = connection.prepareStatement("select  * from ingredients where type=?");
            
            prepStmt.setString(1,type);
            ResultSet rs = prepStmt.executeQuery();
            
          //  con.commit();
            while (rs.next()) {
                ingredients.add(new Ingredient(rs.getInt(1), rs.getString(2),rs.getString(3), rs.getDouble(4),  rs.getString(5)));
            }
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ingredients;    
    }
    
    
   
    
    public Ingredient getIngredient(int id){
     Singleton inst = Singleton.getInstance();
    Connection connection = inst.getCon();
    Ingredient i=null;
     try {
            PreparedStatement prepStmt = connection.prepareStatement("select  * from ingredients where id=?");
            
            prepStmt.setInt(1,id);
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                 i=new Ingredient(rs.getInt(1), rs.getString(2),rs.getString(3), rs.getDouble(4),  rs.getString(5));
                 return i;
            }
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
      return i;
    }
    
     public Crust getCrust(int id){
     Singleton inst = Singleton.getInstance();
    Connection connection = inst.getCon();
    Crust c=null;
     try {
            PreparedStatement prepStmt = connection.prepareStatement("select  * from crust where id=?");
            
            prepStmt.setInt(1,id);
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                 c=new Crust(rs.getInt(1), rs.getString(2), rs.getDouble(3),  rs.getString(4),rs.getString(5));
                 return c;
            }
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
      return c;
    }
public Sauce getSauce(int id){
     Singleton inst = Singleton.getInstance();
    Connection connection = inst.getCon();
    Sauce s=null;
     try {
            PreparedStatement prepStmt = connection.prepareStatement("select  * from sauce where id=?");
            
            prepStmt.setInt(1,id);
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                 s=new Sauce(rs.getInt(1), rs.getString(2), rs.getDouble(3),  rs.getString(4),rs.getString(5));
                 return s;
            }
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
      return s;
    }
//public boolean insertPizza(Pizza p){
//Singleton inst = Singleton.getInstance();
//    Connection connection = inst.getCon();
//    Sauce s=null;
//     try {
//            PreparedStatement prepStmt = connection.prepareStatement("insert into pizza(`id`, `name`, `size`, `crust`, `sauce`, `cheese`, `ingredient1`, `ingredient2`, `ingredient3`,`ingredient4`,ingredient5`,ingredient6`, `price`,img) values(default,?,?,?,?,?,?,?,?,?,?,?,?,?)");
//            
//            prepStmt.setString(1, );
//            ResultSet rs = prepStmt.executeQuery();
//            while (rs.next()) {
//                 s=new Sauce(rs.getInt(1), rs.getString(2), rs.getDouble(3),  rs.getString(4),rs.getString(5));
//                 return s;
//            }
//            prepStmt.close();
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        }
//      return s;
//}
    
}
