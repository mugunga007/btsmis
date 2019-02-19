<!DOCTYPE html>
<html >
 <%@page import="java.util.List"%>
<%@page import="model.InStockModel"%>
<%@page import="model.RequestModel"%>
  <%@page import="service.Request"%>
  <%@page import="model.ItemModel"%>
<%@page import="service.User"%>
  <%@page import="model.InStockModel"%>
<%@page import="service.InStock"%>
<%@page import="model.UserModel"%>
<%@page import="model.ItemUnitModel"%>
<%@page import="service.ItemUnit"%>
<%@page import="model.RegionModel"%>
<%@page import="model.SystemModel"%>
<%@page import="model.ItemCategoryModel"%>
<%@page import="service.ItemCategory"%>
<%@page import="service.Region"%>
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
User use = new User();
User usereg = new User();
UserModel usemo = new UserModel();
 User user = (User) session.getAttribute("user");
            if(user != null){
            	int userId = user.getId();
            	int level = user.getLevel();
            	int region = user.getRegion();
             %>  
<%
InStockModel im = new InStockModel();
RegionModel rgm = new RegionModel();
RequestModel rm = new RequestModel();

%>
    

        <!--/. NAV TOP  -->


        <div class="container">
        
        <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                         <i class="fa fa-list-ol text-success"></i>    <small>Stock Items Details</small>
                        </h1>
                    </div>
                </div>
                <!-- /. ROW  -->
        
        
        
            <div id="row">
<!-- CONTENTS START -->

 <%
ItemModel itm = new ItemModel();

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


                        </tr>
                        
                        </thead>
                        <tbody>
<%
InStock r = new InStock();
List<InStock> list = im.getInStockItemList();
for(InStock it: list){
%>
                        
                        <tr>
<td><%=ic.getItemCategory(it.getCategory()).getName()%></td>
<td><%=sy.getSystem(it.getSystem()).getName() %></td>
<td><%=itm.getItem(it.getItemId() ).getItemName() %></td>
<td><%=it.getType() %></td>
<td><%=it.getBrand() %></td>
<td><%=it.getUcost() %></td>
<td><%=it.getQuantity()%></td>







<td><%=it.getSupplier() %></td>
<td><%=it.getDate()%></td>



<!-- <td><button class="btn btn-default"   data-toggle="modal"     data-target="#myModal"><span class="glyphicon glyphicon-ok"> </span> Deliver</button></td>
-->


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