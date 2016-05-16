<%-- 
    Document   : CreatePizzaJSP
    Created on : May 15, 2016, 3:14:42 PM
    Author     : Ada
--%>
<%@page import="model.Ingredient"%>
<%@page import="model.Sauce"%>
<%@page import="dao.ProductDAO_Factory"%>
<%@page import="java.util.List"%>
<%@page import="model.Crust"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>

        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js "></script>
        <script type="text/javascript" src="jquery.min.js"></script>

        <script type="text/javascript" src="products.js"></script>
        <title>Create Pizza</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
    </head>
    <body>
        <%
            boolean loggedIn = false;
            List<Crust> crusts = ProductDAO_Factory.getProductDAO().getCrust();
            List<Sauce> sauces = ProductDAO_Factory.getProductDAO().getSauce();
            List<Ingredient> ingredientsM = ProductDAO_Factory.getProductDAO().getIngredient("Meats");
            List<Ingredient> ingredientsV = ProductDAO_Factory.getProductDAO().getIngredient("Veggie");
            if (session.getAttribute("user") != null) {
                loggedIn = true;
            }
        %>
        <div id="content">
            <%--
            <div class="header">
                <img src="./img/companyLogo.jpg" width="100px"  />
                <span class="header-text">COMPANY NAME</span>
            </div>
            --%>
            <nav>
                <ul>
                    <a href="index.jsp">Home</a>
                    <a href="LoginJSP.jsp">Login</a>
                    <a href="ProductViewJSP.jsp">View Products</a>

                </ul>
            </nav>
            <h1>Create your own pizza!</h1>   
            <form method="post" action="MakePizzaC">
                <div class= "form-element">
                    <label for= "size">Size</label>
                    <select name="size" id= "size ">
                        <option>Small</option>
                        <option>Medium</option>
                        <option>Large</option>

                    </select>
                </div>




                <div class= "form-element">
                    <label for= "crust">Crust</label>
                    <select name="crust" id= "crust">
                        <option>Select crust...</option>
                        <%
                            for (Crust c : crusts) {


                        %>
                        <option value="<%=c.getId()%>"><%=c.getName()%></option>

                        <%}%>                                    

                    </select>


                    <%for (Crust c : crusts) {%>
                    <div id="<%=c.getId()%>" style="display:none" class="crust">
                        <p>Description: <%=c.getDescription()%></p>
                        <p>Price <%=c.getPrice()%></p>
                        
                        <img class=imgA1 src="<%=c.getImage()%>" >
                        
                    </div>
                    <%}%>


                </div>

                <div class= "form-element">
                    <label for= "sauce">Sauce</label>
                    <select name="sauce" id= "sauce">
                        <option>Select sauce...</option>
                        <%
                            for (Sauce s : sauces) {


                        %>
                        <option value="1<%=s.getId()%>"><%=s.getName()%></option>

                        <%}%>                                    

                    </select>


                    <%for (Sauce s : sauces) {%>
                    <div id="1<%=s.getId()%>" style="display:none" class="sauce">
                        <p>Description: <%=s.getDescription()%></p>
                        <p>Price <%=s.getPrice()%></p>
                       
                        <img class=imgB1 src="<%=s.getImage()%>" >
                    </div>
                    <%}%>


                </div>
                    
                  <div class= "form-element">
                    <label for= "cheese">cheese</label>
                    <select name="cheese" id= "cheese">
                        <option>Choose</option>
                       
                        <option value="w">With cheese</option>
                           <option value="wt">Without cheese</option>
                                                      

                    </select>


                    
                    <div id="w" style="display:none" class="cheese">
                         <img class=imgC1 src="./img/cheese_mozz_ML.png" >
                      
                    </div>
                   
                       <div id="wt" style="display:none" class="cheese">
                       
                      
                    </div>

                </div>
                    
                    <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
    <%for(Ingredient im:ingredientsM){%>
$(document).ready(function(){
    $('input[type="checkbox"]').click(function(){
        if($(this).attr("value")=="<%=im.getId()%>"){
            $(".meats<%=im.getId()%>").toggle();
        }
      
    });
});
<%}%>


 <%for(Ingredient iv:ingredientsV){%>
$(document).ready(function(){
    $('input[type="checkbox"]').click(function(){
        if($(this).attr("value")=="<%=iv.getId()%>"){
            $(".veggies<%=iv.getId()%>").toggle();
        }
      
    });
});
<%}%>
</script>
                    
               
                    <h2>Meats :</h2>
                    
                     <div class= "form-element">
                       <%for(Ingredient im:ingredientsM){%>  
                    <label for= "ingredientsM"><%=im.getName()%></label>
                     <input type= "checkbox" name="meats<%=im.getId()%>" value="<%=im.getId()%>">
                    <%}%>
                     </div>
 
 
   <%for (Ingredient im : ingredientsM) {%>
                    <div  style="display:none" class="meats<%=im.getId()%>">
                       
                        
                        <img class=img<%=im.getId()%> src="<%=im.getImage()%>"  >
                    </div>
                    <%}%>
                    
                    
                     <h2>Veggies :</h2>
                    
                     <div class= "form-element">
                       <%for(Ingredient iv:ingredientsV){%>  
                    <label for= "ingredientsV"><%=iv.getName()%></label>
                     <input type= "checkbox" name="veggies<%=iv.getId()%>" value="<%=iv.getId()%>">
                    <%}%>
                     </div>
 
 
   <%for (Ingredient iv : ingredientsV) {%>
                    <div  style="display:none" class="veggies<%=iv.getId()%>">
                       
                        
                        <img class=img<%=iv.getId()%> src="<%=iv.getImage()%>"  >
                    </div>
                    <%}%>
 
 
<!-- <div class= "form-element">
                       
                    <label for= "ingredientsM">tra</label>
                     <input type= "checkbox" name="a" id= "a" value="aa">
                    
                     </div>-->
 
                <br>
                <div class="form-element">
                    <input type="submit" value="Submit">
                    <input type="reset" value="Reset">
                </div>  


            </form>

            <style type="text/css"> 
                .imgA1 { position:absolute; top: 25px; left: 800px; z-index: 1; } 
                .imgB1 { position:absolute; top: 25px; left: 800px; z-index: 3; } 
                 .imgC1 { position:absolute; top: 25px; left: 800px; z-index: 3; }
                 .img1 { position:absolute; top: 25px; left: 800px; z-index: 3; }
                 .img2 { position:absolute; top: 25px; left: 800px; z-index: 3; }
                 .img3 { position:absolute; top: 25px; left: 800px; z-index: 3; }
                 .img4 { position:absolute; top: 25px; left: 800px; z-index: 3; }
                 .img5 { position:absolute; top: 25px; left: 800px; z-index: 3; }
                 .img6 { position:absolute; top: 25px; left: 800px; z-index: 3; }
            </style>


            
            <% if (request.getAttribute("ERRORS") != null && !request.getAttribute("ERRORS").equals("")) {%>
            <div class="error"><%= request.getAttribute("ERRORS")%></div>
            <% }%>

        </div>
    </body>
</html>