<!DOCTYPE html>
<html >
 <%@page import="java.util.List"%>
<%@page import="service.User"%>
<%@page import="model.ItemUsageModel"%>
<%@page import="service.ItemUsage"%>
<%@page import="model.ItemModel"%>
<%@page import="service.Item"%>

<head>


  <!-- FOCUS IMAGE -->
    
    <style>
#myImg {
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s;
}

#myImg:hover {opacity: 0.7;}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
}

/* Modal Content (image) */
.modal-content {
    margin: auto;
    display: block;
    width: 60%;
    max-width: 500px;
}

/* Caption of Modal Image */
#caption {
    margin: auto;
    display: block;
    width: 80%;
    max-width: 700px;
    text-align: center;
    color: #ccc;
    padding: 10px 0;
    height: 150px;
}

/* Add Animation */
.modal-content, #caption {    
    -webkit-animation-name: zoom;
    -webkit-animation-duration: 0.6s;
    animation-name: zoom;
    animation-duration: 0.6s;
}

@-webkit-keyframes zoom {
    from {-webkit-transform:scale(0)} 
    to {-webkit-transform:scale(1)}
}

@keyframes zoom {
    from {transform:scale(0)} 
    to {transform:scale(1)}
}

/* The Close Button */
.close {
    position: absolute;
    top: 15px;
    right: 35px;
    color: #f1f1f1;
    font-size: 40px;
    font-weight: bold;
    transition: 0.3s;
}

.close:hover,
.close:focus {
    color: #bbb;
    text-decoration: none;
    cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px){
    .modal-content {
        width: 100%;
    }
}
</style>
    
    <!-- FOCUS IMAGE -->




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
                            int itemId = Integer.parseInt(request.getParameter("itemId"));
                            ItemModel im = new ItemModel();
                            %>

<%

 User user = (User) session.getAttribute("user");
            if(user != null){
            	int userId = user.getId();
             %>  

    

        <!--/. NAV TOP  -->


        <div class="container">
        
        <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                       <i class="fa fa-dashboard text-success"></i>     <small>Usage Report of <%=im.getItem(itemId).getItemName() %></small>
                        </h1>
                    </div>
                </div>
                <!-- /. ROW  -->
        
        
        
            <div id="row">
<!-- CONTENTS START -->


 <div class="panel panel-default">
                        <div class="panel-heading">
                            
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                        <tr>

                            <th>Image</th>
                           
                            <th>Quantity</th>
                            
                            <th>BTS</th>
                            
                            <th>Run Hours</th>
                            
                            
                            <th>Date</th>

							 <th>Note</th>
							 
                        </tr>
                        </thead>
                        <tbody>
<% 

//ItemUsage iu = new ItemUsage();
ItemUsageModel ic = new ItemUsageModel();
                            List<ItemUsage> list = ic.getUserItemUsageItem(userId, itemId);
                            for (ItemUsage it : list) {
                        %>                        
                        <tr class="">

  <td><img id="myImg" src="uploadTest<%=it.getAttachment()%>" class=" img-responsive" width="50px" height="50px">  </td>
                            <td><%=it.getQuantity()%></td>
                          
                           <td><%=it.getBtsId()%></td>
                            
                             <td><%=it.getRunHour()%></td>
                            
 <td><%=it.getDate()%></td>
 
  <td><%=it.getNote()%></td>
 
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
    
<!-- FOCUS IMAGE -->
<!-- The Modal -->
<div id="myModal" class="modal">
  <span class="close">�</span>
  <img class="modal-content" id="img01">
  <div id="caption"></div>
</div>

<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the image and insert it inside the modal - use its "alt" text as a caption
var img = document.getElementById('myImg');
var modalImg = document.getElementById("img01");
var captionText = document.getElementById("caption");
img.onclick = function(){
    modal.style.display = "block";
    modalImg.src = this.src;
    modalImg.alt = this.alt;
    captionText.innerHTML = this.alt;
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() { 
    modal.style.display = "none";
}
</script>
<!-- FOCUS IMAGE -->

</body>

</html>