<%-- 
    Document   : HistoryUserJSP
    Created on : May 17, 2016, 1:47:54 PM
    Author     : Ada
--%>

<%@page import="dao.ProductDAOImpl"%>
<%@page import="model.Ingredient"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Pizza"%>
<%@page import="dao.OrderDAO_Factory"%>
<%@page import="dao.UserDAOFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style2.css" type="text/css"/>
        <title>User History</title>
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

            String user = (String) session.getAttribute("user");
            int idorder = Integer.parseInt(request.getParameter("query"));
            ArrayList<Pizza> pizzas = (ArrayList<Pizza>) OrderDAO_Factory.getOrderDAO().getClientPurchases(user, idorder);
        %>
        <div id="content" style='background-image: url("img/pizza33Blur.jpg"); background-repeat: no-repeat; height: 1000px; background-size: 100% 100%;'>


            <h1>View Order</h1>
            <div id="reviewsArea">
                <form method="post" action="CartC">

                    <table id="reviewsTable">
                        <tr id="tableHead"><td>Name</td><td>Size</td><td>Crust</td><td>Sauce</td><td>Cheese</td><td>Ingredients</td><td>Price</td></tr>
                        <%for (Pizza p : pizzas) {%>
                        <tr id="reviewRow">
                            <td><%=p.getName()%></td>
                            <td><%=p.getSize()%></td>
                            <td><%=p.getCrust().getName()%></td>
                            <td><%=p.getSauce().getName()%></td>
                            <td><%=p.isCheese() ? 1 : 0%></td>

                            <%
                                List<Ingredient> ingredients = ProductDAOImpl.getInstance().getIngredient(p);
                            %>

                            <td>
                                <%
                                    for (Ingredient i : ingredients) {
                                %>
                                <%=i.getName()%>, 

                                <%}%>
                            </td>

                            <td><%=p.getPrice()%></td>

                        </tr>
                        <%}%>
                    </table>

                </form>
            </div>
        </div>
    </body>
</html>