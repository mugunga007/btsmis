   <%@page import="service.TicketHandlingReports"%>
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
                         <i class="fa fa-dashboard text-success"></i>    <small>Summary of your stock in all regions</small>
                        </h1>
                    </div>
                </div>
                <!-- /. ROW  -->

            
                <!-- /. ROW  -->

                <div class="row">
                     
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
                                                <th>#</th>
                                                <th>Site</th>
                                                <th>Downtime</th>
                                        
                                             
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int i=1;
                                                int userId=Integer.parseInt(request.getParameter("userId"));
                                               TicketHandlingReports th=new TicketHandlingReports();
                                                List<TicketHandlingReports>k=th.downtimeByFE(userId);
                                          
          for(TicketHandlingReports ws:k){
             
                  
                                            %>
                                            <tr>
                                                <td><%=i%></td>
                                                <td><%=ws.getSite() %></td>
                                                <td><%=ws.getDowntime()%></td>
                                             
                                               
                                            </tr>
                                          
<%
    i++;
}
%>
                                        </tbody>
                                    </table>
<a href="DowntimebyFEchart.jsp?userId=<%=userId%>" class="btn btn-link glyphicon glyphicon-link" >Click to view it on chart</a>
                                                      </div>
                            </div>
                        </div>

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
                     for (Region p : list1) {
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
                           <form action="#.jsp">
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

            }
%>

</body>

</html>