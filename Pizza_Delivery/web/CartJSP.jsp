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
                
                <% if(session.getAttribute("user")!=null)
                {
                    
                
                %>
                <a href="HistoryC">History</a>
                <%}%>
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
            
             ArrayList<Pizza> pizzas = (ArrayList<Pizza>) ProductDAOImpl.getInstance().getPizza();
            ArrayList<Pizza> produseCumparate=(ArrayList<Pizza>)session.getAttribute("ProduseCumparate");
             if(request.getParameter("query")!=null){
                 int idProd=Integer.parseInt(request.getParameter("query"));
//              


Iterator<Pizza> i = produseCumparate.iterator();
while (i.hasNext()) {
   Pizza p = i.next();
  if (p.getId()==idProd) {
      if(p.getQuantity()>1){
      p.setQuantity(p.getQuantity()-1);
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
            <h1>View Order</h1>

            <form method="post" action="BuyC">

                <table>
                    <tr><td>Name</td><td>Size</td><td>Crust</td><td>Sauce</td><td>Cheese</td><td>Ingredients</td><td>Price</td><td>Quantity </td><td></td></tr>
                    <%for (Pizza p : produseCumparate) {%>
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
                        <td><%=p.getQuantity()%></td>
                        <td><a href="CartJSP.jsp?query=<%=p.getId()%>">Delete</a></td>
                    </tr>
                    <%}%>
                </table>


                <input type="submit" value="Finish Order">




            </form>



        </div>
    </body>
</html>