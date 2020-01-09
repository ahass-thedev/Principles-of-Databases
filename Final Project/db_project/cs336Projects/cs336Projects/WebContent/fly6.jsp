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
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  
  <script>
  $( function() {
   /*  $( "#datepicker" ).datepicker({ dateFormat: 'yy-mm-dd',maxDate: 30}); */
    $( "#datepicker" ).datepicker({ dateFormat: 'yy-mm-dd',minDate: 1});
  } );
  </script>
  <script>
	function onSubmit() {
	    document.getElementById("datepicker").value
	}
	</script>
<title>Search for Flights(30 days advance)</title>
</head>
<body>
				<a class="login100-form-title" href="index.html">Home</a>
<br>
<br>
<br>
<br>
<br>
<br>
 <div class="container wrap-input100" align="center">
 
	  
<h3>Customized Search</h3>

	<form method="query" action="Filter.jsp">
	Please Enter your Filters
	<table>
	<P>Please enter All Parameters<p>
	<tr><td><strong>Price(Min)</strong></td><td><input type="text" maxlength="4" name="min"></td>
	<td><strong>Price(Max)</strong></td><td><input type="text" maxlength="4" name="max"></td></tr>
	<tr><td><strong>Number of Stops</strong></td><td><input type="text" maxlength="1" name="numB"></td></tr>
	<tr><td><strong>Airline(AC,UL,CS, etc)</strong></td><td><input type="text"  maxlength="3" name="airline"></td></tr>
	</table> 
	</div>
	
<div align="center">
	<input type="submit" value="Search" class="login100-form-btn wrap-input100 m-b-16"style="width:350px">
	
	</form>
	<div>
<a href="Logout.jsp" class="login100-form-btn wrap-input100 m-b-16" style="width:350px">Logout</a>
</div>
<div>
<a href="searchReserve.jsp"class="login100-form-btn wrap-input100 m-b-16"style="width:350px">Back</a>
</div>
</div>
<br>
<br>

</body>
</html>