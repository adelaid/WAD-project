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
        <link rel="stylesheet" href="style2.css" type="text/css"/>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">

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

        <div id="contentUser" style='background-size: 100% auto; background-attachment: fixed;'>
            <div id="uppermenu">
                <nav>
                    <ul>

                        <li><a class="PolyLogo" href="indexJSP.jsp"></a></li>
                        <li id="message"><em>Be creative!</em></li>

                    </ul>
                </nav>
            </div>

            <h1>Login</h1>
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
                        <input id="formBt" style="background-color: rgb(242, 225, 42);" type="submit" value="Submit">
                        <input id="formBt" style="background-color: rgb(242, 225, 42);" type="reset" value="Reset">
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
