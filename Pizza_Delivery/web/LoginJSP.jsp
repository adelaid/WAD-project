<%-- 
    Document   : LoginJSP
    Created on : May 5, 2016, 7:21:00 PM
    Author     : Adelaid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
       
        <title>Login</title>
        
    </head>
    
    
      <%
          String error = "";
            if (request.getAttribute("LOGIN_ERROR") != null) {
                error = (String) request.getAttribute("LOGIN_ERROR");
            }  

        %>
    <body>
        <div id="content">
            <div class="header">
                
                <span class="header-text">COMPANY NAME</span>
            </div>
            <nav>
                <ul>
                    <a href="index.jsp">Home</a>
                    <a href="Registration.jsp">Register</a>
                    <a href="Login.jsp">Login</a>
                    <a href="Product.jsp">View Products</a>
                    <a href="PurchaseController">History</a>
                    <a href="ShoppingCart.jsp">Shopping Cart</a>
                    <a href="LogoutController">Logout</a>
                </ul>
            </nav>
            <h1>Login form</h1>
            <form method="post" action="LoginC">
                <div class="form-element">
                    <label for="username">Username</label>
                    <input type="text" name="uname" id="uname" required>
                                 </div>
                                   <div class="form-element">
                                     <label for="password">Password</label>
                                      <input type="password" name="password" id="password" required>
                                  </div>
                                  Don't have an account yet? <a href="Registration.jsp">Register</a>
                 <%
                   if (!"".equals(error)) {                       
                 %>
        
        <div class="error"> error </div>
        <%}
%>
      <div class="form-element">
          <input type="submit" value="Submit">
          <input type="reset" value="Reset">
           </div>
      </form>
       </div>
      </body>
      </html>
