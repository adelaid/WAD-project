<%-- 
    Document   : LoginViewJSP
    Created on : Mar 28, 2016, 12:23:44 PM
    Author     : natalialexa
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
    <head>
        <title>Poly Pizza</title>
        <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" href="style2.css" type="text/css" />

    </head>

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
        <h1><img id="pizzalogo" src="img/pizzalogotransp.png" alt="#" width="100px"/></h1>


        <div id="menu">
            <a  href="indexJSP.jsp">Home</a>
            <a class="active" href="AboutUsJSP.jsp">About Us</a> 
            <a href="ContactJSP.jsp">Contact</a> 
            <a href="PizzaJSP.jsp">Menu</a>
            <a href="CreatePizzaJSP.jsp">Create your own pizza!</a>
            <a href="ReviewJSP.jsp">Reviews</a>
            <% if (session.getAttribute("user") != null) {

            %>
            <a href="HistoryC">History</a>
            <%}%>
        </div>
        <img id="logo" src="img/pizzaBoy.png" >
    </div>
    <div id="sidebar2">

        <div id="menu2">

        </div>
    </div>

    <div id="content" style='background-image: url("img/revPattern.png");'>
        <div id="uppermenu">
            <nav>
                <ul>
                    <li><a class="PolyLogo" href="indexJSP.jsp"></a></li>
                    <li id="message"><em>Be creative!</em></li>
                </ul>
            </nav>
        </div>

        <h1>Welcome!</h1>
        <h2>Small and helpful idea</h2>

        <h3 class="AUh">About us</h3>
        <p class="AUp">We are a small delivery company founded in 2016 with a main purpose to reach to our clients needs.
            The main characteristic of this pizza delivery website is that each client can make his own pizza by putting together any ingredients they want. In this way, we intend to satisfy every client�??s needs and preferences regarding food taste.</p>
        <h4 class="AUh">It is all about being practical and fun</h4>
        <p class="AUp">If you are tired of ordering the same old type of pizza the other companies provide, we invite you to check our new method.
            Here, you can build your own dream pizza.
            Once logged in, the client can send an order with the chosen ingredients and also, cand leave a review after the order arrives.
            The gift card system refers to those clients that are loyal to our services. That means that after a certain number of orders, the client collects a number of points that benefits himself: 

            <ul> 
                <li>10 pizza/month- 300 gift points</li>
                <li>15 pizza/month- 500 gift points</li>
                <li>20 pizza/month- 700 gift points</li>
            </ul>

            <p class="AUp">At 2500 gift points, the client can receive one of the following gifts:</p>
            <ul>
                <li>Free pizza for 8 days</li>
                <li>A T-shirt with our logo</li>
                <li>Two mugs with our logo</li>
            </ul>
            <p class="AUp">An only gift is chosen by every client.</p>

        </p>


    </div>



</html>