<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" type="text/css" href="login.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CustomerLogin</title>
<style>
</style>
</head>
<body>




<div class="limiter">

		<div class="container-login100">
		
			<div class="wrap-login100"style = margin-top:200px>
			<a class="login100-form-title" href="index.html">Home</a>
				<form class="login100-form validate-form p-l-55 p-r-55 p-t-178" action="CustomerLogina.jsp" method="post">
					<span class="login100-form-title">
						Welcome!
						
					</span>

					<div class="wrap-input100 validate-input m-b-16" data-validate="Please enter username">
						<input class="input100" type="text" name="usr" placeholder="Username">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Please enter password">
						<input class="input100" type="password" name="pwd" placeholder="Password">
						<span class="focus-input100"></span>
					</div>

					<div class="text-right p-t-13 p-b-23">
						<span class="txt1">
							Create Account
						</span>

						<a href="CustomerRegister.jsp" class="txt2">
							Click Here
						</a>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Sign in
							
						</button>
						
						
						<br>
					</div>

				</form>
			</div>
		</div>
	</div>
	


</body>
</html>