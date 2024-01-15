<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
	<head>
		
		<title>Login Form</title>
	</head>
	<style>
	
	body{
	
		background-color: #2f4353;
		background-image: linear-gradient(315deg, #2f4353 0%, #d2ccc4 74%);
	
	}
	
	
input[type=text], input[type=password], input[type=email], select{
  	width: 100%;
  	padding: 12px 20px;
  	margin: 8px 0;
  	display: inline-block;
  	border: 1px solid #ccc;
  	border-radius: 4px;
  	box-sizing: border-box;
}


input[type=submit] {
 	width: 50%;
  	background-color: #33B5FF;
  	color: white;
  	padding: 14px 20px;
  	margin: 8px 0;
  	border: none;
  	border-radius: 4px;
  	cursor: pointer;
}

input[type=submit]:hover {
  	background-color: #9BDBFF;
}

.link {
	text-align: center;
}

.back {
  	margin: 50px auto;
	width: 25%;
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}

	
	
	
	</style>
	<body>
		<div class='back'>
			<h1>Scholar Commons Login</h1>
			<form action="login" method="POST">
				Username: <input type="text" name="username">
				Password: <input type="password" name="password">
				<div class='link'>
					<input type="submit" value="Login"/><br>
					<a href='register.jsp'>New user? Register here</a>
				</div>
			</form>
		</div>
	</body>
</html> --%>


<!DOCTYPE html>
<html>
	<head>
		<title>Login Form</title>
		<!-- Import Bootstrap CSS -->
		<style>
	
	body{
	
		/* background-color: #2f4353;
		background-image: linear-gradient(315deg, #2f4353 0%, #d2ccc4 74%); */
		
    background: linear-gradient(315deg, #cc0033 0%, #ffffff 100%);
	
	
	}
	
	
input[type=text], input[type=password], input[type=email], select{
  	width: 100%;
  	padding: 12px 20px;
  	margin: 8px 0;
  	display: inline-block;
  	border: 1px solid #ccc;
  	border-radius: 4px;
  	box-sizing: border-box;
}


input[type=submit] {
 	width: 50%;
  	background-color: #33B5FF;
  	color: white;
  	padding: 14px 20px;
  	margin: 8px 0;
  	border: none;
  	border-radius: 4px;
  	cursor: pointer;
}

input[type=submit]:hover {
  	background-color: #9BDBFF;
}

.link {
	text-align: center;
}

.back {
  	margin: 50px auto;
	width: 25%;
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}

	
	
	
	</style>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css">
	</head>
	<body>
		<div class="container mt-5">
    <div class="card mx-auto" style="max-width: 500px;">
        <div class="card-header bg-danger text-white">
            <h3 class="card-title mb-0">Scholar Commons Login</h3>
        </div>
        <div class="card-body">
            <form action="login" method="POST">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" name="username" id="username">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" id="password">
                </div>
                <div class="d-grid gap-2">
                   <button type="submit" class="btn btn-danger">Login</button>
                </div>
            </form>
            <div class="text-center mt-3">
                <p>New user? <a href="register.jsp">Register here</a></p>
            </div>
        </div>
    </div>
</div>

		
		<!-- Import Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
   			integrity="sha384-0Ze1Q2g6Zdld/MZ0p0Hx9XUuV7bYRl8uV7O4cLefu5dTN3Cm5kJV7Sjh9XGagvgr"
   			crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha2/dist/js/bootstrap.min.js"
   			integrity="sha384-kOLLOdkEglzjA/r8o9xCzTV9XjlQYvOOO+ch0kjCpM56NliVM74GzZTx0+Nc+LDz"
   			crossorigin="anonymous"></script>
	</body>
</html>
