<%-- 
    Document   : ReviewJSP
    Created on : May 8, 2016, 9:29:22 PM
    Author     : Adelaid
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Review"%>
<%@page import="dao.ReviewDAOFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
          <link rel="stylesheet" href="styleFunctional.css" type="text/css" />
        <link rel="stylesheet" href="style.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        List<Review> reviews=ReviewDAOFactory.getReviewDAO().getProducts();
        
        %>
        <h1>Post here a comment !</h1>
        
        <form id="ratingsForm" method="post" action="ReviewC">
        <textarea name="com" id="com" rows="4" cols="50">
You can say something here.. 
</textarea>
            <br><br>       
<div class="rating-wrapper">
  <input type="radio" class="rating-input" id="rating-input-1-5" name="rating-input-1" value="1" />
  <label for="rating-input-1-5" class="rating-star"></label>
  <input type="radio" class="rating-input" id="rating-input-1-4" name="rating-input-1" value="2" />
  <label for="rating-input-1-4" class="rating-star"></label>
  <input type="radio" class="rating-input" id="rating-input-1-3" name="rating-input-1" value="3" />
  <label for="rating-input-1-3" class="rating-star"></label>
  <input type="radio" class="rating-input" id="rating-input-1-2" name="rating-input-1" value="4" />
  <label for="rating-input-1-2" class="rating-star"></label>
  <input type="radio" class="rating-input" id="rating-input-1-1" name="rating-input-1" value="5" />
  <label for="rating-input-1-1" class="rating-star"></label>
</div>
            
            
            
     <div class="form-element">
          <input type="submit" value="Submit">
          <input type="reset" value="Reset">
           </div>
      </form>   
        
         <%if(!reviews.isEmpty()){
                        %>
                    
                     <table>
                         <tr><td>User</td><td>Date</td><td>Stars</td><td>Comment</td></tr>
                        <%  for (Review p : reviews) {%>
                        
                        <tr>
                            <td><%=p.getUsername()%></td>
                            <td><%=p.getDate()%></td>
                            
                            <td><%=p.getStars()%></td>
                            <td><%=p.getReview()%></td>
                      
                            
                        </tr>
                            
                         
                      
                         <%}%> 
                     </table>
                         <% }

                                          %>
        
        
    </body>
</html>
