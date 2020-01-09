<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" type="text/css" href="reg.css">
<link rel="stylesheet" type="text/css" href="login.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Redirecting</title>
</head>
<body>			  
<a class="login100-form-title" href="index.html">Home</a>
			<br>
			<br>
			<br>
			<br>
			<br>
<div class="container wrap-input100" align="center">

<br>
<%
try{
	//Create a connection string
	String url = "jdbc:mysql://cs336.ctrr9ro7iyao.us-east-2.rds.amazonaws.com:3306/cs336";
	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
	Class.forName("com.mysql.jdbc.Driver");

	//Create a connection to your DB
	Connection con = DriverManager.getConnection(url, "admin", "administrator");
	//Get the selected radio button from the Manager.jsp
	String taskNum = request.getParameter("command");
		
	if(taskNum.equals("one")){
		response.sendRedirect("fly1.jsp");
	}else if(taskNum.equals("round")){
		response.sendRedirect("fly2.jsp");
	}else if(taskNum.equals("flex")){
		response.sendRedirect("fly4.jsp");
	}else if(taskNum.equals("bestSeller")){
		response.sendRedirect("oneFlights_BestSeller.jsp");
	}else if(taskNum.equals("Advanced")){
		response.sendRedirect("fly6.jsp");
	}else if(taskNum.equals("dep")){
		response.sendRedirect("takeoff.jsp");
	
	}else if(taskNum.equals("arr")){
	response.sendRedirect("landing.jsp");
	}
	//close the connection.
	con.close();
	
}catch (Exception e) {
	out.print("Error 404: Page Not Found");
}

%>
<a href="Logout.jsp" class="login100-form-btn wrap-input100 m-b-16" style="width:350px">Logout</a>

<a href="fly1.jsp"class="login100-form-btn wrap-input100 m-b-16"style="width:350px">Back</a>
</div>
</body>
</html>