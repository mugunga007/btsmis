   <%@page import="service.Region"%>
<%@page import="model.RegionModel"%>
<%@page import="model.UserModel"%>
<%@page import="service.ItemReporting"%>
<%@page import="service.Item"%>
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
<jsp:include page="UserHeader.jsp"></jsp:include>
<%
InStockModel im = new InStockModel();

RequestModel rm = new RequestModel();
ItemReporting it=new ItemReporting();

%>
<%
	UserModel use = new UserModel();
 User user = (User) session.getAttribute("user");
            if(user != null){
            	int regionId = user.getRegion();
            	String role = user.getRole();
            	int level = user.getLevel();
            	int id = user.getId();
            
%>


    <div id="wrapper">

        <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a class="active-menu" href="#"><i class="fa fa-dashboard"></i> Stock</a>
                    </li>
                   
                   


                                   </ul>

            </div>
                    
                      
                
                    
                    <div class="container">
  <div class="dropdown">
   
    <button class="btn btn-default dropdown-toggle glyphicon glyphicon-list" type="button" id="menu1" data-toggle="dropdown">Select Item
    <span class="caret"></span></button>
    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
          <%
                  
                     InStockModel is = new InStockModel();
                     List<Item> list = is.getAllItems();
                     for (Item p : list) {
                 %>
                 <li role="presentation"><a role="menuitem" tabindex="-1" href="ItemReportByOM.jsp?itemId=<%=p.getItemId()%>"><%=p.getItemId()%> <%=p.getItemName()%> </a></li>
      <%
      }
      %>
      
    </ul>
      
  </div>
 </div>
 <br></br> 
  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal1">Get a report by region</button>
      <br></br> 
  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Select a range of period</button>     
   <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a class="active-menu" href="#"><i class="fa fa-dashboard"></i> Access </a>
                    </li>             
                    </ul>

            </div> 
  <a class="btn btn-info"  href="AllAccessRequest.jsp">All access request</a> 
        </nav>
      
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">



                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                         <i class="fa fa-dashboard text-success"></i>    <small>Summary of your stock in all regions</small>
                        </h1>
                    </div>
                </div>
                <!-- /. ROW  -->

            
                <!-- /. ROW  -->

               <div class="col-md-9">


 <div class="panel panel-default">
                        
                        <div class="panel-body">
                            <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Names</th>
                                                <th>Tel</th>
                                                <th>Email</th>
                                                <th>Region</th>
                                                <th>Print</th>
                                             
                                            </tr>
                                        </thead>
                                        <tbody>
                                         <%   
                                             int i=1;
                                             RegionModel regm = new RegionModel();
                                             Region rng=new Region();
                    // List<Region> list = regm.getRegionList();
                        String rol = "Field Engineer";
                            List<User> listr = use.getUserByRole(rol);
                            for (User ip : listr) { 
                        %>
                                            <tr>
                                                <td><%=ip.getId() %></td>
                                                <td><%=ip.getFname()%> <%=ip.getLname() %></td>
                                                <td><%=ip.getEmail() %></td>
                                                <td><%=ip.getTel() %></td>
                                               
                                                <td><%=regm.getRegion(ip.getRegion()).getRname()%></td> 
                                                <td> <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal2">Print</button>  </td> 
                                                            </tr>
                                          
<%
    i++;
}
%>
                                        </tbody>
                                    </table>
                                        <a href="ItemReportByOMAll.jsp" class="btn btn-link glyphicon glyphicon-link" >Click to view whole report</a>
                                                      </div>
                            </div>
                        </div>

                    </div>
                </div>
                                          
  <!-- Trigger the modal with a button -->
 

  <!-- Modal -->
  <form class="form-horizontal" action="ReportByRange.jsp" method="post">
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;Close</button>
        
 <div class="form-group">
         <label for="name" class=" control-label">Choose Item Name</label>
              
                <div class="input-group">
                
                 <select name="itemid" value="" class="form-control">
                 
                  <%
                   
                     for (Item p : list) {
                 %>
                 
                <option  name="itemId" value="<%=p.getItemId()%>"><%=p.getItemName() %> </option>
               <%
                     }
               %>
               
            </select>
                  </div> 
                 
 
                      
       
        <div class="modal-body">
          <p>Select initial date.</p>
       
          <input class="form-control" type="date" name="date1" value="" /> 
                </div>
        <div class="modal-body">
          <p>Select second date.</p>
       
          <input class="form-control" type="date" name="date1" value="" /> 
                </div>
                </div> </div>
               
        <div class="modal-footer">
         
          <input type="submit" class="btn btn-default" value="Retrieve" />
        </div>
      </div>
    </div>
  </div>
            </form>
                <form action="ItemReportByRegion.jsp">
               <div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
          <div class="form-group">
         <label for="name" class=" control-label">Choose Item Name</label>
              
                <div class="input-group">
                
                 <select name="itemId" value="" class="form-control">
                 
                  <%
                   
                     for (Item lo : list) {
                 %>
                 
                <option  name="itemId" value="<%=lo.getItemId()%>"><%=lo.getItemId()%> <%=lo.getItemName() %> </option>
               <%
                     }
               %>
               
            </select>
                </div> </div>
        </div>
              
        <div class="modal-body">
           <div class="form-group">
         <label for="name" class=" control-label">Region</label>
              
                <div class="input-group">
               
 <select name="regionId" class="form-control">
                 
                  <%
                  
                     RegionModel rg = new RegionModel();
                     List<Region> list1 = rg.getRegionList();
                     for (Region p : list1) {
                 %>
                 
               
                	
                <option  name="regionId" value="<%=p.getRegionId()%>"> <%=p.getRegionId()%> <%=p.getRname()%> </option>
               <%
                       }
               %>
               
            </select>

  </div> 
                 
  </div>
        </div>
        <div class="modal-footer">
            <input type="submit" class="btn btn-default" value="Retrieve"></input>
        </div>
      </div>
    </div>
  </div></form>
               
               
               <form action="ChartOnItemUsage.jsp">
               <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
          <div class="form-group">
         <label for="name" class=" control-label">Choose Item Name</label>
              
                <div class="input-group">
                
                 <select name="userId" value="" class="form-control">
                 
                  <%
                  for (User ip : listr) { 
                 %>
                 
                <option  name="userId" value="<%=ip.getId() %>"><%=ip.getFname() %> <%=ip.getLname() %></option>
               <%
                     }
               %>
               
            </select>
                </div> </div>
        </div>
               <div class="modal-content">
        <div class="modal-header">
       <div class="form-group">
         <label for="name" class=" control-label">Choose Item Name</label>
              
                <div class="input-group">
                
                 <select name="itemId" value="" class="form-control">
                 
                  <%
                   
                     for (Item lo : list) {
                 %>
                 
                <option  name="itemId" value="<%=lo.getItemId()%>"><%=lo.getItemId()%> <%=lo.getItemName() %> </option>
               <%
                     }
               %>
               
            </select>
                </div> </div></div>
        <div class="modal-footer">
            <input type="submit" class="btn btn-default" value="Retrieve"></input>
        </div>
      </div>
    </div>
    </div></div></form><!-- /. ROW  -->
				<footer><p>All right reserved by: <a href="www.tresrw.com">TRES</a></p></footer>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->
<%

            }else{
%>

<jsp:forward page="Login.jsp"></jsp:forward>
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