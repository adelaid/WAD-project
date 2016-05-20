/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Ada
 */
public class Ingredient {
     private int id;
    private String name;
    private String type;
    private double price;
   
    private String image;

    public int getId() {
        return id;
    }

    @Override
    public String toString() {
        return name+" ,";
    }

    public Ingredient(int id, String name, String type, double price, String image) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.price = price;
        
        this.image = image;
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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
