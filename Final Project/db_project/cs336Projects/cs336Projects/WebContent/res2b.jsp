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
			
<%
	
%>		
<div class="container wrap-input100" align="Center">	  
<h3>Reserve a Flight</h3>
	
	<form method="post" action="makeRes22.jsp">
	<table>
	<tr><td><strong>Airline Code </strong></td><td><input type="text" name="airID" maxlength="2"></td></tr>
	<tr><td><strong>Flight ID Number </strong></td><td><input type="text" name="flightID" maxlength="4"></td></tr>		
	</table>
	
	<h3>Who is traveling?</h3>
	<table cellspacing="10px">
	<tr><td><input placeholder="First Name"  type="text" name="firstName"></td>
	<td><input placeholder="Last Name" type="text" name="lastName"></td></tr>
	
	<tr><td><input placeholder="First Name"  type="text" name="firstName2"></td>
	<td><input placeholder="Last Name" type="text" name="lastName2"></td></tr>
	
	<tr><td><input placeholder="First Name"  type="text" name="firstName3"></td>
	<td><input placeholder="Last Name" type="text" name="lastName3"></td></tr>
	
	<tr><td><input placeholder="First Name"  type="text" name="firstName4"></td>
	<td><input placeholder="Last Name" type="text" name="lastName4"></td></tr>
	
	</table>
	
	<h3>How can we accommodate your travels?</h3>
	<td><strong>Seat Preference</strong></td>
	<select name="seatPreference" size=1>
	<option value="window">Window</option>
	<option value="middle">Middle</option>
	<option value="aisle">Aisle</option>
	<option value="none">No Preference</option>
	</select>&nbsp;

<h3>First Class / or Economy</h3><br>


<select name="clas" size=1>
	<option value="First Class/Business Class"> First Class/Business
    <option value="Economy"> Economy
	</select>&nbsp;<br>

	<td><strong>Dietary Restrictions</strong></td>
	<select name="mealPreference" size=1>
	<option value="none">No Restrictions</option>
	<option value="vegetarian">Vegetarian</option>
	<option value="vegan">Vegan</option>
	<option value="gluten">Gluten-free</option>
	</select>&nbsp;<br>
	</table>
	
	<br>
	<input type="submit" value="Complete return Flight"class="login100-form-btn wrap-input100 m-b-16"style="width:350px">
	</form>
<br>
<br>
</div>

</body>
</html>