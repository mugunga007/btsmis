   
<%@page import="java.util.List"%>
<%@page import="service.Region"%>
<%@page import="model.RegionModel"%>
<%@page import="model.BscModel"%>
<%@page import="model.UserModel"%>
 <%@page import="model.FieldEngineerModel"%>
<%@page import="service.FieldEngineer"%>
<%@page import="service.Bsc"%>
<%@page import="service.User"%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>BTSMIS</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
	 <link href="mystyle.css" rel="stylesheet">
   <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
</head>
<%


RegionModel is = new RegionModel();
UserModel use = new UserModel();
 User user = (User) session.getAttribute("user");
            if(user != null){
            	int userId = user.getId();
             %> 
<body>
<jsp:include page="UserHeader.jsp"></jsp:include>
<div class="container">

    <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header ">
                          <i class="fa fa-edit text-success"></i>  <small>Add BSC  <small>(B.S.C)</small></small>
                        </h1>
                    </div>
                </div>

<div class="clear"></div>
<div class="row">

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

<form class="form-horizontal" action="AddBCSController" method="post">
 
  <div class="form-group">
         <label for="name" class=" control-label">BSC ID</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="bscId"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  <div class="form-group">
         <label for="name" class=" control-label">BSC Name</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="bscName"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  
  <div class="form-group">
         <label for="name" class=" control-label">Field Engineer</label>
              
                <div class="input-group">

<select name="engineerId"  class="form-control">
                 
                  <%
                  
                   String role = "Field Engineer";
                     List<User> lists = use.getUserByRole(role);
                     for (User p : lists) {
                 %>
                 
                <option value="<%=p.getId()%>"> <%=p.getFname()%> <%=p.getLname()%> (<%=is.getRegion(p.getRegion()).getRname() %>) </option>
               <%
                     }
               %>
               
            </select>                

   </div> 
                 
  </div>
 
  <div class="form-group">
         <label for="name" class=" control-label">Latitude </label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="latitude"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  <div class="form-group">
         <label for="name" class=" control-label">Longitude </label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="longitude"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
    <div class="input-group">
                 <label for="name" class=" control-label">Region</label>
                 <select name="regionId" value="" class="form-control">
                 
                  <%
                  
                    
                     List<Region> list = is.getRegionList(); 
                     for (Region p : list) {
                 %>
                 
                 
                 
                <option value="<%=p.getRegionId()%>" ><%=p.getRname()%> </option>
               <%
                  }
               %>
               
            </select>
                  </div>
  <div class="form-group">
  <center>
  <div class="input-group">
 <input type="submit" class="form-control btn btn-primary"  value="Add"/>
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
                            <th>Region </th>
                            <th>Engineer</th>
                            <th>Latitude</th>
                            <th>Longitude</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
<% 
BscModel im = new BscModel(); 
                            List<Bsc> lis = im.getAllBsc();
                            for (Bsc it : lis) {
                        %>                    
                            
                        <tr  >
                            <td><%=it.getBscId()%></td>
                            
                            <td><%=it.getBscName()%></td>
                            
                            <td><%=is.getRegion(it.getRegionId()).getRname()%></td>
                            <td><%=use.getUser(it.getEngineerId()).getFname()%> <%=use.getUser(it.getEngineerId()).getLname()%></td>
                            <td><%=it.getLatitude()%></td>
                          <td><%=it.getLongitude()%></td>
                          <td><a href="UpdateBSC.jsp?id=<%=it.getBscId() %>" class="btn btn-default"><i class="fa fa-edit"></i> Edit</a></td>
                           <td><a class="btn btn-danger" href=""  data-href="AddBCSController?delid=<%=it.getBscId() %>" data-toggle="modal" data-target="#confirm-delete"><i class="fa fa-trash"></i> Delete</a></td>
                        </tr>
                        <%} %>
                       
                        </tbody>
                    </table>
</div>
</div>
</div>




<!--   TABLE END -->


</div>
</div>
</div>



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



</body>
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
</html>