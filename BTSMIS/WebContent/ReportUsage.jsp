<!DOCTYPE html>
<html >
<%@page import="service.User"%>
<%@page import="model.ItemModel"%>
<%@page import="service.Bts"%>
<%@page import="model.BtsModel"%>
 <%@page import="java.util.List"%>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>BTSMIS</title>
    <!-- Bootstrap Styles-->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="bower_components/font-awesome/css/font-awesome.css" rel="stylesheet" />
   
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
     <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?sensor=false">
    </script>
    <script type="text/javascript">
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

        
     
    </script>
    
</head>

<body style="background-color: #E5EBF2">
<jsp:include page="UserHeader.jsp"></jsp:include>
<%

 User user = (User) session.getAttribute("user");
            if(user != null){
            	int userId = user.getId();
             %>  

    

        <!--/. NAV TOP  -->
        
        

<%
Bts bt = new Bts();
BtsModel btm = new BtsModel();
ItemModel im = new ItemModel();

int itemId = Integer.parseInt(request.getParameter("itemId"));
int itemC = Integer.parseInt(request.getParameter("itemC"));
String itemName = im.getItem(itemId).getItemName();


%>
        <div class="container">
        
        <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                         <i class="fa fa-cogs text-success"></i>  <small>Report Usage Of <%=itemName %></small> 
                        </h1>
                    </div>
                </div>
                <!-- /. ROW  -->
        
        
        
            <div id="row">
<!-- CONTENTS START -->




<div class="col-md-4">
</div>


<div class="col-md-4">
<%
 if(request.getAttribute("success")!=null){ 
 %>
 
 <div class="alert alert-success">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <%=request.getAttribute("success") %>
</div>
 <%
 }else if(request.getAttribute("notavailable")!=null){
 %>
 
 <div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <%=request.getAttribute("notavailable") %>
</div>
 

  <%} else if(request.getAttribute("failed")!=null){%>
  
  
  <div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <%=request.getAttribute("failed") %>
  </div>
  
  <%
 }
  %>

<form class="form-horizontal" action="ReportUsage" method="post" >
 
  <div class="form-group">
         <label for="name" class="col-md-4 control-label">Quantity Used</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="number" name="quantity"  class="col-md-8 form-control" id="name" required="required"/>
                 </div> 
                 
  </div>
  
    <div class="form-group">
         <label for="name" class="col-md-4 control-label"> Note </label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="note" class="col-md-8 form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  
  
  
  <div class="form-group">
         <label for="name" class="col-md-4 control-label">BTS Id </label>
              
                <div class="input-group">
                
                
                <select name="btsId" class="form-control">
                 
                  <%
                  
                     List<Bts> listb = btm.getBtsByEngineer(userId);
                     for (Bts p : listb) {
                 %>
                 
                <option value="<%=p.getBtsId()%>"><%=p.getBtsName()%> </option>
               <%
                     }
               %>
               
            </select>
                
                
                     </div> 
                 
  </div>




  <div class="form-group">
         <label for="name" class="col-md-4 control-label"> Run Hour </label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="number" name="runHour" class="col-md-8 form-control" id="name" placeholder="" />
                 </div> 
                 
  </div>
  
  <!-- 
  
    <div class="form-group">
         <label for="name" class="col-md-4 control-label"> Upload Picture </label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="fa fa-image"></span> </span>
                          <input type="file" name="attachement" class="col-md-8 form-control"   />
                 </div> 
                 
  </div>
  
   -->
  <input type="hidden" name="userId" value="<%=userId%>"/>
  <input type="hidden" name="itemId" value="<%=itemId%>"/>
    <input type="hidden" name="itemC" value="<%=itemC%>"/>
  <input type="text" name="lat" id="latitude" value=""/>
  <input type="text" name="lon" id="longitude" value=""/>
  <div class="form-group">
  <center>
  <div class="input-group">
 <input type="submit" class="form-control btn btn-primary" value="Report"/>
  </div>
  </center>
  </div>
  
  
  
  </form>

</div>

<div class="col-md-4">
</div>



<!-- CONTENTS END -->


            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->
<%
            }
            else
            {
%>

<jsp:forward page="Login.jsp" ></jsp:forward>
<%
            }
%>


    <!-- JS Scripts-->
    <!-- jQuery Js -->
    <script src="custom/js/jquery-1.10.2.js"></script>
      <!-- Bootstrap Js -->
    
     <!-- DATA TABLE SCRIPTS -->
    <script src="custom/dataTables/jquery.dataTables.js"></script>
    <script src="custom/dataTables/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
            });
    </script>
         <!-- Custom Js -->
    <script src="custom/custom-scripts.js"></script>
    

</body>

</html>