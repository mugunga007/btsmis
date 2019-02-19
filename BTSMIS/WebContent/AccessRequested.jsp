<!DOCTYPE html>
<html >
 <%@page import="java.util.List"%>
<%@page import="service.User"%>
<%@page import="model.ItemUsageModel"%>
<%@page import="service.AccessRequest"%>
<%@page import="model.AccessRequestModel"%>
<%@page import="model.BtsModel"%>
<%@page import="service.Bts"%>

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

 User user = (User) session.getAttribute("user");
            if(user != null){
            	int userId = user.getId();
             %>  

    

        <!--/. NAV TOP  -->


        <div class="container">
        
        <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                       <i class="fa fa-dashboard text-success"></i>     <small>Ticket opened</small>
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

                            <th>B.T.S</th>
                           
                            <th>Access Date</th>
                            
                            <th>Source</th>
                            
                            <th>Date Received</th>
                            
                            <th>Reason</th>
                            
                            
                            <th>Reported Issue</th>

							 <th>Staff Names</th>
							 
							 <th>Ticket Severity</th>
							 
							 <th>Date Requested</th>
							 
							 <th>Status</th> 
                                                         <%
                                                         if(user.getRole().equals("Field Engineer")){
                                                         %>
                                                         <th>Report</th>
                                                         <%
                                                         }
                                                         %>
							 
                        </tr>
                        </thead>
                        <tbody>
<% 

//ItemUsage iu = new ItemUsage();
Bts bt = new Bts();
BtsModel btm = new BtsModel();
AccessRequestModel ic = new AccessRequestModel();
                            List<AccessRequest> list = ic.getAccessRequestByPartner(userId);
                            for (AccessRequest it : list) {
                        %>                        
                        <tr class="">

  <td>
  
  <%
  String bnm = btm.getBts(it.getBtsId()).getBtsName();
  %>
  <%=bnm %>  
  </td>
                            <td><%=it.getAccessDate()%></td>
                          
                           <td><%=it.getInfoFrom()%></td>
                            
                             <td><%=it.getTimeReceiveInfo()%></td>
                              <td><%=it.getReason() %> </td>
                               <td><%=it.getReportedIssue() %> </td>
                            
 <td><%=it.getStaffFname()%> <%=it.getStaffLname() %></td>
 
  <td><%=it.getTicketSeverity()%></td>
  
   <td><%=it.getDate() %> </td>
   
   <%--
   
   if(it.getStatus().equals("Waiting")){
   
   --%>
    <td ><a href="" class="btn btn-warning" disabled> <i class="fa fa-clock-o"></i> <%=it.getStatus()%>...</a> </td>
    <%--
    <td ><a href="" class="btn btn-success" disabled> <i class="fa fa-close"></i> Report</a> </td>
    
    
    <%
                            }else if(it.getStatus().equals("Confirmed")){
    %>
    
    <td ><a href="" class="btn btn-success" disabled>  <i class="fa fa-check-square-o"></i> <%=it.getStatus()%></a> </td>
    
    <td ><a href="AccessHandlingForm.jsp?arId=<%=it.getRequestId() %>&bnm=<%=bnm %>" class="btn btn-success" > <i class="fa fa-check-square-o"></i> Report</a> </td>
    <%
                            }else if(it.getStatus().equals("Denied")){
    %>
      <td ><a href="" class="btn btn-danger" disabled>  <i class="fa fa-check-square-o"></i> <%=it.getStatus()%></a> </td>
 <td ><a href="" class="btn btn-danger" disabled>  <i class="fa fa-close"></i> <%=it.getStatus()%></a> </td>
  --%>
    <%
   if(user.getRole().equals("Field Engineer")){
   
      if(it.getStatus().equals("Waiting")){
       %>
     <td ><a href="" class="btn btn-success" disabled>  <i class="fa fa-check-square-o"></i><%=it.getStatus()%></a> </td>
    <%
       }else if(it.getStatus().equals("Denied")){
       %>
      <td ><a href="" class="btn btn-danger" disabled>  <i class="fa fa-check-square-o"></i> <%=it.getStatus()%></a> </td>
      <%}else if(it.getStatus().equals("Confirmed")){%>
      
       <td ><a href="AccessHandlingForm.jsp?arId=<%=it.getRequestId() %>&bnm=<%=bnm %>" class="btn btn-success" > <i class="fa fa-check-square-o"></i> Report</a> </td>
       <%  }else if(it.getStatus().equals("Reported")){ %>
    <td ><a href="AccessHandlingReport.jsp?arId=<%=it.getRequestId() %>&bnm=<%=bnm %>" class="btn btn-success" >  <i class="fa fa-arrow-circle-o-right"></i> Show Report</a> </td>
    <%
    
                         
}}
    %>
    
    
 
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