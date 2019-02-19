<!DOCTYPE html>
<html >
 <%@page import="java.util.List"%>
<%@page import="service.User"%>
<%@page import="service.GenSet"%>
<%@page import="service.Bts"%>
<%@page import="service.GenFuelTracking"%>
<%@page import="service.RemainingFuel"%>
<%@page import="model.BtsModel"%>
<%@page import="model.GenSetModel"%>
<%@page import="model.RemainingFuelModel"%>
<%@page import="model.GenFuelTrackingModel"%>
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

 User user = (User) session.getAttribute("user");
            if(user != null){
            	int userId = user.getId();
             %>  

    

        <!--/. NAV TOP  -->

<%
Bts b = new Bts();
BtsModel bm = new BtsModel();
GenSet gn = new GenSet();
GenFuelTrackingModel gfm = new GenFuelTrackingModel();
RemainingFuelModel rm = new RemainingFuelModel();
GenSetModel gm = new GenSetModel();
String genSetId = request.getParameter("genSetId");
%>
        <div class="container">
        
        <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                       <i class="fa fa-dashboard text-success"></i>     <small> Fuel Report</small>
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

                        
                            
                            <th> Used Fuel</th>
                            
                            <th> Time </th>
                            
                            <th>Running Hours </th>
                            
                            <th>Liters/Hour</th>
                            
							<th>Date</th>
							
							
							
                        </tr>
                        </thead>
                        <tbody>
<% 

//ItemUsage iu = new ItemUsage();

                            List<GenFuelTracking> list = gfm.getGenFuelTrackingList(genSetId);
                            for (GenFuelTracking it : list) { 
                        %>                         
                        <tr class="">
  <td><%=it.getUsedQuantity()%></td>
  
  <%
  
  %>
  
  <td>
  <%=it.getTime() %> day(s)
  
    </td>
  
                          <td><%=it.getHours()%></td>
                          
                 
  
  <td><%=it.getPerHour() %></td>
                          
                            <td><%=it.getDate()%></td>

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