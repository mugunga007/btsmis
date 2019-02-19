<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.DataInputStream"%>
 <%@page import="java.util.Date"%>
<%@page import="service.ItemUsage"%>
<%@page import="model.ItemControllerModel"%>

<%@page import="service.Bts"%>
<%@page import="model.ItemUsageModel"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>   </title>
</head>
<body>


<%
String userId = request.getParameter("userId");
String quantity = (request.getParameter("quantity"));
String note =  request.getParameter("note");
//int quant =(int) Integer.parseInt(quantity);

int q = Integer.parseInt(quantity);

out.print(quantity);


%>



</body>
</html>