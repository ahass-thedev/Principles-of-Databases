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
	
<title>Aircrafts</title>
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
					response.sendRedirect("Index.Html");
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

Add a Aircraft:
<br>
	<form method="post" action="Cust_Rep5a.jsp">
	<table>
	<tr>    
	<td>Aircraft</td><td><input type="text" name="Name" maxlength=20 required></td>
	</tr>
	<input type="submit" value="submit"class="login100-form-btn wrap-input100 m-b-16"style="width:350px">
	</table>
	</form>
<br>
<br>
<hr>
<h1>Edit Aircraft:</h1>
<br>
	<form method="post" action="Cust_Rep5b.jsp">
	<table>
	<tr>   
	<td>Aircraft_Name</td><td><input type="text" name="Aircraft_Name" maxlength=30 required></td>
	</tr>
	</table>
	<h2>To....</h2>
	<table>
	<tr>
	<td>New_Name</td><td><input type="text" name="Name"></td>
	</tr>
	</table>
	<input type="submit" value="submit"class="login100-form-btn wrap-input100 m-b-16"style="width:350px">
	</form>
<br>
<hr>
Delete a Airport Entry:
<br>
	<form method="post" action="Cust_Rep5c.jsp">
		<table>
	<tr>    
	
	<td>Aircraft_Name</td><td><input type="text" name="Aircraft_Name" maxlength=30 required></td>
	</tr>
	
	</table>
	<input type="submit" value="submit"class="login100-form-btn wrap-input100 m-b-16"style="width:350px">
	</form>
<br>
<br>
<a href="index.html"class="login100-form-btn wrap-input100 m-b-16"style="width:350px">Back</a>
</div>
</body>
</html>