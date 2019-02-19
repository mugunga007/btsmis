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
    <title>Free Bootstrap Admin Template : Dream</title>
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
                        <a class="active-menu" href="index.html"><i class="fa fa-dashboard"></i> Dashboard</a>
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

        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
  <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            <small>Title...</small>
                        </h1>
                    </div>
                </div>
                <!-- /. ROW  -->


<!-- CONTENTS START -->
<%
ItemModel itm = new ItemModel();
Item i = new Item();
Request r = new Request();
int requestId = Integer.parseInt(request.getParameter("requestId"));
//int itemId = Integer.parseInt(request.getParameter("itemId"));
r = rm.getRequest(requestId);
i = itm.getItem(r.getItemId());
%>

<div class="alert alert-info"><center><h3><%=i.getItemName() %> Requested: <%=r.getQuantity() %> <%=i.getUnits() %></h3></center></div>
<%

	if(request.getParameter("rep")!=null){  
	int rep = Integer.parseInt(request.getParameter("rep").toString());
	if(rep == 1){

%>

<div class="alert alert-danger"> You don't have <strong><%=request.getParameter("q") %> </strong> <%=i.getUnits() %> of <strong><%=i.getItemName() %>(s) </strong>in your stock   </div>

<%
	}else if(rep == 2){
%>


<div class="alert alert-danger"> <strong>Delivery</strong> Exceeds <strong>Requested</strong> Quantity! </div>


<%
	}
%>

<%
	}
%>
<form class="form-horizontal" action="DeliverController" method="post">


 
  <div class="form-group">
         <label for="name" class=" control-label">Quantity Approved</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="number" name="deliveredQuantity"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
 </div>
  
  
  <input type="hidden" name="userId" value="1"/>
  
   <input type="hidden" name="requestId" value="<%=requestId%>"/>
  <div class="form-group">
  <center>
  <div class="input-group">
 <input type="submit" class="btn btn-primary" value="Register"/>
  </div>
  </center>
  </div>
  
  
  
  </form>



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
