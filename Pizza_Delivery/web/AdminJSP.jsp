<%-- 
    Document   : AdminJSP
    Created on : May 22, 2016, 6:57:52 PM
    Author     : Ada
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <head>
        <title>Poly Pizza</title>
        <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" href="style2.css" type="text/css" />
        <link rel="stylesheet" href="createPizza3.css" type="text/css" />
         <script type="text/javascript" src="products.js"></script>

    </head>

    <div id="bigmenu">

        <div id="bigmenulinks">
            <%if (session.getAttribute("user") == null) {%>
            <a href="LoginJSP.jsp">Login</a>
            <a href="RegistrationJSP.jsp">Register</a>

            <%} else {%>
            You are logged in as <b><%=session.getAttribute("user")%></b>
            <a href="LogoutC">Logout</a>
            <%}%>

        </div>
    </div>

    <div id="sidebar">
        <h1><img id="pizzalogo" src="img/pizzalogotransp.png" alt="#" width="100px"/></h1>


        <div id="menu">
            <a  href="indexJSP.jsp">Home</a>
            <a class="active" href="AboutUsJSP.jsp">About Us</a> 
            <a href="ContactJSP.jsp">Contact</a> 
            <a href="PizzaJSP.jsp">Menu</a>
            <a href="CreatePizzaJSP.jsp">Create your own pizza!</a>
            <a href="ReviewJSP.jsp">Reviews</a>
            <% if (session.getAttribute("user") != null) {

            %>
            <a href="HistoryC">History</a>
            <%}%>
        </div>
          <br><br>
            <br><br>
            <br><br>
            <img id="logo" src="img/pizzaBoy.png" >
            </div>
    </div>
    <div id="sidebar2">

        <div id="menu2">

        </div>
    </div>

    <div id="content" style='background-image: url("img/adminPattern.png");'>
        <div id="uppermenu">
            <nav>
                <ul>
                       <li><a class="PolyLogo" href="indexJSP.jsp"></a></li>
                        <li id="message"><em>Be creative!</em></li>
                </ul>
            </nav>
        </div>


        <br>
        <br>
        <br>

        <div class="pizzaFormAdmin" style="margin: 10% auto;">
        <form method="POST" action="AddProductC" enctype="multipart/form-data" >
            
            
             <div class= "form-element">
                            <label for= "product">Product</label>
                            <select name="product" id= "product ">
                                <option value="crust">Crust</option>
                                <option value="sauce">Sauce</option>
                             
                                
                            </select>
                        </div>


            
            <div class= "form-element ">
                
                
                <label for= "name">Name</label>
                <input type= "text" name= "name" id= "name" required>
            </div>



            <div class= "form-element">
                <label for= "price">Price</label>
                <input type= "text" id= "price " name= "price" required>
            </div>

            <div class= "form-element" class="dede" id="sauce" id="crust">
                <label for= "description">Description</label>
                <input type= "text" id= "description " name= "description" required>
            </div>
            
         
            <div class= "form-element">
                <label for= "file">File </label>
                <input type="file" name="file" id="file" /> 
            </div>
            <div class= "form-element">
                <label for= "destination">Destination </label>
                <input type="text" value="C:\Users\Ada\Documents\GitHub\WAD-project\Pizza_Delivery\web\img" name="destination"/>
            </div>


            <div class="form-element">
                <input type="submit" value="Add Crust !" name="upload" id="upload">
                <input type="reset" value="Reset ">
            </div>  

        </form>    
    </div>


</html>
