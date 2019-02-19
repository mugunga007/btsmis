
  <%@page import="service.Downtime"%>
<%@page import="model.DowntimeModel"%>
<%@page import="service.OpenTicket"%>
<%@page import="model.OpenTicketModel"%>
<%@page import="model.PartnerModel"%>
<%@page import="model.BtsModel"%>
<%@page import="service.GenFuelTracking"%>
<%@page import="model.GenFuelTrackingModel"%>
<%@page import="model.GenFuelTrackingModel"%>
<%@page import="model.GenFuelTrackingModel"%>
<%@page import="model.GenFuelTrackingModel"%>
<%@page import="model.ItemModel"%>
<%@page import="service.FieldEngineer"%>
<%@page import="model.FieldEngineerModel"%>
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
    
    <%
    try{
    %>
<jsp:include page="UserHeader.jsp"></jsp:include>
<%
InStockModel im = new InStockModel();
RegionModel regm = new RegionModel();
RequestModel rm = new RequestModel();
ItemReporting it=new ItemReporting();

%>
<%
	UserModel use = new UserModel();
        String rol="Field Engineer";
           List<User> listr = use.getUserByRole(rol);
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
                        <a class="active-menu" href="#"><i class="fa fa-dashboard"></i> Item</a>
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
            
  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal1">Get a report by region</button>  
  
 
  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal2">Get report by field engineer</button> 
   <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a class="active-menu" href="#"><i class="fa fa-dashboard"></i> Access </a>
                    </li>             
                    </ul>

   </div>
 
   <div class="dropdown">
   
    <button class="btn btn-default dropdown-toggle glyphicon glyphicon-list" type="button" id="menu1" data-toggle="dropdown">Select downtime reason
    <span class="caret"></span></button>
    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
        
        <li role="presentation"><a role="menuitem" tabindex="-1" href="DowntimeReport.jsp?reason=Reporting delay">Reporting delay </a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="DowntimeReport.jsp?reason=Handling delay">Handling delay</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="DowntimeReport.jsp?reason=Un-sufficient  DC Backup">Un-sufficient  DC Backup</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="DowntimeReport.jsp?reason=Refuel Issue">Refuel Issue</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="DowntimeReport.jsp?reason=Human Intervention">Human Intervention</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="DowntimeReport.jsp?reason=Battery issue">Battery issue</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="DowntimeReport.jsp?reason=Access">Access</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="DowntimeReport.jsp?reason=ATS-AMF Issue">ATS-AMF Issue</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="DowntimeReport.jsp?reason=DBs & CBs Issue">DBs & CBs Issue</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="DowntimeReport.jsp?reason=Diezel Outage">Diezel Outage</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="DowntimeReport.jsp?reason=Fuel line">Fuel line</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="DowntimeReport.jsp?reason=Gen Servicing">Gen Servicing</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="DowntimeReport.jsp?reason=Generator Issue">Generator Issue</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="DowntimeReport.jsp?reason=Rectifier Issue">Rectifier Issue</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="DowntimeReport.jsp?reason=Planned Work">Planned Work</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="DowntimeReport.jsp?reason=Solar">Solar</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="DowntimeReport.jsp?reason=Theft">Theft</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="DowntimeReport.jsp?reason=BFU Issue">BFU Issue</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="DowntimeReport.jsp?reason=INALA Issue">INALA Issue</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="DowntimeReport.jsp?reason=IPT Issue">IPT Issue</a></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="DowntimeReport.jsp?reason=Other">Other</a></li>
         </ul>
      
  </div>
    
     
               <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal11">Downtime by region</button> 
               <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal21">Downtime by F.E</button> 
              
       </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">
               <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                         <i class="fa fa-dashboard text-success"></i>    <small>Operation manager report</small>
                        </h1>
                    </div>
                </div>
                <!-- /. ROW  -->

            
                <!-- /. ROW  -->
<div class="container">
  <h2>Simple click</h2>
  <p></p>
  <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo">Fuel</button>
  <div id="demo" class="collapse">
  <div class="row">
                     
                    <div class="col-md-8 col-sm-12 col-xs-12">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Monthly report
                            </div>
                            
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Item</th>
                                                <th>Quantity(Requested)</th>
                                                <th>Quantity(Approved)</th>
                                                <th>Quantity(Used)</th>
                                             
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int i=1;
                                                ItemModel itm=new ItemModel();
                                                int itemId=itm.getFuelItem().getItemId();
                                               
                                                List<ItemReporting>k=it.itemRemainingByOM(itemId);
                                             List<ItemReporting> l=it.itemReportByOM(itemId);
          for(ItemReporting ws:l){
             
                  
                                            %>
                                            <tr>
                                                <td><%=itemId%></td>
                                                <td><a href=""><%=ws.getItemName()%></a></td>
                                                <td><%=ws.getQuantity()%></td>
                                                <td><%=ws.getDeliveredQuantity()%></td>
                                                <%
                                                 for(ItemReporting ki:k){
                                                %>
                                                <td><%=ki.getQuantityUsed()%></td>
                                                <%}%>
                                            </tr>
                                          
<%
    i++;
}
%>
                                        </tbody>
                                    </table>
                                        <a href="ItemReportByRegion.jsp?itemId=<%=itemId%>" class="btn btn-link glyphicon glyphicon-link" >Click to view details</a>
                                                      </div>
                            </div>
                        </div>

                    </div>
                </div>
                                          
  
    <div class="row">
                     
                    <div class="col-md-8 col-sm-12 col-xs-12">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                General report
                            </div> 
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Region</th>
                                                <th>Quantity(Requested)</th>
                                                <th>Quantity(Approved)</th>
                                                <th>Quantity(Used)</th>
                                             </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int y=1;
                                           //    int itemId=;
                                               
                                                List<ItemReporting>k1=it.itemRemainingByOMAll(itm.getFuelItem().getItemId());
                                             List<ItemReporting> l1=it.itemReportByOMAll(itm.getFuelItem().getItemId());
          for(ItemReporting ws:l1){
             
                  
                                            %>
                                            <tr>
                                                <td><%=y%></td>
                                                <td> <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal1"><%=ws.getItemName()%></button> </a></td>
                                                <td><%=ws.getQuantity()%></td>
                                                <td><%=ws.getDeliveredQuantity()%></td>
                                                <%
                                                 for(ItemReporting ki:k1){
                                                %>
                                                <td><%=ki.getQuantityUsed()%></td>
                                                   <%}%>
                                                   
                                            </tr>
                                          
<%
    y++;
}
%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
    <div class="row">
                     
                    <div class="col-md-8 col-sm-12 col-xs-12">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                            Fuel usage by Field engineer
                            </div> 
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Field Engineer</th>
                                                <th>Running hours</th>
                                                <th>Consumption per hour</th>
                                           
                                             </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int y1=1;
                                           //    int itemId=;
                                               GenFuelTrackingModel gf=new GenFuelTrackingModel();
                                                List<GenFuelTracking>k7=gf.getFuelTrackingByFE();
                                                
                                           
          for(GenFuelTracking ws1:k7){
             
                  
                                            %>
                                            <tr>
                                                <td><%=y1%></td>
                                                <td> <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal1"><%=use.getUser(ws1.getUserId()).getFname() %> <%=use.getUser(ws1.getUserId()).getLname() %></button> </a></td>
                                                <td><%=ws1.getRunHours() %></td>
                                                <td><%=ws1.getPerHour()%></td>
                                              
                                                   
                                            </tr> 
                                          
<%
    y1++;
}
%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
  
  
  </div>
  <p></p>
  <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo1">Ticket</button>
  <div id="demo1" class="collapse">
                   <div class="container">
                <div class="panel panel-default">
                    <div class="panel-heading">
All tickets
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Reference ID</th>
                                        <th>B.T.S</th>
                                        <th>Open date</th>
                                        <th>Notifier</th>
                                        <th>Alarm</th>
                                        <th>Severity</th>
                                        <th>Note</th>
                                        <th>Site arrival</th>
                                        <th>Arrival status</th>
                                        <th>Issue handling</th> 
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        int ki = 1;
                                        UserModel usmo = new UserModel();
                                        BtsModel btm = new BtsModel();
                                        PartnerModel pm = new PartnerModel();
                                        OpenTicketModel ic = new OpenTicketModel();
                                        List<OpenTicket> list1 = ic.getAllTicket();
                                        for (OpenTicket it1 : list1) {
                                    %>                        
                                    <tr class="">
                                        <td><%=ki%></td>
                                        <td><%=it1.getReferenceId()%></td>
                                        <td><a href="BtsDetails.jsp?btsId=<%=it1.getSiteId()%>"><%=it1.getSiteId()%></a></td>

                                        <td><%=it1.getOpenDate()%></td>
                                        <td><%=it1.getNotifier()%></td>
                                        <td><%=it1.getAlarm()%>
                                        <td><%=it1.getSeverity()%></td>

                                        <td><%=it1.getNote()%></td>
                                        <td><a href="SiteArrivalDetails.jsp?referenceId=<%=it1.getReferenceId()%>"><%=it1.getArrivalTime()%> </a></td>
                                        <td><%=it1.getIssue()%></td>
                                        <td><a href="IssueHandlingDetails.jsp?referenceId=<%=it1.getReferenceId()%>"><%=it1.getHandling()%></a></td>
                                          <td><%=it1.getStatus()%></td>


                                    </tr>
                                    <%ki++;
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div></div>
                   <div class="container">
                <div class="panel panel-default">
                    <div class="panel-heading">
All Downtime
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Reference ID</th>
                                        <th>B.T.S</th>
                                      
                                        <th>Hours</th>
                                        <th>Reason</th>
                                        <th>Comment</th>
                                       >
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        int pi = 1;
                                        DowntimeModel dtm = new DowntimeModel();
                                        BtsModel bm = new BtsModel(); 
                                        List<Downtime> list5 = dtm.getAllDownTime();
                                        for (Downtime it5 : list5) {
                                    %>                        
                                    <tr class="">
                                        <td><%=pi%></td>
                                        <td><%=it5.getReferenceId()%></td>
                                        
                                        <td><a href=""><%=it5.getReferenceId() %><%=bm.getBts("2017451").getBtsId() %></a></td>
 
                                        <td><%=it5.getDowntimehours()%></td>
                                        <td><%=it5.getReason()%></td>
                                        <td><%=it5.getComment()%></td>
                                     


                                    </tr>
                                    <%ki++;
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div></div>
                                
                                
  </div>
  <p></p>
  <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo2">Maintenance </button>
  <div id="demo2" class="collapse">
    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
  </div>
  <p></p>
  <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo3">Stock </button>
  <div id="demo3" class="collapse">
    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
  </div>
</div>
                

                                          
  <!-- Trigger the modal with a button -->
 

  <!-- Modal -->
 
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
                 
                <option  name="itemId" value="<%=lo.getItemId()%>"> <%=lo.getItemName() %> </option>
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
                     List<Region> list2 = rg.getRegionList();
                     for (Region p : list2) {
                 %>
                 
               
                	
                <option  name="regionId" value="<%=p.getRegionId()%>"><%=p.getRname()%> </option>
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
               <form action="DowntimebyRegion.jsp">
               <div class="modal fade" id="myModal11" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
                <div class="modal-body">
           <div class="form-group">
         <label for="name" class=" control-label">Region</label>
              
                <div class="input-group">
               
 <select name="regionId" class="form-control">
                 
                  <%
                  
                    // RegionModel rg = new RegionModel();
                  //   List<Region> list1 = rg.getRegionList();
                     for (Region p : list2) {
                 %>
                 
               
                	
                <option  name="regionId" value="<%=p.getRegionId()%>"><%=p.getRname()%> </option>
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
    </div></div></form>
               
                           <form action="ChartOnItemUsage.jsp">
               <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
          <div class="form-group">
         <label for="name" class=" control-label">Select field engineer</label>
              
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
    </div></div></form>
               <form action="DowntimebyFE.jsp">
               <div class="modal fade" id="myModal21" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
          <div class="form-group">
         <label for="name" class=" control-label">Select field engineer</label>
              
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
        
        <div class="modal-footer">
            <input type="submit" class="btn btn-default" value="Retrieve"></input>
        </div>
      </div>
    </div>
    </div></div></form>
               
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
                <!-- /. ROW  -->
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

            }}catch(Exception e){
response.sendRedirect("index.jsp");
}
%>

</body>

</html>