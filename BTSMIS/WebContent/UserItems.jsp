<!DOCTYPE html>
<html >
 <%@page import="java.util.List"%>
 <%@page import="model.RequestModel"%>
<%@page import="service.User"%>
<%@page import="model.ItemControllerModel"%>
<%@page import="service.ItemController"%>
<%@page import="model.ItemModel"%>
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
                            RequestModel rm = new RequestModel();
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
                       <i class="fa fa-dashboard text-success"></i>     <small>Your Stock</small> 
                       
                        </h1>
                        
                                       
                    </div>
                </div>
                <!-- /. ROW  -->
        
        
        
            <div id="row">
<!-- CONTENTS START -->


 <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2><small>List of Your Items</small></h2>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                        <tr>

                           
                            <th>Item Name</th>
                            <th>Quantity</th>
                            
                            <th>Report Usage</th>
                            
                            <th>Reported Usage</th>
                            
                            <th>Request</th>

                        </tr>
                        </thead>
                        <tbody>
<% 
ItemModel im = new ItemModel();
ItemControllerModel ic = new ItemControllerModel();
                            List<ItemController> list = ic.getUserItemController(userId);
                            for (ItemController it : list) {
                        %>                        
                        <tr <% if(it.getQuantity()<=1){%> class="danger" <% }%>>

  <td><%=im.getItem(it.getItemId()).getItemName()%></td>
                            <td><%=it.getQuantity()%></td>
                          
                            <td class=""><a class="btn btn-default" href="ReportUsage.jsp?itemId=<%=it.getItemId()%>&itemC=<%=it.getItemControllerId()%>"><i class="fa fa-cogs"></i> Report Usage </a></td>
                            
                             <td><a class="btn btn-default" href="UsageView.jsp?itemId=<%=it.getItemId()%>"><i class="fa fa-list-ol"></i> Show Reported Usage </a></td>
                            
							<td><a class="btn btn-default" href="RequestForm.jsp"><i class="fa fa-edit"></i> Request </a></td>
                            
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