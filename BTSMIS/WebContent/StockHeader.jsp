<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="service.User"%>
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

<body>
<%

 User user = (User) session.getAttribute("user");
            if(user != null){
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
               <li>
                <a href="AddItemUnit.jsp" ><i class="fa fa-edit"></i> Create Item Unit</a>
               </li>
               
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-user fa-fw"></i> <strong><%=user.getUsername() %>:</strong> <small><%=user.getRole() %> </small><i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
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

            }else{
%>

<jsp:forward page="Login.jsp"></jsp:forward>
<%

            }
%>
</body>

</html>