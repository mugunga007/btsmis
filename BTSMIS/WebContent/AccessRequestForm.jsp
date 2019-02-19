 <!DOCTYPE html>
<html >
 <%@page import="java.util.List"%>
<%@page import="model.InStockModel"%>
<%@page import="model.RequestModel"%>
  <%@page import="service.Request"%>

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
String BtsId = request.getParameter("BtsId");
session.setAttribute("BtsId", BtsId);
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
                          <i class="fa fa-edit text-success"></i>  <small> Request site access </small>
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
 if(request.getAttribute("futuredate")!=null){ 
 %>
 
 <div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <%=request.getAttribute("futuredate") %> 
</div>

<%
 }else if(request.getAttribute("success")!=null){ 
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
 
   <%} else if(request.getAttribute("notinserted")!=null){%>
  
  
  <div class="alert alert-warning">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <%=request.getAttribute("notinserted") %>
  </div>
  
  <%
 }
  %>

<form class="form-horizontal" action="AccessRequestController" method="post">

 <div class="form-group">
         <label for="name" class=" control-label">Access Date</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="date" name="accessDate" class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  
    <div class="form-group">
         <label for="name" class=" control-label">Staff Id</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="staffId" class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
                   
    <div class="form-group">
         <label for="name" class=" control-label">Staff FirstName</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="staffFname" class="form-control" id="name" placeholder="" required="required"/>
                 </div>                  
  </div> <div class="form-group">
         <label for="name" class=" control-label">Staff LastName</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="staffLname" class="form-control" id="name" placeholder="" required="required"/>
                 </div>                  
  </div> <div class="form-group">
         <label for="name" class=" control-label">Reason</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="reason" class="form-control" id="name" placeholder="" required="required"/>
                 </div>                  
  </div> <div class="form-group">
         <label for="name" class=" control-label">Date received information</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="date" name="timeReceiveInfo" class="form-control" id="name" placeholder="" required="required"/>
                 </div>                  
  </div>
   <div class="form-group">
         <label for="name" class=" control-label">Source of information</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="infoFrom" class="form-control" id="name" placeholder="" required="required"/>
                 </div>                  
  </div>
  <div class="form-group">
         <label for="name" class=" control-label">Reported issue</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="reportedIssue" class="form-control" id="name" placeholder="" required="required"/>
                 </div>                  
  </div>
   <div class="form-group">
         <label for="name" class=" control-label">Ticket severity</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="ticketSeverity" class="form-control" id="name" placeholder="" required="required"/>
                 </div>                  
  </div>
  
  
  
  
  <input type="hidden" name="partnerId" value="<%=userId%>"/>
   <input type="hidden"  name="btsId" value="<%=BtsId%>"/>
  
  <div class="form-group">
  <center>
  <div class="input-group">
 <input type="submit" class="btn btn-primary" value="Request"/>
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