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
import java.util.Date;
import java.util.List;
import model.Review;
import util.Hash;

/**
 *
 * @author Adelaid
 */
public class ReviewDAO implements ReviewDAOInterface {
    private static ReviewDAO instance;

    public static ReviewDAO getInstance() {
        if (instance == null) {
            instance = new ReviewDAO();
        }
        return instance;
    }
    
    public boolean createReview(String username,String dateR,int stars,String review){
        Singleton inst = Singleton.getInstance();
    Connection con = inst.getCon();
    try {
            PreparedStatement stmt = 
                    con.prepareStatement("insert into reviews values (default, ?, ?, ?, ?)");
            stmt.setString(1, username);
            stmt.setString(2, dateR);
            stmt.setInt(3, stars);
            stmt.setString(4,review);
           
            stmt.executeUpdate();
            con.commit();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    public  List<Review> getProducts() {
     Singleton inst = Singleton.getInstance();
    Connection connection = inst.getCon();
        List<Review> reviews = new ArrayList<>();
        try {
            PreparedStatement prepStmt = connection.prepareStatement("select  * from reviews");
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                reviews.add(new Review(rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5)));
            }
            prepStmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return reviews;    
    }
}
