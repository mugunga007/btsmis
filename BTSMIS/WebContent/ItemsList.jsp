<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@page import="model.InStockModel"%>
<%@page import="java.util.List"%>
<%@page import="model.RequestModel"%>
<%@page import="model.InStockModel"%>
<%@page import="model.ItemUnitModel"%>
<%@page import="service.Item"%>
<%@page import="service.ItemUnit"%>
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
                        <a class="active-menu" href="ItemsList.jsp"><i class="fa fa-list-ul"></i> Items List (<%=im.getAllItems().size() %>)</a>
                    </li>
					<li>
                        <a href="AddItem.jsp"><i class="fa fa-plus"></i> Add a new Item</a>
                    </li>
                    <li>
                        <a href="InStock.jsp"><i class="fa fa-plus"></i> Add Purchased Items</a>
                    </li>
                    
                    <li>

<a href="InStockList.jsp"><i class="fa fa-shopping-cart"></i> Available Items (<%=im.getAvailableItems().size() %>)</a>
                    </li>


                                   </ul>

            </div>

        </nav>

        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
            

                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                          <i class="fa fa-dashboard text-success"></i>   <small>Summary of your stock</small>
                        </h1>
                    </div>
                </div>
                <!-- /. ROW  -->

                <div class="row">
                
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-red">
                            <div class="panel-body">
                                <i class="fa fa-shopping-cart fa-5x"></i>
                                <h3><%=im.getUnavailableItems().size() %></h3>
                            </div>
                            <a href="Unavailable.jsp" style="text-decoration: none" >
                            <div class="panel-footer back-footer-red">
                           Unavailable Items

                            </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-brown">
                            <div class="panel-body">
                                <i class="fa fa-bell fa-5x"></i>
                                <h3><%=rm.getPendingRequestsNumber()%> </h3>
                            </div>
                            <a href="RequestsList.jsp" style="text-decoration: none" >
                            <div class="panel-footer back-footer-brown">
                                Pending Requests

                            </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-green">
                            <div class="panel-body">
                                <i class="fa fa fa-check-circle fa-5x"></i>
                                
                                <h3><%=rm.getDeliveryConfirmedList().size() %> </h3>
                            </div>
                            <a href="DeliveryList.jsp" style="text-decoration: none" >
                            <div class="panel-footer back-footer-green">
                                Delivered Items

                            </div>
                            
                            </a>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-blue">
                            <div class="panel-body">
                                <i class="fa fa-calculator fa-5x"></i>
                                <h3><%=rm.getRequestList().size() %> </h3>
                            </div>
                            <a href="AllRequest.jsp" style="text-decoration: none" >
                            <div class="panel-footer back-footer-blue">
                                All Requests

                            </div>
                            </a>
                        </div>
                    </div>
                    
                    
                   
                    
                </div>

            
  <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                           <i class="fa fa-list-ol text-success"></i>  <small>Items List</small>
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
                            <th>ID</th>
                            <th>NAME</th>
                            <th>UNITS</th>
                            <th>QUANTITY</th>

                        </tr>
                        </thead>
                        <tbody>
                        <%  
                        ItemUnitModel iu = new ItemUnitModel();
                        List<Item> list = im.getAllItems();
                            for (Item it : list) {
                        %>
                        
                        <tr>
                            <td><%=it.getItemId()%></td>
                            <td><%=it.getItemName()%></td>
                            <%
                            int unit = Integer.parseInt(it.getUnits());
                            %>
                            <td><%=iu.getItemUnit(unit).getName()%></td> 
                            <td><%=it.getQuantity()%></td>

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
               <footer><p>All right reserved. Template by: <a href="http://webthemez.com">WebThemez</a></p></footer>
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
