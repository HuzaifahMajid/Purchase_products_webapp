package buy_prod;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.io.*;
import java.sql.*;
import java.awt.image.* ;
import javax.imageio.ImageIO ;
import java.io.ByteArrayOutputStream;
import java.awt.image.BufferedImage ;
import java.io.File ;
import javax.imageio.ImageIO;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BuyItemServlet
 */
@WebServlet("/BuyItemServlet")
public class BuyItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyItemServlet() {
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
		PrintWriter out = response.getWriter();
		
		out.println("<!DOCTYPE html>\n"
				+ "<html>\n"
				+ "	<head>\n"
				+ "		<title>Buy an item</title>\n"
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
				+ "	<h1>Buy Product</h1>\n"
				+ "	<div>\n"
				+ "		<p>You can either buy this item directly. Or send an offer to the seller.\n"
				+ "			\n"
				+ "			"
				+ "		</p>\n"
				+ "	</div>\n"
				);
		
		try {
			String ListingID = request.getParameter("itemID"); 
			out.println("ITEM ID  " + ListingID);
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ru_amazon","root", "PASSWORD");
			Statement st = con.createStatement();
			ResultSet rs;
			
			
			
			
			
			String getBuyingItem = "select * from listings l natural join (select * from items i natural join products p" + 
					" where i.item_id = p.item_id) p where l.item_id = '" + ListingID + "' and l.item_id = p.item_id";
				
			
			rs = st.executeQuery(getBuyingItem);
			
			if(rs.next()) {
				out.println("<table>\n"
						+ "			<tr>\n"
						+ "				<td><b>Item Number</b></td>\n"
						+ "				<td><b>Product Name</b></td>\n"
						+ "				<td><b>Product Location</b></td>\n"
						+ "				<td><b>Product Description</b></td>\n"
						+ "				<td><b>Product Type</b></td>\n"
						+ "				<td><b>Product Color</b></td>\n"
						+ "				<td><b>Delivery Option</b>\n"
						+ "				<td><b>Product Condition</b></td>\n"
						+ "				<td><b>Product Price</b></td>\n"
						//+ "				<td><b>Product Image</b></td>\n"
						+ "			</tr>");
				out.println("<tr>");
				
				out.println("<td>" + rs.getString("item_id") + "</td>");
				out.println("<td>" + rs.getString("prod_name") + "</td>");
				out.println("<td>" + rs.getString("prod_loc") + "</td>");
				out.println("<td>" + rs.getString("product_desc") + "</td>");
				out.println("<td>" + rs.getString("prod_type") + "</td>");
				out.println("<td>" + rs.getString("prod_color") + "</td>");
				out.println("<td>" + rs.getString("delivery") + "</td>");


				if(rs.getString("prod_condition").equals("brandnew")) {
					out.println("<td> Brand New </td>");
				}
				out.println("<td>" + rs.getString("current_price") + "</td>");
				
				
//				Blob blob = rs.getBlob("photo");
//				
//				InputStream inputStream = blob.getBinaryStream();
//				
//				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
//				byte[] buffer = new byte[2000];
//				int bytesRead = -1;
//				
//				while ((bytesRead = inputStream.read(buffer)) != -1) {
//					outputStream.write(buffer, 0, bytesRead);
//				}
//				byte[] imageBytes = outputStream.toByteArray();
//				
//				String base64Image = Base64.getEncoder().encodeToString(imageBytes);	
//				
//				//<td> <img src="data:image/png;base64,<%=base64Image%>" width="240" height="300"/> </td> 
//				out.println("<td>");
//				out.println("<img src= data:image/png;base64,'"+ ListingID + "width=240" + "height=300" + "/>");
//				out.println("</td>");
				
				//String testing = "where l.item_id = '" + ListingID;
				out.println("</tr>");
				out.println("</table>");

			}
			out.println("<h2>Buy Product Now</h2>\n"
					+ "		<p>This will allow you to buy a product. Please enter the price of the item inside the box to confirm</p>\n" 
					+ "		<form action=\"BuyDirectServlet\" method=\"POST\">\n"
					+ "			<input type=\"number\" required=\"required\" step=\"0.01\" name=\"buyAmount\"><br>\n"
					+ "			<input type=\"hidden\" name=\"listingID\" value=\"" +  ListingID  + "\">\n"
					+ "			<input type=\"submit\" value=\"Submit\">\n"
					+ "		</form>\n"
					+ "		<a href=\"End/rutgersMain.jsp\">Return to the main page</a>\n"
					+ "	</div>");		
				
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
				//doGet(request, response);
	}

}
