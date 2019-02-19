<!DOCTYPE html>
<html >
 <%@page import="java.util.List"%>
<%@page import="model.InStockModel"%>
<%@page import="model.RequestModel"%>
  <%@page import="service.Request"%>
  <%@page import="model.ItemModel"%>
   <%@page import="service.Item"%>
<%@page import="service.User"%>
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
            	int region = user.getRegion();
             %>  
<%
InStockModel im = new InStockModel();

RequestModel rm = new RequestModel();

%>
    

        <!--/. NAV TOP  -->


        <div class="container">
        
        <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                          <i class="fa fa-edit text-success"></i>  <small> Request an Item </small>
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

<form class="form-horizontal" action="RequestController" method="post">
<div class="form-group">
         <label for="name" class=" control-label">Choose Item Name</label>
              
                <div class="input-group">
                
                 <select name="itemId" value="" class="form-control">
                 
                  <%
                  
                     InStockModel is = new InStockModel();
                     List<Item> list = is.getAllItems();
                     for (Item p : list) {
                 %>
                 
                <option value="<%=p.getItemId()%>"><%=p.getItemName() %> </option>
               <%
                     }
               %>
               
            </select>
                  </div> 
                 
  </div>



 
  <div class="form-group">
         <label for="name" class=" control-label">Quantity</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="number" name="quantity"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  
    <div class="form-group">
         <label for="name" class=" control-label">Proposed delivery Date (mm/dd/yyyy)</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="date" name="proposedDeliveryDate" class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
   <div class="form-group">
         <label for="name" class=" control-label">Add note</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                 <input type="text" name="note"  class="form-control" id="name" value="Nothing to say!" placeholder="" />
                 </div> 
                 
  </div>
  
  <input type="hidden" name="userId" value="<%=userId%>"/>
   <input type="hidden" name="region" value="<%=region%>"/>
  
  <div class="form-group">
  <center>
  <div class="input-group">
 <input type="submit" class="btn btn-primary" value="Submit"/>
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