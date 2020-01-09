<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee Home</title>
<link rel="stylesheet" type="text/css" href="reg.css">
<link rel="stylesheet" type="text/css" href="login.css">
</head>
<body align="center">

<div class="container-login100">
<div class="wrap-login100">
<br>
<br>
<br><br>
			<a class="login100-form-title" href="index.html">Home</a>



<br />



 <div class="container wrap-input100" >
 <b><p align ="center" style ="font-size:40px">Welcome Employee </p>
  <p align ="center" style ="font-size:25px" >Please enter your credentials </p></b>
  <br>
	<form action="EmployeeLogin.jsp" method="post">
 <label for="id"><b>Employee ID Number</b></label>
    <input type="text" placeholder="Employee ID Number" name="id" required>
<br>
    <label for="pwd"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>
 <br>



	<input type="submit" value="Submit" class="login100-form-btn wrap-input100 m-b-16">
	<br>
	<br>
	<p>If you do not have an account set up, Please go contact someone from the CS336 Group.
	</p>
	  </div>
  </div>
	</form>


<br>

</body>
</html>