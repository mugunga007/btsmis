<%@ page import="java.sql.*" %>
<%
//Statement st=null;
Connection con=null;


Class.forName("com.mysql.jdbc.Driver");
        Connection kon = DriverManager.getConnection("jdbc:mysql://localhost:3306/htestnew", "root", "");
       // Connection kon = DriverManager.getConnection("jdbc:mysql://198.38.82.203:3306/brunonse_bts", "brunonse_bruno", "vwI.fnORBSsb");
//st=con.createStatement();
%>
