<%@page import="service.ServiceRequest"%>
<%@page import="model.ServiceRequestModel"%>
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
                                        <th>Take Action</th>
                                        
                                        </tr>
                                </thead>
                                <tbody>
                                    <%
                                        
                                        ServiceRequestModel thm = new ServiceRequestModel();
                                        List<ServiceRequest> k=thm.getAllTicket(userId);

                                        for (ServiceRequest it : k) {

                                    %>                        
                                    <tr class="">
 
                                        <td><a class="active" href="TicketDetails.jsp?referenceId=<%=it.getReferenceId()%>"><%=it.getReferenceId()%></a></td>

                                        <td><a class="active" href="BtsDetails.jsp?btsId=<%=it.getBtsId()%>"><%=it.getBtsId()%></a></td>
                                        <td><a class="active" href="HandlingForm.jsp?serviceRequestId=<%=it.getServiceRequestId()%>">Open Form</a></td>
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