<!-- <!DOCTYPE html>
<html>
	<head>
		<title>Generate Sales Report</title>
	</head>
	<style>
	 	
	 	body{background: #FFFAF0;}
	 	</style>
	<body>
		<h1>Generate Sales Report</h1>
		<div>
		<form action="../../FetchReportServlet" method="POST">
Choose Data Type: <select size="1" id="data_type" title="" name="option_type">
				<option value="total_earnings">Total Earnings</option>
				<option value="Sold Items">Sold Items</option>
				<option value="best_sellers">Best Sellers</option>
			</select><br>
			 <input type="submit" value="Submit"/><br><br><br>
			 </form>

			 <a href='../rutgersMain.jsp'>Go back to Main Page</a>
			 
			</div>
			
	</body>
</html> -->


<!DOCTYPE html>
<html>

	<head>
		<title>Your Sales </title>
		<!-- Add bootstrap css link -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		
		<style>
	 	
	 		body{background: #FFFAF0;}
	 	</style>
		
	</head>
	<body>
		<div class="container">
			<h1 class="text-center mt-5 mb-3">Your Sales Report</h1>
			<form action="../../FetchReportServlet" method="POST">
				<div class="form-group">
					<label for="data_type">Choose Data Type:</label>
					<select class="form-control" id="data_type" name="option_type">
						<option value="total_earnings">Total Earnings</option>
						<!-- <option value="Sold Items">Sold Items</option> -->
						<!-- <option value="best_sellers">Best Sellers</option> -->
					</select>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
			<div class="mt-5">
				<a href="../rutgersMain.jsp" class="btn btn-secondary">Go back to Main Page</a>
			</div>
		</div>
		<!-- Add bootstrap js and jquery links -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	</body>
</html>