<!DOCTYPE html>
<html >
 <%@page import="java.util.List"%>
<%@page import="model.InStockModel"%>
<%@page import="model.RequestModel"%>
  <%@page import="service.Request"%>
  <%@page import="model.ItemModel"%>
   <%@page import="model.RegionModel"%>
  <%@page import="service.SitesClass"%>
<%@page import="service.User"%>
 <%@page import="model.BtsModel"%>
  <%@page import="model.SitesClassModel"%>
<%@page import="service.Bts"%>
 <%@page import="model.BscModel"%>
  <%@page import="model.UserModel"%>
<%@page import="service.Bsc"%>
<%@page import="service.SitesCategory"%>
 <%@page import="model.FieldEngineerModel"%>
  <%@page import="model.SitesCategoryModel"%>
<%@page import="service.FieldEngineer"%>
<%@page import="service.Region"%>
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
 User user = (User) session.getAttribute("user");
            if(user != null){
            	int userId = user.getId();
             %>  
<%
String id = request.getParameter("id");
BscModel btm = new BscModel(); 
Bsc b = btm.getBsc(id);

%>
    

        <!--/. NAV TOP  -->


        <div class="container">
        
        <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header ">
                          <i class="fa fa-edit text-success"></i>  <small>Update BSC Info  <small>(<%=b.getBscId() %>)</small></small>
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
 }else if(request.getAttribute("failed")!=null){
 %>
 
 <div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <%=request.getAttribute("failed") %>
</div>
 
 <%
 }
 %>

<form class="form-horizontal" action="AddBtsController" method="post">

  <div class="form-group">
         <label for="name" class=" control-label">BSC ID</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" value="<%=b.getBscId() %>" name="btsId" readonly="readonly" class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  <div class="form-group">
         <label for="name" class=" control-label">BSC Name</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" value="<%=b.getBscName() %>" name="btsName"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  <div class="form-group">
         <label for="name" class=" control-label">Region</label>
              
                <div class="input-group">
               
 <select name="regionId" value="" class="form-control">
                 
                  <%
                  
                     RegionModel is = new RegionModel();
                     List<Region> list = is.getRegionList();
                     for (Region p : list) {
                 %>
                 
                <option <%if(b.getRegionId()==p.getRegionId()){ %> selected="selected" <%} %> value="<%=p.getRegionId()%>"><%=p.getRname() %> </option>
               <%
                     }
               %>
               
            </select>

  </div> 
                 
  </div>
  <div class="form-group">
         <label for="name" class=" control-label">Field Engineer</label>
              
                <div class="input-group">

<select name="engineerId"  class="form-control">
                 
                  <%
                  
                   //  FieldEngineerModel fe = new FieldEngineerModel();
        		 String role = "Field Engineer";
                     List<User> lists = use.getUserByRole(role);
                     for (User pu : lists) {
                 %>
                 
                <option <%if(b.getEngineerId()==pu.getId()){ %> selected="selected" <%} %> value="<%=pu.getId()%>"><%=pu.getFname()%> <%=pu.getLname()%>, <small> <%=is.getRegion(pu.getRegion()).getRname() %> (<%=btm.getBscByEngineer(pu.getId()).size() %> BTS)</small> </option>
               <%
                     }
               %>
               
            </select>
                

     </div> 
                 
  </div>

  
  <div class="form-group">
         <label for="name" class=" control-label">BSC </label>
              
                <div class="input-group">
                
                
                <select name="bscId" class="form-control">
                 
                  <%
                  
                     BscModel bs = new BscModel();
                     List<Bsc> listb = bs.getAllBsc();
                     for (Bsc pb : listb) {
                 %>
                 
                <option <%if(b.getBscId()==pb.getBscId()){ %> selected="selected" <%} %> value="<%=pb.getBscId()%>"><%=pb.getBscName()%> </option>
               <%
                     }
               %>
               
            </select>
                
                
                     </div> 
                 
  </div>
  <div class="form-group">
         <label for="name" class=" control-label">Longitude </label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" value="<%=b.getLongitude() %>" name="longitude"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  <div class="form-group">
         <label for="name" class=" control-label">Latitude </label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" value="<%=b.getLatitude() %>" name="latitude"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  
 <input type="hidden" name="userId" value="<%=userId%>"/>
 
  <div class="form-group">
  <center>
  <div class="input-group">
 <input type="submit" class="btn btn-primary" value="Update"/>
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