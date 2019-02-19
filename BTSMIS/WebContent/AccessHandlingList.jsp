<!DOCTYPE html>
<html >
 <%@page import="java.util.List"%>
<%@page import="service.User"%>
<%@page import="model.ItemUsageModel"%>
<%@page import="service.AccessRequest"%>
<%@page import="model.AccessRequestModel"%>
<%@page import="model.BtsModel"%>
<%@page import="service.Bts"%>
<%@page import="service.AccessHandling"%>
<%@page import="model.AccessHandlingModel"%>
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
AccessHandlingModel ahm = new AccessHandlingModel();
 User user = (User) session.getAttribute("user");
            if(user != null){
            	int userId = user.getId();
             %>  

    

        <!--/. NAV TOP  -->


        <div class="container">
        
        <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                       <i class="fa fa-dashboard text-success"></i>     <small>List of Access Handling Report</small>
                        </h1>
                    </div>
                </div>
                <!-- /. ROW  -->
        
        
        
            <div id="row">
<!-- CONTENTS START -->


 <div class="panel panel-default">
                        <div class="panel-heading">
                            
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                        <tr>
<th>Image</th>

                            <th>B.T.S</th>
                           
                            <th>Actual Issue</th>
                            
                            <th>DownTime</th>
                            
                            <th>Downtime Reason</th>
                            
                            <th>Issue Handling Result</th>
                            
                            
                            <th>Reporting Time</th>

							 <th>Running Hours</th>
							 
							 <th>Status at Arrival</th>
							 
							
							 
							 <th>Status At Departure</th>
							 
							
							 
                        </tr>
                        </thead>
                        <tbody>
<% 

//ItemUsage iu = new ItemUsage();
Bts bt = new Bts();
BtsModel btm = new BtsModel();
AccessRequestModel ic = new AccessRequestModel();
                            List<AccessHandling> list = ahm.getAccessHandlingList();
                            for (AccessHandling it : list) {
                        %>                        
                        <tr class="">

<td> <img src="AccessHandAttachs<%=it.getAttachement() %>" width="50px" height="50px"> </td>

  <td>
  
  <%
  String bnm = btm.getBts(ic.getAccessRequest(it.getTicketId()).getBtsId()).getBtsName();
  %>
  <%=bnm %>  
  </td>
                            <td><%=it.getActualIssue()%></td>
                          
                           <td><%=it.getDowntime()%></td>
                            
                             <td><%=it.getDowntimereason()%></td>
                              <td><%=it.getIssueHandlingResult() %> </td>
                               <td><%=it.getReportingTime()%> </td>
                            
 <td><%=it.getRunningHours() %></td>
 
  <td><%=it.getStatusAtArrival()%></td>
  
   <td><%=it.getStatusAtDeparture() %> </td>
   
  
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