<%-- 
    Document   : RegistrationJSP
    Created on : May 5, 2016, 3:01:47 PM
    Author     : Adelaid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
        <html>
            <head>
                 <link rel="stylesheet" href="styleFunctional.css" type="text/css"/>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js "></script>
        <script type="text/javascript" src="jquery.min.js"></script>
         <script type="text/javascript" src="ajaxRegister.js"></script>
               
                <title>Registration</title>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width">
            </head>
            <body>
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
                            <a href="CreatePizzaJSP.jsp">Create Pizza</a>

                        </ul>
                </nav>
                    <h1>Registration form</h1>   
                    <form method="post" action="RegistrationC">
                        <div class="form-element">
                            <label for="username">Username</label>
                            <input type="text" name="uname" id="uname" required class="field">  <span class="status"></span> 
                        </div>
                        <br>
                        <div class="form-element">
                            <label for="password">Password</label>
                            <input type="password" name="password" id="password" required class="field"> 
                        </div>
                        
                        <div class="form-element">
                            <label for="rPassword">Repeat password</label>
                            <input type="password" id="rpassword" name="rpassword" required class="field"> <span class='message'></span>
                        </div>
                        <div class="form-element">
                            <label for="first_name">First Name</label>
                            <input type="text" name="fname" id="fname" required>
                        </div>
                        <br>
                        <div class="form-element">
                            <label for="last_name">Last Name</label>
                            <input type="text" name="lname" id="lname" required>
                        </div>
                        <br>
                        <div class="form-element">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" required>
                        </div>    
                        <br>
                        <div class="form-element">
                            <label for="tel">Telephone</label>
                            <input type="tel" name="tel" id="tel" required>
                        </div>
                        <br>
                        <div class="form-element">
                            <label for="address">Address</label>
                            <input type="text" name="address" id="address" required>
                        </div>
                        <br>
                        <div class="form-element">
                            <label for="gender">Gender </label>
                            Male<input type="radio" name="gender" value="male" checked> 
                            Female<input type="radio" name="gender" value="female"> 
                        </div>
                        <br>
                        <div class="form-element">
                            <label for="spam">Subscribe to mail list</label>
                            <input type="checkbox" name="spam" id="spam">
                        </div> 
                        <br>
                          <div class="form-element">
                              <input type="submit" value="Submit">
                            <input type="reset" value="Reset">
                        </div>  


                    </form>
                <% if (request.getAttribute("ERRORS") != null && !request.getAttribute("ERRORS").equals("")) { %>
                <div class="error"><%= request.getAttribute("ERRORS") %></div>
           <% }%>

        </div>
            </body>
        </html>
