<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<style>
	 	
	 	body{background: #FFFAF0;}
	 	</style>
	<head>
		<link rel="stylesheet" href="main.css"/>
		<title>Scholar Commons Admin Page</title>
	</head>
	<body>
		<h1>Scholar Commons Admin Page</h1>
		
		
		
			<div>
				<!-- <form action="../viewRepsServlet">
					<input type="submit" value="View Reps"/><br>
				</form>
				
				<form action="../createRepsServlet">
					<input type="submit" value="Create Reps"/><br>
				</form>
				
				<form action="../deleteRepsServlet">
					<input type="submit" value="Delete Reps"/><br>
				</form>
				
				<form action="../viewEndUsersServlet">
					<input type="submit" value="View End Users"/><br>
				</form>
				
				<form action="../generateSaleReportServlet">
					<input type="submit" value="Generate Report"/><br>
				</form> -->
				
				
			 	<a href='controlCustReps/ViewReps.jsp'>View Customer Representatives</a><br/>
			 	<br/>
			 	
				<a href='controlCustReps/CreateRep.jsp'>Add Customer Representative</a><br/>
					<br/>
				<a href='controlCustReps/DeleteRep.jsp'>Remove Customer Representative</a><br/>
					<br/>
				<a href='ViewEndUsers.jsp'>View End Users</a><br/>
					<br/>
				<a href='salesReport/genSalesReport.jsp'>Create Sales Report</a><br/> <!-- NEED TO WORK ON -->
					<br/>
				
				<a href='../logout.jsp'>Log out</a>
			</div>
		
		
		
			
		
		
		
		
		
	</body>
</html>