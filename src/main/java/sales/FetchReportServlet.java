package sales;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FetchReportServlet
 */
@WebServlet("/FetchReportServlet")
public class FetchReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FetchReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		PrintWriter out = response.getWriter();	
		HttpSession session = request.getSession();
		String user = (String)session.getAttribute("user");
		
		out.println("<!DOCTYPE html>\n"
				+ "<html>\n"
				+ "	<head>\n"
				+ "    	<title>Sales Report</title>\n"
				+ "    <style>\n"
				+ "			table {\n"
				+ "				border: 1px solid black;\n"
				+ "				border-collapse: collapse;	\n"
				+ "				width: 50%\n"
				+ "			}\n"
				+ "			table.center {\n"
				+ "  				margin-left: auto; \n"
				+ "  				margin-right: auto;\n"
				+ "			}\n"
				+ "			th, td {\n"
				+ "				text-align: left;\n"
				+ "				padding: 15px;\n"
				+ "			}	\n"
				+ "			tr:nth-child(even) {\n"
				+ "				background-color: #f2f2f2;\n"
				+ "			}\n"
				+ "	</style>\n"
				+ "	</head>\n"
				+ "	<body>");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String dataType= request.getParameter("option_type");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ru_amazon","root", "PASSWORD");
	        Statement st=con.createStatement();
	        ResultSet rs;
	        ResultSet rs2;
	        PreparedStatement ps;
	        
	        if(dataType.equals("total_earnings")) {
	        	 rs=st.executeQuery("select sum(s.final_price) as total from sold s where buyer <> ''");
	        	String query = "select * from addresses natural join sold where uname = ?";
	        	
	        	ps = con.prepareStatement(query);
	        	ps.setString(1, user);
	        	rs2 = ps.executeQuery();
	        	rs2.next();
	        	
	        	
	        	 
	        	 
	        	 out.println(" <table>\n"
	        	 		+ "                 <tr>\n"
	        	 		+ "                    <th>Total Earnings</th>\n"
	        	 		+ "                 </tr>");
	        	 
	        	 while(rs.next()) {
	        		 out.println("<tr>");
	        		 out.println("<td>" + rs.getString("total") + "</td>");
	        		 out.println("</tr>");
	        		 
	        		 out.println(" </table><br>");
	        		 
	        		
	        		 
	        		 
	   
	        		 
	        	 }
	        	 out.println(" <table>\n"
	        			 + "   <th>Items Sold and to Deliver</th>"
	 	        	 		+ "                 <tr>\n"
	 	       
	 	  
	 	        	 		+ "				<td><b>Street</b></td>\n"
	 	        	 		+ "				<td><b>City</b></td>\n"
	 	        	 		+ "				<td><b>Apt</b></td>\n"
	 	        	 		+ "				<td><b>Instructions</b></td>\n"
	 	        	 		+ "<td><b>Item ID</b></td>\n"
	 	        	 		+"<td><b>Final Price</b></td>\n"
	 	        	 		+ 	 "                 </tr>");
	 	
	 	        	 	
	        	while(rs2.next()) {
	        		
	        		 out.println("                 <tr>");
	        		// out.println("<tr> ");
	        		 out.println("<td>" + rs2.getString("Street") + "</td>");
	        	//	 out.println("</tr>");
	        		 
	        		 
	        		 //out.println("<tr>");
	        		 out.println("<td>" + rs2.getString("City") + "</td>");
	        		// out.println("</tr>");
	        		 
	        		 //out.println("<tr>");
	        		 out.println("<td>" + rs2.getString("Apt") + "</td>");
	        		// out.println("</tr>");
	        		 
	        		 //out.println("<tr>");
	        		 out.println("<td>" + rs2.getString("instructions") + "</td>");
	        		// out.println("</tr>");
	        		 
	        		 out.println("<td>" + rs2.getString("item_id") + "</td>");
	        		 
	        		 out.println("<td>" + rs2.getString("final_price") + "</td>");
	        	 }
	        	 
	        	 out.println("                 </tr>");
	        }
	        
//	        else if(dataType.equals("best_items")) {
//	        	 rs=st.executeQuery("select a.item_id, sum(s.final_price) as total from listings a natural join sold s where s.buyer <> '' group by a.item_id order by total desc");
//	        	 
//	        	 out.println("<table border=1 style=\"text-align:center\">");
//	        	 
//	        	 out.println("<tr>\n"
//	        	 		+ "                    <th>Item ID</th>\n"
//	        	 		+ "                    <th>Earnings for Item</th>\n"
//	        	 		+ "                 </tr>");
//	        	 
	        	 
	        	 
//	        	 while(rs.next()) {
//	        		 out.println("<tr>\n"
//	        		 		+ "                       <td>" + rs.getString("a.item_id") + "</td>\n"
//	        		 		+ "                        <td>" + rs.getString("total") + "</td>\n"
//	        		 		+ "                   </tr>");
//	        		 out.println("</table><br>");
//	        	 }
	       // }
	        
//	        else if(dataType.equals("best_sellers")) {
//	        	 rs=st.executeQuery("select a.seller, sum(a.current_price) as total from auctions a natural join sold s where buyer <> '' group by seller order by total desc;");
//	        	 
//	        	 out.println("<table border=1 style=\"text-align:center\">");
//	        	 
//	        	 out.println("<tr>\n"
//	        	 		+ "                    <th>Seller Username</th>\n"
//	        	 		+ "                    <th>Earnings Made By User</th>\n"
//	        	 		+ "                 </tr>");
//	        	 
//	        	 
//	        	 
//	        	 while(rs.next()) {
//	        		 out.println("<tr>\n"
//	        		 		+ "                       <td>" + rs.getString("a.seller") + "</td>\n"
//	        		 		+ "                        <td>" + rs.getString("total") + "</td>\n"
//	        		 		+ "                   </tr>");
//	        		 out.println("</table><br>");
//	        	 }
//	        }
	        
	        else {
	        	
	        }
	        
	    
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	    out.println("<a href='End/SalesReport/userSales.jsp'>Go back to Generate Sales Report Page</a>");
        out.println("</body>");
	}
	

}
