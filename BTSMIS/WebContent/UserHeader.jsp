
<%@page import="service.TicketHandlingReports"%>
<%@page import="model.OpenTicketModel"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html >
    <%@page import="service.User"%>
    <%@page import="java.util.List"%>
    <%@page import="model.InStockModel"%>
    <%@page import="model.FieldEngineerModel"%>
    <%@page import="model.RequestModel"%>
    <%@page import="model.RegionModel"%>
    <%@page import="model.ItemCategoryModel"%>
    <%@page import="model.SitesClassModel"%>
    <%@page import="model.SystemModel"%>
    <%@page import="model.UserModel"%>
    <%@page import="model.SitesCategoryModel"%> 
    <%@page import="model.BtsModel"%>
    <%@page import="model.BscModel"%>
    <%@page import="model.ItemUnitModel"%>
    <%@page import="model.AccessRequestModel"%>
    <head>

        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>BTSMIS</title>
        <!-- Bootstrap Styles-->
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
        <!-- FontAwesome Styles-->
        <link href="bower_components/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <!-- Morris Chart Styles-->
        <link href="bower_components/morrisjs/morris.min.css" rel="stylesheet" />
        <!-- Custom Styles-->
        <link href="custom/custom-styles.css" rel="stylesheet" />
        <!-- Google Fonts-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    </head> 
    <%
        InStockModel im = new InStockModel();
        RequestModel rm = new RequestModel();
        AccessRequestModel arm = new AccessRequestModel();

        BtsModel btm = new BtsModel();
        BscModel bsm = new BscModel();
        SitesCategoryModel sc = new SitesCategoryModel();
        SitesClassModel scm = new SitesClassModel();
        RegionModel rgm = new RegionModel();
        UserModel um = new UserModel();
        OpenTicketModel otm = new OpenTicketModel();
        TicketHandlingReports th=new TicketHandlingReports();
     
    %>
    <body>
        <%
            UserModel use = new UserModel();
            User user = (User) session.getAttribute("user");
            if (user != null) {
                int regionId = user.getRegion();
                String role = user.getRole();
                int level = user.getLevel();
                int id = user.getId();

        %>     
        <div id="wrapper">
            <img src="images/BTS.png" class="" width="100%" height="80px"/>
            <nav class="navbar navbar-default top-navbar" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                </div>

                <ul class="nav navbar-top-links navbar-right">
                    <%           if (role.equals("Field Engineer")) {
                    %>
                    <li class="dropdown">

                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                            <i class="fa fa-list-ul "></i>Ticket <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">

                            <li>

                                <a href="OpenedTicket.jsp" >
                                    <div>
                                        <i class="fa fa-list-ol "> </i>Open Ticket
                                    </div>

                                </a>



                            </li>

                            <li class="divider"></li>
                            <li>

                                <a href="ClosedTicket.jsp" >
                                    <div>
                                        <i class="fa fa-edit "> </i> Closed Ticket 
                                    </div>

                                </a>



                            </li>
                         
                            <li class="divider"></li>
                            <li>


                                <a href="SpecialTicket.jsp">
                                    <div>
                                        <i class="fa fa-list-ol "> </i>Special Ticket
                                        <span class="pull-right text-muted small"></span>
                                    </div>
                                </a>
                            </li>


    <li class="divider"></li>
                            <li>

                                <a href="AllTicketsByFE.jsp" >
                                    <div>
                                        <i class="fa fa-edit "> </i> All Tickets 
                                    </div>

                                </a>



                            </li>

                        </ul></li>
                    <li >
                        <a href="OpenedTicket.jsp" > <i class="fa fa-list-ul "> </i>Ticket</a>
                    </li>

                    <li >
                        <a href="UserItems.jsp" > <i class="fa fa-edit "> </i> Report Usage </a>
                    </li>

                    <li class="dropdown">





                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                            <i class="fa fa-cog fa-fw"></i> Your Stock <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">

                            <li>

                                <a href="UserItems.jsp" >
                                    <div>
                                        <i class="fa fa-list-ol "> </i> Your Items
                                    </div>

                                </a>



                            </li>

                            <li class="divider"></li>
                            <li>

                                <a href="RequestForm.jsp" >
                                    <div>
                                        <i class="fa fa-edit "> </i> Request an Item 
                                    </div>

                                </a>



                            </li>
                            <li class="divider"></li>
                            <li>


                                <a href="RequestListUser.jsp">
                                    <div>
                                        <i class="fa fa-list-ol "> </i> Requested Items
                                        <span class="pull-right text-muted small"> (<%=rm.getRequestedItemsByUser(user.getId()).size()%>) </span>
                                    </div>
                                </a>
                            </li>

                            <li class="divider"></li>
                            <li>


                                <a href="DeliveredToUser.jsp">
                                    <div>
                                        <i class="fa fa-shopping-cart "> </i> Delivery Received
                                        <span class="pull-right text-muted small"> (<%=rm.getRequestDeliveredByUser(user.getId()).size()%>)</span>
                                    </div>
                                </a>
                            </li>

                            <li class="divider"></li>
                            <li>


                                <a href="AllRequestsUser.jsp">
                                    <div>
                                        <i class="fa fa-check-square-o "> </i> Confirmed Deliveries
                                        <span class="pull-right text-muted small"> (<%=rm.getDeliveryConfirmedByUser(user.getId()).size()%>)</span>
                                    </div>
                                </a>
                            </li>


                        </ul>

                        <!-- /.dropdown-alerts -->

                    </li>


                    <!-- /.dropdown -->




                    <!-- /.dropdown-alerts -->


                    <li >
                        <a href="BtsList.jsp" > <i class="fa fa-list-ul "> </i>My Sites (<%=btm.getBtsByEngineer(id).size()%>)</a>
                    </li>







                    <%
                    } else if (role.equals("Operations Manager")) {
                    %>
                     <li>
                        <a href="RequestOperations.jsp" ><span class="fa fa-calendar"> </span>  Approvals (<%=rm.getRequestApprovalsOperation(level).size()%>)</a>
                    </li> 
     
                           <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                            <i class="fa fa-cog fa-fw"></i> Ticket <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="AllTicketByOM.jsp">
                                    <div>
                                      <i class="fa fa-cogs fa-fw"></i> All ticket
                                        <span class="pull-right text-muted small">(<%=otm.getAllTicket().size()%>)</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="SpecialTicketByOM.jsp">
                                    <div>
                                        <i class="fa fa-cogs fa-fw"></i>Special ticket
                                        <span class="pull-right text-muted small"> </span>
                                    </div>
                                </a>
                            </li>

                        </ul>
                        <!-- /.dropdown-alerts -->
                    </li>
                   
           <li>
                        <a href="AddPatner.jsp" ><span class="fa fa-plus"> </span>Partner (<%=rm.getRequestApprovalsOperation(level).size()%>)</a>
                    </li> 

                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                            <i class="fa fa-cog fa-fw"></i> Create & View (Stock) <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">

                            <li>

                                <a href=ItemsReportOpe.jsp>
                                    <div>
                                        <i class="fa fa-archive"></i> Stock Report
                                    </div>
                                </a>

                            </li>

                            <li class="divider"></li>
                            <li>
                                <a href="AddItemCategory.jsp">
                                    <div>
                                        <%
                                            ItemCategoryModel icm = new ItemCategoryModel();
                                            SystemModel sy = new SystemModel();
                                        %>
                                        <i class="fa fa-cogs fa-fw"></i> Add Item Category
                                        <span class="pull-right text-muted small">(<%=icm.getItemCategoryList().size()%>)</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="AddSystem.jsp">
                                    <div>
                                        <i class="fa fa-cogs fa-fw"></i> Add Item System
                                        <span class="pull-right text-muted small"> (<%=sy.getSystemList().size()%>)</span>
                                    </div>
                                </a>
                            </li>


                        </ul>
                        <!-- /.dropdown-alerts -->
                    </li>
                    <!-- /.dropdown -->


                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                            <i class="fa fa-cog fa-fw"></i> Region <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="RegionForm.jsp">
                                    <div>
                                      <i class="fa fa-cogs fa-fw"></i> Regions
                                        <span class="pull-right text-muted small">(<%=rgm.getRegionList().size()%>)</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="AddRegionManager.jsp">
                                    <div>
                                        <i class="fa fa-cogs fa-fw"></i> Region Managers
                                        <span class="pull-right text-muted small"> (<%=um.getUserByRole("Region Manager").size()%>)</span>
                                    </div>
                                </a>
                            </li>

                        </ul>
                        <!-- /.dropdown-alerts -->
                    </li>
                    <!-- /.dropdown -->

                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                            <i class="fa fa-cog fa-fw"></i> Sites <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="AddBSC.jsp">
                                    <div>

                                        <i class="fa fa-cogs fa-fw"></i> B.S.C
                                        <span class="pull-right text-muted small">(<%=bsm.getAllBsc().size()%>)</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="AddBTS.jsp">
                                    <div>
                                        <i class="fa fa-cogs fa-fw"></i> B.T.S
                                        <span class="pull-right text-muted small"> (<%=btm.getAllBts().size()%>)</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="SitesCategory.jsp">
                                    <div>
                                        <i class="fa fa-cogs fa-fw"></i> Site Category
                                        <span class="pull-right text-muted small"> (<%=sc.getSitesCategoryList().size()%>)</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="AddSitesClass.jsp">
                                    <div>
                                        <i class="fa fa-cogs fa-fw"></i> Site Class
                                        <span class="pull-right text-muted small"> (<%=scm.getSitesClassList().size()%>)</span>
                                    </div>
                                </a>
                            </li>

                        </ul>
                        <li >
                            <a href="ReportsByOM.jsp" > <i class="fa fa-list-ul "> </i>Report</a>
                        </li>
                        <!-- /.dropdown-alerts -->
                    </li>
                    <!-- /.dropdown -->



                    <li>
                        <%
                            FieldEngineerModel fm = new FieldEngineerModel();
                            String field = "Field Engineer";
                        %>
                        <a href="AddFieldEngineer.jsp" ><span class="glyphicon glyphicon-plus"> </span>Add Field Eng. (<%=use.getUserByRole(field).size()%>)</a>

                    </li>


                    <%
                        }
                        if (role.equals("Region Manager")) {
                    %>
      <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                            <i class="fa fa-cog fa-fw"></i> Ticket <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="OpenTicketByRM.jsp">
                                    <div>
                                        <%


                                        %>
                                        <i class="fa fa-cogs fa-fw"></i> Open ticket
                                        <span class="pull-right text-muted small">(<%=th.getAllOpenTicketByRM(user.getRegion()).size()%>)</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="ClosedTicketByRM.jsp">
                                    <div>
                                        <i class="fa fa-cogs fa-fw"></i> Closed ticket
                                        <span class="pull-right text-muted small">(<%=th.getAllOpenTicketByRM(user.getRegion()).size()%>)</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="SpecialTicketByRM.jsp">
                                    <div>
                                        <i class="fa fa-cogs fa-fw"></i>Special ticket
                                        <span class="pull-right text-muted small"> </span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="AllTicketByRM.jsp">
                                    <div>
                                        <i class="fa fa-cogs fa-fw"></i>All tickets
                                        <span class="pull-right text-muted small">(<%=th.getAllTicketByRM(user.getRegion()).size()%>)</span>
                                    </div>
                                </a>
                            </li>

                        </ul>
                        <!-- /.dropdown-alerts -->
                    </li>
                    <li>
                        <a href="RequestRegion.jsp" ><span class="fa fa-calendar"> </span>  Approvals (<%=rm.getRequestApprovalsRegionSize(level, regionId).size()%>)</a>
                    </li>


                    <li>
                        <a href="AddGenSet.jsp" ><span class="glyphicon glyphicon-plus"> </span>   Add genset</a>
                    </li>

                    <li>
                        <a href="FieldEngineerRegion.jsp" ><span class="fa fa-list-ol"> </span> field engineers(<%=use.getFieldEngineerByRegion(regionId).size()%>)</a>
                    </li>

                    <li >
                        <a href="BtsByRegion.jsp" > <i class="fa fa-list-ul "> </i>  Sites From <%=rgm.getRegion(regionId).getRname()%> (<%=btm.getBtsByRegion(regionId).size()%>)</a>
                    </li>
                    <li >
                        <a href="ReportByRegionManager.jsp" > <i class="fa fa-list-ul "> </i>Report</a>
                    </li>

                    <%

                        }
                        if (role.equals("Partner")) {
                    %>



                    <li>
                        <a href="ChooseBTSAccess.jsp" ><span class="fa fa-edit"> </span>  Request Access</a>
                    </li>
                    <li>
                        <%

                        %>
                        <a href="AccessRequested.jsp" ><span class="fa fa-list-ol"> </span>  Requested Access (<%=arm.getAccessRequestByPartner(id).size()%>)</a>
                    </li>

                    <%
                    } else if (role.equals("NOC")) {
                    %>

                    <li>
                        <a href="PendingApprovals.jsp" ><span class="fa fa-calendar"> </span>  Pending Approvals (<%=arm.getPendingRequests().size()%>)</a>
                    </li>



                    <li>
                        <a href="AccessRequested.jsp" ><i class="fa fa-list-ul"> </i> All Requests (<%=arm.getAccessRequestByPartner(id).size()%>)</a>
                    </li>

                    <li>

                        <li class="dropdown">

                            <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                                <i class="fa fa-user fa-fw"></i>Ticket </small><i class="fa fa-caret-down"></i>
                            </a> 
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="AllBts.jsp"><i class="fa fa-openid"></i> Open</a>
                                </li>

                                <li class="divider"></li>
                                <li><a href="AllTickets.jsp"><i class="fa fa-sign-out fa-fw"></i> View</a>
                                </li>
                            </ul>
                        </li>
                    </li>




                    <%

                        }
                    %>



                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                            <i class="fa fa-user fa-fw"></i> <%=user.getFname()%> <%=user.getLname().toUpperCase().charAt(0) %>.: <small><%=user.getRole()%> </small><i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="UserProfile.jsp?id=<%=id%>"><i class="fa fa-user fa-fw"></i> User Profile</a>
                            </li>

                            <li class="divider"></li>
                            <li><a href="logout.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                            </li>
                        </ul>
                        <!-- /.dropdown-user -->
                    </li>
                    <!-- /.dropdown -->
                </ul>
            </nav>



            <!--/. NAV TOP  -->
        </div>
        <!-- JS Scripts-->
        <!-- jQuery Js -->
        <script src="custom/jquery-1.10.2.js"></script>
        <!-- Bootstrap Js -->
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <!-- Metis Menu Js -->
        <script src="jquery.metisMenu.js"></script>

        <!-- Custom Js -->
        <script src="custom/custom-scripts.js"></script>



        <%

        } else {
        %>

        <jsp:forward page="Login.jsp"></jsp:forward>
        <%
            }
        %>
    </body>

</html>