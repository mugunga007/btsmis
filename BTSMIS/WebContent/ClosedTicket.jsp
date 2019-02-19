<%@page import="service.TicketHandlingReports"%>
<%@page import="model.OpenTicketModel"%>
<%@page import="service.OpenTicket"%>
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
          <script src="MyJs.js"></script>
    </head>

    <body style="background-color: #E5EBF2">
        <jsp:include page="UserHeader.jsp"></jsp:include>


        <%

            User user = (User) session.getAttribute("user");
            if (user != null) {
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
                <!-- CONTENTS START -->


                <div class="panel panel-default">
                    <div class="panel-heading">

                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>

                                        <th>Ticket ID</th>
                                        <th>B.T.S</th>
                                        <th>Alarm</th>
                                        <th>Notifier</th>



                                        <th>Severity</th>

                                        <th>Open date</th>
                                        <th>Description</th> 
                                        <th>Status</th> 
                                        <th>Site arrival</th> 
                                        <th>Issue handling</th> 


                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        TicketHandlingReports thm = new TicketHandlingReports();
                                        List<TicketHandlingReports> k = thm.getAllClosedTicket(userId);

                                        for (TicketHandlingReports it : k) {

                                    %>                        
                                    <tr class="">

                                        <td><%=it.getReferenceId()%></td>

                                        <td><%=it.getBtsId()%></td>

                                        <td><%=it.getNotifier()%></td>
                                        <td><%=it.getAlarm()%> </td>
                                        <td><%=it.getSeverity()%> </td>
                                        <td><%=it.getOpenDate()%> </td>
                                        <td><%=it.getNote()%> </td>

                                        <td>  <a href="#"> <span class="glyphicon glyphicon-clock"></span> <%=it.getStatus()%> </a></td> 

                                        <td>  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Site arrival</button> </td>
                                        <td>  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalT">Issue handling</button> </td>




                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>

                                <form class="form-horizontal" action="SiteArrivalController" method="post">
                                    <div class="Container">
                                        <div class="form-group">
                                            <label for="name" class=" control-label">Select Ticket Id</label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                                                <select name="ticketId" value="" class="form-control">
                                                    <%
                                                        for (TicketHandlingReports it : k) {%>
                                                    <option value="<%=it.getReferenceId()%>"><%=it.getReferenceId()%></option>
                                                    <%}%>

                                                </select>
                                            </div>
                                        </div> 
                                        <div class="form-group">
                                            <label for="name" class=" control-label">Status at arrival</label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                                                <select name="arrivalStatus" value="" class="form-control">

                                                    <option value="AC Backup">Normal</option>
                                                    <option value="AC Backup">AC Backup</option>
                                                    <option value="DC Backup">DC Backup</option>
                                                    <option value="Down">Down</option>

                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="name" class=" control-label">Issue</label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                                                <select name="issue" value="" class="form-control">

                                                    <option value="AC Backup">CP</option>
                                                    <option value="DC Backup">DG</option>
                                                    <option value="Down">DC Power</option>
                                                    <option value="AC">AC</option>
                                                    <option value="ATS">ATS</option>
                                                    <option value="Monitoring System">Monitoring System</option>
                                                    <option value="Other">Other</option>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">

                                            <span class="input-group-addon">Note</span> </span>
                                            <textarea name="description" class=" control-label" rows="4" cols="32">
                                            </textarea>

                                        </div>


                                        <div class="modal-footer">
                                            <input type="submit" class="btn btn-default" value="Save"></input>
                                        </div>

                                    </div></form> </div>
                        </div></div>     </div>

                <div class="modal fade" id="myModalT" role="dialog">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>

                                <form class="form-horizontal" action="TestController" method="get">
                                    <input type="hidden" name="fengineer" value="<%=userId%>" />
                                    <div class="Container">
                                        <div class="form-group">
                                            <label for="name" class=" control-label">Select Ticket Id</label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                                                <select name="ticketId" value="" class="form-control">
                                                    <%
                                                        for (TicketHandlingReports it : k) {%>
                                                    <option value="<%=it.getReferenceId()%>"><%=it.getReferenceId()%></option>
                                                    <%}  %>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="name" class=" control-label">Issue handling</label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                                                <select name="handling" value="" class="form-control">

                                                    <option value="Definitive">Definitive</option>
                                                    <option value="Temporal">Temporal</option>


                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="name" class=" control-label">Status departure</label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                                                <select name="statusDeparture" value="" class="form-control">   <option value="AC Backup">Normal</option>
                                                    <option value="AC Backup">AC Backup</option>
                                                    <option value="DC Backup">DC Backup</option>
                                                    <option value="Down">Down</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                                                <input type="number" name="runningHours" placeholder="Running hours" class="col-md-8 form-control" id="name" required="required"/>
                                            </div> 

                                        </div>
                                        <div class="form-group">


                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                                                <input type="number" name="cpIndex" placeholder="CP Index"  class="col-md-8 form-control" id="name" required="required"/>
                                            </div> 

                                        </div>
                                        <div class="form-group">
                                            <label for="name" class=" control-label">Service request</label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                                                <input onclick="service();" type="checkbox" name="serviceRequest" value="Yes"/>Yes
                                                    <input  onclick="noService();" type="checkbox" value="No">No


                                               
                                            </div>
                                            
                                        </div>
                                                    
                                                    
                                                    <fieldset id="requestservice" style="display: none">
                                                                  <legend>Reason for request</legend>
                                                                  <textarea name="reason" rows="4" cols="20">
                                                                  </textarea>
                                                    </fieldset>



                                        <div class="modal-footer">
                                            <input type="submit" class="btn btn-default" value="Save"></input>
                                        </div>

                                    </div></form> </div>
                        </div></div>     </div>

                <!-- CONTENTS END -->


                <!-- /. PAGE INNER  -->

                <!-- /. PAGE WRAPPER  -->
            </div>
            <!-- /. WRAPPER  -->
            <%
            } else {
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