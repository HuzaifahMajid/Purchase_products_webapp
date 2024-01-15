<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<!-- <link rel='stylesheet' href='../../CSS/navbar.css'> -->
<link rel='stylesheet' href='../../CSS/params.css'>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<title>List an Item</title>
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
		<h1>Create a new Item listing</h1>
		<!-- idk about this yet -->

		<!-- IDK WHY BUT I COULDNT CHANGE THE SERVLET MAPPING: BUT AddlistingServlet refers to addItemServlet -->
		<form action="../../AddlistingServlet" method="POST"
			enctype="multipart/form-data">
			<div class='lcolumn'>
				<label>Name:</label> <input type="text" name="name" /> <label>Condition:</label>
				<select name="condition" id="condition">
					<option value="brandnew">Brand New</option>
					<option value="good">Used: Good Condition</option>
					<option value="fair">Used: Fair Condition</option>
					<option value="fair">Bad Condition</option>
				</select> <label>Location:</label> <input type="text" name="location" /> <label>Type:</label>
				<input type="text" name="type" /> <label>Color:</label> <input
					type="text" name="color" /> <label>Description:</label>
				<!-- <input type="text" name="description"/> -->
				<textarea class="form-control" id="description" name="description"
					rows="4" cols="50">Enter text here...</textarea>

				<!-- <label>Year:</label>
					<input type="text" name="year"/>
					<label>Mileage:</label>
					<input type="text" name="mileage"/> -->
				<!-- <label>Auction end date and time:</label>
					<input type="datetime-local" name="endDate"/> -->
				<input type="submit" value="List Item">
			</div>
			<div class='rcolumn'>
				<label>Free Delivery?</label> <select name="delivery" id="delivery">
					<option value=false>No</option>
					<option value=true>Yes</option>
				</select>
				<!-- <label>Height:</label>
					<input type="text" step="0.5" name="height">
					<label>Back Support</label>
					<select name="support" id="support">
						<option value=false>No</option>
						<option value=true>Yes</option>
					</select>
					<label>Transmission Type</label>
					<select name="transmition" id="transmition">
						<option value=manual>Manual</option>
						<option value=auto>Automatic</option>
					</select>
					<label>Weight</label>
					<select name="weight" id="weight">
						<option value=heavy>heavy</option>
						<option value=medium>medium</option>
						<option value=light>light</option>
					</select> -->
				<label>Price:</label> <input type="number" step="0.01" name="price" />

				<label>Upload Photo:</label> <input type="file"
					class="form-control-file" name="photo" size=50 />


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