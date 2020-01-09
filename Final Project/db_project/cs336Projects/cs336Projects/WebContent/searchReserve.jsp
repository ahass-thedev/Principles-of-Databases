<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search and Reserve a Flight</title>
<style>
</style>
</head>
<body align = "center">
<%
if(request.getSession().getAttribute("accNo") == null){
	response.sendRedirect("index.html");
}
	
%>
<br>
<br>
			<a class="login100-form-title" href="index.html">Home</a>
<br>
<br>
<br>




<link rel="stylesheet" type="text/css" href="reg.css">
<link rel="stylesheet" type="text/css" href="login.css">

<div class="container-login100">
	
			<div class="wrap-login100">

				<form class="login100-form validate-form p-l-55 p-r-55 p-t-178">
					<span class="login100-form-title">
					Flights
						
					</span>	</form>
				
<h4 align = "center" >Search and Reserve for Available Flights</h4>	
		
<div class="container wrap-input100 login100-form p-l-55 p-r-55 ">
<form method="get" action="searchActions.jsp" enctype=text/plain>

 <select name="command">
  <option name="command" value="one"/> One-way
  <option name="command" value="round"/> Round-trip
  <option name="command" value="flex"/> Flexible Date/Time
  <option name="command" value="bestSeller"/> Sort All Flights By Fare
  <option name="command" value="Advanced"/> Filter
  <option name="command" value="dep"/> Sort By Takeoff Time
    <option name="command" value="arr"/> Sort By Landing Time
  </select>
  <br>
<br>
					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn">
						Search for Available Flights
							<br>
						</button>
						<br>
					</div>

</form>

<br>


<br>
<br>	

<div align = "Center">
<a href="Logout.jsp">Logout</a><br>
<a href="CustomerResPort.jsp">Reservation Portal</a> 
</div>
</div>
 
</body>
</html>