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
                        <i class="fa fa-dashboard text-success"></i>     <small>All Ticket</small>
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

                                        <th>#</th>
                                        <th>Ticket ID</th>
                                        <th>B.T.S</th>
                                        <th>Alarm</th>
                                        <th>Notifier</th>



                                        <th>Severity</th>

                                        <th>Open date</th>
                                        <th>Description</th> 
                                        <th>Status</th> 
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        int i=1;
                                        TicketHandlingReports thm = new TicketHandlingReports();
                                        List<TicketHandlingReports> k = thm.getAllTicketByRM(user.getRegion());

                                        for (TicketHandlingReports it : k) {

                                    %>                        
                                    <tr class="">

                                        <td><%=i%></td>
                                        <td><%=it.getReferenceId()%></td>

                                        <td><%=it.getBtsId()%></td>

                                        <td><%=it.getNotifier()%></td>
                                        <td><%=it.getAlarm()%> </td>
                                        <td><%=it.getSeverity()%> </td>
                                        <td><%=it.getOpenDate()%> </td>
                                        <td><%=it.getNote()%> </td>

                                        <td>  <a href="#"> <span class="glyphicon glyphicon-clock"></span> <%=it.getStatus()%> </a></td> 

                                       


                                    </tr>
                                    <%i++;
                                        }
                                    %>
                                </tbody>
                            </table>
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