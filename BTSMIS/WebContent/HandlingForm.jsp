<!DOCTYPE html>
<html >
    <%@page import="java.util.List"%>
    <%@page import="model.InStockModel"%>
    <%@page import="model.RequestModel"%>
    <%@page import="service.Request"%>
    <%@page import="model.ItemModel"%>
    <%@page import="model.RegionModel"%>
    <%@page import="model.BtsModel"%>
    <%@page import="model.UserModel"%>
    <%@page import="model.FieldEngineerModel"%>
    <%@page import="service.User"%>
    <%@page import="service.Region"%>
    <%@page import="service.FieldEngineer"%>
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

            int engid = 0;
            String eng = (request.getParameter("engid"));
            User sc = new User();

            UserModel scm = new UserModel();
            if (eng != null) {
                engid = Integer.parseInt(eng);
                sc = scm.getUser(engid);
            }

            UserModel use = new UserModel();
            User user = (User) session.getAttribute("user");
            if (user != null) {
                int userId = user.getId();
        %>  
        <%
            InStockModel im = new InStockModel();

            RequestModel rm = new RequestModel();
            BtsModel btm = new BtsModel();
            FieldEngineerModel fm = new FieldEngineerModel();

        %>


        <!--/. NAV TOP  -->


        <div class="container">

            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        <i class="fa fa-edit text-success"></i>    <small>Issue handling form</small>
                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->



            <div id="row">
                <!-- CONTENTS START -->

                <div class="col-md-3">


                    <%    if (request.getAttribute("success") != null) {
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




                </div>


                <div class="col-md-9">


                    <div class="panel panel-default">

                        <div class="panel-body">
                            <div class="table-responsive">
                                <form class="form-horizontal" action="SpecialHandlingController" method="post">
                                    <%
                                        String serviceRequestId = request.getParameter("serviceRequestId");
                                    %>
                                    <input type="hidden" name="serviceRequestId" value="<%=serviceRequestId%>" />
                                    <div class="form-group">


                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> Issue handling description</span>
                                            <textarea name="handling" rows="5" cols="80">
                                            </textarea>
                                        </div> 

                                    </div>

                                    <div class="form-group">


                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span>Is there a part replaced ?</span>
                                            Yes <input type="radio" name="replacement" value="Yes" />
                                            No <input type="radio" name="replacement" value="No" checked="checked" />
                                        </div> 

                                    </div> 
                                    <div class="form-group">
                                        <center>
                                            <div class="input-group">

                                                <input type="submit" class="btn btn-primary"  value="Record" />
                                            </div>
                                        </center>
                                    </div>



                                </form>

                            </div>
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