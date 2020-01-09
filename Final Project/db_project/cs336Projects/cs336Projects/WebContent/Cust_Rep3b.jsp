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
<title>CustomerRep2b</title>
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

			//Get parameters from the HTML form at the Admin1.jsp
			String Airport_ID = request.getParameter("Airport_ID");
			String Name = request.getParameter("Name");
			String City = request.getParameter("City");
			String Country = request.getParameter("Country");
	
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		

			
			//Make a SELECT query from the
			String str = "SELECT * FROM Airport WHERE Airport_ID = '" + Airport_ID + "'";
			//Run the query against the database.
			//out.print(str);
			ResultSet result = stmt.executeQuery(str);
				if (!result.next() ) {
					con.close();
					throw new IndexOutOfBoundsException("Airport does not exist; enter a valid Airport ID Number");
				}
				
				
				if(!Name.equals("")){
					
					String update = "UPDATE Airport SET Name = ? WHERE Airport_ID = '" + Airport_ID + "'";
				
					PreparedStatement ps = con.prepareStatement(update);
					ps.setString(1, Name);
					ps.executeUpdate();
				}
				
			
			if(!City.equals("")){
				String update = "UPDATE Airport SET City = ? WHERE Airport_ID = '" + Airport_ID + "'";
				PreparedStatement ps = con.prepareStatement(update);
				ps.setString(1,City);
				ps.executeUpdate();
			}
			
			if(!Country.equals("")){
				String update = "UPDATE Airport SET Country = ? WHERE Airport_ID = '" + Airport_ID + "'";
				PreparedStatement ps = con.prepareStatement(update);
				ps.setString(1,Country);
				ps.executeUpdate();
			}
			
		
	
			//Close the connection.
			con.close();
			
			out.print("edit succeeded");
		} catch (Exception e) {
			out.print("edit failed");
			e.printStackTrace(new java.io.PrintWriter(out));
		}
%>
<a href="index.html"class="login100-form-btn wrap-input100 m-b-16"style="width:350px">Back</a>
</div>
</body>
</html>