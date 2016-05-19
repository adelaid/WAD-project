<%-- 
    Document   : PizzaJSP
    Created on : May 15, 2016, 1:12:45 PM
    Author     : Ada
--%>

<%@page import="dao.OrderDAO_Factory"%>
<%@page import="dao.UserDAOFactory"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAO_Factory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page import="model.Ingredient"%>
<%@page import="model.Pizza"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>


        <title>View Pizzas</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
    </head>
    <body>
        <%
            ArrayList<Pizza> pizzas = (ArrayList<Pizza>) ProductDAOImpl.getInstance().getPizza();
            int idUser=UserDAOFactory.getUserDAO().getUserid((String)(session.getAttribute("user")));
           // ArrayList<Pizza> pizzaCumparate=OrderDAO_Factory.getOrderDAO().
             
            boolean loggedIn = false;
//            List<Crust> crusts = ProductDAO_Factory.getProductDAO().getCrust();
//            List<Sauce> sauces = ProductDAO_Factory.getProductDAO().getSauce();
//            List<Ingredient> ingredientsM = ProductDAO_Factory.getProductDAO().getIngredient("Meats");
//            List<Ingredient> ingredientsV = ProductDAO_Factory.getProductDAO().getIngredient("Veggie");
            if (session.getAttribute("user") != null) {
                loggedIn = true;
            }
            
            
            Iterator<Pizza> ii = pizzas.iterator();
while (ii.hasNext()) {
   Pizza p = ii.next();
  if (p.getName().startsWith("Personal")) {
      if(!OrderDAO_Factory.getOrderDAO().pizzaBought(p, idUser)){
      ii.remove();
      }
    
   
  }
   
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

            <form method="post" action="CartC">

                <table>
                    <tr><td>Name</td><td>Size</td><td>Crust</td><td>Sauce</td><td>Cheese</td><td>Ingredients</td><td>Price</td><td>Quantity </td></tr>
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
                        <td><input type="text" name="<%=p.getId()%>" value="0"></td>
                    </tr>
                    <%}%>
                </table>


                <input type="submit" value="Buy">




            </form>



        </div>
    </body>
</html>
