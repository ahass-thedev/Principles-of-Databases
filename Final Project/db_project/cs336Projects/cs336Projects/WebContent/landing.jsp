<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" type="text/css" href="reg.css">
<link rel="stylesheet" type="text/css" href="login.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flight Listings</title>
</head>
<body>
<a class="login100-form-title" href="searchReserve.jsp">Home</a>
			<br>
			<br>
			<br>
			<br>
			<br>
<div class="container wrap-input100" align="center">
<br>	
	<%
	List<String> list = new ArrayList<String>();
	
	try {
		//Create a connection string
		String url = "jdbc:mysql://cs336.ctrr9ro7iyao.us-east-2.rds.amazonaws.com:3306/cs336";
		//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		Class.forName("com.mysql.jdbc.Driver");

		//Create a connection to your DB
		Connection con = DriverManager.getConnection(url, "admin", "administrator");

		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Get parameters from the HTML form at fly1.jsp
		

		String str = "SELECT * FROM Flight Order BY arrDate";
		// out.print("[For debug] the query is  :" + str); 
		
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
		
		
		
		//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print("| Airline |");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Flight No. |");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print(" From  |");
			out.print("</td>");
			//make a column
			out.print("<td> ");
			out.print("   To   |");
			out.print(" </td>");
			//make a column
			out.print("<td>");
			out.print("Departure Date |");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Departure Time |");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Arrival Date |");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Arrival Time |");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Fare |");
			out.print("</td>");
			out.print("<td>");
			out.print("First Class Fare |");
			out.print("</td>");
			out.print("<td>");
			out.print("Number of Stops|");
			out.print("</td>");
			out.print("<td>");
			out.print("Aircrafts |");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current Airline_ID name:
				out.print(result.getString("Airline_ID"));
				out.print("</td>");
				out.print("<td>");
				//Print out current Flight Number:
				out.print(result.getString("Flight_No"));
				out.print("</td>");
				out.print("<td>");
				//Print out departing Airport ID
				out.print(result.getString("depAirID"));
				out.print("</td>");
				out.print("<td>");
				//Print out arriving Airport ID
				out.print(result.getString("arrAirID"));
				out.print("</td>");
				out.print("<td>");
				//Print out departure date
				
				out.print(result.getString("depDate"));
				out.print("</td>");
				out.print("<td>");
				//Print out departure time
				out.print(result.getString("depTime"));
				out.print("</td>");
				out.print("<td>");
				//Print out arrival date
				out.print(result.getString("arrDate"));
				out.print("</td>");
				out.print("<td>");
				//Print out arrival time
				out.print(result.getString("arrTime"));
				out.print("</td>");
				out.print("<td>");
				//Print out air fare
				out.print(result.getString("Fare"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("First_Fare"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("Num_Stops"));
				out.print("</td>");
				
				out.print("<td>");
				out.print(result.getString("Aircraft"));
				out.print("</td>");
			
				out.print("<tr>");
			}
			out.print("</table>");

			//close the connection.
			con.close();
			
			
		} catch (Exception e) {
			out.print("No flights are available.");
		}
	%>

	<a href="Logout.jsp" class="login100-form-btn wrap-input100 m-b-16" style="width:350px">Logout</a>

<a href="searchReserve.jsp"class="login100-form-btn wrap-input100 m-b-16"style="width:350px">Back</a>
</div>