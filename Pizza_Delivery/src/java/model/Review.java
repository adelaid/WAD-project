/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Adelaid
 */
public class Review {
    String username;
    String date;
    int stars;
    String review;

    public Review(String username, String date, int stars, String review) {
        this.username = username;
        this.date = date;
        this.stars = stars;
        this.review = review;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getStars() {
        return stars;
    }

    public void setStars(int stars) {
        this.stars = stars;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }
            
    public String getStarsImage(){
        if(this.getStars()==5)
            return "img/stars5.png";
        if(this.stars==4)
            return "img/stars4.png";
        if(this.stars==3)
            return "img/stars3.png";
        if(this.stars==2)
            return "img/stars2.png";
        if(this.stars==1)
            return "img/stars1.png";
        return "#";
    }
}
