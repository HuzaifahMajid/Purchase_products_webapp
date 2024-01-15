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
	
		 <link rel='stylesheet' href='groupmelist.css'>
 		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 	
		<title>Courses</title>
		
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
			body{
				background: #FFFAF0;
			}
			tr.urgent td{ 
				background-color :red; 
			}
		    tr.warning td{ 
		    	background-color : yellow; 
		    }
		    tr.okay td{ 
		    	background-color : green; 
		    }
		    td {
			   white-space:nowrap;
			   border: 1px solid black;
			   max-width: 300px;
			   overflow-y:hidden;
			}
		</style>
	</head>
	
	

<%

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ru_amazon","root", "PASSWORD");
Statement st = con.createStatement();
ResultSet rs;



String search = request.getParameter("course_id");

String query;

if (search == null) {
	query = "select * from courses";

	}

else{
	query = "select * from courses WHERE course_id like '%" + search + "%' OR course_name like '%" + search + "%' OR professor_names like '%" + search + "%'";
}




// Create the query and insert the proper values afterwards
%>
<%-- <form method="post" action="courses.jsp">

    

<h2 align="center"><font><strong>Courses</strong></font></h2>
	
	<div class= "first" style="clear:both">


<% if(search != null){
	
%>
	
	<form action="courses.jsp" >
    	<input type="submit" value="Clear Search" style="float: right;"/>
	</form>
<%
}
%>
	
	<button type="submit" name="save" class="btn btn-primary " style="float: right;">Search</button>
	<input type="text" name="course_id" class="form-control" placeholder="Search Course ID" style="float: right;">
	
	

   
    </div> --%>
    <body>
    <a href="../rutgersMain.jsp">Return to Main Page</a>
		<div class="container">
			<h2 align="center"><strong>Courses</strong></h2>
			<form method="post" action="courses.jsp">
				<div class="form-group">
					<label for="course_id">Search Course ID:</label>
					<input type="text" name="course_id" id="course_id" class="form-control" placeholder="Enter Course ID">
				</div>
				<button type="submit" name="save" class="btn btn-primary">Search</button>
				<% if(search != null){ %>
					<button type="submit" class="btn btn-secondary" onclick="location.href='courses.jsp'">Clear Search</button>
				<% } %>
			</form>
<table border=1 frame=void rules=rows>

	<tr bgcolor="#DEB887"> 
	<td>Course ID</td>
	<td>Course Name</td>
	<td>Section</td>
	<td>Professor Name</td>
	<td>RateMyProfessor Link</td>
	<td>Section Status</td>


<%
rs = st.executeQuery(query);





while(rs.next()){



	%>


	
	
	</tr>
		
		<%
		if(rs.getString("status").equals("Open")){
			
		%>
			
			<tr bgcolor="#DEB887" class = "okay">
			
		<%
		}
		else{
			
		%>
			
			<tr bgcolor="#DEB887" class = "urgent">
			
		<%	
		}
		
		%>
		
		
		
		

		<td><%=rs.getString("course_id") %></td>
		<td ><%=rs.getString("course_name") %></td>
		<td><%=rs.getString("section_number") %></td>
		<td>
		<%
		String names = rs.getString("professor_names");
		String [] namesList = names.split(";");
		
		for (String name : namesList){
			
			%>
			<%=name%>
			
			<BR>
			
		<%	
			
		}
		%>		
		
		
		
		
		</td>
		
		
		<td>
		
		<%	
		String links = rs.getString("rmp_links");
		String ratings = rs.getString("professor_rating");

		
		
		if(links != null && ratings != null){
			
			
			
			String [] linksList = links.split(";");
			String [] ratingsList = ratings.split(";");
			
			
			for (int i = 0; i <  linksList.length; i++){
				
				if(linksList[i].equals("na") || linksList[i].equals("npd")){
				%>
				
					No Instructor Information - <b>[ --/5 ]</b>
					<BR>
				
			<%	
				}
				else{
				
				%>
				<a href=<%=linksList[i]%> target="_blank">View on RateMyProfessor</a> -  <b><%=ratingsList[i]%> </b>
				
				<BR>
				
			<%	
				
				}
			}
		}
		else{
			
		%>
			
			No Instructor Information - <b>[ --/5 ]</b>
			
			<BR>
			
		<%	
		}
		
		
			
		%>
				
		
		</td>
		
		
	
		
		<td><%=rs.getString("status") %></td>

	
		</tr>
	
	
	

	<%
}
%>
</table>
</form>

<div>
  

</div>

<%

%>




	





 