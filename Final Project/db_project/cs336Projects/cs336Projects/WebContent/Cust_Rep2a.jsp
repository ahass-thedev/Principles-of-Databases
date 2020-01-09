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
<title>CustomerRep2a</title>
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
			String Airline_ID = request.getParameter("Airline_ID");
			String Airline_Name = request.getParameter("Airline_Name");
			String Flight_No = request.getParameter("Flight_No");
			String depAirID = request.getParameter("depAirID");
			String arrAirID = request.getParameter("arrAirID");
			String depDate = request.getParameter("depDate");
			String depTime = request.getParameter("depTime");
			String arrTime = request.getParameter("arrTime");
			String arrDate = request.getParameter("arrDate");
			String Num = request.getParameter("Num_Seats");
			String Fa = request.getParameter("Fare");
			String Fi= request.getParameter("First_Fare");
			String Aircraft = request.getParameter("Aircraft");
			String N = request.getParameter("Num_Stops");
		
			int Num_Seats= Integer.parseInt(Num);
			double Fare = Double.valueOf(Fa);
			int First_Fare = Integer.parseInt(Fi);
			int Num_Stops = Integer.parseInt(N);
			String insert = "INSERT INTO Airline (Airline_ID, Name)"
					+ "VALUES (?, ?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, Airline_ID);
			ps.setString(2, Airline_Name);
		

			//Run the query against the DB
			ps.executeUpdate();
			//Make an insert statement for the Flight table:
			insert = "INSERT INTO Flight (Airline_ID, Flight_No, depAirID, arrAirID, depDate, depTime, arrTime, arrDate, Num_Seats, Fare, First_Fare, Aircraft, Num_Stops)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			out.print(insert);
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			 ps = con.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, Airline_ID);
			ps.setString(2, Flight_No);
			ps.setString(3, depAirID);
			ps.setString(4, arrAirID);
			ps.setString(5, depDate);
			ps.setString(6, depTime);
			ps.setString(7, arrTime);
			ps.setString(8, arrDate);
			ps.setInt(9, Num_Seats);
			ps.setDouble(10, Fare);
			ps.setInt(11, First_Fare);
			ps.setString(12, Aircraft);
			ps.setInt(13, Num_Stops);
	

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