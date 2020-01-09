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
<title>Admin2</title>
</head>
<body>
	  			<a class="login100-form-title" href="admin.jsp"> Admin Home</a>
<br>
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
				String str = "SELECT * FROM Emp_Manager M WHERE M.ID = '" + id +"'";
				//Run the query against the database.
				ResultSet result = stmt.executeQuery(str);
				//Check the result
				
			}
			else {
				// send back to employee login page
				response.sendRedirect("EmployeeHome.jsp");
			}
			
			//close the connection.
			con.close();

		} catch (Exception e) {
			out.print("Problem with Database, Sorry for the inconvenience.");
			request.getSession().setAttribute("userid", null);
		}
%>
<br>
Choose a month and year from to drop down lists to obtain a sales report for the particular month and group/sort using the options below:
<br>
<br>
<pre>
  Month:      Year:       Sort By:</pre>
<form action="Admin2a.jsp">
  <select name="month">
    <option value="1">January</option>
    <option value="2">February</option>
    <option value="3">March</option>
    <option value="4">April</option>
    <option value="5">May</option>
    <option value="6">June</option>
    <option value="7">July</option>
    <option value="8">August</option>
    <option value="9">September</option>
    <option value="10">October</option>
    <option value="11">November</option>
    <option value="12">December</option>
  </select>
    <select name="year">
    <option value="2019">2019</option>
    <option value="2018">2018</option>
  </select>
   	<select name="group">
    <option value="CR">Customer Rep</option>
    <option value="TF">Total Fare</option>
    <option value="BF">BookingManager Fee</option>
   	<option value="dated">Date (most recent first)</option>
    <option value="datea">Date (most recent last)</option>
  </select>
  <input type="submit" value="Submit"class="login100-form-btn wrap-input100 m-b-16"style="width:350px">
</form>
</div>
		<div align="center">
<a href="Logout.jsp" class="login100-form-btn wrap-input100 m-b-16" style="width:350px">Logout</a>
</div>
<div align="center">
<a href="Cust_Rep.jsp"class="login100-form-btn wrap-input100 m-b-16"style="width:350px">Back</a>
</div>
<br>
<br>


</body>
</html>