   
<%@page import="java.util.List"%>
<%@page import="service.User"%>

<%@page import="model.UserModel"%>
 <%@page import="model.PartnerModel"%>
<%@page import="service.Partner"%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>BTSMIS</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
	 <link href="mystyle.css" rel="stylesheet">
   <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
</head>
<%
Partner pa = new Partner();
PartnerModel pam = new PartnerModel();
int patid = 0;
String pat = request.getParameter("patid");

if(pat!=null){
	 patid = Integer.parseInt(pat);
	pa = pam.getPatner(patid);
}

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
                          <i class="fa fa-edit text-success"></i>  <small>Add Partner  <small></small></small>
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
  <%=request.getAttribute("success")%>
</div>
 <%
 	}else if(request.getAttribute("failed")!=null){
 %>
 
 <div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <%=request.getAttribute("failed")%>
</div>
 
 <%
  	}
  %>





<form class="form-horizontal" action="PartnerController" method="post">
 
  <div class="form-group">
         <label for="name" class=" control-label">Partner Name</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" value="<%=pa.getPartnerName() %>" name="name"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  
  <div class="form-group">
         <label for="name" class=" control-label">Email </label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" value="<%=pa.getEmail() %>" name="email"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  
  <div class="form-group">
         <label for="name" class=" control-label">Phone </label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" value="<%=pa.getPhone() %>" name="phone"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  
  
   <input type="hidden" name="userId" value="<%=userId%>" />
                
    <input type="hidden" name="id" value="<%=pa.getPartnerId()%>"/>
  
  <div class="form-group">
  <center>
  <div class="input-group">
 <input type="submit" class="btn btn-primary" <%if(request.getParameter("patid")!=null) {%> value="Edit" <%}%> value="Add"/>
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

                           
                            <th> Name</th>
                            <th>Email </th>
                            <th>Phone </th>
                            <th>Edit</th>
                           

                        </tr>
                        </thead>
                        <tbody>
<%
	PartnerModel im = new PartnerModel();
                            List<Partner> lis = im.getPatnerList();
                            for (Partner it : lis) {
%>                        
                        <tr <% if(patid==it.getPartnerId()){ %> class="alert-danger danger" <%} %>>
                            <td><%=it.getPartnerName()%></td>
                            
                            <td><%=it.getEmail()%></td>
                          <td><%=it.getPhone() %></td>
                          <td><a href="AddPatner.jsp?patid=<%=it.getPartnerId() %>" class="btn btn-success"><i class="fa fa-edit"></i> Edit</a></td>
                           <td>
                      
                    
                      </td>
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
                Are You Sure You want to delete this partner?
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