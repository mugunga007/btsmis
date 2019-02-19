<!DOCTYPE html>
<html>
<body>



<div id="demo">
<h2>The XMLHttpRequest Object</h2>

<a href="#" onclick="loadDoc()">Request data</a>

<%String m = request.getParameter("fname"); %>

para (m): <%=m %>
</div>

<script>

var map = null;
function showlocation() {
   // One-shot position request.
    navigator.geolocation.getCurrentPosition(callback);
}
var lat = null;
var lon = null;
function callback(position) {

lat = position.coords.latitude;
lon = position.coords.longitude;

//	 lat = 23;
//	 lon = 45;


	 document.getElementById('latitude').innerHTML = lat;
document.getElementById('longitude').innerHTML = lon;
	
var latLong = new google.maps.LatLng(lat, lon);

	var marker = new google.maps.Marker({
	    position: latLong
	});      
	
	marker.setMap(map);
map.setZoom(8);
map.setCenter(marker.getPosition());
}

google.maps.event.addDomListener(window, 'load', initMap);
function initMap() {
var mapOptions = {
center: new google.maps.LatLng(0, 0),
zoom: 1,
mapTypeId: google.maps.MapTypeId.ROADMAP
};
map = new google.maps.Map(document.getElementById("map-canvas"), 
                              mapOptions);



}
var lat = null;
var lon = null;
var lo = 5;
function loadDoc() {
	 lo = 5;
	 lat = position.coords.latitude;
	 lon = position.coords.longitude;
	 	 
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("demo").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "TemplateUserTable.jsp?fname=Henry&lname="+lat, true);
  xhttp.send();
}
</script>

</body>
</html>