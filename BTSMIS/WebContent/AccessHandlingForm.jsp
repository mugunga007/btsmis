 <!DOCTYPE html>
<html >
 <%@page import="java.util.List"%>
<%@page import="model.InStockModel"%>
<%@page import="model.BtsModel"%>
<%@page import="service.AccessRequest"%>
<%@page import="model.AccessRequestModel"%>

  <%@page import="service.Request"%>
  <%@page import="model.AccessHandlingModel"%>
  <%@page import="service.AccessHandling"%>

<%@page import="service.User"%>
<head>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>BTSMIS</title>
    <!-- Bootstrap Styles-->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="bower_components/font-awesome/css/font-awesome.css" rel="stylesheet" />
   
    <!-- Google  Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>

<body style="background-color: #E5EBF2">
<jsp:include page="UserHeader.jsp"></jsp:include>
<%

AccessRequestModel arm = new AccessRequestModel();
BtsModel btm = new BtsModel();
String arId = request.getParameter("arId");
String bnm = request.getParameter("bnm");
//session.setAttribute("BtsId", BtsId);

%>

<% 
 User user = (User) session.getAttribute("user");
            if(user != null){
            	int userId = user.getId();
            	int region = user.getRegion();
                
             %>  
    

        <!--/. NAV TOP  -->


        <div class="container">
        
        <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                          <i class="fa fa-edit text-success"></i>  <small> Access Handling Report for <%=bnm %></small>
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
 
   <%} else if(request.getAttribute("failed")!=null){%>
  
  
  <div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <%=request.getAttribute("failed") %>
  </div>
  
  <%
 }
  %>

<form class="form-horizontal" action="AccessHandlingController" method="post">

  
    <div class="form-group">
         <label for="name" class=" control-label">Status at Arrival</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="statusAtArrival" class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
                   
    <div class="form-group">
         <label for="name" class=" control-label">Actual Issue</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="actualIssue" class="form-control" id="name" placeholder="" required="required"/>
                 </div>                  
  </div> <div class="form-group">
         <label for="name" class=" control-label">Issue Handling Result</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="issueHandlingResult" class="form-control" id="name" placeholder="" required="required"/>
                 </div>                  
  </div> <div class="form-group">
         <label for="name" class=" control-label">Downtime</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="number" name="downtime" class="form-control" id="name" placeholder="" required="required"/>
                 </div>                  
  </div> <div class="form-group">
         <label for="name" class=" control-label">Downtime Reason</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="downtimereason" class="form-control" id="name" placeholder="" required="required"/>
                 </div>                  
  </div>
   <div class="form-group">
         <label for="name" class=" control-label">Running Hours</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="number" name="runningHours" class="form-control" id="name" placeholder="" required="required"/>
                 </div>                  
  </div>
  <div class="form-group">
         <label for="name" class=" control-label">Status at Departure</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="statusAtDeparture" class="form-control" id="name" placeholder="" required="required"/>
                 </div>                  
  </div>
  
  
  
  
  
  <input type="hidden" name="userId" value="<%=userId%>"/>
   <input type="hidden"  name="ticketId" value="<%=arId%>"/>

  
  <div class="form-group">
  <center>
  <div class="input-group">
 <input type="submit" class="btn btn-primary" value="Report"/>
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