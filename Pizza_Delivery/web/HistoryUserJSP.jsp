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
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <title>JSP Page</title>
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
                <a href="#">Contact</a> 
                <a href="PizzaJSP.jsp">Menu</a>
                <a href="CreatePizzaJSP.jsp">Create your own pizza!</a>
                <a href="ReviewJSP.jsp">Reviews</a>
                <a class="active" href="HistoryC">History</a>
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
         

        String user=(String)session.getAttribute("user");    
        int idorder=Integer.parseInt(request.getParameter("query"));
        ArrayList<Pizza> pizzas=(ArrayList<Pizza>)OrderDAO_Factory.getOrderDAO().getClientPurchases(user, idorder);
        %>
   <div id="content">

            
            <h1>View Order</h1>

            <form method="post" action="CartC">

                <table>
                    <tr><td>Name</td><td>Size</td><td>Crust</td><td>Sauce</td><td>Cheese</td><td>Ingredients</td><td>Price</td></tr>
                    <%for (Pizza p : pizzas) {%>
                    <tr>
                        <td><%=p.getName()%></td>
                        <td><%=p.getSize()%></td>
                        <td><%=p.getCrust().getName()%></td>
                        <td><%=p.getSauce().getName()%></td>
                        <td><%=p.isCheese() ? 1:0%></td>

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
    </body>
</html>