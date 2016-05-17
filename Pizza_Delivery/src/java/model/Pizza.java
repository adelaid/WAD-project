/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author Ada
 */
public class Pizza {

    private int id;
    private String name;
    private String size;
    private Crust crust;
    private Sauce sauce;
    private boolean cheese;
    private ArrayList<Ingredient> ingredients;
    private int quantity;
   
    private double price;
    private String image;

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Pizza(int id, String name, String size, Crust crust, Sauce sauce, boolean cheese, int quantity, double price, String image) {
        this.id = id;
        this.name = name;
        this.size = size;
        this.crust = crust;
        this.sauce = sauce;
        this.cheese = cheese;
        this.quantity = quantity;
        this.price = price;
        this.image = image;
    }

    
    
    
    public ArrayList<Ingredient> getIngredients() {
        return ingredients;
    }

    public Pizza(int id, String name, String size, Crust crust, Sauce sauce, boolean cheese,double price, String image) {
        this.id = id;
        this.name = name;
        this.size = size;
        this.crust = crust;
        this.sauce = sauce;
        this.cheese = cheese;
        this.ingredients = ingredients;
        this.price = price;
        this.image = image;
    }
    

    public void setIngredients(ArrayList<Ingredient> ingredients) {
        this.ingredients = ingredients;
    }

    public Pizza(String size, Crust crust, Sauce sauce, boolean cheese, ArrayList<Ingredient> ingredients, double price) {
        this.id = id;
        this.name = name;
        this.size = size;
        this.crust = crust;
        this.sauce = sauce;
        this.cheese = cheese;
        this.ingredients = ingredients;
        this.price = price;
        this.image = image;
    }

    public Pizza(String name, String size, Crust crust, Sauce sauce, boolean cheese, ArrayList<Ingredient> ingredients, double price, String image) {
        this.id = id;
        this.name = name;
        this.size = size;
        this.crust = crust;
        this.sauce = sauce;
        this.cheese = cheese;
        this.ingredients = ingredients;
        this.price = price;
        this.image = image;
    }

   
    
    
    
    
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public Crust getCrust() {
        return crust;
    }

    public void setCrust(Crust crust) {
        this.crust = crust;
    }

    public Sauce getSauce() {
        return sauce;
    }

    public void setSauce(Sauce sauce) {
        this.sauce = sauce;
    }

    public boolean isCheese() {
        return cheese;
    }

    public void setCheese(boolean cheese) {
        this.cheese = cheese;
    }

  

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
}
