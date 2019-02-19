<!DOCTYPE html>
<html >
 <%@page import="java.util.List"%>
<%@page import="model.InStockModel"%>
<%@page import="model.RequestModel"%>
  <%@page import="service.Request"%>
  <%@page import="model.ItemModel"%>
    <%@page import="model.RegionModel"%>
     <%@page import="model.BtsModel"%>
      <%@page import="model.UserModel"%>
   <%@page import="model.FieldEngineerModel"%>
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

int mid = 0;
String eng = (request.getParameter("mid"));
User sc = new User();

UserModel scm = new UserModel();
if(eng!=null){
	 mid = Integer.parseInt(eng);
	sc = scm.getUser(mid);
}


 User user = (User) session.getAttribute("user");
            if(user != null){
            	int userId = user.getId();
             %>  
<%
InStockModel im = new InStockModel();

RequestModel rm = new RequestModel();
BtsModel btm = new BtsModel();
UserModel fm = new UserModel();

%>
    

        <!--/. NAV TOP  -->


        <div class="container">
        
        <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                         <i class="fa fa-edit text-success"></i>    <small>Add a Region Manager</small>
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

<form class="form-horizontal" action="RegionManagerController" method="post">

  <div class="form-group">
         <label for="name" class=" control-label">First Name</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" value="<%=sc.getFname() %>" name="fname"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  <div class="form-group">
         <label for="name" class=" control-label">Last Name</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" value="<%=sc.getLname() %>" name="lname"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  <div class="form-group">
         <label for="name" class=" control-label">Tel</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" value="<%=sc.getTel() %>" name="tel"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  <div class="form-group">
         <label for="name" class=" control-label">Email</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="email" value="<%=sc.getEmail() %>"  class="form-control" id="name" placeholder="" required="required"/>
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
                 
                <option value="<%=p.getRegionId()%>" <%if(sc.getRegion() == p.getRegionId()) {%> selected="selected" <%} %>><%=p.getRname() %> </option>
               <%
                     }
               %>
               
            </select>

  </div> 
                 
  </div>
  
  <input type="hidden" name="userId" value="<%=userId %>"/> 
     <input type="hidden" name="id" value="<%=sc.getId()%>"/>
  <div class="form-group">
  <center>
  <div class="input-group">
 
      <input type="submit" class="btn btn-primary" <%if(request.getParameter("mid")!=null) {%> value="Edit" <%}%> value="Add"/> 
  </div>
  </center>
  </div>
  
  
  
  </form>



</div>


<div class="col-md-9">


 <div class="panel panel-default">
                        <div class="panel-heading">
                            
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                        <tr>

                           
                            <th>Names</th>
                            <th>Email</th>
                            <th>Tel</th>
                            <th>Region</th>
                            <th>Edit</th>

                        </tr>
                        </thead>
                        <tbody>
                        <%   
                        String role = "Region Manager";
                            List<User> listr = fm.getUserByRole(role);
                            for (User it : listr) { 
                        %>

                        
                        <tr <% if(mid==it.getId()){ %> class="alert-danger danger" <%} %>>

                            <td><%=it.getFname()%> <%=it.getLname()%></td>
                              <td><%=it.getEmail()%></td>
                            <td><%=it.getTel()%></td>
                           
                            <td><%=is.getRegion(it.getRegion()).getRname()%></td>
                                   <td><a href="AddRegionManager.jsp?mid=<%=it.getId() %>"  class="btn btn-success"><i class="fa fa-edit"></i> Edit</a></td>
                            

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