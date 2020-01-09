<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="reg.css">
<link rel="stylesheet" type="text/css" href="login.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirmed Reservation</title>
</head>
<body>
<a class="login100-form-title" href="index.html">Home</a>
			<br>
			<br>
			<br>
			<br>
			<br>

<%
	String depDate = (String) request.getSession().getAttribute("departDate");
	
%>		
 <div class="container wrap-input100" align="center">	  
<h3>Confirmed Reservation</h3>
	<form method="post" action="index.html"> 
	
	Success! Your flight reservation for your round trip has been confirmed please see reservation portal for more details!
<br>
<br>
	</form>
<a href="Logout.jsp" align="center"class="login100-form-btn wrap-input100 m-b-16" style="width:350px;align:center">Logout</a>

</div>
</body>
</html>