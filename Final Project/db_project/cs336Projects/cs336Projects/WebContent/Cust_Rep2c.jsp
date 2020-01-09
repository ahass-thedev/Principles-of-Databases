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
<title>CustomerRep2c</title>
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
<%
		try {
			
			//Create a connection string
			String url = "jdbc:mysql://cs336.ctrr9ro7iyao.us-east-2.rds.amazonaws.com:3306/cs336";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "admin", "administrator");
			Statement stmt = con.createStatement();
			
			String Airline_ID = request.getParameter("Airline_ID");
			String Flight_No = request.getParameter("Flight_No");
			String depDate = request.getParameter("depDate");
			
			//Make a SELECT query from the
			String str = "SELECT * FROM Flight WHERE Airline_ID = '" + Airline_ID + "'"+ " AND" +" "+ "Flight_No = '"+ Flight_No+ "'"+ " "+" AND"+" " +"depDate = " +" " + "'" + depDate +"'";
			//Run the query against the database.
			//out.print(str);
			
			ResultSet result = stmt.executeQuery(str);
			
				if (!result.next() ) {
					con.close();
					throw new IndexOutOfBoundsException("Flight does not exist; enter a valid Airline ID Number");
				}
			
			// Delete from Employee Table
			str = "DELETE FROM Flight WHERE Airline_ID = '" + Airline_ID + "'"+ " AND" +" "+ "Flight_No = '"+ Flight_No+ "'"+ " "+" AND"+" " +"depDate = " +" " + "'" + depDate +"'";
			stmt.executeUpdate(str);
		
			//Close the connection.
			con.close();
			
			out.print("delete succeeded");
			
		} catch (Exception e) {
			out.print("delete failed");
			e.printStackTrace(new java.io.PrintWriter(out));
		}
%>


<a href="index.html"class="login100-form-btn wrap-input100 m-b-16"style="width:350px">Back</a>
</div>

</body>
</html>