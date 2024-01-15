<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.awt.image.*"%>
<%@ page import="javax.imageio.ImageIO"%>
<%@ page import="java.io.ByteArrayOutputStream"%>
<%@ page import="java.awt.image.BufferedImage"%>
<%@ page import="java.io.File"%>
<%@ page import="javax.imageio.ImageIO"%>

<!DOCTYPE html>
<html>
<head>
<title>Product Listings</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
table {
	border: 1px solid black;
	border-collapse: collapse;
	width: 100%
}

th, td {
	text-align: left;
	padding: 15px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

body {
	background: #FFFAF0;
}
</style>
</head>



<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ru_amazon", "root", "PASSWORD");
Statement st = con.createStatement();
Statement st2 = con.createStatement();
ResultSet rs;
ResultSet rs2;

String query = "select * from listings l natural join (select * from items i natural join products p "
		+ " where i.item_id = p.item_id) p where l.item_id = p.item_id ";

// Create the query and insert the proper values afterwards
%>

<h2 class="text-center"><strong>Browse Products</strong></h2>

<form action="../../BuyItemServlet" method="POST">
	<table  class="table table-bordered">
		<%
		rs = st.executeQuery(query);

		while (rs.next()) {

			String item_id = rs.getString("item_id");
			int id = Integer.parseInt(item_id);
		%>
		<tr bgcolor="#DEB887">
			<td>Item Number</td>
			<td>Product Name</td>
			<td>Product Location</td>
			<td>Product Description</td>
			<td>Product Type</td>
			<td>Product Color</td>
			<td>Delivery Option</td>
			<td>Product Condition</td>
			<td>Price</td>
			<td>Product Image</td>
			<td>Buy Item</td>





		</tr>

		<tr bgcolor="#DEB887">


			<td><%=rs.getString("item_id")%></td>
			<td><%=rs.getString("prod_name")%></td>
			<td><%=rs.getString("prod_loc")%></td>
			<td><%=rs.getString("product_desc")%></td>
			<td><%=rs.getString("prod_type")%></td>
			<td><%=rs.getString("prod_color")%></td>
			<td><%=rs.getBoolean("delivery")%></td>




			<%
			String newString = "";
			if (rs.getString("prod_condition").equals("brandnew")) {
				newString = "Brand New";

			}
			%>

			<td><%=newString%></td>

			<td><%=rs.getString("current_price")%></td>

			<%
			Blob blob = rs.getBlob("photo");

			InputStream inputStream = blob.getBinaryStream();

			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			byte[] buffer = new byte[2000];
			int bytesRead = -1;

			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outputStream.write(buffer, 0, bytesRead);
			}
			byte[] imageBytes = outputStream.toByteArray();

			String base64Image = Base64.getEncoder().encodeToString(imageBytes);
			%>



			<td><img src="data:image/png;base64,<%=base64Image%>"
				width="240" height="300" /></td>


			<%
			String test = rs.getString("item_id");
			/* out.println("PRoduct id's are" + test); */
			int testID = Integer.parseInt(test);
			%>
			<td>
				<button type="submit" name="itemID" value="<%=test%>">Buy</button>


			</td>





		</tr>

		<%
}
%>
	</table>
</form>
<div></div>

<%

%>






<a href="../rutgersMain.jsp">Return to Main Page</a>