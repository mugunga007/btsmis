<!DOCTYPE html>
<html >
 <%@page import="java.util.List"%>
<%@page import="service.User"%>
<%@page import="model.FieldEngineerModel"%>
<%@page import="service.Bts"%>
<%@page import="model.BtsModel"%>
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
                                FieldEngineerModel im = new FieldEngineerModel();

                            %>

<%

 User user = (User) session.getAttribute("user");
            if(user != null){
            	int userId = user.getId();
             %>  

    

        <!--/. NAV TOP  -->


        <div class="container">
        
        <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                       <i class="fa fa-list-ol text-success"></i>     <small>All BTS</small>
                        </h1>
                    </div>
                </div>
                <!-- /. ROW  -->
        
        
        
            <div id="row">
<!-- CONTENTS START -->


 <div class="panel panel-default">
                        <div class="panel-heading">
                            
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                        <tr>

                           
                             <th>ID</th>
                            <th>NAME</th>
                            <th>LATITUDE</th>
                            <th>LONGITUDE</th>
                            <th>MAP VIEW</th>
                            <th>ADD FUEL</th>
                            <th>GENSET</th>

                        </tr>
                        </thead>
                        <tbody>
<% 
                            
                            List<Bts> list = im.getAllBts(); 
                            for (Bts it : list) {
                        %>                        
                        <tr>

  <td><%=it.getBtsId()%></td>
                             <td><%=it.getBtsName()%></td>
                            <td><%=it.getLatitude() %></td>
                            <td><%=it.getLongitude()%></td>
                            <td><a class="btn btn-default" target="_blank" href="mapTest.jsp?lati=<%=it.getLatitude()%>&lon=<%=it.getLongitude() %>">View</a></td>
                            <td><a class="btn btn-default" href="AddFuel.jsp?btsId=<%=it.getBtsId()%>">Add</a></td>
                          
                            <td><a class="btn btn-default" target="_blank" href=""></a></td>
                            

                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
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