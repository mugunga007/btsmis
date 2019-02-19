<!DOCTYPE html>
<html >
 <%@page import="java.util.List"%>
<%@page import="model.InStockModel"%>
<%@page import="model.RequestModel"%>
  <%@page import="service.Request"%>
  <%@page import="model.ItemModel"%>
<%@page import="service.User"%>
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
<%
InStockModel im = new InStockModel();

RequestModel rm = new RequestModel();

%>
    

        <!--/. NAV TOP  -->


        <div class="container">
        
        <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                          <i class="fa fa-shopping-cart text-success"></i>   <small>New Delivery Received</small>
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
<th>Item Name</th>
<th>Requested Quantity</th>
<th>Requested Date</th>
<th>Delivered Date</th>
<th>Delivered Quantity</th>
<th>Confirm Delivery</th>

                        </tr>
                        </thead>
                        <tbody>
                      <%
ItemModel itm = new ItemModel();
Request r = new Request();
List<Request> list = rm.getRequestDeliveredByUser(userId);
for(Request it: list){
%>

                        
                        <tr>
<td><%=itm.getItem(it.getItemId()).getItemName()%></td>
<td><%=it.getQuantity() %></td>
<td><%=it.getRequestDate() %></td>
<td><%=it.getActionDate() %></td>
<td><%=it.getDeliveredQuantity() %></td>
<td><a href="ConfirmServlet?requestId=<%=it.getRequestId() %>&itemId=<%=it.getItemId() %>&userId=<%=user.getId() %>&dequan=<%=it.getDeliveredQuantity() %>" class="btn btn-info"><span class="glyphicon glyphicon-ok"> </span> Confirm Delivery</a></td>



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


        </div>
    </div>
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