<%@ page import ="java.sql.*" %>
<%

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ru_amazon","root", "PASSWORD");
Statement st = con.createStatement();

String username = (String)session.getAttribute("uname");

// Update when the customer last logged in and delete their alerts
st.executeUpdate("update users set last_login = now() where uname = '" + (String)session.getAttribute("user") + "'");
//st.executeUpdate("delete from alerts where username = '" + (String)session.getAttribute("user") + "'");

session.invalidate();
response.sendRedirect("login.jsp");
 
%>