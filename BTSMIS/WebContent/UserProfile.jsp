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
<%@page import="model.UserModel"%>
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
UserModel um = new UserModel();
%>

<% 
int uid = Integer.parseInt(request.getParameter("id"));
 User user = (User) session.getAttribute("user");
            if(user != null){
            	int id = user.getId();
            	int region = user.getRegion();
                
             %>  
    

        <!--/. NAV TOP  -->


        <div class="container">
        
        <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                          <i class="fa fa-edit text-success"></i>  <small> User Info for <%=user.getUsername() %></small>
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




<form class="form-horizontal" action="UserController" method="post">

  
    <div class="form-group">
         <label for="name" class=" control-label">Firstname</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="firstname" value="<%=user.getFname() %>" class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
                   
    <div class="form-group">
         <label for="name" class=" control-label">Lastname</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="lastname" value="<%=user.getLname() %>" class="form-control" id="name" placeholder="" required="required"/>
                 </div>                  
  </div> 
  
   <div class="form-group">
         <label for="name" class=" control-label">Phone</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="number" name="tel" value="<%=user.getTel() %>" class="form-control" id="name" placeholder="" required="required"/>
                 </div>                  
  </div> 
  
  <div class="form-group">
         <label for="name" class=" control-label">Post</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="role" value="<%=user.getRole() %>" class="form-control" id="name" placeholder="" readonly="readonly"/>
                 </div>                  
  </div> 
  <div class="form-group">
         <label for="name" class=" control-label">Email</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="email" value="<%=user.getEmail() %>" class="form-control" id="name" placeholder="" readonly="readonly"/>
                 </div>                  
  </div> 
   <div class="form-group">
         <label for="name" class=" control-label">Username</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="username" value="<%=user.getUsername() %>" class="form-control" id="name" placeholder="" readonly="readonly"/>
                 </div>                  
  </div>
  <div class="form-group">
         <label for="name" class=" control-label">Status</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="status" value="<%=user.getStatus() %>" class="form-control" id="name" placeholder="" readonly="readonly"/>
                 </div>                  
  </div>
  
  
  
  
  
  <input type="hidden" name="date" value="<%=user.getDate()%>"/>
  <input type="hidden" name="description" value="<%=user.getDescription()%>"/>
  <input type="hidden" name="level" value="<%=user.getLevel()%>"/>
  <input type="hidden" name="password" value="<%=user.getPassword()%>"/>

  <input type="hidden" name="region" value="<%=user.getRegion()%>"/>

  <input type="hidden" name="id" value="<%=uid%>"/>
  <input type="hidden" name="userId" value="<%=user.getUserId()%>"/>

  
  <div class="form-group">
  <center>
  <div class="input-group">
 <input type="submit" class="btn btn-primary" value="Edit Info"/>
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