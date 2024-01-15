<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ru_amazon", "root", "PASSWORD");
Statement st = con.createStatement();
Statement st2 = con.createStatement();
ResultSet rs, rs2;

String user = (String) session.getAttribute("user");
rs = st.executeQuery("select a.alert_message from alerts a where a.uname = '" + user + "'");
rs2 = st2.executeQuery(
		"select prod_name, current_price from listings natural join items " + "where seller = '" + user + "'");
%>


<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='../CSS/main.css'>
<!--  <link rel='stylesheet' href='../CSS/navbar.css'>  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<!-- <style>
		/* body {
			margin: 0;
			padding: 0;
			background-color: #CC0033;
		}
		
		p {
			color: #FFFFFF;
		} */
		body {
  background: linear-gradient(-45deg, #EE7752, #E73C7E, #23A6D5, #23D5AB);
  background-size: 400% 400%;
  animation: gradient 15s ease infinite;
}

@keyframes gradient {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}
		

</style> -->

<style>
    body {
        background-color: #000;
    }
    
    .star {
        position: absolute;
        width: 2px;
        height: 2px;
        background-color: #fff;
        animation: shooting-star 1s linear infinite;
        opacity: 0;
    }
    
    @keyframes shooting-star {
        0% {
            opacity: 0;
            transform: translate(-100%, -100%) rotate(0deg);
        }
        10% {
            opacity: 1;
        }
        100% {
            opacity: 0;
            transform: translate(100%, 100%) rotate(720deg);
        }
    }
    h1 {
  color: white;
}

 h2 {
  color: white;
}

 p {
  color: white;
}
</style>

<title>Welcome to the Rutgers Scholar Commons</title>
</head>
<body>


	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="rutgersMain.jsp">Home</a>
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
							<a class="dropdown-item" href="CreateListing/itemListing.jsp">Create
								a Item Listing</a> <a class="dropdown-item"
								href="CreateListing/serviceListing.jsp">Offer a service</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="browseListingsDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> Browse active
							Rutgers listings </a>
						<div class="dropdown-menu"
							aria-labelledby="browseListingsDropdown">
							<a class="dropdown-item" href="BrowseItems/browseProducts.jsp">Browse
								Items</a> <a class="dropdown-item"
								href="BrowseItems/browseServices.jsp">Browse Services</a>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						href="../Blog/blogHome.jsp">Blog</a></li>
					<li class="nav-item"><a class="nav-link"
						href="SalesReport/userSales.jsp">My Sales</a></li>
					<li class="nav-item"><a class="nav-link"
						href="GroupMe/GroupMeList.jsp">Rutgers Group Me Chats</a></li>
					<li class="nav-item"><a class="nav-link"
						href="Courses/courses.jsp">Courses</a></li>
					<li class="nav-item"><a class="nav-link"
						href="CustomerService/endCustomerService.jsp">Customer Service</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="../MyBuyServlet">My Buys</a></li>
					<li class="nav-item"><a class="nav-link" href="../logout.jsp"
						style="float: right">Log out</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<h1>Welcome to the Rutgers Scholar Commons.</h1>
	<p>One man's trash is another man's treasure!?</p>
	<h2>
		Welcome,
		<%
	out.print(session.getAttribute("user").toString());
	%>
	</h2>
	<div class='center-collapse'>
		<button class='collapsible'>Your Alerts</button>
		<div class='collapsible-content'>
			<%
			if (!rs.isBeforeFirst()) {
			%>
			<p>You have no alerts at this time.</p>
			<%
			} else {
			%>
			<table>
				<%
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("alert_message")%></td>
				</tr>
				<%
				}
				%>
			</table>
			<%
			}
			%>
		</div>
		<button class='collapsible' class='text-center'>Your Listings</button>
		
		<div class='collapsible-content'>
			<%
			if (!rs2.isBeforeFirst()) {
			%>
			<p>You currently have no listings.</p>
			<%
			} else {
			%>
			<table>
				<thead>
					<tr>
						<th>Item</th>
						<th>Price</th>
					</tr>
				</thead>
				<tbody>
					<%
					while (rs2.next()) {
					%>
					<tr>
						<td><%=rs2.getString("prod_name")%></td>
						<td>$<%=rs2.getString("current_price")%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<%
			}
			%>
		</div>

	</div>


	<script src='end.js'></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
		crossorigin="anonymous"></script>
		
		<script>
        for (var i = 0; i < 50; i++) {
            var x = Math.floor(Math.random() * window.innerWidth);
            var y = Math.floor(Math.random() * window.innerHeight);
            var duration = Math.floor(Math.random() * 10000) + 5000;
            var delay = Math.floor(Math.random() * 10000);
            var star = document.createElement('div');
            star.className = 'star';
            star.style.left = x + 'px';
            star.style.top = y + 'px';
            star.style.animationDuration = duration + 'ms';
            star.style.animationDelay = delay + 'ms';
            document.body.appendChild(star);
        }
    </script>


</body>
</html>
