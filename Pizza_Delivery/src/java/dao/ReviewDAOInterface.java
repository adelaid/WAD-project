/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Review;

/**
 *
 * @author Adelaid
 */
public interface ReviewDAOInterface {
    public boolean createReview(String username,String dateR,int stars,String review);
    
     public  List<Review> getProducts();
    
}
