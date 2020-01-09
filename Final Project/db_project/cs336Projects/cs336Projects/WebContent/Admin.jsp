<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
 <link rel="stylesheet" type="text/css" href="reg.css">
  <link rel="stylesheet" type="text/css" href="login.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Home</title>
</head>
<body>
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
				if (!result.next() ) {
					//Employee is a Customer Rep
					response.sendRedirect("Cust_Rep.jsp");
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

<body>	
	  			<a class="login100-form-title" href="index.html">Home</a>
<br>
<br>
<br>
<br>
<br>
<br>
 <div class="container wrap-input100" align="center">
 
Pick one of the Manager Actions below:
<br>
<br>
<br>

<form method="get" action="ManagerActions.jsp" enctype=text/plain align="center">
    <!-- note the ManagerActions.jsp will be invoked when the choice is made -->
	<!-- The next lines give HTML for radio buttons being displayed -->
	<div>
	<select name = "command" style="width:500px;font-size:20px">
  <option name="command" value="1"/> Add, Edit and Delete information for an employee/customer
  <br>
  <option name="command" value="2"/> Obtain a sales report for a particular month
  <br>
  <option name="command" value="3"/> Produce a comprehensive listing of all flights
  <br>
  <option name="command" value="4"/> Produce a list of reservations by flight number or by customer name
  <br>
  <option name="command" value="5"/> Produce a summary listing of revenue generated by a particular flight, destination city, or customer
  <br>
  <option name="command" value="6"/> Determine which customer generated most total revenue
  <br>
  <option name="command" value="7"/> Produce a list of most active flights
  <br>
  <option name="command" value="9"/> Produce a list of all flights for a given airport
  
    </select>
    <br>
    <br>
    <div align="center">
  <input type="submit" value="submit" class="login100-form-btn wrap-input100 m-b-16"style="width:350px"/>
  </div>
</form>
<br>

	<div align="center">
<a href="Logout.jsp" class="login100-form-btn wrap-input100 m-b-16" style="width:350px">Logout</a>
 </div>
	<div align="center">
<a href="EmployeeHome.jsp"class="login100-form-btn wrap-input100 m-b-16"style="width:350px">Back</a>
</div>
	</div>


</body>
</html>