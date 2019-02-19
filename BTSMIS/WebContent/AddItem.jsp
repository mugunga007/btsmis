<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@page import="model.InStockModel"%>
<%@page import="java.util.List"%>
<%@page import="model.RequestModel"%>
<%@page import="model.InStockModel"%>
<%@page import="service.Item"%>
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
                        <a class="active-menu" href="AddItem.jsp"><i class="fa fa-plus"></i> Add a new Item</a>
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
                           <i class="fa fa-plus text-success"></i>  <small>Add a new Item</small>
                        </h1>
                    </div>
                </div>
                <!-- /. ROW  -->


<!-- CONTENTS START -->
<div class="row">

<div class="col-md-4">

<%
 if(request.getAttribute("success")!=null){
 %>
 
 <div class="alert alert-success">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <%=request.getAttribute("success") %>
</div>
 <%
 }else if(request.getAttribute("failed")!=null){
 %>
 
 <div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <%=request.getAttribute("failed") %>
</div>
 
 <%
 }
 %>

<form class="form-horizontal" action="AddItemController" method="post">

  <div class="form-group">
         <label for="name" class=" control-label">Item Name</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="name"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  
  <div class="form-group">
         <label for="name" class=" control-label">Item Unit</label>
              
                <div class="input-group">
               
 <select name="units" class="form-control">
                 
                  <%
                  
                     ItemUnitModel sy = new ItemUnitModel();
                     List<ItemUnit> listsy = sy.getItemUnitList();
                     for (ItemUnit p : listsy) {
                 %>
                 
                <option value="<%=p.getId()%>"><%=p.getName() %> </option>
               <%
                     }
               %>
               
            </select>

  </div> 
                 
  </div>


  
  <div class="form-group">
 <center>
  <div class="input-group">
 <input type="submit" class="btn btn-primary" value="Add"/>
  </div>
</center>
  </div>
  
  
  
  </form>

</div>

<div class="col-md-4">
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
