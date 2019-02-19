 <%@page import="java.util.List"%>
<%@page import="model.InStockModel"%>
<%@page import="model.RequestModel"%>
<%@page import="model.FieldEngineerModel"%>
<%@page import="service.Bts"%>
<%@page import="model.BtsModel"%>
<%@page import="service.User"%>
<%@page import="model.ItemModel"%>
<%@page import="model.RegionModel"%>
<%@page import="model.UserModel"%>
<%@page import="model.ItemUnitModel"%>
<%@page import="service.GenSet"%>
<%@page import="service.Request"%>
<%@page import="model.ItemControllerModel"%>
<%@page import="service.ItemController"%>
<%@page import="model.GenSetModel"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html >
<%

 User user = (User) session.getAttribute("user");
            if(user != null){
            	int userId = user.getId();
             %>  
<head>

<title>BTSMIS</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/> 
	 <link href="mystyle.css" rel="stylesheet"/>
   <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css"/>

</head>
<body>

<jsp:include page="UserHeader.jsp" ></jsp:include>

<div class="container">
 <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                        </h1>
                    </div>
                </div>
<div class="row">


 <%
 
                                FieldEngineerModel fe = new FieldEngineerModel();

                            %>
                            
<%

if(user.getRole().equals("Field Engineer")){
	%>
	
	<jsp:forward page="BtsList.jsp" />

	<%} %>
	
	
	<%

if(user.getRole().equals("Operations Manager")){
	%>

<!-- CONTENTS START -->


 <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3><small>List of Your Requests</small></h3>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                        <tr>

<th>Item Name</th>
<th>Requested Quantity</th>
<th>Requested By</th>

<th>Region</th>
<th>Date of Request</th>
<th>Proposed Date</th>
<th>Note</th>



<th>State</th>

                        </thead>
                        <tbody>
               <%
               RegionModel rgm = new RegionModel();
               User use = new User();
               User usereg = new User();
               UserModel usemo = new UserModel();
ItemModel itm = new ItemModel();
Request r = new Request();
RequestModel rm = new RequestModel();
ItemUnitModel iu =new ItemUnitModel();
List<Request> list = rm.getRequestApprovalsOperationsAll();
for(Request it: list){
	
use = usemo.getUser(it.getUserId());
//r = rgm.getRegion(id)
%>
                        
                        <tr>
 <td><%=itm.getItem(it.getItemId()).getItemName()%></td>


 


<%
String unit = iu.getItemUnit(Integer.parseInt(itm.getItem(it.getItemId()).getUnits())).getName();
String rl = "Region Manager";
usereg = usemo.getUser((usemo.getRegionManagerByRegion(it.getRegion()).getId()));
%>

<td><%=it.getQuantity()%> <%=unit %>(s)</td>
<td><%=use.getFname() %> <%=use.getLname() %></td>

<td><%=rgm.getRegion(it.getRegion()).getRname() %></td>
<td><%=it.getRequestDate() %></td>
<td><%=it.getProposedDeliveryDate() %></td>
<td><%=it.getNote()%></td>
<%
int stage = it.getStage();
%>


<%
if(stage == 1){
%>
<td><a href="ApproveRequestOperations?requestId=<%=it.getRequestId() %>" class="btn btn-primary" > <i class="fa fa-check-square-o"></i> Click to Approve </a><a href="DenyRequestForm.jsp?requestId=<%=it.getRequestId() %>" class="btn btn-danger"><span class="glyphicon glyphicon-remove "> </span> Deny </a></td>
<%
} else if (stage == 0){
%>
<td><a class="btn btn-success" disabled="disabled"> <i class="fa fa-check-square-o"></i> Approved </a></td>
<%
} 
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



	<%} %>
	
	<%

if(user.getRole().equals("Region Manager")){
	%>
	
	<jsp:forward page="RequestRegion.jsp" />

	<%} %>
	
	<%

if(user.getRole().equals("Partner")){
	%>
	
	<jsp:forward page="ChooseBTSAccess.jsp" />

	<%} %>
	
	<%

if(user.getRole().equals("NOC")){
	%>
	
	<jsp:forward page="PendingApprovals.jsp" />

	<%} %>
	

</div>

<div class="row">



</div>

</div>

<br/>

</body>
<%
            }
            else
            {
%>

<jsp:forward page="Login.jsp" ></jsp:forward>
<%
            }
%>
</html>