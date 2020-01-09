<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" type="text/css" href="reg.css">
  <link rel="stylesheet" type="text/css" href="login.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<title>Customer Representative 1</title>
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
	try {
			
			//Create a connection string
			String url = "jdbc:mysql://cs336.ctrr9ro7iyao.us-east-2.rds.amazonaws.com:3306/cs336";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "admin", "administrator");
					
			//Create a SQL statement
			Statement stmt = con.createStatement();

			// Check user id
			if(request.getSession().getAttribute("userid") != null){
				String id = (String) request.getSession().getAttribute("userid");
				//Make a SELECT query from the Employee table
				String str = "SELECT * FROM Emp_CustomerRep C WHERE C.ID = '" + id +"'";
				//Run the query against the database.
				ResultSet result = stmt.executeQuery(str);
				//Check the result
				if (!result.next() ) {
					//Employee is a Manager
					response.sendRedirect("Admin.jsp");
					}
			}
			else {
				// send back to employee login page
				response.sendRedirect("EmployeeHome.jsp");
			}
			
			//close the connection.
			con.close();

		} catch (Exception e) {
			out.print("Problem with Database, please contact help desk. Sorry for the inconvenience.");
			request.getSession().setAttribute("userid", null);
		}
%>


<h3>Reserve a Flight</h3>
	<form method="post" action="makeRes1a.jsp">
	<table>
	<tr><td><strong>Airline Code </strong></td><td><input type="text" name="airID" maxlength="2"></td></tr>
	<tr><td><strong>Flight ID Number </strong></td><td><input type="text" name="flightID" maxlength="4"></td></tr>
	<tr><td><strong>Origin</strong></td><td><input type="text" maxlength="3" name="origin"></td></tr>
	<tr><td><strong>Destination</strong></td><td><input type="text" maxlength="3" name="destination"></td></tr>
	<tr><td><strong>Date:</strong></td><td><input type="text" id="datepicker" name="departDate"></td></tr>
	<tr><td><strong>Account Number </strong></td><td><input type="text" name="accNo" maxlength="10"></td></tr>

	<tr><td>Customer needs an account to make a reservation</td></tr>
			<tr><td>click me to find account</td></tr>
	</table>
	
	<h3>Who is traveling?</h3>
	<table cellspacing="10">
	<tr><td><strong></strong></td><td><input placeholder="First Name" type="text" name="firstName">
	<strong></strong></td><td><input placeholder="Last Name" type="text" name="lastName"></td></tr>
	
	<tr><td><strong></strong></td><td><input placeholder="First Name" type="text" name="firstName2">
	<strong></strong></td><td><input placeholder="Last Name" type="text" name="lastName2"></td></tr>
	
	<tr><td><strong></strong></td><td><input placeholder="First Name" type="text" name="firstName3"> &nbsp;&nbsp;&nbsp;&nbsp;
	<strong></strong></td><td><input placeholder="Last Name" type="text" name="lastName3"></td></tr>
	
	<tr><td><strong></strong></td><td><input placeholder="First Name"  type="text" name="firstName4"> &nbsp;&nbsp;&nbsp;&nbsp;
	<strong></strong></td><td><input placeholder="Last Name" type="text" name="lastName4"></td></tr>
	</table>
	
	<h3>How can we accommodate your travels?</h3>
	<td><strong>Seat Preference</strong></td>
	<select name="seatPreference" size=1>
	<option value="window">Window</option>
	<option value="middle">Middle</option>
	<option value="aisle">Aisle</option>
	<option value="none">No Preference</option>
	</select>&nbsp;
	<br>
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
	<br>
	<h3>Method of Payment</h3>
	We accept the following credit card types: Visa, MasterCard, American Express, Discover.<p>
	<table>
	<td><strong>Type</strong><td>
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
	
	
	<br>
	<input type="submit" value="Confirm my reservation"class="login100-form-btn wrap-input100 m-b-16"style="width:350px">
<br>
<br>

<a href="Logout.jsp" class="login100-form-btn wrap-input100 m-b-16" style="width:350px">Logout</a>

<a href="Cust_Rep.jsp" class="login100-form-btn wrap-input100 m-b-16"style="width:350px">Back</a>
</div>


</body>
</html>
	