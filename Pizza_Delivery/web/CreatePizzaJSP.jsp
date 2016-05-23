<%-- 
    Document   : CreatePizzaJSP
    Created on : May 15, 2016, 3:14:42 PM
    Author     : Ada
--%>
<%@page import="dao.UserDAOFactory"%>
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
        <link rel="stylesheet" href="createPizza3.css" type="text/css" />
        <link rel="stylesheet" href="style2.css" type="text/css" />


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
            <%--
            <div class="header">
                <img src="./img/companyLogo.jpg" width="100px"  />
                <span class="header-text">COMPANY NAME</span>
            </div>
            --%>

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
               

                <div id="menu">
                    <a  href="indexJSP.jsp">Home</a>
                      <a  href="AboutsUsJSP.jsp">About Us</a> 
                    <a href="ContactJSP.jsp">Contact</a> 
                    <a href="PizzaJSP.jsp">Menu</a>
                    <a class="active" href="CreatePizzaJSP.jsp">Create your own pizza!</a>
                    <a href="ReviewJSP.jsp">Reviews</a>
                    
                    <% if(session.getAttribute("user")!=null)
                {
                    
                
                %>
                <a href="HistoryC">History</a>
                <%}%>
                </div>
                 <br><br>
            <br><br>
            <br><br>
            <img id="logo" src="img/pizzaBoy.png" >
            </div>
            <div id="sidebar2">

                <div id="menu2">

                </div>
            </div>

            <div id="content" style="background-image: url(img/ingredients.jpg);background-size: inherit;background-repeat: no-repeat; overflow-y: hidden;">
                <div id="uppermenu">
                    <nav>
                        <ul>
                            <li><a class="PolyLogo" href="indexJSP.jsp"></a></li>
                        <li id="message"><em>Be creative!</em></li>
                        </ul>
                    </nav>
                </div>
                <h1>Create your own pizza!</h1>  
                <div class="pizzaForm">
                    <img src="img/boardPizza.png" style="position: absolute; z-index: 1; background-color: transparent; width: 400px; left: 58.5%; top: 23%;">
  <%String action="MakePizzaC";
      String admin=(String)session.getAttribute("user");
                            if(UserDAOFactory.getUserDAO().isAdmin(admin)){
                                action="AdminPizzaC";
                            }%>
                            
                          
                    <form method="post" action="<%=action%>">
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
                            <%for (Ingredient im : ingredientsM) {%>
                            $(document).ready(function () {
                                $('input[type="checkbox"]').click(function () {
                                    if ($(this).attr("value") == "<%=im.getId()%>") {
                                        $(".meats<%=im.getId()%>").toggle();
                                    }

                                });
                            });
                            <%}%>


                            <%for (Ingredient iv : ingredientsV) {%>
                            $(document).ready(function () {
                                $('input[type="checkbox"]').click(function () {
                                    if ($(this).attr("value") == "<%=iv.getId()%>") {
                                        $(".veggies<%=iv.getId()%>").toggle();
                                    }

                                });
                            });
                            <%}%>
                        </script>


                        <p>Meats :</p>

                        <div class= "form-element">
                            <%for (Ingredient im : ingredientsM) {%>  
                            <label for= "ingredientsM"><%=im.getName()%></label>
                            <input type= "checkbox" name="meats<%=im.getId()%>" value="<%=im.getId()%>">
                            <%}%>
                        </div>


                        <%for (Ingredient im : ingredientsM) {%>
                        <div  style="display:none" class="meats<%=im.getId()%>">


                            <img class=img<%=im.getId()%> src="<%=im.getImage()%>"  >
                        </div>
                        <%}%>


                        <p>Veggies :</p>

                        <div class= "form-element">
                            <%for (Ingredient iv : ingredientsV) {%>  
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
                        
                        <%
                            if(UserDAOFactory.getUserDAO().isAdmin(admin)){%>
                        
                        <div class="form-element">
                          <label for="PizzaName">Pizza Name</label>
                        <input type="text" name="pname" id="pname" required>
                          
                        </div> 
                        <%}%>
                        
                        <br>
                        <%if(session.getAttribute("user")!=null){%>
                        
                        <div class="form-element">
                            <input type="submit" value="Submit">
                          
                        </div>  
<%}%>

                    </form>
                </div>
                <style type="text/css"> 
                    .imgA1 { position:absolute; top: 25%; left: 60%; z-index: 1; background-color: transparent; width:350px; } 
                    .imgB1 { position:absolute; top: 25%; left: 60%; z-index: 1; background-color: transparent; width:350px;} 
                    .imgC1 { position:absolute; top: 25%; left: 60%; z-index: 1; background-color: transparent; width:350px;}
                    .img1 { position:absolute; top: 25%; left: 60%; z-index: 1; background-color: transparent; width:350px; }
                    .img2 { position:absolute; top: 25%; left: 60%; z-index: 1; background-color: transparent; width:350px;}
                    .img3 { position:absolute; top: 25%; left: 60%; z-index: 1; background-color: transparent; width:350px;}
                    .img4 { position:absolute; top: 25%; left: 60%; z-index: 1; background-color: transparent; width:350px;}
                    .img5 { position:absolute; top: 25%; left: 60%; z-index: 1; background-color: transparent; width:350px; }
                    .img6 { position:absolute; top: 25%; left: 60%; z-index: 1; background-color: transparent; width:350px;}
                </style>



                <% if (request.getAttribute("ERRORS") != null && !request.getAttribute("ERRORS").equals("")) {%>
                <div class="error"><%= request.getAttribute("ERRORS")%></div>
                <% }%>

            </div>
    </body>
</html>