<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <%@page import="java.util.List"%>
<%@page import="model.InStockModel"%>
<%@page import="model.RequestModel"%>
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
                        <a class="active-menu" href="#"><i class="fa fa-dashboard"></i> Dashboard</a>
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
                        <a href="InStockList.jsp"><i class="fa fa-shopping-cart"></i> Available Items (<%=im.getAvailableItems().size() %>)</a>
                    </li>
                    
                   


                                   </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">



                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                         <i class="fa fa-dashboard text-success"></i>    <small>Summary of your stock</small>
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


                   
                  

                </div>
                <!-- /. ROW  -->

                <div class="row">
                    <div class="col-md-4 col-sm-12 col-xs-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Requests Panel
                            </div>
                            <div class="panel-body">
                                <div class="list-group">

                                    <a href="#" class="list-group-item">
                                        <span class="badge">7 days</span>
                                        <i class="fa fa-fw fa-comment"></i> 30 L fuel
                                    </a>
                                  
                                </div>
                                <div class="text-right">
                                    <a href="#">More Tasks <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-8 col-sm-12 col-xs-12">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Items
                            </div> 
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>S No.</th>
                                                <th>Name</th>
                                                <th>Quantity</th>
                                                <th>Date</th>
                                                <th>User</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>switch</td>
                                                <td>40</td>
                                                <td>5/5/23</td>
                                                <td>name@gmail.com</td>
                                            </tr>
                                          

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- /. ROW  -->
				<footer><p>All right reserved by: <a href="www.tresrw.com">TRES</a></p></footer>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->


</body>

</html>