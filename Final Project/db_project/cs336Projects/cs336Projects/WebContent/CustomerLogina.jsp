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
<title>Customer Login a</title>
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
			
			String userName = request.getParameter("usr"); 
			String pwd = request.getParameter("pwd"); 
			
			ResultSet result = stmt.executeQuery("select * from Account where userName='"+userName+"'"); 
			if(result.next()) 
			{ 
				String pass = result.getString("pass");
				String accNo = result.getString("Account_No");
				if(pass.equals(pwd)) 
				{ 
					out.println("Welcome, "+userName + "!");
					request.getSession().setAttribute("accNo", accNo);
					response.sendRedirect("searchReserve.jsp");
				} 
				else 
				{ 
					out.println("ERROR: Invalid password, please try again");
					request.getSession().setAttribute("accNo", null); 
				} 
			} 
			else {
				out.println("ERROR: Invalid password, please try again");
			}
			
			//Close the connection.
			con.close();
			
	} catch (Exception e) {
		out.print("ERROR: Login Failed");
	}

%>

<a href="CustomerLogin.jsp"class="login100-form-btn wrap-input100 m-b-16"style="width:350px">Back</a>
</div>
</body>
</html>