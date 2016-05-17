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
public class Order {
    private int id;
    private String user;
    private String dateO;
    private int quantity;
    private double price;

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Order(String user, String dateO, int quantity, double price) {
        this.user = user;
        this.dateO = dateO;
        this.quantity = quantity;
        this.price = price;
    }
    

    public Order(int id, String user, String dateO, double price) {
        this.id = id;
        this.user = user;
        this.dateO = dateO;
        this.price = price;
    }

    public Order(int id, String user, String dateO, int quantity, double price) {
        this.id = id;
        this.user = user;
        this.dateO = dateO;
        this.quantity = quantity;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getDateO() {
        return dateO;
    }

    public void setDateO(String dateO) {
        this.dateO = dateO;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    
}
