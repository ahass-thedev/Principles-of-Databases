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
<title>CustomerRep3a</title>
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

			//Get parameters from the HTML form at the Admin1.jsp
			String Airport_ID = request.getParameter("Airport_ID");
			String Name = request.getParameter("Name");
			String City = request.getParameter("City");
			String Country = request.getParameter("Country");
	
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		


		

		
			//Make an insert statement for the Flight table:
			String insert = "INSERT INTO Airport (Airport_ID, Name, City, Country)"
					+ "VALUES (?, ?, ?, ?)";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				PreparedStatement ps = con.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, Airport_ID);
			ps.setString(2, Name);
			ps.setString(3, City);
			ps.setString(4, Country);

	

			//Run the query against the DB
			ps.executeUpdate();

			//Make an insert statement for the Employee table:
		

			//Close the connection.
			con.close();
			
			out.print("insert succeeded");
		} catch (Exception e) {
			out.print("insert failed");
		}
%>
<a href="Cust_Rep.jsp"class="login100-form-btn wrap-input100 m-b-16"style="width:350px">Back</a>
</div>
</body>
</html>