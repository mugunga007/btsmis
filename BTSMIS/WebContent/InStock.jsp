<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@page import="model.InStockModel"%>
<%@page import="java.util.List"%>
<%@page import="model.RequestModel"%>
<%@page import="model.InStockModel"%>
<%@page import="model.ItemCategoryModel"%>
<%@page import="model.SystemModel"%>
<%@page import="service.Item"%>
<%@page import="service.User"%>
<%@page import="service.ItemCategory"%>
<%@page import="service.System"%>
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

<%
 User user = (User) session.getAttribute("user");
            if(user != null){
            	int userId = user.getId();
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
                        <a class="active-menu" href="InStock.jsp"><i class="fa fa-plus"></i> Add Purchased Items</a>
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
             <i class="fa fa-edit text-success"></i>  <small>Record Added Items in Your stock</small>
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

<form class="form-horizontal" action="InStockController" method="post">


<div class="form-group">
         <label for="name" class=" control-label">Choose Item Name</label>
              
                <div class="input-group">
                
                 <select name="itemid" value="" class="form-control">
                 
                  <%
                  
                     InStockModel is = new InStockModel();
                     List<Item> list = is.getAllItems();
                     for (Item p : list) {
                 %>
                 
                <option value="<%=p.getItemId()%>"><%=p.getItemName() %> </option>
               <%
                     }
               %>
               
            </select>
                  </div> 
                 
  </div>


  <div class="form-group">
         <label for="name" class=" control-label">Supplier</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="supplier"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  
  
  
  <div class="form-group">
         <label for="name" class=" control-label">Quantity</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="number" name="quantity"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  
   <div class="form-group">
         <label for="name" class=" control-label">Brand</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="brand"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  
   <div class="form-group">
         <label for="name" class=" control-label">Type</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="type"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  
  
<div class="form-group">
         <label for="name" class=" control-label">Category</label>
              
                <div class="input-group">
               
 <select name="itemcategory" class="form-control">
                 
                  <%
                  
                     ItemCategoryModel ic = new ItemCategoryModel();
                     List<ItemCategory> listc = ic.getItemCategoryList();
                     for (ItemCategory p : listc) {
                 %>
                 
                <option value="<%=p.getId()%>"><%=p.getName() %> </option>
               <%
                     }
               %>
               
            </select>

  </div> 
                 
  </div>

  
  <div class="form-group">
         <label for="name" class=" control-label">System</label>
              
                <div class="input-group">
               
 <select name="system" class="form-control">
                 
                  <%
                  
                     SystemModel sy = new SystemModel();
                     List<System> listsy = sy.getSystemList();
                     for (System p : listsy) {
                 %>
                 
                <option value="<%=p.getId()%>"><%=p.getName() %> </option>
               <%
                     }
               %>
               
            </select>

  </div> 
                 
  </div>

  
  
   <div class="form-group">
         <label for="name" class=" control-label">Price/Unit</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="number" name="ucost"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  
  
  <div class="form-group">
         <label for="name" class=" control-label">Note</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="note"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  
  <input type="hidden" name="userId" value="<%=userId%>"/>
  
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
               <footer><p>All right reserved by: <a href="http://tresrw.com">TRES</a></p></footer>
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
    
   <%
            }
            else
            {
%>

<jsp:forward page="Login.jsp" ></jsp:forward>
<%
            }
%>
</body>
</html>
