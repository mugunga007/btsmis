<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@page import="model.InStockModel"%>
<%@page import="java.util.List"%>
<%@page import="model.RequestModel"%>
<%@page import="model.InStockModel"%>
<%@page import="model.ItemModel"%>
<%@page import="service.Item"%>
<%@page import="service.Request"%>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>BTSMIS</title>
	<!-- Bootstrap Styles-->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
     <!-- FontAwesome Styles-->
    <link href="bower_components/font-awesome/css/font-awesome.css" rel="stylesheet" />
     <!-- Morris Chart Styles-->
   
        <!-- Custom Styles-->
    <link href="custom/custom-styles.css" rel="stylesheet" />
     <!-- Google Fonts-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
     <!-- TABLE STYLES-->
    <link href="custom/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
</head>
<body>

<jsp:include page="StockHeader.jsp"></jsp:include>
<%
InStockModel im = new InStockModel();

RequestModel rm = new RequestModel();

%>
    <div id="wrapper">
                <!--/. NAV TOP  -->

        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a  href="StockHome.jsp"><i class="fa fa-dashboard"></i> Dashboard</a>
                    </li>
                    <li>
                        <a href="ItemsList.jsp"><i class="fa fa-list-ul"></i> Items List (<%=im.getAllItems().size() %>)</a>
                    </li>
					<li>
                        <a href="AddItem.jsp"><i class="fa fa-plus"></i> Add a new Item</a>
                    </li>
                    <li>
                        <a href="InStock.jsp"><i class="fa fa-plus"></i> Add Purchased Items</a>
                    </li>
                    
                   
 <li>
                        <a href="InStockList.jsp"><i class="fa fa-shopping-cart"></i> Available Items (<%=im.getAllPurchased().size() %>)</a>
                    </li>
                    

                                   </ul>

            </div>

        </nav>
 <%
ItemModel itm = new ItemModel();
int itemId = Integer.parseInt(request.getParameter("itemId").toString());
String itemName = itm.getItem(itemId).getItemName()+"";
%>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
  <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            <small>Requested <%=itemName %> (s)</small>
                        </h1>
                    </div>
                </div>
                <!-- /. ROW  -->


<!-- CONTENTS START -->


 <div class="panel panel-default">
                        <div class="panel-heading">
                            
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                        <tr>
<th>User Id</th>
<th>Requested Quantity</th>
<th>Requested Date</th>
<th>Proposed Delivery Date</th>
<th>Note</th>
<th>Remaining Days</th>
<th>Deliver</th>
<th>Deny</th>
                        </tr>
                        
                        </thead>
                        <tbody>
<%
Request r = new Request();
List<Request> list = rm.getDetailedRequestList(itemId);
for(Request it: list){
%>
                        
                        <tr>

<td><%=it.getUserId()%></td>
<td><%=it.getQuantity()%></td>
<td><%=it.getRequestDate() %></td>

<td><%=it.getProposedDeliveryDate() %></td>
<td><%=it.getNote()%></td>
<td><%=rm.daysBetween(it.getRequestDate(), it.getProposedDeliveryDate()) %></td>
<!-- <td><button class="btn btn-default"   data-toggle="modal"     data-target="#myModal"><span class="glyphicon glyphicon-ok"> </span> Deliver</button></td>
-->
<td><a href="DeliverForm.jsp?requestId=<%=it.getRequestId()%>&userId=<%=it.getUserId()%>" class="btn btn-success"> <span class="glyphicon glyphicon-ok "> </span> Deliver </a></td>
<td><a href="DenyRequestForm.jsp?requestId=<%=it.getRequestId() %>&itemId=<%=itemId%>" class="btn btn-danger"><span class="glyphicon glyphicon-remove "> </span> Deny </a></td>

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
               <footer><p>All rights reserved by: <a href="http://tresrw.com">TRES</a></p></footer>
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
     <!-- /. WRAPPER  -->
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
