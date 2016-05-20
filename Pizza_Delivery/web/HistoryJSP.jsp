<%-- 
    Document   : HistoryJSP
    Created on : May 17, 2016, 1:33:10 PM
    Author     : Ada
--%>

<%@page import="model.Order"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" href="style.css" type="text/css" />
        <title>View Pizzas</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
    </head>
    <body>
        <div id="bigmenu">

        <div id="bigmenulinks">
            <a href="LoginJSP.jsp">Login</a>
            <a href="RegistrationJSP.jsp">Register</a>
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
    <div id="uppermenu">
        <nav>
            <ul>
<!--                <a href="index.jsp">Home</a>
                <a href="#">Contact</a>
                <a href="#">Menu</a>
                <a href="#">Special Discounts</a>-->
            </ul>
        </nav>
    </div>
        <%
            List<Order> orders=(List<Order>)session.getAttribute("orders");

            boolean loggedIn = false;
//            
            if (session.getAttribute("user") != null) {
                loggedIn = true;
            }
        %>
        <div id="content">

           
            <h1>View History</h1>

            <form method="post" action="CartC">
     <%if(!orders.isEmpty()){%>
                <table>
                    <tr><td>OrderId</td><td>Date</td><td>Quantity</td><td>Price</td><td> See Details</td></tr>
                    <%for (Order o : orders) {%>
                    <tr>
                        <td><%=o.getId()%></td>
                        <td><%=o.getDateO()%></td>
                        <td><%=o.getQuantity()%></td>
                        <td><%=o.getPrice()%></td>
                        <td><a href="HistoryUserJSP.jsp?query=<%=o.getId()%>">See Details</a></td>

                     
                    </tr>
                    <%}%>
                </table>
<%}%>

            </form>



        </div>
    </body>
</html>