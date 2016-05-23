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

        <link rel="stylesheet" href="style2.css" type="text/css" />
        <title>View Pizzas</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
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
       <h1><img id="pizzalogo" src="img/pizzalogotransp.png" alt="#" width="120px"></h1>
       

        <div id="menu">
           <a href="indexJSP.jsp">Home</a>
                    <a  href="AboutsUsJSP.jsp">About Us</a>  
                <a href="ContactJSP.jsp">Contact</a>
                <a class="active" href="PizzaJSP.jsp">Menu</a>
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
            int idUser=UserDAOFactory.getUserDAO().getUserid((String)(session.getAttribute("user")));
           // ArrayList<Pizza> pizzaCumparate=OrderDAO_Factory.getOrderDAO().
             Pizza creata=null;
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
   //   if(!OrderDAO_Factory.getOrderDAO().pizzaBought(p, idUser)){
          
      ii.remove();
    //  }
       
     
    
   
  }
   
}
   String a="aa";
if(session.getAttribute("ShoppingCart")!=null){
             creata =(Pizza)session.getAttribute("ShoppingCart");
//            String img=ProductDAO_Factory.getProductDAO().getImgPizza(creata.getName());
//             creata.setImage(img);
             pizzas.add(creata);
             a=creata.getIngredients().toString();
             session.setAttribute("ShoppingCart", null);
            }
          
            
           
        %>
        <div id="content" style='background-image: url("img/anotherBGBlur.jpg"); background-repeat: no-repeat; background-size: 200% auto; height: 800px;'>

           
            <h1>View Order</h1>
            <div id="reviewsArea">
            <form method="post" action="CartC">
              
                
                <table id="reviewsTable">
                    <tr id="tableHead"><td>Image</td><td>Name</td><td>Size</td><td>Crust</td><td>Sauce</td><td>Cheese</td><td>Ingredients</td><td>Price</td><td>Quantity </td></tr>
                    <%for (Pizza p : pizzas) {%>
                    
                    
                    
                    <tr>
                          <td>
                        <%if(p.getImage().equals("-")){%>
                        <img id="menuPizza" src="./img/pizzaBuilder.png" width="100px" height="100px">
                        
                        <%}else{%>
                        <img id="menuPizza" src="<%=p.getImage()%>" width="100px" height="100px">
                   <%}%>
                        </td>

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
<%if(session.getAttribute("user")!=null){%>

                <input class="Formbuttons" type="submit" value="Buy">

<%}%>


            </form>

            </div>

        </div>
    </body>
</html>
