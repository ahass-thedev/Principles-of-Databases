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
<title>CustomerRepActions</title>
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
			
			// Check user id
			if(request.getSession().getAttribute("userid") != null){
				String id = (String) request.getSession().getAttribute("userid");
				//Make a SELECT query from the Employee table
				String str = "SELECT * FROM Emp_CustomerRep C WHERE C.ID = '" + id +"'";
				//Run the query against the database.
				ResultSet result = stmt.executeQuery(str);
				//Check the result
				if (!result.next() ) {
					//Employee is a Manager
					response.sendRedirect("Admin.jsp");
					}
			}
			else {
				// send back to employee login page
				response.sendRedirect("EmployeeHome.jsp");
			}
			
			//Get the selected radio button from the Manager.jsp
			String taskNum = request.getParameter("command");
		
			
			if(taskNum.equals("1")){
				response.sendRedirect("Cust_Rep1.jsp");
				
			}else if(taskNum.equals("2")){
				response.sendRedirect("Cust_Rep2.jsp");

			
		}else if(taskNum.equals("3")){
			response.sendRedirect("Cust_Rep3.jsp");

		
		}else if(taskNum.equals("4")){
			response.sendRedirect("Cust_Rep4.jsp");

		}
		else if(taskNum.equals("5")){
			response.sendRedirect("Cust_Rep5.jsp");

		}

			//close the connection.
			con.close();

		} catch (Exception e) {
			out.print("Problem with Database, please contact help desk. Sorry for the inconvenience.");
		}
%>
<a href="Logout.jsp" class="login100-form-btn wrap-input100 m-b-16" style="width:350px">Logout</a>
</div>
	
</body>
</html>