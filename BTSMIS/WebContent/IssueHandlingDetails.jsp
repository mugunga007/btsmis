<%@page import="service.SitesCategory"%>
<%@page import="service.SitesCategory"%>
<%@page import="model.SitesCategoryModel"%>
<%@page import="service.SitesClass"%>
<%@page import="model.SitesClassModel"%>
<%@page import="service.Region"%>
<%@page import="model.RegionModel"%>
<%@page import="model.BscModel"%>
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
UserModel use = new UserModel();
            User user = (User) session.getAttribute("user");
            if (user != null) {
                int userId = user.getId();
                
        %>  



        <!--/. NAV TOP  -->


        <div class="carousel">

            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        <i class="fa fa-dashboard text-success"></i>     <small>Issue handling details</small>
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
                <div class="panel panel-default">
                    <div class="panel-heading">

                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover">
                                <%
                                    String referenceId = request.getParameter("referenceId");
                                    OpenTicketModel ic = new OpenTicketModel();
                                    List<OpenTicket> list = ic.getAllTicketByTicketId(referenceId);
                                    for (OpenTicket it : list) {

                                %>
                                <tbody>
                                    <tr>
                                        <td>Reference ID</td>
                                        <td><%=it.getReferenceId()%></td>
                                    </tr>
                                    <tr>
                                        <td>Site ID</td>
                                        <td><%=it.getSiteId()%></td>
                                    </tr>
                                    <tr>
                                        <td>Handling</td>
                                        <td><%=it.getHandling()%></td>
                                    </tr>
                                    <tr>
                                        <td>Departure</td>
                                        <td><%=it.getDeparture()%></td>
                                    </tr>

                                    <tr>
                                        <td>Status at departure</td>
                                        <td><%=it.getStatusDeparture()%> </td>
                                    </tr>
                                    <tr>
                                        <td>Running hours</td>
                                        <td><%=it.getRunHours()%></td>
                                    </tr>
                                    <tr>
                                        <td>CP Index</td>
                                        <td><%=it.getCpIndex()%></td>
                                    </tr>
                                    <tr>
                                        <td>Service request</td>
                                        <td><%=it.getServiceRequest()%></td>
                                    </tr>
                                    <%
                                        if (it.getServiceRequest().equals("Yes") && user.getRole().equals("Operations Manager") ) {
                                    %>
                                    <tr>
                                        <td>Assign new field engineer</td>
                               
                                        <td>   <div class="form-group">
                                                 <form action="ServiceRequestController" method="get">
                                          <div class="input-group">
                                              <input type="hidden" name="referenceId" value="<%=it.getReferenceId()%>" />
                                              <input type="hidden" name="btsId" value="<%=it.getSiteId()%>" />
                                        <select name="fengineerId"  class="form-control">

                                            <%
                                               
                                               RegionModel is = new RegionModel();
                                               BtsModel btm = new BtsModel(); 
                                                //  FieldEngineerModel fe = new FieldEngineerModel();
                                                String role = "Field Engineer";
                                                List<User> lists = use.getUserByRole(role);
                                                for (User p : lists) {
                                                    
                                            %>
                                           
                                            <option value="<%=p.getId()%>"><%=p.getFname()%> <%=p.getLname()%>, <small> <%=is.getRegion(p.getRegion()).getRname()%></small> </option>
                                         
                                            <%
                                                }
                                            %>

                                        </select>
</div> 
                                            <input type="submit" value="Assign" /></form>
                                    

                                            </div></td></form>
                                </tr>
                                <%} else%>
                                <tr>
                                    <td>Reason for request</td>
                                    <td><%=it.getReason() %></td>
                                </tr>
                                <tr>
                                    <td>Downtime</td>
                                    <td><%=it.getDowntime()%></td>
                                </tr>
                                <tr>
                                    <td>Status</td>
                                    <td><%=it.getStatus()%></td>
                                </tr>
                                <tr>
                                    <td>Closure</td>
                                    <td><%=it.getClosure()%></td>
                                </tr>



                                <%}%>    
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