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

BtsModel btm = new BtsModel(); 
%>
    

        <!--/. NAV TOP  -->


        <div class="container">
        
        <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header ">
                          <i class="fa fa-edit text-success"></i>  <small>Add BTS  <small>(B.T.S)</small></small>
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

<form class="form-horizontal" action="AddBtsController" method="post">

  <div class="form-group">
         <label for="name" class=" control-label">BTS ID</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="btsId"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  <div class="form-group">
         <label for="name" class=" control-label">BTS Name</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="btsName"  class="form-control" id="name" placeholder="" required="required"/>
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
                 
                <option value="<%=p.getRegionId()%>"><%=p.getRname() %> </option>
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
                     for (User p : lists) {
                 %>
                 
                <option value="<%=p.getId()%>"><%=p.getFname()%> <%=p.getLname()%>, <small> <%=is.getRegion(p.getRegion()).getRname() %> (<%=btm.getBtsByEngineer(p.getId()).size() %> BTS)</small> </option>
               <%
                     }
               %>
               
            </select>
                

     </div> 
                 
  </div>

  <div class="form-group">
         <label for="name" class=" control-label">Site Class</label>
              
                <div class="input-group">
                
<select name="sitesclass"  class="form-control">
<%
SitesClassModel ic = new SitesClassModel();
        		 List<SitesClass> its = ic.getSitesClassList();
                 for (SitesClass p : its) {
%>                 
                 
                 
                <option value="<%=p.getId()%>"><%=p.getName() %> </option>
               <%
                 }
               %>
            </select>

    </div> 
                 
  </div>
  
  
  <div class="form-group">
         <label for="name" class=" control-label">Site Category</label>
              
                <div class="input-group">
                
<select name="sitecategory"  class="form-control">
<%
SitesCategoryModel ics = new SitesCategoryModel();
        		 List<SitesCategory> isd = ics.getSitesCategoryList();
                 for (SitesCategory p : isd) {
%>                 
                 
                 
                <option value="<%=p.getId()%>"><%=p.getName() %> </option>
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
                     for (Bsc p : listb) {
                 %>
                 
                <option value="<%=p.getBscId()%>"><%=p.getBscName()%> </option>
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
                          <input type="text" name="longitude"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  <div class="form-group">
         <label for="name" class=" control-label">Latitude </label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="latitude"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  
 <input type="hidden" name="userId" value="<%=userId%>"/>
 
  <div class="form-group">
  <center>
  <div class="input-group">
 <input type="submit" class="btn btn-primary" value="Add"/>
  </div>
  </center>
  </div>
  
  
  
  </form>



</div>


<div class="col-md-9">

<!--   TABLE -->

 
 <div class="panel panel-default">
                        <div class="panel-heading">
                            
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                        <tr>

                           
                            <th>ID</th>
                            <th>Name</th>
                            <th>BSC</th>
                            <th>Region </th>
                            <th>Engineer</th>
                            <th>Class</th>
                             <th>Category</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
<% 
BscModel bsm = new BscModel(); 

                            List<Bts> lis = btm.getAllBts();
                            for (Bts it : lis) {
                        %>                        
                        <tr>
                        	<td><%=it.getBtsId()%></td>
                        	<td><%=it.getBtsName()%></td>
                            <td><%=bsm.getBsc(it.getBscId()).getBscName()%></td>
                             <td><%=is.getRegion(it.getRegionId()).getRname()%></td>
                            <td><%=use.getUser(it.getEngineerId()).getFname()%> <%=use.getUser(it.getEngineerId()).getLname()%></td>
                           
                             <td><%=ic.getSitesClass(it.getSitesclass()).getName() %></td>
                           <td><%=ics.getSitesCategory(it.getSitescategory()).getName() %></td>
                          <td><a href="UpdateBTS.jsp?id=<%=it.getBtsId() %>" class="btn btn-default"><i class="fa fa-edit"></i> Edit</a></td>
                           <td><a class="btn btn-danger" href=""  data-href="AddBtsController?delid=<%=it.getBtsId() %>" data-toggle="modal" data-target="#confirm-delete"><i class="fa fa-trash"></i> Delete</a></td>
                        </tr>
                        <%} %>
                       
                        </tbody>
                    </table>
</div>
</div>
</div>




<!--   TABLE END -->


</div>
<!-- CONTENTS END -->


            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->
    
    <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class=" modal-header">
             <i class="fa fa-trash"></i>  Delete
            </div>
            <div class="modal-body">
                Are You Sure You want to delete this item?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"></i> Cancel</button>
                <a href="" class="btn btn-danger btn-ok"><i class="fa fa-check"> Delete </i></a>
            </div>
        </div>
    </div>
</div>
<script>

$('#confirm-delete').on('show.bs.modal', function(e) {
    $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
});
</script>

    
    
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