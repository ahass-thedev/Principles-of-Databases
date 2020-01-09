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
<title>Admin6</title>
</head>
<body>
<a class="login100-form-title" href="index.html">Home</a>
			<br>
			<br>
			<br>
			<br>
			<br>

 <div class="container wrap-input100" align="left">
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
				//Check the result
					
			}
			else {
				// send back to employee login page
				response.sendRedirect("EmployeeHome.jsp");
			}
			String str ="SELECT m.ID_No, p.First_Name, p.Last_Name, m.Total_Revenue"
					+"			 FROM"
					+"				(SELECT A.ID_No, tf AS Total_Revenue"
					+"				FROM"
					+"					(SELECT Account_No, (SUM(Total_Fare)+SUM(Booking_Fee)) AS tf FROM Reservation GROUP BY Account_No) monies, Customer C, Account A"
					+"					WHERE monies.Account_No=A.Account_No AND A.ID_No=C.ID_No"
					+"					GROUP BY A.ID_No) m, Person p"
					+"			WHERE p.ID_No=m.ID_No AND Total_Revenue =" 
					+"				 (SELECT MAX(m.Total_Revenue)"
					+"				 FROM"
					+"					(SELECT A.ID_No, tf AS Total_Revenue"
					+"					FROM"
					+"						(SELECT Account_No, (SUM(Total_Fare)+SUM(Booking_Fee)) AS tf FROM Reservation GROUP BY Account_No) monies, Customer C, Account A"
					+"						WHERE monies.Account_No=A.Account_No AND A.ID_No=C.ID_No"
					+"						GROUP BY A.ID_No) m);";
						//Run the query against the database.
						ResultSet result = stmt.executeQuery(str);
						result.next();
						out.print("The customer who provides the most revenue is "+result.getString("ID_No")+", whose name is "+result.getString("First_Name")+" "+result.getString("Last_Name")+
								", who brought in $"+result.getString("Total_Revenue")+".");
						

			//close the connection.
			con.close();

		} catch (Exception e) {
			out.print("ERROR: Search Failed");
			e.printStackTrace(new java.io.PrintWriter(out));
		}

%>

</div>
<div>
<a href="Logout.jsp" class="login100-form-btn wrap-input100 m-b-16" style="width:350px">Logout</a>
</div>
<div>
<a href="Cust_Rep.jsp"class="login100-form-btn wrap-input100 m-b-16"style="width:350px">Back</a>
</div>
</body>
</html>