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
</head>

<body style="background-color: #E5EBF2">
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
                         <i class="fa fa-edit text-success"></i>    <small>Page Title</small>
                        </h1>
                    </div>
                </div>
                <!-- /. ROW  -->
        
        
        
            <div id="row">
<!-- CONTENTS START -->


<div class="col-md-4">
</div>
<div class="col-md-4">



<div class="well well-small"><center><h3>Add fuel </h3></center></div>
<%
String btsId = request.getParameter("btsId").toString(); 
GenSetModel n1=new GenSetModel();
GenSet v=new GenSet();

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
  <%} else{%>
  
  
  <div class="alert alert-warning">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <%=request.getAttribute("notinserted") %>
  </div>
  
  <%
 }
  %>

<form class="form-horizontal" action="AddFuelController" method="post">
    <input type="hidden" name="bts" value="<%=btsId%>"  />
             
 <div class="form-group">
     <label for="genSetId" class=" control-label">GenSet ID</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                 <input type="text" name="genSetId" value="<%=v.getGenSetId()%>" readonly="true" class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  <div class="form-group">
         <label for="" class=" control-label">Quantity</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="number" name="quantity"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
   
  
  
  <div class="form-group">
  <center>
  <div class="input-group">
 <input type="submit" class="btn btn-primary" value="Register"/>
  </div>
  </center>
  </div>
  
  
  
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