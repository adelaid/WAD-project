<%-- 
    Document   : RegistrationJSP
    Created on : May 5, 2016, 3:01:47 PM
    Author     : Adelaid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
       <html>
    <head>
        <link rel="stylesheet" href="style2.css" type="text/css"/>
        <link rel="stylesheet" href="styleFunctional.css" type="text/css"/>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js "></script>
        <script type="text/javascript" src="jquery.min.js"></script>
        <script type="text/javascript" src="ajaxRegister.js"></script>

        <title>Registration</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
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
            

            <div id="menu">
                <a href="indexJSP.jsp">Home</a>
                    <a  href="AboutsUsJsp.jsp">About Us</a>  
                <a href="ContactJSP.jsp">Contact</a> 
                <a href="PizzaJSP.jsp">Menu</a>
                <a href="CreatePizzaJSP.jsp">Create your own pizza!</a>
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
        <div id="contentUser" style='background-image: url("img/pizza33Blur.jpg"); background-size: 100% 100%; background-attachment: fixed; height: 1500px'>
            <div id="uppermenu">
                <nav>
                    <ul>
                        <li><a class="PolyLogo" href="indexJSP.jsp"></a></li>
                        <li id="message"><em>Be creative!</em></li>
                    </ul>
                </nav>
            </div>

            <h1>Registration form</h1>   
            <div class="registrationform">
                <form method="post" action="RegistrationC">
                    <div class="form-element">
                        <label for="username">Username</label>
                        <input type="text" name="uname" id="uname" required class="field">  <span class="status"></span> 
                    </div>
                    
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
                    
                    <div class="form-element">
                        <label for="last_name">Last Name</label>
                        <input type="text" name="lname" id="lname" required>
                    </div>
                    
                    <div class="form-element">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" required>
                    </div>    
                    
                    <div class="form-element">
                        <label for="tel">Telephone</label>
                        <input type="tel" name="tel" id="tel" required>
                    </div>
                    
                    <div class="form-element">
                        <label for="address">Address</label>
                        <input type="text" name="address" id="address" required>
                    </div>
                    
                    <div class="form-element">
                        <label for="gender">Gender </label>
                        Male<input type="radio" name="gender" value="male" checked> 
                        Female<input type="radio" name="gender" value="female"> 
                    </div>
                    
                    <div class="form-element">
                        <label for="spam">Subscribe to mail list</label>
                        <input type="checkbox" name="spam" id="spam">
                    </div> 
                   
                    <div class="form-element">
                        <input id="formBt" style="background-color: rgb(242, 225, 42);" type="submit" value="Submit">
                        <input id="formBt" style="background-color: rgb(242, 225, 42);" type="reset" value="Reset">
                    </div>  


                </form>
            </div>
            <% if (request.getAttribute("ERRORS") != null && !request.getAttribute("ERRORS").equals("")) {%>
            <div class="error"><%= request.getAttribute("ERRORS")%></div>
            <% }%>

        </div>
    </body>
</html>