<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" type="text/css" href="reg.css">
<link rel="stylesheet" type="text/css" href="login.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search for Flights</title>
</head>
<body>
<a class="login100-form-title" href="index.html">Home</a>
			<br>
			<br>
			<br>
			<br>
			<br>
<div class="container wrap-input100" align="center">
<%
	
%>			  
<h3>Reserve a Flight</h3>

	
	<form method="post" action="checkout.jsp">
	<table>
	<tr>    
	<td><strong>Flight ID Number </strong></td><td><input type="text" name="flightID"></td>
	</tr>	
	
	<h3>Who is traveling?</h3>
	
	<tr><td><strong>First Name</strong></td><td><input type="text" name="firstName"></td></tr>
	<tr><td><strong>Last Name</strong></td><td><input type="text" name="lastName"></td></tr>
	<tr><td><strong>Address</strong></td><td><input type="text" name="addr"></td></tr>
	<tr><td><strong>City</strong></td><td><input type="text" name="city"></td></tr>
	<tr><td><strong>State</strong></td><td><input type="text" name="state"></td></tr>
	<tr><td><strong>Zip Code</strong></td><td><input type="text" name="zipcode"></td></tr>
	<tr><td><strong>Phone</strong></td><td><input type="text" name="phone"></td></tr>
	</table>
	
	<br>
	<input type="submit" value="Continue to checkout"class="login100-form-btn wrap-input100 m-b-16" style="width:350px">
	</form>
<br>
<br>
<a href="Logout.jsp" class="login100-form-btn wrap-input100 m-b-16" style="width:350px">Logout</a>

<a href="searchReserve.jsp"class="login100-form-btn wrap-input100 m-b-16"style="width:350px">Back</a>
</div>
</body>
</html>