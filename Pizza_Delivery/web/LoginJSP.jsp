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
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <title>Login</title>


    </head>


    <%
        String error = "";
        if (request.getAttribute("LOGIN_ERROR") != null) {
            error = (String) request.getAttribute("LOGIN_ERROR");
        }

    %>
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
                <a class="active" href="#">About Us</a> 
                <a href="#">Contact</a> 
                <a href="PizzaJSP.jsp">Menu</a>
                <a href="CreatePizzaJSP.jsp">Create your own pizza!</a>
                <a href="ReviewJSP.jsp">Reviews</a>
                <a href="HistoryC">History</a>
            </div>
            <img id="logo" src="img/oneLogo.png" >
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

            <h1>Please fill in the form</h1>
            <div class="loginform">
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
                    <%                     if (!"".equals(error)) {
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
        </div>
    </body>
</html>
