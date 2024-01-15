package reg_service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BuyServiceServlet
 */
@WebServlet("/BuyServiceServlet")
public class BuyServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyServiceServlet() {
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
		out.println("<!DOCTYPE html>\n"
				+ "<html>\n"
				+ "	<head>\n"
				+ "		<title>Sign up for a service</title>\n"
				+ "		<style>\n"
				+ "			table {\n"
				+ "				border: 1px solid black;\n"
				+ "				border-collapse: collapse;	\n"
				+ "				width: 100%\n"
				+ "			}\n"
				+ "			th, td {\n"
				+ "				text-align: left;\n"
				+ "				padding: 15px;\n"
				+ "			}	\n"
				+ "			tr:nth-child(even) {\n"
				+ "				background-color: #f2f2f2;\n"
				+ "			}\n"
				+ "			body{background: #FFFAF0;}\n"
				+ "		</style>\n"
				+ "	</head>\n"
				+ "	<h1>Sign up </h1>\n"
				+ "	<div>\n"
				+ "		<p>You can either sign up for this service today! "
				+ "			The seller will be notified of your purchase. \n"
				+ "			"
				+ "		</p>\n"
				+ "	</div>\n"
				);
		
		
	try {
		String ListingID = request.getParameter("serviceID");
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ru_amazon","root", "PASSWORD");
		Statement st = con.createStatement();
		Statement st2 = con.createStatement();
		ResultSet rs;
		ResultSet rs2;
		
		String getService = "select * from listings l natural join (select * from items i natural join services p" + 
				 " where i.item_id = p.item_id) p where l.item_id = '" + ListingID + "' and l.item_id = p.item_id";
		rs = st.executeQuery(getService);
		
		if(rs.next()) {
			out.println("<table>\n"
					+ "			<tr>\n"
					+ "				<td><b>Item Number</b></td>\n"
					+ "				<td><b>Service Name</b></td>\n"
					+ "				<td><b>Service Location</b></td>\n"
					+ "				<td><b>Service Description</b></td>\n"
					+ "				<td><b>Course or Subject</b></td>\n"
					+ "				<td>$<b>Service Charge (hourly)</b></td>\n"
					+ "				<td><b>Qualifications </b></td>\n"
					//+ "				<td><b>Product Image</b></td>\n"
					+ "			</tr>");
			out.println("<tr>");
			
			out.println("<td>" + rs.getString("item_id") + "</td>");
			out.println("<td>" + rs.getString("prod_name") + "</td>");
			out.println("<td>" + rs.getString("prod_loc") + "</td>");
			out.println("<td>" + rs.getString("product_desc") + "</td>");
			out.println("<td>" + rs.getString("course_subject") + "</td>");
			out.println("<td>" + rs.getString("service_charge") + "</td>");
			out.println("<td>" + rs.getString("qualifications") + "</td>");


			
			
			out.println("</tr>");
			out.println("</table>");
		
	}
		
		out.println("<h2>Register for  '" + rs.getString("prod_name")  + "' + </h2>\n"
				+ "		<p>This will allow you to register for the service. Please enter the price of the item inside the box to confirm</p>\n" 
				+ "		<form action=\"RegisterServiceServlet\" method=\"POST\">\n"
				+ "			<input type=\"number\" required=\"required\" step=\"0.01\" name=\"buyAmount\"><br>\n"
				+ "			<input type=\"hidden\" name=\"listingID\" value=\"" +  ListingID  + "\">\n"
				+ "			<input type=\"submit\" value=\"Submit\">\n"
				+ "		</form>\n"
				+ "		<a href=\"End/rutgersMain.jsp\">Return to the main page</a>\n"
				+ "	</div>");		
		
		
	}
	catch(Exception e){
			e.printStackTrace();
		}
	}
}


