<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="java.io.*" %>
<%@ page import ="java.awt.image.*" %>
<%@ page import ="javax.imageio.ImageIO" %>
<%@ page import ="java.io.ByteArrayOutputStream" %>
<%@ page import ="java.awt.image.BufferedImage" %>
<%@ page import ="java.io.File" %>
<%@ page import ="javax.imageio.ImageIO" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Service Listings</title>
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
			body{background: #FFFAF0;}
		</style>
	</head>
	
	
	

<%

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ru_amazon","root", "PASSWORD");
Statement st = con.createStatement();
Statement st2 = con.createStatement();
ResultSet rs;
ResultSet rs2;

String query = "select * from listings l natural join (select * from items i natural join services s " + " where i.item_id = s.item_id) s where l.item_id = s.item_id ";

// Create the query and insert the proper values afterwards
%>
<form action="../../BuyServiceServlet" method="POST">

<h2 align="center"><font><strong>Retrieve data from database in jsp</strong></font></h2>
<table >
<%
rs = st.executeQuery(query);



while(rs.next()){



String item_id = rs.getString("item_id");
int id = Integer.parseInt(item_id);
	%>
	<tr bgcolor="#DEB887"> 
	<td>Item Number</td>
	<td>Product Name</td>
	<td>Where Service is being offered</td>
	<td>Product Description</td>
	<td>Course or Subject</td>
	<td>Service Charge</td>
	<td>Qualifications</td>
	<td>Register?</td>
	
	
	
	
	
	</tr>
	
		<tr bgcolor="#DEB887">
		

		<td><%=rs.getString("item_id") %></td>
		<td><%=rs.getString("prod_name") %></td>
		<td><%=rs.getString("prod_loc") %></td>
		<td><%=rs.getString("product_desc") %></td>
		<td><%=rs.getString("course_subject") %></td>
		<td><%=rs.getString("service_charge") %></td>
		
		
		<%
		
		String ans = rs.getString("qualifications");
		if(ans.equals("n/a") || ans.equals("N/A")){
			ans = "No Answer";
		}
		
		%>
		
		<% 
			String test = rs.getString("item_id");
			out.println("PRoduct id's are" + test);
			int testID = Integer.parseInt(test);
			
			%>
		
		<td><%=rs.getString("qualifications") %></td>
			<td>
				<button type="submit" name="serviceID" value= "<%=test%>"> Sign up  </button>
				
					
			</td>  
		
		
		</tr>
		
		
		
		
	

	<%
}
%>
</table>
</form>



<%

%>



	

<a href="../rutgersMain.jsp">Return to Main Page</a>


		
