<!DOCTYPE html>
<html >
 <%@page import="java.util.List"%>
<%@page import="model.InStockModel"%>
<%@page import="model.RequestModel"%>
 <%@page import="model.BscModel"%>
<%@page import="service.Bsc"%>
  <%@page import="model.UserModel"%>
  <%@page import="service.Request"%>
  <%@page import="model.ItemModel"%>
    <%@page import="model.RegionModel"%>
     <%@page import="model.BtsModel"%>
   <%@page import="model.FieldEngineerModel"%>
   <%@page import="service.Bts"%>
<%@page import="service.User"%>
<%@page import="service.Region"%>
<%@page import="service.FieldEngineer"%>
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
UserModel use = new UserModel();
User us = new User();
 User user = (User) session.getAttribute("user");
            if(user != null){
            	int userId = user.getId();
             %>  
<%
InStockModel im = new InStockModel();

RequestModel rm = new RequestModel();
BtsModel btm = new BtsModel();
FieldEngineerModel fm = new FieldEngineerModel();

int engineerId = Integer.parseInt(request.getParameter("eng"));
int region = Integer.parseInt(request.getParameter("rg"));
//FieldEngineer eng = fm.getFieldEngineer(engineerId);
us = use.getUser(engineerId); 
RegionModel rgm = new RegionModel();
Region r = rgm.getRegion(region);

%>
        <!--/. NAV TOP  -->


        <div class="container">
        
        <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                        
                         <i class="fa fa-edit text-success"></i>    <small>Assign a B.T.S to <%=us.getFname()%> <%=us.getLname() %> <small>(<%=rgm.getRegion(region).getRname() %>)</small></small>
                        </h1>
                    </div>
                </div>
                <!-- /. ROW  -->
        
        
        
            <div id="row">
<!-- CONTENTS START -->

<div class="col-md-3">


<%
 if(request.getAttribute("success")!=null){
 %>
 
 <div class="alert alert-success">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <%=request.getAttribute("success") %>
</div>
 <%
 }else if(request.getAttribute("failed")!=null){
 %>
 
 <div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <%=request.getAttribute("failed") %>
</div>
 
 <%
 }
 %>


<form class="form-horizontal" action="AssignBtsController" method="post">

  
  <div class="form-group">
         <label for="name" class=" control-label">List of B.T.S from <%=r.getRname() %></label>
              
                <div class="input-group">
               
 <select name="bts" value="" class="form-control">
                 
                  <%
                  
                   
                     List<Bts> list = btm.getBtsByRegion(region);
                     for (Bts p : list) {
                 %>
                 
                <option value="<%=p.getBtsId()%>"><%=p.getBtsName()%> <small>(<%=p.getBtsId() %>)</small> </option>
               <%
                     }
               %>
               
            </select>

  </div> 
                 
  </div>
  <input type="hidden" name="rg" value="<%=region%>"/>
    <input type="hidden" name="engId" value="<%=us.getId() %>"/> 
  <input type="hidden" name="userId" value="<%=userId %>"/> 
  
  <div class="form-group">
  <center>
  <div class="input-group">
 
      <input type="submit" class="btn btn-primary" value="Assign"/> 
  </div>
  </center>
  </div>
  
  
  
  </form>



</div>


<div class="col-md-9">


 <div class="panel panel-default">
                        <div class="panel-heading">
                           <h4>  B.T.S Assigned to <%=us.getFname()%> <%=us.getLname() %> </h4>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                        <tr>

                           
                            <th>ID</th>
                            <th>Name</th>
                            <th>BSC</th>
                            <th>View Map</th>
                            <th>Remove</th>
                        </tr>
                        </thead>
                        <tbody>
<% 
//SitesClassModel cm = new SitesClassModel();
BscModel bsm = new BscModel();  
                            List<Bts> lis = btm.getBtsByEngineer(engineerId);  
                            for (Bts it : lis) {
                        %>                        
                        <tr>
                            <td><%=it.getBtsId()%></td>
                            <td><%=it.getBtsName()%></td>
                            <td><%=bsm.getBsc(it.getBscId()).getBscName()%></td>
                       <td><a class="btn btn-default"><i class="fa fa-list"></i> View Details</a></td>
                            
                           <td><a class="btn btn-danger"><i class="fa fa-trash"></i> Remove</a></td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
</div>
</div>
</div>



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