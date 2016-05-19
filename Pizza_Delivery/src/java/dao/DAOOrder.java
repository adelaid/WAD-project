/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Order;
import model.OrderPizza;
import model.Pizza;

/**
 *
 * @author Ada
 */
public interface DAOOrder {
    public boolean createOrder(Order o);
    public boolean createOrder2(OrderPizza op);
    public List<Order> getOrders(String user);
    public List<Pizza> getClientPurchases(String username,int orderId);
    
    public boolean pizzaBought(Pizza p,int userid);
}
