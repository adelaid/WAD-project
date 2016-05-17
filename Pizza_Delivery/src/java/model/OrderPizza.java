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
public class OrderPizza {
    
    private Order o;
    private int userId;
    private Pizza p;
    private int quantity;
    private double price;

    public OrderPizza(Order o, int userId, Pizza p, int quantity, double price) {
        this.o = o;
        this.userId = userId;
        this.p = p;
        this.quantity = quantity;
        this.price = price;
    }

    public Order getO() {
        return o;
    }

    public void setO(Order o) {
        this.o = o;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Pizza getP() {
        return p;
    }

    public void setP(Pizza p) {
        this.p = p;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    
    
    
    
}

