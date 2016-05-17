<%-- 
    Document   : ShoppingCarrtJSP
    Created on : May 16, 2016, 9:19:45 PM
    Author     : Ada
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Ingredient"%>
<%@page import="model.Pizza"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        
        <title>View Order</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
    </head>
    <body>
        <%
            Pizza p=(Pizza)request.getSession().getAttribute("ShoppingCart");
            
            boolean loggedIn = false;
//            List<Crust> crusts = ProductDAO_Factory.getProductDAO().getCrust();
//            List<Sauce> sauces = ProductDAO_Factory.getProductDAO().getSauce();
//            List<Ingredient> ingredientsM = ProductDAO_Factory.getProductDAO().getIngredient("Meats");
//            List<Ingredient> ingredientsV = ProductDAO_Factory.getProductDAO().getIngredient("Veggie");
            if (session.getAttribute("user") != null) {
                loggedIn = true;
            }
        %>
        <div id="content">
         
            <nav>
                <ul>
                    <a href="indexJSP.jsp">Index</a>                    
                    <a href="LoginJSP.jsp">Login</a>
                    <a href="RegistrationJSP.jsp">Register</a>
                    <a href="CreatePizzaJSP.jsp">Create Pizza!</a>
                    <a href="ReviewJSP.jsp">Review</a>
                    <a href="LogoutC">Log out!</a>

                </ul>
            </nav>
            <h1>View Order</h1>
            
             <form method="post" action="BuyC">
            <table>
                <tr><td>Name</td><td>Size</td><td>Crust</td><td>Sauce</td><td>Cheese</td><td>Ingredients</td><td>Price</td><td> </td></tr>
                       
                        
                        <tr>
                           
                            <td><%=p.getName() %></td>
                            <td><%=p.getSize() %></td>
                            <td><%=p.getCrust().getName() %></td>
                            <td><%=p.getSauce().getName() %></td>
                            <td><%=p.isCheese() %></td>
                           
                            <%ArrayList<Ingredient> ingredients=p.getIngredients(); %>
                            <td><%for(Ingredient ii:ingredients){ %>  <%=ii.getName()%>    <%}%>    </td>
                             <td><%=p.getPrice() %></td>
                            <td><a href="ShoppingCart.jsp?query=<%=p.getId()%>">Delete</a></td>
                            
                            
                        </tr>
                            
                         
                      
                         
                     </table>
                     
                     
                                      <input type="submit" value="Check Out">
                                      
                                     
                                     
   
      </form>
            
            
            
        </div>
    </body>
</html>
