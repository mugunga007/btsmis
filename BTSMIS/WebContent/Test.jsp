<!DOCTYPE html>
<HTML>
<BODY>
Click Show location button and run :)
<input type="button" value="Show Location" onclick="showlocation()"/> 

<br/>
Latitude: <span id="latitude">..</span> <br>
Longitude: <span id="longitude">..</span>

<%

String lat = "";

%>
Lat = <%=lat %>

<SCRIPT>

function showlocation(){
	navigator.geolocation.watchPosition(callback);
}
function callback(position){
	document.getElementById('latitude').innerHTML=position.coords.latitude;
	document.getElementById('longitude').innerHTML=position.coords.longitude;

	var lat = document.getElementById('latitude');
}

</SCRIPT>
</HTML>