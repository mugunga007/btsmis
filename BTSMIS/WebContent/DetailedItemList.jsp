<!DOCTYPE html>
<html>
<head>
<%@page import="service.InStock"%>
<%@page import="java.util.List"%>
<%@page import="model.InStockModel"%>
<%@page import="model.ItemModel"%>
<%@page import="service.Item"%>
  <%@page import="service.ItemCategory"%>
<%@page import="service.System"%>
<%@page import="model.ItemCategoryModel"%>
<%@page import="model.SystemModel"%>
<%@page import="service.ItemUnit"%>
<%@page import="model.ItemUnitModel"%>
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

<a href="InStockList.jsp"><i class="fa fa-shopping-cart"></i> Available Items (<%=im.getAvailableItems().size() %>)</a>                    


                    </li>
                    

                                   </ul>

            </div>

        </nav>
 <%
ItemModel itm = new ItemModel();
int itemId = Integer.parseInt(request.getParameter("itemId"));
String itemName = itm.getItem(itemId).getItemName()+"";
%>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
  <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                          <i class="fa fa-bar-chart text-success"></i>  <small>Detailed List of <%=itemName %> (s)</small>
                        </h1>
                    </div>
                </div>
                <!-- /. ROW  -->


<!-- CONTENTS START -->


<%
ItemCategoryModel ic = new ItemCategoryModel();
SystemModel sy = new SystemModel();
ItemUnitModel iu = new ItemUnitModel();
%>
 <div class="panel panel-default">
                        <div class="panel-heading">
                                 <span class="btn bg-info">   <input type="button" class="btn btn-primary glyphicon glyphicon-download-alt" style="" onclick="tableToExcel('dataTables-example','First sheet')" value="Exporting Data to Excel"></input>
 
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                        <tr>
                        
<th>Category</th>
<th>System</th>
<th>Item Name</th>
<th>Type</th>
<th>Brand</th>
<th>Cost/Unit</th>
<th> Quantity</th>







<th>Supplier</th>
<th> Recorded Date</th>

<th>Edit Info</th>

                        </tr>
                        
                        </thead>
                        <tbody>
<%
InStock r = new InStock();
List<InStock> list = im.getDetailedItemList(itemId);
for(InStock it: list){
%>
                        
                        <tr>
<td><%=ic.getItemCategory(it.getCategory()).getName()%></td>
<td><%=sy.getSystem(it.getSystem()).getName() %></td>
<td><%=itemName%></td>
<td><%=it.getType() %></td>
<td><%=it.getBrand() %></td>
<td><%=it.getUcost() %></td>
<td><%=it.getQuantity()%></td>







<td><%=it.getSupplier() %></td>
<td><%=it.getDate()%></td>



<!-- <td><button class="btn btn-default"   data-toggle="modal"     data-target="#myModal"><span class="glyphicon glyphicon-ok"> </span> Deliver</button></td>
-->

<td><a href="" class="btn btn-default"><span class="glyphicon glyphicon-edit "> </span> Edit </a></td>

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
     <script src="tableToExcel.js"></script>
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
