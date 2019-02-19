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
UserModel use = new UserModel();
 User user = (User) session.getAttribute("user");
            if(user != null){
            	int userId = user.getId();
            	int regionId = user.getRegion();
             %>  
<%
InStockModel im = new InStockModel();

RequestModel rm = new RequestModel();
BtsModel btm = new BtsModel();
RegionModel is = new RegionModel();

%>
    

        <!--/. NAV TOP  -->


        <div class="container">
        
        <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                         <i class="fa fa-edit text-success"></i>    <small>Field Engineers List</small>
                        </h1>
                    </div>
                </div>
                <!-- /. ROW  -->
        
        
        
            <div id="row">
<!-- CONTENTS START -->




<div class="">


 <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="text-info">List of Field Engineers in <%=is.getRegion(regionId).getRname() %></h4>
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
                            <th>Assign To BTS</th>

                        </tr>
                        </thead>
                        <tbody>
                        <%   
                        String role = "Field Engineer";
                            List<User> listr = use.getFieldEngineerByRegion(regionId);
                            for (User it : listr) { 
                        %>

                        
                        <tr>

                            <td><%=it.getFname()%> <%=it.getLname()%></td>
                              <td><%=it.getEmail()%></td>
                            <td><%=it.getTel()%></td>
                           
                            <td><%=is.getRegion(it.getRegion()).getRname()%></td> 
                            <td><a href="AssignBTS.jsp?eng=<%=it.getId()%>&rg=<%=it.getRegion() %>" class="btn btn-default"><i class="fa fa-edit"></i> (<%=btm.getBtsByEngineer(it.getId()).size() %>) BTS</a></td>
                            

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