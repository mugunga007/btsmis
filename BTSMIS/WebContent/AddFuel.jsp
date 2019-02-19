<!DOCTYPE html>
<html >
 <%@page import="java.util.List"%>
<%@page import="model.GenSetModel"%>
<%@page import="service.User"%>


<%@page import="service.GenSet"%>
<%@page import="service.Bts"%>
<%@page import="model.BtsModel"%>
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
     <script type="text/javascript">
     function initGeolocation()
     {
        if( navigator.geolocation )
        {
           // Call getCurrentPosition with success and failure callbacks
           navigator.geolocation.getCurrentPosition( success, fail );
        }
        else
        {
           alert("Sorry, your browser does not support geolocation services.");
        }
     }

     function success(position)
     {

         document.getElementById('longitude').value = position.coords.longitude;
         document.getElementById('latitude').value = position.coords.latitude
     }

     function fail()
     {
        // Could not obtain location
     }

   </script>    
    
</head>

<body onLoad="initGeolocation();" style="background-color: #E5EBF2">
<jsp:include page="UserHeader.jsp"></jsp:include>
<%

 User user = (User) session.getAttribute("user");
            if(user != null){
            	int userId = user.getId();
             %>  
<%

%>
    

        <!--/. NAV TOP  -->


        <div class="container">
        
        <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                         <i class="fa fa-edit text-success"></i>    <small>Add Fuel</small>
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
String btsId = request.getParameter("btsId").toString(); 
GenSetModel n1=new GenSetModel();
GenSet v=new GenSet();
String genId = n1.getGenSetByBts(btsId).getGenSetId();
v = n1.getGenSet(btsId);
//String genSetId=n1.getGenSet(btsId).v.getGenSetId();
%>

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
 
 <div class="alert alert-warning">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <%=request.getAttribute("notavailable") %>
</div>
 
 <%
 }else if(request.getAttribute("date")!=null){
	 
 
 %>
 <div class="alert alert-warning">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <%=request.getAttribute("date") %>
  </div>
  <%} else if(request.getAttribute("notinserted")!=null){%>
  
  
  <div class="alert alert-warning">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <%=request.getAttribute("notinserted") %>
  </div>
  
  <%
 }
  %>

<form   class="form-horizontal" action="AddFuelController" method="post">
    <input type="hidden" name="bts" value="<%=btsId%>"  />
             
 <div class="form-group">
     <label for="genSetId" class=" control-label">GenSet ID  </label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                 <input type="text" name="genSetId" value="<%=genId%>" readonly="true" class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  
  <div class="form-group">
         <label for="" class=" control-label">Remaining Fuel Quantity (Liters) </label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="number" name="remQuantity"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  
  <div class="form-group">
         <label for="" class=" control-label">Running Hours</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="number" name="runHours"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
   
  
  
  <div class="form-group">
         <label for="" class=" control-label">Added Fuel Quantity (Liters)</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="number" name="quantity"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
   
   
                          <input type="hidden" name="longitude"  class="form-control" id="longitude" placeholder="" required="required"/>
                          <input type="hidden" name="latitude"  class="form-control" id="latitude"  required="required"/>
                 
   
   
  
  
  
  <div class="form-group">
  <center>
  <div class="input-group">
 <input type="submit" class="btn btn-primary" value="Report"/>
  </div>
  </center>
  </div>
   <input type="hidden" name="userId" value="<%=userId%>"  />
  
  
  </form>



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