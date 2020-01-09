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
<title>Admin1a</title>
</head>
<body>

			<a class="login100-form-title" href="index.html">Home</a>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			 <div class="container wrap-input100" align="left">
<div align="left">
<a href="Admin.jsp">Home</a>
</div>
<div>
<a href="Logout.jsp">Logout</a>
</div>
<div>
<a href="Admin1.jsp">Back</a>
</div>
<br>
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
				// Get userid
				String id = (String) request.getSession().getAttribute("userid");
				//Make a SELECT query from the Employee table
				String str = "SELECT * FROM Emp_Manager M WHERE M.ID = '" + id +"'";
				//Run the query against the database.
				ResultSet result = stmt.executeQuery(str);
				//Check the result
				if (!result.next() ) {
					//Employee is a Customer Rep
					response.sendRedirect("Cust_Rep.jsp");
					}
			}
			else {
				// send back to employee login page
				response.sendRedirect("EmployeeHome.jsp");
			}
			
			//Get parameters from the HTML form at the Manager1.jsp
			String type = request.getParameter("type");
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String ssn = request.getParameter("ssn");
			String srate = request.getParameter("rate");
			double rate;
			if(srate.equals("")){
				rate = 0;
			}else{
				rate = Double.valueOf(srate);
			}
			String date = request.getParameter("date");
			if(date.equals("")){
				date = "0000-00-00";
			}
			String first = request.getParameter("first");
			String last = request.getParameter("last");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String zip = request.getParameter("zip");
			String phone = request.getParameter("phone");
			
			if(!(type.equals("Man") || type.equals("man")|| type.equals("Cust")||type.equals("cust"))){
				out.print("ERROR: Must choose (Man) or (Cust) ");
				return;
			}
			
			//Check that ID is numeric and is not empty
			if(!id.matches("((-|\\+)?[0-9]+(\\.[0-9]+)?)+") || id.equals("")) {
				con.close();
				throw new IndexOutOfBoundsException("ERROR: Not a valid Employee ID. Please enter up to 12 numeric characters.");
			}
			
			// Check that this ID is not already in the system
			String str = "SELECT * FROM Person WHERE ID_No = '" + id +"'";
			ResultSet result = stmt.executeQuery(str);
			if (result.next()) {
					out.print("ERROR: This ID_No is already taken, please choose another one.");
					con.close();
					return;
			}

			//Make an insert statement for the Person table:
			String insert = "INSERT INTO Person (ID_No, First_Name, Last_Name, Address, City, State, Zip_Code, Telephone_No)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, id);
			ps.setString(2, first);
			ps.setString(3, last);
			ps.setString(4, address);
			ps.setString(5, city);
			ps.setString(6, state);
			ps.setString(7, zip);
			ps.setString(8, phone);

			//Run the query against the DB
			ps.executeUpdate();
			
			//Make an insert statement for the Employee table:
			insert = "INSERT INTO Employee (ID_No, password, SSN, Hourly_Rate, Start_Date)"
					+ "VALUES (?, ?, ?, ?, ?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			ps = con.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, id);
			ps.setString(2, password);
			ps.setString(3, ssn);
			ps.setDouble(4, rate);
			ps.setString(5, date);

			//Run the query against the DB
			ps.executeUpdate();

			//Make an insert statement for the Manager or Customer Rep table:
				if(type.equals("Man") || type.equals("man")){
					insert = "INSERT INTO Emp_Manager (ID)"
							+ "VALUES (?)";
				} else if (type.equals("Cust") || type.equals("cust")){
					insert = "INSERT INTO Emp_CustomerRep(ID)"
							+ "VALUES (?)";
				}else{
					out.print("ERROR: Must choose between Man and Cust (Manager or Customer Representative)");
					return;
				}
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			ps = con.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, id);

			//Run the query against the DB
			ps.executeUpdate();

			//Close the connection.
			con.close();
			
			out.print("Insert succeeded!");
		} catch (Exception e) {
			out.print("ERROR: insert failed");
			e.printStackTrace(new java.io.PrintWriter(out));

		}
%>


</body>
</html>