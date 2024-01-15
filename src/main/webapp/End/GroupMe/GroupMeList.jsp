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
	
		<title>GroupMe Links</title>
		
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
ResultSet rs;



String search = request.getParameter("course_id");

String query;

if (search == null) {
	query = "select * from course_groupme_chats";

	}

else{
	query = "select * from course_groupme_chats WHERE course_id like '%" + search + "%' OR course_name like '%" + search + "%' OR professor_name like '%" + search + "%'";
}




// Create the query and insert the proper values afterwards
%>
<form method="post" action="GroupMeList.jsp">

    

<h2 align="center"><font><strong>GroupMe Invite Links</strong></font></h2>
	
	<div class= "first" style="clear:both">


<% if(search != null){
	
%>
	
	<form action="GroupMeList.jsp" >
    	<input type="submit" value="Clear Search" style="float: right;"/>
	</form>
<%
}
%>
	
	<button type="submit" name="save" class="btn btn-primary " style="float: right;">Search</button>
	<input type="text" name="course_id" class="form-control" placeholder="Search Course ID" style="float: right;">
	
	

   
    </div>
<table >

	<tr bgcolor="#DEB887"> 
	<td>Course ID</td>
	<td>Course Name</td>
	<td>Professor Name</td>
	<td>GroupMe Invite Link</td>

<%
rs = st.executeQuery(query);





while(rs.next()){



	%>


	
	
	</tr>
	
		<tr bgcolor="#DEB887">
		

		<td><%=rs.getString("course_id") %></td>
		<td><%=rs.getString("course_name") %></td>
		<td><%=rs.getString("professor_name") %></td>
		
		<td>
  			<a href="<%=rs.getString("groupme_link") %>">
    			 JOIN 
  			</a>
		</td>
		
<%-- 		<td><%=rs.getString("groupme_link") %></td> --%>

		

	
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




	

<a href="../rutgersMain.jsp">Return to Main Page</a>



 