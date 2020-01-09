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
<title>Admin3a</title>
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


	List<String> list = new ArrayList<String>();

		try {
			
			//Create a connection string
			String url = "jdbc:mysql://cs336.ctrr9ro7iyao.us-east-2.rds.amazonaws.com:3306/cs336";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "admin", "administrator");
					
			// Check user id
			if(request.getSession().getAttribute("userid") != null){
				//Create a SQL statement
				Statement stmt = con.createStatement();
				// Get userid
				String id = (String) request.getSession().getAttribute("userid");
				//Make a SELECT query from the Employee table
				String str = "SELECT * FROM Emp_Manager M WHERE M.ID = '" + id +"'";
				//Run the query against the database.
				ResultSet result = stmt.executeQuery(str);
				
			}
			else {
				// send back to employee login page
				response.sendRedirect("EmployeeHome.jsp");
			}
			// Get month parameters from Manager2.jsp
			String sort = request.getParameter("sort");
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			String str;

			//Make a SELECT query from the Employee table
			if(sort.equals("time")){
				str = "SELECT * FROM Flight ORDER BY depDate, depTime";
			}else if(sort.equals("airline")){
				str = "SELECT * FROM Flight Airline_ID ORDER BY Airline_ID, Flight_No";
			}else if(sort.equals("airport")){
				str = "SELECT * FROM Flight ORDER BY depAirID, depDate, depTime";
			}else{
				str = "SELECT * FROM Flight ORDER BY Fare";
			}
				
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
				if (!result.next() ) {
 					out.print("No Flights currently in the system.");
				}
				else{
					//Make an HTML table to show the results in:
					out.print("<table style= 'text-align:center' cellspacing='15' table border='3' bordercolor='#c86260' rules='all'");

					//make a row
					out.print("<tr>");
					//make a column
					out.print("<td>");
					out.print("<b>Airline ID</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>Flight Number</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>From Airport</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>To Airport</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>Departure Date</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>Departure Time</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>Arrival Date</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>Arrival Time</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>Number of Seats</b>");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print("<b>Fare</b>");
					out.print("</td>");
					//make a column
			
					out.print("<td>");
					out.print("<b>Number of Stops</b>");
					out.print("</td>");
					out.print("<td>");
					out.print("<b>Aircraft</b>");
					out.print("</td>");
					//end row
					out.print("</tr>");

					//parse out the results
					while (true) {
						//make a row
						out.print("<tr>");
						//make a column
						out.print("<td>");
						//Print out column value
						out.print(result.getString("Airline_ID"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("Flight_No"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("depAirID"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("arrAirID"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("depDate"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("depTime"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("arrDate"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("arrTime"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("Num_Seats"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("Fare"));
						out.print("</td>");

						out.print("<td>");
						out.print(result.getString("Num_Stops"));
						out.print("</td>");
						out.print("<td>");
						out.print(result.getString("Aircraft"));
						out.print("</td>");
						out.print("</tr>");
						if(!result.next()){
							break;
						}
					}

					out.print("</table>");
				}

			//Close the connection.
			con.close();
			
		} catch (Exception e) {
			out.print("ERROR: Search failed");
			e.printStackTrace(new java.io.PrintWriter(out));
		}
%>
</div>
		<div align="center">
<a href="Logout.jsp" class="login100-form-btn wrap-input100 m-b-16" style="width:350px">Logout</a>
</div>
<div align="center">
<a href="Admin3.jsp"class="login100-form-btn wrap-input100 m-b-16"style="width:350px">Back</a>
</div>

</body>
</html>