   
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
	 <link href="mystyle.css" rel="stylesheet">
   <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <script src="jquery-1.12.3.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<div class="row">
    <jsp:include page="UserHeader.jsp"></jsp:include>
</div>
<div class="clear"></div>
<div class="row">
<div class="col-md-4">
</div>
<div class="col-md-4">
<div class="well well-small"><center><h3>Add New Meter</h3></center></div>


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

<form class="form-horizontal" action="AddGenSetController" method="post">

  <div class="form-group">
         <label for="name" class=" control-label">ID</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="genSetId"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  <div class="form-group">
         <label for="name" class=" control-label">BTS</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="btsId"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
  <div class="form-group">
         <label for="name" class=" control-label">Manufacturer</label>
              
                <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span> </span>
                          <input type="text" name="manufacturer"  class="form-control" id="name" placeholder="" required="required"/>
                 </div> 
                 
  </div>
 
  
  
  
  <div class="form-group">
  <center>
  <div class="input-group">
 <input type="submit" class="btn btn-primary" value="Register"/>
  </div>
  </center>
  </div>
  
  
  
  </form>



</div>
<div class="col-md-4">
</div>
</div>
</div>



</body>
</html>