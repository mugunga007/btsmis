<!DOCTYPE html>
<html>
<head>
<script>
</script>
</head>
<body>
<button class="button-links" >go to index</button>
<p>Hey i am the temp user</p>
<form action="index2.jsp">
<input type="text" name="fn"/>
<input type="text" name="ln" value="<%=request.getParameter("fname")%>"/>
<input type="submit" value="send" onclick="loadDoc()"/>
</form>


</br> of <%=request.getParameter("lname") %></br>
</body>
</html>
