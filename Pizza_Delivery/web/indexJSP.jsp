<%-- 
    Document   : indexJSP
    Created on : May 16, 2016, 3:34:01 PM
    Author     : Ada
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
    <head>
        <title>Poly Pizza</title>
        <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" href="style.css" type="text/css" />
        

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
    <div id="content">
        
        <div class="slideshow">

            <div class="slideshowDisplay">
                <img src="img/pizza1.jpg" style="width:100%">
                    <div class="w3-display-bottomleft w3-large w3-container w3-padding-hor-16 w3-black">
                        some pizza
                    </div>
            </div>

            <div class="slideshowDisplay">
                <img src="img/pizza2.jpg" style="width:100%">
                    <div class="w3-display-bottomright w3-large w3-container w3-padding-hor-16 w3-black">
                        some pizza1
                    </div>
            </div>

            <div class="slideshowDisplay">
                <img src="img/pizza4.jpg" style="width:100%">
                    <div class="w3-display-topleft w3-large w3-container w3-padding-hor-16 w3-black">
                        some pizza2
                    </div>
            </div>

            <div class="slideshowDisplay">
                <img src="img/pizza5.jpg" style="width:100%">
                    <div class="w3-display-topright w3-large w3-container w3-padding-hor-16 w3-black">
                        some pizza3
                    </div>
            </div>

            <div class="slideshowDisplay">
                <img src="img/pizza1.jpg" style="width:100%">
                    <div class="w3-display-middle w3-large w3-container w3-padding-hor-16 w3-black">
                        some pizza4
                    </div>
            </div>


            <a id="left" style="position:absolute;top:52%;left:0;opacity:0.4" onclick="plusDivs(-1)"><img src="img/left.png"></a>
            <a id="right" style="position:absolute;top:52%;right:0;opacity:0.4" onclick="plusDivs(1)"><img src="img/right.png"></a>

        </div>

        <script>
            var slideIndex = 0;
            carousel();
            showDivs(slideIndex);

            function carousel() {
                var i;
                var x = document.getElementsByClassName("slideshowDisplay");
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                slideIndex++;
                if (slideIndex > x.length) {
                    slideIndex = 1;
                }
                x[slideIndex - 1].style.display = "block";
                setTimeout(carousel, 4000); // Change image every 2 seconds
            }
                

                function plusDivs(n) {
                    showDivs(slideIndex += n);
                }

                function showDivs(n) {
                    var i;
                    var x = document.getElementsByClassName("slideshowDisplay");
                    if (n > x.length) {
                        slideIndex = 1;
                    }
                    if (n < 1) {
                        slideIndex = x.length;
                    }
                    ;
                    for (i = 0; i < x.length; i++) {
                        x[i].style.display = "none";
                    }
                    x[slideIndex - 1].style.display = "block";
                }
            
        </script>

        <h1>Welcome!</h1>
        <h2>Create your own pizza</h2>

        <h3>How to:</h3>
        <p></p>

        <p></p>


    </div>

</body>
</html>