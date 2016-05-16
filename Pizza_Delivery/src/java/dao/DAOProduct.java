/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Crust;
import model.Ingredient;
import model.Product;
import model.Sauce;

/**
 *
 * @author Adelaid
 */
public interface DAOProduct {
    
  
    

 public  List<Crust> getCrust();
 
 public  List<Sauce> getSauce();
 
 public List<Ingredient> getIngredient(String type);
 
 public Ingredient getIngredient(int id);
 
 public Crust getCrust(int id);
 
 public Sauce getSauce(int id);
    
    

}
