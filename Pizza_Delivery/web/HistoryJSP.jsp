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

        <link rel="stylesheet" href="style2.css" type="text/css" />
        <title>View Pizzas</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
    </head>
    <body>
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
            <h1><img id="pizzalogo" src="img/pizzalogotransp.png" alt="#" width="120px"/></h1>


            <div id="menu">
                <a href="indexJSP.jsp">Home</a>
                <a  href="AboutsUsJsp.jsp">About Us</a>  
                <a href="ContactJSP.jsp">Contact</a>
                <a href="PizzaJSP.jsp">Menu</a>
                <a href="CreatePizzaJSP.jsp">Create your own pizza!</a>
                <a href="ReviewJSP.jsp">Reviews</a>
                <a class="active" href="HistoryC">History</a>
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
        <div id="uppermenu">
            <nav>
                <ul>
                    <li><a class="PolyLogo" href="indexJSP.jsp"></a></li>
                    <li id="message"><em>Be creative!</em></li>
                </ul>
            </nav>
        </div>
        <%
            List<Order> orders = (List<Order>) session.getAttribute("orders");

            boolean loggedIn = false;
//            
            if (session.getAttribute("user") != null) {
                loggedIn = true;
            }
        %>
        <div id="content" style='background-image: url("img/pizza33Blur.jpg"); background-repeat: no-repeat; height: 1000px; background-size: 100% 100%;'>


            <h1>View History</h1>
            <div id="reviewsArea">
                <form method="post" action="CartC">
                    <%if (!orders.isEmpty()) {%>
                    <table id="reviewsTable">
                        <tr id="tableHead"><td>OrderId</td><td>Date</td><td>Quantity</td><td>Price</td><td> See Details</td></tr>
                        <%for (Order o : orders) {%>
                        <tr id="reviewRow">
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