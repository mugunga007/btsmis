<!DOCTYPE html>
<html >
    <%@page import="java.util.List"%>
    <%@page import="model.InStockModel"%>
    <%@page import="model.RequestModel"%>
    <%@page import="service.Request"%>
    <%@page import="model.ItemModel"%>
    <%@page import="service.User"%>
    <%@page import="model.ItemUnitModel"%>
    <%@page import="service.ItemUnit"%>
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
                int level = user.getLevel();
        %>  
        <%
            InStockModel im = new InStockModel();

            RequestModel rm = new RequestModel();

        %>


        <!--/. NAV TOP  -->


        <div class="container">

            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        <i class="fa fa-list-ol text-success"></i>    <small>Requested Items</small>
                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->



            <div id="row">
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
                                        <th>Date of Request</th>
                                        <th>Proposed Date</th>
                                        <th>Note</th>
                                        <th>Region Manager</th>
                                        <th>Operation Manager</th>
                                        <th>Cancel</th>
                                </thead>
                                <tbody>
                                    <%                   ItemModel itm = new ItemModel();
                                        Request r = new Request();
                                        ItemUnitModel iu = new ItemUnitModel();
                                        List<Request> list = rm.getRequestedItemsByUser(userId);
                                        for (Request it : list) {


                                    %>

                                    <tr>

                                        <td><%=itm.getItem(it.getItemId()).getItemName()%></td>
                                        <%
                                            String unit = iu.getItemUnit(Integer.parseInt(itm.getItem(it.getItemId()).getUnits())).getName();

                                        %>

                                        <td><%=it.getQuantity()%> <%=unit%>(s)</td>
                                        <td><%=it.getRequestDate()%></td>
                                        <td><%=it.getProposedDeliveryDate()%></td>
                                        <td><%=it.getNote()%></td>
                                        <%
                                            int stage = it.getStage();
                                        %>


                                        <%
                                            if (stage < 2) {
                                        %>
                                        <td><a class="btn btn-success" disabled="disabled"> <i class="fa fa-check-square-o"></i> Approved </a></td>
                                        <%
                                        } else {
                                        %>
                                        <td><a class="btn btn-warning" disabled="disabled"> <i class="fa fa-check-close"></i> Pending... </a></td>
                                        <%
                                            }
                                        %>

                                        <%
                                            if (stage < 1) {
                                        %>
                                        <td><a class="btn btn-success" disabled="disabled"><i class="fa fa-check-square-o"></i> Approved </a></td>
                                        <%
                                        } else {
                                        %>
                                        <td><a class="btn btn-warning"  disabled="disabled"><i class="fa fa-check-close"></i> Pending... </a></td>
                                        <%
                                            }
                                        %>
                                        <td><a href="CancelRequest?requestId=<%=it.getRequestId()%>" class="glyphicon glyphicon-remove btn btn-danger">Cancel</a></td>

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