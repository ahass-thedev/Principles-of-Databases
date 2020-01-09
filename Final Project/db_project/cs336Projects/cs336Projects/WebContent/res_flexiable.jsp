<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" type="text/css" href="reg.css">
<link rel="stylesheet" type="text/css" href="login.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker({ dateFormat: 'yy-mm-dd'});
  } );
  </script>
  <script>
	function onSubmit() {
	    document.getElementById("datepicker").value
	}
	</script>
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
<br>		  
<h3>Please enter in the corresponding airport codes.</h3>

	<form method="query" action="makeRes1.jsp">
	
	<table>
	<tr><td><strong>Airline Code </strong></td><td><input type="text" name="airID" maxlength="2"></td></tr>
	<tr><td><strong>Flight ID Number </strong></td><td><input type="text" name="flightID"></td></tr>
	<tr><td><strong>Date:</strong></td><td><input type="text" id="datepicker" name="departDate"></td></tr>
	</table> 
		
	<br>	
	<br>	
	<tr><td><strong>Who is traveling?</strong></td><td>
	
	
	<table cellspacing ="10px">
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
<br><br>

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
	<br><br>
	<h3>Method of Payment</h3>
	We accept the following credit card types: Visa, MasterCard, American Express, Discover.<p>
	<table>
	<br><br>
	<td><strong>Type</strong><td>
	<br>
		<select name="ccType" size=1>
		<option value="vs">Visa</option>
		<option value="mc">MasterCard</option>
		<option value="ax">American Express</option>
		<option value="ds">Discover</option>
		</select>&nbsp;<br>
	<tr><td><strong>Credit Card No.</strong></td><td><input type="text" name="ccno" maxlength="16"></td></tr>
	<tr><td><strong>Expiration Date</strong></td><td><input type="text" name="expiration" maxlength="5"></td></tr>
	<tr><td><strong>First Name</strong></td><td><input type="text" name="ccfirstName"></td></tr>
	<tr><td><strong>Last Name</strong></td><td><input type="text" name="cclastName"></td></tr>
	<tr><td><strong>Billing Address</strong></td><td><input type="text" name="ccbillAddr"></td></tr>
	</table>
	<input type="submit" value="Confirm my reservation" class="login100-form-btn wrap-input100 m-b-16"style="width:350px">
	</form>
	
<br>
<br>
<a href="Logout.jsp" class="login100-form-btn wrap-input100 m-b-16" style="width:350px">Logout</a>

<a href="searchReserve.jsp"class="login100-form-btn wrap-input100 m-b-16"style="width:350px">Back</a>
</div>
</body>
</html>