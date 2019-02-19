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
String btsId = request.getParameter("btsId");
session.setAttribute("BtsId", btsId);
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
  
<form class="form-horizontal" action="OpenTicketController" method="post">
     
 <input type="hidden" class="form-control" id="name" name="nocId" value="<%=userId%>"/>
 <div class="form-group">
         <label for="name" class=" control-label">Site Id</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                 <input type="text" class="form-control" id="name" name="btsId" value="<%=btsId%>"/>
                
                 </div> 
                 
  </div>
  
    <div class="form-group">
         <label for="name" class=" control-label">Notifier</label>
              
                <div class="input-group">
                     <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                <select  class="form-control" name="notifier">
                    <option value="Monitoring System">Monitoring System</option>
                              <option value="Securiry">Security</option>
                              <option value="Customer">Customer</option>
                              <option value="Other">Other</option>
                          </select> 
                 </div> 
                 
  </div>
                   
    <div class="form-group">
         <label for="name" class=" control-label">Alarm</label>
              
                <div class="input-group">
                 
                             <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                <select  class="form-control" name="alarm">
                    <option value="Site on batteries">Site on batteries</option>
                    <option value="Site down">Site down</option>
                    <option value="High temp">High temp</option>
                               
                          </select> 
                 </div>                  
  </div> <div class="form-group">
         <label for="name" class=" control-label">Ticket severity</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
             <select  class="form-control" name="severity">
                              <option value="Critical" >Critical</option>
                              <option value="Major">Major</option>
                              <option value="Minor">Minor</option>
                              <option value="DC issue">DC issue</option>
                              <option value="CP issue">CP issue</option>
                              <option value="other">Other</option>
             </select>
                  
                 </div>                  
  </div> <div class="form-group">
         <label for="name" class=" control-label">Note</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          
                          <textarea name="note" class="form-control"  id="name" rows="4" cols="20">
                          </textarea>
                 </div>                  
  </div>  
   
  
  
  <div class="form-group">
  <center>
  <div class="input-group">
 <input type="submit" class="btn btn-primary" value="Open"/>
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