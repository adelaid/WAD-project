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

        <link rel="stylesheet" href="reviewStars.css" type="text/css" />
        <link rel="stylesheet" href="style.css" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="bigmenu">

             <div id="bigmenulinks">
            <%if(session.getAttribute("user")==null){%>
            <a href="LoginJSP.jsp">Login</a>
            <a href="RegistrationJSP.jsp">Register</a>
            
            <%}else{%>
            You are logged in as <b><%=session.getAttribute("user")%></b>
            <a href="LogoutC">Logout</a>
            <%}%>
            
        </div>
        </div>
        <div id="sidebar">
            <h1><img id="pizzalogo" src="img/pizzalogotransp.png" alt="#" width="120px"/></h1>
            <h2>Pizza is in session!</h2>

            <div id="menu">
                <a class="active" href="indexJSP.jsp">Home</a>
            <a href="AboutUsJSP.jsp">About Us</a> 
            <a href="#">Contact</a> 
            <a href="CreatePizzaJSP.jsp">Create your own pizza!</a>
            <a href="ReviewJSP.jsp">Reviews</a>
            <a href="PizzaJSP.jsp">Menu</a>
            <a href="HistoryC">History</a>
            </div>
        </div>
        <div id="sidebar2">

            <div id="menu2">

            </div>
        </div>

        <div id="content">
            <div id="uppermenu">
                <nav>
                    <ul>
<!--                        <a href="index.jsp">Home</a>
                        <a href="#">Contact</a>
                        <a href="#">Menu</a>
                        <a href="#">Special Discounts</a>-->
                    </ul>
                </nav>
            </div>
            
            <%
                List<Review> reviews = ReviewDAOFactory.getReviewDAO().getProducts();
                boolean loggedIn=false;
             if (request.getSession().getAttribute("user") != null) {
            loggedIn = true;
        }
        else{
            loggedIn=false;
        }

            %>
            
            <h1>Post here a comment !</h1>
            <div id="reviewsArea">
            <form id="ratingsForm" method="post" action="ReviewC">
                <textarea name="com" id="com" rows="4" cols="50">
You can say something here.. 
                </textarea>
                <br><br>       
                <div class="rating-wrapper">
                    <input type="radio" class="rating-input" id="rating-input-1-5" name="rating-input-1" value="5" />
                    <label for="rating-input-1-5" class="rating-star"></label>
                    <input type="radio" class="rating-input" id="rating-input-1-4" name="rating-input-1" value="4" />
                    <label for="rating-input-1-4" class="rating-star"></label>
                    <input type="radio" class="rating-input" id="rating-input-1-3" name="rating-input-1" value="3" />
                    <label for="rating-input-1-3" class="rating-star"></label>
                    <input type="radio" class="rating-input" id="rating-input-1-2" name="rating-input-1" value="2" />
                    <label for="rating-input-1-2" class="rating-star"></label>
                    <input type="radio" class="rating-input" id="rating-input-1-1" name="rating-input-1" value="1" />
                    <label for="rating-input-1-1" class="rating-star"></label>
                </div>



                <div class="form-element">
                    <input type="submit" value="Submit">
                    <input type="reset" value="Reset">
                </div>
            </form>   

            <%if (!reviews.isEmpty()) {
            %>

            <table id="reviewsTable">
                <tr id="tableHead"><td>User</td><td>Date</td><td>Stars</td><td>Comment</td></tr>
                <%  for (Review p : reviews) {%>

                <tr id="reviewRow">
                    <td><%=p.getUsername()%></td>
                    <td><%=p.getDate()%></td>

                    <td>
                    <img id="starImg" src="<%=p.getStarsImage()%>" alt="#"/></td>
                    <td><%=p.getReview()%></td>


                </tr>



                <%}%> 
            </table>
            <% }

            %>
            </div>
            </div>
    </body>
</html>

