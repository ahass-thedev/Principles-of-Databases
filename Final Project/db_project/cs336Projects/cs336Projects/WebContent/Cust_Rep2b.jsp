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

			//Get parameters from the HTML form at the Manager1.jsp
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
		
			int Num_Seats=	0;
			double Fare=0;
			int First_Fare=0;
			int Num_Stops=0;
			
			
			//Make a SELECT query from the
			String str = "SELECT * FROM Flight WHERE Airline_ID = '" + Airline_ID + "'"+ " AND" +" "+ "Flight_No = '"+ Flight_No+ "'"+ " "+" AND"+" " +"depDate = " +" " + "'" + depDate +"'";
			//Run the query against the database.
			//out.print(str);
			ResultSet result = stmt.executeQuery(str);
				if (!result.next() ) {
					con.close();
					throw new IndexOutOfBoundsException("Flight does not exist; enter a valid Airline ID Number");
				}
				
				
				if(!depAirID.equals("")){
					
					String update = "UPDATE Flight SET depAirID = ? WHERE Flight_No = '" + Flight_No + "'"+" "+"AND"+ " "+"depDate = '" + depDate + "'"+ " "+"AND"+" "+ "Flight_No = '" + Flight_No + "'";				
				
					PreparedStatement ps = con.prepareStatement(update);
					ps.setString(1, depAirID);
					ps.executeUpdate();
				}
				
			
			if(!arrAirID.equals("")){
				String update = "UPDATE Flight SET arrAirID = ? WHERE Flight_No = '" + Flight_No + "'"+" "+"AND"+ " "+"depDate = '" + depDate + "'"+ " "+"AND"+" "+ "Flight_No = '" + Flight_No + "'";				
				PreparedStatement ps = con.prepareStatement(update);
				ps.setString(1,arrAirID);
				ps.executeUpdate();
			}
			
			if(!depTime.equals("")){
				String update = "UPDATE Flight SET depTime = ? WHERE Flight_No = '" + Flight_No + "'"+" "+"AND"+ " "+"depDate = '" + depDate + "'"+ " "+"AND"+" "+ "Flight_No = '" + Flight_No + "'";				
				PreparedStatement ps = con.prepareStatement(update);
				ps.setString(1,depTime );
				ps.executeUpdate();
			}
			
			if(!arrTime.equals("")){
				String update = "UPDATE Flight SET arrTime = ? WHERE Flight_No = '" + Flight_No + "'"+" "+"AND"+ " "+"depDate = '" + depDate + "'"+ " "+"AND"+" "+ "Flight_No = '" + Flight_No + "'";	
				PreparedStatement ps = con.prepareStatement(update);
				ps.setString(1, arrTime);
				ps.executeUpdate();
			}
			if(!arrDate.equals("")){
				String update = "UPDATE Flight SET arrDate = ? WHERE Flight_No = '" + Flight_No + "'"+" "+"AND"+ " "+"depDate = '" + depDate + "'"+ " "+"AND"+" "+ "Flight_No = '" + Flight_No + "'";
				PreparedStatement ps = con.prepareStatement(update);
				ps.setString(1, arrDate);
				ps.executeUpdate();
			}
			if(!Num.equals("")){
				String update = "UPDATE Flight SET Num_Seats = ? WHERE Flight_No = '" + Flight_No + "'"+" "+"AND"+ " "+"depDate = '" + depDate + "'"+ " "+"AND"+" "+ "Flight_No = '" + Flight_No + "'";				
				PreparedStatement ps = con.prepareStatement(update);
				ps.setInt(1, Num_Seats);
				ps.executeUpdate();
			}
			
			if(!Fa.equals("")){
				String update = "UPDATE Flight SET Fare = ? WHERE Flight_No = '" + Flight_No + "'"+" "+"AND"+ " "+"depDate = '" + depDate + "'"+ " "+"AND"+" "+ "Flight_No = '" + Flight_No + "'";			
				PreparedStatement ps = con.prepareStatement(update);
				ps.setDouble(1, Fare);
				ps.executeUpdate();
			}
			
			if(!Fi.equals("")){
				String update = "UPDATE Flight SET First_Fare = ? WHERE Flight_No = '" + Flight_No + "'"+" "+"AND"+ " "+"depDate = '" + depDate + "'"+ " "+"AND"+" "+ "Flight_No = '" + Flight_No + "'";			
				PreparedStatement ps = con.prepareStatement(update);
				ps.setInt(1, First_Fare);
				ps.executeUpdate();
			}
			
			if(!Aircraft.equals("")){
				String update = "UPDATE Flight SET Aircraft = ? WHERE Flight_No = '" + Flight_No + "'"+" "+"AND"+ " "+"depDate = '" + depDate + "'"+ " "+"AND"+" "+ "Flight_No = '" + Flight_No + "'";				
				PreparedStatement ps = con.prepareStatement(update);
				ps.setString(1, Aircraft);
				ps.executeUpdate();
			}
			if(!N.equals("")){
				String update = "UPDATE Flight SET Num_Stops = ? WHERE Flight_No = '" + Flight_No + "'"+" "+"AND"+ " "+"depDate = '" + depDate + "'"+ " "+"AND"+" "+ "Flight_No = '" + Flight_No + "'";
				
				PreparedStatement ps = con.prepareStatement(update);
				ps.setInt(1, Num_Stops);
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