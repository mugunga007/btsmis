
     <%     
         session.removeAttribute("userId");
         session.removeAttribute("password");
         session.invalidate();
     %>
     <jsp:forward page="Login.jsp"></jsp:forward>

