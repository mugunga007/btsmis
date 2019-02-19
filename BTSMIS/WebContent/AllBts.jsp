<!DOCTYPE html>
<html >
    <%@page import="java.util.List"%>
    <%@page import="model.InStockModel"%>
    <%@page import="model.RequestModel"%>
    <%@page import="service.Request"%>
    <%@page import="model.ItemModel"%>
    <%@page import="model.RegionModel"%>
    <%@page import="service.SitesClass"%>
    <%@page import="service.User"%>
    <%@page import="model.BtsModel"%>
    <%@page import="model.SitesClassModel"%>
    <%@page import="service.Bts"%>
    <%@page import="model.BscModel"%>
    <%@page import="model.UserModel"%>
    <%@page import="service.Bsc"%>
    <%@page import="service.SitesCategory"%>
    <%@page import="model.FieldEngineerModel"%>
    <%@page import="model.SitesCategoryModel"%>
    <%@page import="service.FieldEngineer"%>
    <%@page import="service.Region"%>
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
            UserModel use = new UserModel();
            User user = (User) session.getAttribute("user");
            if (user != null) {
                int userId = user.getId();
        %>  
        <%
            BtsModel btm = new BtsModel();
        %>


        <!--/. NAV TOP  -->


        <div class="container">

            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header ">
                        <i class="fa fa-edit text-success"></i>  <small>Add BTS  <small>(B.T.S)</small></small>
                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->



            <div id="row">
                <!-- CONTENTS START -->

                <div class="col-md-3">


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

                    <form class="form-horizontal" action="AddBtsController" method="post">


                        <%
                            RegionModel is = new RegionModel();

                            String role = "Field Engineer";
                            SitesClassModel ic = new SitesClassModel();

                            SitesCategoryModel ics = new SitesCategoryModel();
                        %>

                    </form>



                </div>


                <div class="col-md-9">

                    <!--   TABLE -->


                    <div class="panel panel-default">
                        <div class="panel-heading">

                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>


                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>BSC</th>
                                            <th>Region </th>
                                            <th>Engineer</th>
                                            <th>Class</th>
                                            <th>Category</th>
                                            <th>Ticket</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            BscModel bsm = new BscModel();

                                            List<Bts> lis = btm.getAllBts();
                                            for (Bts it : lis) {
                                        %>                        
                                        <tr>
                                            <td><%=it.getBtsId()%></td>
                                            <td><%=it.getBtsName()%></td>
                                            <td><%=bsm.getBsc(it.getBscId()).getBscName()%></td>
                                            <td><%=is.getRegion(it.getRegionId()).getRname()%></td>
                                            <td><%=use.getUser(it.getEngineerId()).getFname()%> <%=use.getUser(it.getEngineerId()).getLname()%></td>

                                            <td><%=ic.getSitesClass(it.getSitesclass()).getName()%></td>
                                            <td><%=ics.getSitesCategory(it.getSitescategory()).getName()%></td>
                                            <td><a href="OpenTicketForm.jsp?btsId=<%=it.getBtsId()%>" class="btn btn-default"><i class="fa fa-edit"></i> Open ticket</a></td>
                                        </tr>
                                        <%} %>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>




                    <!--   TABLE END -->


                </div>
                <!-- CONTENTS END -->


                <!-- /. PAGE INNER  -->
            </div>
            <!-- /. PAGE WRAPPER  -->
        </div>
        <!-- /. WRAPPER  -->

        <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class=" modal-header">
                        <i class="fa fa-trash"></i>  Delete
                    </div>
                    <div class="modal-body">
                        Are You Sure You want to delete this item?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"></i> Cancel</button>
                        <a href="" class="btn btn-danger btn-ok"><i class="fa fa-check"> Delete </i></a>
                    </div>
                </div>
            </div>
        </div>
        <script>

            $('#confirm-delete').on('show.bs.modal', function (e) {
                $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
            });
        </script>



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