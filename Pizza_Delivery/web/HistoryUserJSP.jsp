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
        <title>JSP Page</title>
    </head>
    <body>
         <%
         

        String user=(String)session.getAttribute("user");    
        int idorder=Integer.parseInt(request.getParameter("query"));
        ArrayList<Pizza> pizzas=(ArrayList<Pizza>)OrderDAO_Factory.getOrderDAO().getClientPurchases(user, idorder);
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