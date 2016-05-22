/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import model.Crust;
import model.Ingredient;
import model.Pizza;

import model.Sauce;

/**
 *
 * @author Adelaid
 */
public interface DAOProduct {
    
  public boolean updatePizza(String pizzaName,String imgPath);
    
public boolean insertSauce(Sauce s);
    
    public boolean insertCrust(Crust c);
            
      public List<Pizza> getPizza();
    
    public boolean insertIngredient(int pizzaId,int ingredientId);
    
    public boolean insertPizza(Pizza p);
  
    public ArrayList<Integer> getPizzaIds();
    
    public Pizza getPizza(int id);

 public  List<Crust> getCrust();
 
 public  List<Sauce> getSauce();
 
 public List<Ingredient> getIngredient(String type);
 
  public List<Ingredient> getIngredient(Pizza p);
 
 public Ingredient getIngredient(int id);
 
 public Crust getCrust(int id);
 
 public Sauce getSauce(int id);
 
 public Crust getCrust(String name);
 
 public Sauce getSauce(String name);
 
 
    
    

}
