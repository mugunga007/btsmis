<%@page import="model.PartnerModel"%>
<%@page import="model.UserModel"%>
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
                <!-- CONTENTS START -->


                <div class="panel panel-default">
                    <div class="panel-heading">

                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>



                                        <th>Reference ID</th>
                                        <th>B.T.S</th>
                                        <th>Open date</th>

                                        <th>Notifier</th>

                                        <th>Alarm</th>

                                        <th>Severity</th>
                                        <th>Description</th>
                                        <th>Status</th>
                                        <th>Site arrival</th> 
                                        <th>Issue handling</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        UserModel usmo = new UserModel();
                                        BtsModel btm = new BtsModel();
                                        PartnerModel pm = new PartnerModel();
                                        OpenTicketModel ic = new OpenTicketModel();
                                        List<OpenTicket> list = ic.getAllTicket();
                                        for (OpenTicket it : list) {
                                    %>                        
                                    <tr class="">
                                        <td><%=it.getReferenceId()%></td>
                                        <td><%=it.getSiteId()%></td>

                                        <td><%=it.getOpenDate()%></td>
                                        <td><%=it.getNotifier()%></td>
                                        <td><%=it.getAlarm()%>
                                        <td><%=it.getSeverity()%></td>

                                        <td><%=it.getDescription()%></td>
                                        <td><%=it.getStatus()%></td>
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



                <!-- CONTENTS END -->
                <div class="Container">
                    <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">


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
                                        <label for="name" class=" control-label">Select Ticket Id</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                                            <select name="ticketId" value="" class="form-control">
                                                <%
                                                    TicketHandlingReports thm = new TicketHandlingReports();
                                                    List<TicketHandlingReports> k = thm.getAllTicket(userId);
    for (TicketHandlingReports it : k) {%>
                                                <option value="<%=it.getReferenceId()%>"><%=it.getReferenceId()%></option>
                                                <%}  %>

                                            </select>
                                        </div>
                                    </div>

                                </div></div>
                        </div>
                    </div>
                </div>
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