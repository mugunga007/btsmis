
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html >

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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
</head> 
    <script>
$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
});
</script>

<body>
     
    <div id="wrapper">
    <img src="images/BTS.png" class="" width="100%" height="80px"/>
                 
              
       
        
        <!--/. NAV TOP  -->
                           </div>
                           
                           <div class="container">
    <div class="row">
    
    </div>
    
    <div class="row">
   
                    <div class="col-md-12">
                        <h1 class="page-header text-center">
                 <small>  Welcome to BTS Management Information System  </small>   
                   
                        </h1>
                        <h3> <button type="button" class="btn btn-success text-success text-center" <i center-block fa fa-user id="myBtn"></i>Login</button>
                        </h3>      
                                      </div>
                </div>
           
                               <div class="container">
 
             
                <ul class="nav" id="main-menu">
 
                    <li>
                        <a href="OurServices.jsp"><i class="fa fa-list-alt"></i>Services</a>
                    </li>
                    <li>
                        <a href="Contacts.jsp"><i class="fa fa-user"></i>Contacts</a>
                    </li>
		  </ul>
 
      
          <%
 if(request.getAttribute("wrong")!=null){
 %>
 
 <div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
Invalid Credentials
</div>


 
 <%
 }
 %>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
            <form class="form-horizontal" action="LoginController" method="post">
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
              <input type="text" class="form-control" id="usrname" name="username" required="true" placeholder="Enter email"></input>
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" id="psw" name="password" required="true" placeholder="Enter password"></input>
            </div>
             
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          
        </div>
      </div>
      
    </div>
  </div> 
</div>
   <div class="row">
   </br>
 
  
   
     <img src="images/homepic.jpg" class="center-block" width="60%" height="350px"/>
   
    </div>
    
    </div>  
                           
  
    
 

</body>

</html>