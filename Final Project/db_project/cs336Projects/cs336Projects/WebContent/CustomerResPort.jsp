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
<title>CustomerResPort</title>
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
					
			//Create a SQL statement
			Statement stmt = con.createStatement();

			// Access current user's account number
	 		String account = (String) request.getSession().getAttribute("accNo");
 
 			//Make a SELECT query for Reservation
			String str = "SELECT * FROM Reservation WHERE Account_No='"+account+"'";

			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			out.print("<h1>Reserved flights for Account Number: "+ account +"</h1>");
			

			//parse out the results
			while (result.next()) {
				
				out.print("<b>Reservation:</b>");

				//Make an HTML table to show the results in:
				out.print("<table style= 'text-align:center' cellspacing='15' table border='3' bordercolor='#c86260' rules='all'>");

				//make a header row
				out.print("\n\n\n<tr>");
				
				//make a column 1
				out.print("<td>");
				out.print("<em>Reservation ID</em>");
				out.print("</td>");
				
				//make a column 2
				out.print("<td>");
				out.print("<em>Date</em>");
				out.print("</td>");
				
				//make a column 3
				out.print("<td>");
				out.print("<em>Total Fare</em>");
				out.print("</td>");
				
				//make a column 4
				out.print("<td>");
				out.print("<em>Booking_Fee</em>");
				out.print("</td>");
				
				//make a column 5
				out.print("<td>");
				out.print("<em>class</em>");
				out.print("</td>");
				
				
				out.print("</tr>");
				
				
				
				//make a row
				out.print("\n<tr>");
				
				//make a column 1
				out.print("<td>");
				//Print out reservation no:
				out.print(result.getString("Res_No"));
				out.print("</td>");
				
				//make a column 2
				out.print("<td>");
				//Print out date:
				out.print(result.getString("Date"));
				out.print("</td>");
				
				//make a column 3
				out.print("<td>");
				//Print out Total Fare:
				out.print(result.getString("Total_Fare"));
				out.print("</td>");
				
				//make a column 4
				out.print("<td>");
				//Print out Booking Fee:
				out.print(result.getString("Booking_Fee"));
				out.print("</td>");
				
				//make a column 5
				out.print("<td>");
			
				out.print(result.getString("class"));
				out.print("</td>");
				
				
				out.print("</tr>");
				out.print("</table>");
				
				out.print("<b>Passengers:</b>");
				
				out.print("<table style= 'text-align:center' cellspacing='15' table border='3' bordercolor='#c86260' rules='all'>");
				
				//make a header row
				out.print("\n<tr>");
				
				//make a column 1
				out.print("<td>");
				out.print("<em>First Name</em>");
				out.print("</td>");
				
				//make a column 2
				out.print("<td>");
				out.print("<em>Last Name</em>");
				out.print("</td>");
				
				//make a column 3
				out.print("<td>");
				out.print("<em>Meal Preference</em>");
				out.print("</td>");
				
				//make a column 4
				out.print("<td>");
				out.print("<em>Seat Preference</em>");
				out.print("</td>");
				

				
				out.print("</tr>");
				
				//Make another query for passengers
				//Create a SQL statement

				Statement stmtp = con.createStatement();
				String strps = "SELECT * FROM Passenger WHERE resNo= '"+result.getString("Res_No")+"'";
				ResultSet pass = stmtp.executeQuery(strps);

				while(pass.next()){
					//make a row
					out.print("<tr>");

					
					//make a column 1
					out.print("<td>");
					//Print out First Name:
					out.print(pass.getString("firstName"));
					out.print("</td>");


					//make a column 2
					out.print("<td>");
					//Print out Last Name:
					out.print(pass.getString("lastName"));
					out.print("</td>");

					//make a column 3
					out.print("<td>");
					//Print out Special Meal Ordered:
					out.print(pass.getString("mealPref"));
					out.print("</td>");

					
					//make a column 4
					out.print("<td>");
					//Print out Class:
					out.print(pass.getString("seatPref"));
					out.print("</td>");


					
					out.print("</tr>");
				}
				
				out.print("</table>");
				
				out.print("<b>Reservation for flights:</b>");
				
				out.print("<table style= 'text-align:center' cellspacing='15' table border='3' bordercolor='#c86260' rules='all'>");
				
				//make a header row
				out.print("\n<tr>");
				
				//make a column 1
				out.print("<td>");
				out.print("<em>Airline ID</em>");
				out.print("</td>");
				
				//make a column 2
				out.print("<td>");
				out.print("<em>Flight Number</em>");
				out.print("</td>");
				
				//make a column 3
				out.print("<td>");
				out.print("<em>From</em>");
				out.print("</td>");
				
				//make a column 4
				out.print("<td>");
				out.print("<em>To</em>");
				out.print("</td>");
				
				//make a column 5
				out.print("<td>");
				out.print("<em>Departure Date, Time</em>");
				out.print("</td>");
				
				out.print("</tr>");
				
				//Create another query for flights
				Statement stmtf = con.createStatement();
				String strflight = "SELECT * FROM Leg WHERE Res_No='"+result.getString("Res_No")+"'";
				ResultSet flight = stmtf.executeQuery(strflight);
				
				while(flight.next()){
					//make a row
					out.print("<tr>");
					
					//make a column 1
					out.print("<td>");
					//Print out Airline ID:
					out.print(flight.getString("Airline_ID"));
					out.print("</td>");
					
					//make a column 2
					out.print("<td>");
					//Print out Flight Number:
					out.print(flight.getString("Flight_Number"));
					out.print("</td>");
					
					//make a column 3
					out.print("<td>");
					//Print out From:
					out.print(flight.getString("From_Airport_ID"));
					out.print("</td>");
					
					//make a column 4
					out.print("<td>");
					//Print out To:
					out.print(flight.getString("To_Airport_ID"));
					out.print("</td>");
					
					//make a column 5
					out.print("<td>");
					//Print out Departure Date/Time:
					out.print(flight.getString("Departure_Date_Time"));
					out.print("</td>");
					
					
					out.print("</tr>");
				}
				out.print("</table>");
				out.print("<br><br>");
			}
			//list <String>=new ArrayList<>();
			//go back to the start of the reservations query
	while (result.previous()){};
			
			out.print("\n\n\n\nCancel Reservation:\n");
			out.print("<form action=\"CustomerCancelRes.jsp\">");
			out.print("<select name=\"Reservation\" size=1>");
			while(result.next()){
				if(!result.getString("class").equals("Economy")||!result.getString("class").equals(null)){
				out.print("<option value="+result.getString("Res_No")+">"+result.getString("Res_No")+"</option>");}
			}
			out.print("</select>&nbsp;<br> <input type=\"submit\" value=\"submit\"class=\"login100-form-btn wrap-input100 m-b-16\"style=\"width:350px\">");
			out.print("</form>");

			
			//close the connection.
			con.close();

		} catch (Exception e) {
			e.printStackTrace(new java.io.PrintWriter(out));

		}
		 %>





	<a href="Logout.jsp" class="login100-form-btn wrap-input100 m-b-16" style="width:350px">Logout</a>

<a href="searchReserve.jsp"class="login100-form-btn wrap-input100 m-b-16"style="width:350px">Back</a>
</div>
</body>
</html>