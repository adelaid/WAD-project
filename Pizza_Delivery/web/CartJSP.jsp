<%-- 
    Document   : CartJSP
    Created on : May 17, 2016, 12:37:11 AM
    Author     : Ada
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.Ingredient"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page import="model.Pizza"%>
<%@page import="java.util.ArrayList"%>
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
                <a class="active" href="PizzaJSP.jsp">Menu</a>
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

            ArrayList<Pizza> pizzas = (ArrayList<Pizza>) ProductDAOImpl.getInstance().getPizza();
            ArrayList<Pizza> produseCumparate = (ArrayList<Pizza>) session.getAttribute("ProduseCumparate");
            if (request.getParameter("query") != null) {
                int idProd = Integer.parseInt(request.getParameter("query"));
//              

                Iterator<Pizza> i = produseCumparate.iterator();
                while (i.hasNext()) {
                    Pizza p = i.next();
                    if (p.getId() == idProd) {
                        if (p.getQuantity() > 1) {
                            p.setQuantity(p.getQuantity() - 1);
                        }
                        i.remove();

                    }

                }

            }
            session.setAttribute("FinalProd", produseCumparate);

            boolean loggedIn = false;
//            List<Crust> crusts = ProductDAO_Factory.getProductDAO().getCrust();
//            List<Sauce> sauces = ProductDAO_Factory.getProductDAO().getSauce();
//            List<Ingredient> ingredientsM = ProductDAO_Factory.getProductDAO().getIngredient("Meats");
//            List<Ingredient> ingredientsV = ProductDAO_Factory.getProductDAO().getIngredient("Veggie");
            if (session.getAttribute("user") != null) {
                loggedIn = true;
            }
        %>
        <div id="content"  style='background-image: url("img/pizza33Blur.jpg"); background-repeat: no-repeat; height: 1000px; background-size: 100% 100%;'>


            <h1>View Order</h1>
            <div id="reviewsArea">
                <form method="post" action="BuyC">

                    <table id="reviewsTable">
                        <tr id="tableHead"><td>Name</td><td>Size</td><td>Crust</td><td>Sauce</td><td>Cheese</td><td>Ingredients</td><td>Price</td><td>Quantity </td><td></td></tr>
                        <%for (Pizza p : produseCumparate) {%>
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
                            <td><%=p.getQuantity()%></td>
                            <td><a href="CartJSP.jsp?query=<%=p.getId()%>">Delete</a></td>
                        </tr>
                        <%}%>
                    </table>


                    <input type="submit" value="Finish Order">




                </form>
            </div>


        </div>
    </body>
</html>