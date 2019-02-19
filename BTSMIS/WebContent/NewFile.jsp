<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String n = request.getParameter("co");

%>
 <%=n %>
<script type="text/javascript">
var el = document.getElementById("data");
el.value = "Needed_value";
</script>
<form action="NewFile.jsp" method="POST">
<input id="data" type="hidden" name="co" value="" />
<input type="submit" />
</form>

</body>
</html>