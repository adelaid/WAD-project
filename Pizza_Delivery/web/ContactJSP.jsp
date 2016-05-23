<%-- 
    Document   : LoginJSP
    Created on : May 5, 2016, 7:21:00 PM
    Author     : Adelaid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Contact</title>
    <link rel="stylesheet" href="style2.css" type="text/css" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
      }
    </style>
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
                <a href="AboutUsJSP.jsp">About Us</a> 
                <a href="#">Contact</a> 
                <a href="PizzaJSP.jsp">Menu</a>
                <a href="CreatePizzaJSP.jsp">Create your own pizza!</a>
                <a href="ReviewJSP.jsp">Reviews</a>
                <a href="HistoryC">History</a>
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
    <div id="content">
        <div id="uppermenu">
                <nav>
                    <ul>
                        <li><a class="PolyLogo" href="indexJSP.jsp"></a></li>
                        <li id="message"><em>Be creative!</em></li>
                    </ul>
                </nav>
            </div>
    <div id="map" style="position: relative;overflow: hidden;transform: translateZ(0px);background-color: rgb(229, 227, 223);z-index: 8;margin-top: 20px; margin-left: 3px;"></div>
    <script>
      // Note: This example requires that you consent to location sharing when
      // prompted by your browser. If you see the error "The Geolocation service
      // failed.", it means you probably did not give permission for the browser to
      // locate you.

      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 10
        });
        var infoWindow = new google.maps.InfoWindow({map: map});

        // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };

            infoWindow.setPosition(pos);
            infoWindow.setContent('Your position');
            map.setCenter(pos);
       
             
             
             var image = {
    url: 'http://findicons.com/files/icons/1672/mono/32/home.png'
    // This marker is 20 pixels wide by 32 pixels high.
   
  };
         
        var marker_position=  new google.maps.Marker({
          position: pos,
          map: map,
          icon: image,
            animation: google.maps.Animation.DROP,
          title: 'Hello World!'
            });
          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, map.getCenter());
        }
        
         var marker = new google.maps.Marker({
          position: {lat: 44.43841, lng: 26.05165},
          map: map,
          title: 'Hello World!'
            });
           
            new google.maps.Marker({
          position: {lat: 44.42689, lng: 26.10624},
          map: map,
          title: 'Hello World!'
            });
            
             new google.maps.Marker({
          position: {lat: 44.40507, lng: 26.10933},
          map: map,
          title: 'Hello World!'
            });
            
              new google.maps.Marker({
          position: {lat: 44.43204, lng: 26.17113},
          map: map,
          title: 'Hello World!'
            });
      }

      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
      }
      
      
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDN4hyNB_1yr744klBUh3S1WF68WvSlfPk&callback=initMap">
    </script>
    </div>
  </body>
</html>