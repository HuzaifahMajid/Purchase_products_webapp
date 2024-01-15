<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<link rel='stylesheet' href='../../CSS/params.css'>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>List A Service</title>
</head>
<style>
body {
	/* background-color: #e9bcb7; */
	background-image: linear-gradient(315deg, #e01223 0%, #e63c4a 74%);
}

h1, p, h2, label {
	color: white;
}
</style>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="../rutgersMain.jsp">Home</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="createListingDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> Create a new
							listing </a>
						<div class="dropdown-menu" aria-labelledby="createListingDropdown">
							<a class="dropdown-item" href="../CreateListing/itemListing.jsp">Create
								a Item Listing</a> <a class="dropdown-item"
								href="../CreateListing/serviceListing.jsp">Offer a service</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="browseListingsDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> Browse active
							Rutgers listings </a>
						<div class="dropdown-menu"
							aria-labelledby="browseListingsDropdown">
							<a class="dropdown-item" href="../BrowseItems/browseProducts.jsp">Browse
								Items</a> <a class="dropdown-item"
								href="../BrowseItems/browseServices.jsp">Browse Services</a>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						href="../../Blog/blogHome.jsp">Blog</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../SalesReport/userSales.jsp">My Sales</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../GroupMe/GroupMeList.jsp">Rutgers Group Me Chats</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../Courses/courses.jsp">Courses</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../CustomerService/endCustomerService.jsp">Customer
							Service</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../../MyBuyServlet">My Buys</a></li>
					<li class="nav-item"><a class="nav-link" href="../logout.jsp"
						style="float: right">Log out</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<div class='back'>
		<h1>Create a new Service listing</h1>
		<!-- idk about this yet -->
		<form action="../../AddServiceServlet" method="POST">
			<div class="row">
				<div class="col-md-6">
					<div class="mb-3">
						<label for="name" class="form-label">Name of the Service:</label>
						<input type="text" class="form-control" name="name" id="name">
					</div>
					<div class="mb-3">
						<label for="location" class="form-label">Where Service is
							being offered:</label>
						<textarea class="form-control" name="location" id="location"
							rows="4"
							placeholder="How or where will you be offering this service i.e Student center, library, dorm, etc."></textarea>
					</div>
					<div class="mb-3">
						<label for="subject" class="form-label">Course or Subject
							(type N/A if you don't have one):</label> <input type="text"
							class="form-control" name="subject" id="subject">
					</div>
				</div>
				<div class="col-md-6">
					<div class="mb-3">
						<label for="description" class="form-label">Description:</label>
						<textarea class="form-control" name="description" id="description"
							rows="4" placeholder="Enter text here..."></textarea>
					</div>
					<div class="mb-3">
						<label for="qualification" class="form-label">Qualifications:</label>
						<textarea class="form-control" name="qualification"
							id="qualification" rows="4"
							placeholder="List your qualifications separated by commas..."></textarea>
					</div>
					<div class="mb-3">
						<label for="charge" class="form-label">Price (specify if
							it is hourly):</label>
						<div class="input-group">
							<span class="input-group-text">$</span> <input type="number"
								step="0.01" class="form-control" name="charge" id="charge">
						</div>
					</div>
				</div>
			</div>
			<div class="d-grid">
				<button type="submit" class="btn btn-primary">List Service</button>
			</div>
		</form>

	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
		crossorigin="anonymous"></script>
</body>
</html>