<%@page import="service.OpenTicket"%>
<%@page import="model.OpenTicketModel"%>
<%@page import="model.UserModel"%>
<!DOCTYPE html>
<html >
    <%@page import="java.util.List"%>
    <%@page import="service.User"%>
    <%@page import="model.ItemUsageModel"%>
    <%@page import="service.AccessRequest"%>
    <%@page import="model.AccessRequestModel"%>
    <%@page import="model.BtsModel"%>
    <%@page import="service.Bts"%>
    <%@page import="model.PartnerModel"%> 
    <%@page import="service.Partner"%>

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


        <div class="carousel">

            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        <i class="fa fa-dashboard text-success"></i>     <small>All opened tickets</small>
                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->



            <div id="row">
                <!-- CONTENTS START -->

                <%
                    if (request.getAttribute("success") != null) {
                %>

                <div class="alert alert-success">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <%=request.getAttribute("success")%>
                </div>
                <%
                } else if (request.getAttribute("failed") != null) {
                %>

                <div class="alert alert-danger">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <%=request.getAttribute("failed")%>
                </div>

                <%
                    }
                %>
                <div class="container">
                <div class="panel panel-default">
                    <div class="panel-heading">

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
                                        int i = 1;
                                        UserModel usmo = new UserModel();
                                        BtsModel btm = new BtsModel();
                                        PartnerModel pm = new PartnerModel();
                                        OpenTicketModel ic = new OpenTicketModel();
                                        List<OpenTicket> list = ic.getAllTicket();
                                        for (OpenTicket it : list) {
                                    %>                        
                                    <tr class="">
                                        <td><%=i%></td>
                                        <td><%=it.getReferenceId()%></td>
                                        <td><a href="BtsDetails.jsp?btsId=<%=it.getSiteId()%>"><%=it.getSiteId()%></a></td>

                                        <td><%=it.getOpenDate()%></td>
                                        <td><%=it.getNotifier()%></td>
                                        <td><%=it.getAlarm()%>
                                        <td><%=it.getSeverity()%></td>

                                        <td><%=it.getNote()%></td>
                                        <td><a href="SiteArrivalDetails.jsp?referenceId=<%=it.getReferenceId()%>"><%=it.getArrivalTime()%> </a></td>
                                        <td><%=it.getIssue()%></td>
                                        <td><a href="IssueHandlingDetails.jsp?referenceId=<%=it.getReferenceId()%>"><%=it.getHandling()%></a></td>
                                          <td><%=it.getStatus()%></td>


                                    </tr>
                                    <%i++;
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div></div>



                <!-- CONTENTS END -->


                <!-- /. PAGE INNER  -->
            </div>
            <!-- /. PAGE WRAPPER  -->
        </div>

        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <form action="RecordDowntimeController">
                        <div class="modal-header">
                            <a name="moda"><b></b></a>

                            <label class="input-group-addon"><input type="text" placeholder="PASTE REFERENCE ID" name="referenceId" required="true" value="" /></label><br/>

                            <label class="input-group-addon"><input type="text" placeholder="ENTER EQUIPMENT AFFECTED" name="equipment" required="true" value="" /></label><br/>
                            <label class="input-group-addon">ENTER DOWNTIME(Hrs)<br/><input type="number" name="downtime" required="true" value="" /></label><br/>

                            <label class="input-group-addon"><input type="text" placeholder="ENTER REASON" name="reason" required="true" value="" /></label><br/>
                            <textarea class="text text-left text-nowrap" name="comment" rows="4" cols="28">
                            </textarea>
                        </div>
                        <input class="btn btn-adn" type="submit" value="Record" />
                    </form>
                </div>
            </div></div> 



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