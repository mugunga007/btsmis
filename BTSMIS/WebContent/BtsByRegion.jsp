<!DOCTYPE html>
<html >
 <%@page import="java.util.List"%>
<%@page import="service.User"%>
<%@page import="model.FieldEngineerModel"%>
<%@page import="service.Bts"%>
<%@page import="model.BtsModel"%>

<%@page import="service.GenSet"%>
<%@page import="model.GenSetModel"%>
<%@page import="model.UserModel"%>
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
                            BtsModel bm = new BtsModel();
                            UserModel umo = new UserModel();
                            
                            %>

<%
GenSet gn = new GenSet();
GenSetModel gm = new GenSetModel();
 User user = (User) session.getAttribute("user");
            if(user != null){
            	int regionId = user.getRegion();
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
                            <th>ENGINEER IN CHARGE</th>
                            <th>LATITUDE</th>
                            <th>LONGITUDE</th>
                            <th>MAP VIEW</th>
                            <th>GEN QUANTITY</th>
                            <th>LAST UPDATE</th>
                            <th>GENSET FUEL TRACKING</th>

                        </tr>
                        </thead>
                        <tbody>
<% 
                            
                            List<Bts> list = bm.getBtsByRegion(regionId);
                            for (Bts it : list) {
                        %>                        
                        <tr>

  <td><%=it.getBtsId()%></td>
                            <td><%=it.getBtsName()%></td>
                            <td><%=umo.getUser(it.getEngineerId()).getFname() %> <%=umo.getUser(it.getEngineerId()).getLname() %></td>
                            <td><%=it.getLatitude() %></td>
                            <td><%=it.getLongitude()%></td>
                            <td><a class="btn btn-default" target="_blank" href="mapTest.jsp?lati=<%=it.getLatitude()%>&lon=<%=it.getLongitude() %>"><i class="fa fa-list-ul"></i> View</a></td>
                          
                            <td>
                                              <%
                            String bid = it.getBtsId();
                            if(gm.getGenSetByBts(bid) != null){
                            	%>

								

								<% 
                            	
                           int quantity = gm.getGenSetByBts(it.getBtsId()).getQuantity();
                            int capacity = gm.getGenSetByBts(it.getBtsId()).getCapacity();
                            int percentage = (quantity*100)/capacity;
                            
                            		
                            %>
                            
                            <%=quantity %> / <%=capacity %> Liters
    <div class="progress">
  <div class="progress-bar <%if(percentage>=50){ %> progress-bar-success <%} else{%>progress-bar-danger <%} %>progress-bar-striped" role="progressbar"
  aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:<%=percentage%>%">
  
    <%=percentage%>% Complete
    
  </div>
</div>

<%
                            }else{
%>


No Genset 

<%
}
%>
                            
                                            
                                                      </td>
                            
<td><%=gm.getGenSetByBts(it.getBtsId()).getLastUpdate()  %></td>

 <td><a class="btn btn-default" href="GensSetFuelRegion.jsp?genSetId=<%=gm.getGenSetByBts(it.getBtsId()).getGenSetId()%>&&bid=<%=it.getBtsId()%>"><i class="fa fa-list-ul"></i> View Report </a></td>

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