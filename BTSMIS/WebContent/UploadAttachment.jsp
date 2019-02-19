<!DOCTYPE html>
<html >
<%@page import="service.User"%>
<%@page import="model.ItemModel"%>
<%@page import="service.Bts"%>
<%@page import="model.BtsModel"%>
 <%@page import="java.util.List"%>
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
            if(user != null){
            	int userId = user.getId();
             %>  

    

        <!--/. NAV TOP  -->

<%


//int itemId = Integer.parseInt(request.getParameter("itemId"));
//int itemC = Integer.parseInt(request.getParameter("itemC"));
//String itemName = im.getItem(itemId).getItemName();

// String usageId = session.getAttribute("usageId").toString();

%>
        <div class="container">
        
        <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                         <i class="fa fa-cogs text-success"></i>  <small>  Upload Attachment </small> 
                        </h1>
                    </div>
                </div>
                <!-- /. ROW  -->
        
        
        
            <div id="row">
<!-- CONTENTS START -->




<div class="col-md-4">
</div>


<div class="col-md-4">


<form class="form-horizontal" action="UploadProcess.jsp" method="post" enctype="multipart/form-data">
 
  
    <div class="form-group">
         <label for="name" class="control-label"> Upload Picture </label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="fa fa-image"></span> </span>
                          <input type="file" name="attachment" class="col-md-8 form-control"   required/>
                 </div> 
                 
  </div>
  
    
  
  <div class="form-group">
  <center>
  <div class="input-group">
 <input type="submit" class="form-control btn btn-primary" value="Report"/>
  </div>
  </center>
  </div>
  
  
  
  </form>

</div>

<div class="col-md-4">
</div>



<!-- CONTENTS END -->


            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->
<%
            }
            else
            {
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