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
<title>CustomerRegister</title>
<style>

</style>
</head>
<body>



<div class="container-login100">
<div class="wrap-login100">
<br>
<br>
<br><br>
			<a class="login100-form-title" href="index.html">Home</a>
<br>
<br>
<form action="CustomerRegistera.jsp" method="post">
 <div class="container wrap-input100" >
 <br>
<br>
<br>
<br>
    <h1>Register</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>

    <label for="username"><b>Username</b></label>
    <input type="text" placeholder="Enter Email" name="username" required>
<br>
    <label for="pwd"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="pwd" required>
 <br>

    <label for="fname"><b>First Name</b></label>
    <input type="text" placeholder="First Name" name="fname">
   <br>
   	<label for="lname"><b>Last Name</b></label>
    <input type="text" placeholder="Last Name" name="lname">
   	<br>
   	<label for="adress"><b>Address</b></label>
    <input type="text" placeholder="Addresss" name="adress">
    
 	<br>
    <label for="city"><b>City</b></label>
    <input type="text" placeholder="City" name="city">
    <br>
    
    <label for="state"><b>State</b></label>
    <input type="text" placeholder="State" name="state">
    
     <br>
     
    <label for="zip"><b>Zip Code</b></label>
    <input type="text" placeholder="Zip code" name="zip">
     <br>
    <label for="tel"><b>Telephone</b></label>
    <input type="text" placeholder="Telephone" name="tel">
    
    <button type="submit" class="registerbtn">Register</button>
  </div>

  <div class="container signin">
    <p>Already have an account? <a href="index.html">Sign in</a>.</p>
  </div>
  </div>
<br/>


</form>


</body>
</html>