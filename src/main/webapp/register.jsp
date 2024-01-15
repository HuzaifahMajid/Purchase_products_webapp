<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel='stylesheet' href='CSS/forms.css'>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<style>

.banner-background{
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 93%, 60% 79%, 29% 91%, 0 97%, 0 0);
	
}

</style>
		<title>Registration Form</title>
	</head>
	<body>
	<p></p>
		<div class="jumbotron primary-background ">
			<h1>Rutgers Scholar Commons Registration</h1>
			<!-- <form action="register" method="POST">
				Username: <input type="text" class='login' name="username">
				Password: <input type="password" name="password">
				Email: <input type="email" name="email">
				Major: <input type="text" name="major">
				<div class='link'>
					<input type="submit" value="Register"/><br>
					<a href='login.jsp'>Go back to login page</a>
				</div>
			</form> -->
			
			<form action="register" method="POST">
			 	  <div class="form-group">
				    <label for="inputUsername">Username</label>
				    <input type="text" class="form-control" name="username" placeholder="username">
				  </div>
				  <div class="form-group">
				    <label for="inputPassword">Password</label>
				    <input type="password" class="form-control" name="password" placeholder="Password">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1">Email address</label>
				    <input type="email" class="form-control" name="email" aria-describedby="emailHelp" placeholder="Enter email">
				    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">Major</label>
				    <input type="text" class="form-control" name="major" placeholder="major">
				  </div>
				  <div class='link'>
				  
				  <input type="submit" value="Register"class="btn btn-primary"></>
					<!-- <input type="submit" value="Register"/><br> -->
					<a href='login.jsp'>Go back to login page</a>
				</div>
				  
		</form>
		</div>
	</body>
</html>