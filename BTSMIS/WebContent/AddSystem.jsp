   
<%@page import="java.util.List"%>
<%@page import="service.User"%>
<%@page import="model.RegionModel"%>
<%@page import="model.BscModel"%>
 <%@page import="model.SystemModel"%>
<%@page import="service.System"%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>BTSMIS</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
	 <link href="mystyle.css" rel="stylesheet">
   <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
</head>
<%

int cid = 0;
String scl = (request.getParameter("cid"));
System sc = new System();

SystemModel scm = new SystemModel();
if(scl!=null){
	 cid = Integer.parseInt(scl);
	sc = scm.getSystem(cid);
}

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
                          <i class="fa fa-edit text-success"></i>  <small>Add System  <small></small></small>
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





<form class="form-horizontal" action="SystemController" method="post">
 
  <div class="form-group">
         <label for="name" class=" control-label">System Name</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" value="<%=sc.getName() %>" name="name"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  <div class="form-group">
         <label for="name" class=" control-label">System Description <small>(Optional)</small></label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input name="description" value="<%=sc.getDescription() %>"  class="form-control" id="name" placeholder="" />
                 </div> 
                 
  </div>
  
   <input type="hidden" name="userId" value="<%=userId %>" />
                
   <input type="hidden" name="id" value="<%=sc.getId()%>"/>
  
  <div class="form-group">
  <center>
  <div class="input-group">
 <input type="submit" <%if(request.getParameter("cid")!=null) {%> value="Edit" <%}%> class="btn btn-primary" value="Add"/>
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

                           
                            <th>Class Name</th>
                            <th>Description</th>
                            
                            <th>Date </th>
                            <th>Edit</th>
                            <th>Delete</th>
                           

                        </tr>
                        </thead>
                        <tbody>
<% 
SystemModel im = new SystemModel();
                            List<System> lis = im.getSystemList();
                            for (System it : lis) {
                        %>                        
                        <tr <% if(cid==it.getId()){ %> class="alert-danger danger" <%} %>>
                            <td><%=it.getName()%></td>
                            
                            <td><%=it.getDescription()%></td> 
                            
                            <td><%=it.getDate()%></td>
                          
                          <td><a href="AddSystem.jsp?cid=<%=it.getId() %>" class="btn btn-default"><i class="fa fa-edit"></i> Edit</a></td>
                           <td><a class="btn btn-danger" href=""  data-href="SystemController?delid=<%=it.getId() %>" data-toggle="modal" data-target="#confirm-delete"><i class="fa fa-trash"></i> Delete</a></td>
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