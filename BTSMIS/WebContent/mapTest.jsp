 <!DOCTYPE html>
<html>
  <head>
    <style>
       #map {
        height: 400px;
        width: 100%;
       }
    </style>
  </head>
  <body>
      <h3>SITE LOCATION</h3>
    <div id="map"></div>
    <%
     String lati=request.getParameter("lati");
        String lon=request.getParameter("lon");
    %>
    <script>
       
      function initMap() {
      //  var uluru = {lat: -25.363, lng: 131.044};
        var uluru = {lat:<%=lati%>, lng: <%=lon%>};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCMzaIsbmtzH4VVrpa-j3okB3XKkc5-Tak&callback=initMap">
    </script>
  </body>
</html>