package buy_prod;

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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterServiceServlet
 */
@WebServlet("/RegisterServiceServlet")
public class RegisterServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServiceServlet() {
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
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String buyer = (String)session.getAttribute("user");
		String buyingAmount = request.getParameter("buyAmount");
		
		
		float amountFloat = Float.parseFloat(buyingAmount);
		
		String thisListingString = request.getParameter("listingID");
		
		
		int thisListing = Integer.parseInt(thisListingString);
		//out.println("The listing ID is : " + thisListingString + "The number version is: " + thisListing );
		
		
		
		out.println("<!DOCTYPE html>\n"
				+ "<html>\n"
				+ "	<head>\n"
				+ "		<title>Buy a service</title>\n"
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
				+ "	<div>\n"
				//+ "		<p>You successfully purchased the item, please enter your address below so the seller can either send or deliver the item to you\n"
				+ "			"
				+ "		</p>\n"
				+ "	</div>\n"
				+ " <html/>"
				);
				
		
				
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ru_amazon","root", "PASSWORD");
					Statement st = con.createStatement();
					ResultSet rs;
					
					String params = "select seller, prod_name, current_price from listings natural join items where item_id = " + thisListing;
					
					rs = st.executeQuery(params);
					rs.next();
					String seller = rs.getString("seller");
					//out.println(buyer + " is the buyer");
		
					String prod_name = rs.getString("prod_name");
					String current_price = rs.getString("current_price");
					float curr_price = Float.parseFloat(current_price);
					
					//out.println(seller + " is so cool");
					//out.println(prod_name + " is a great product");
					
					
					if (seller.equals((String)session.getAttribute("user"))) {
						out.println("Error: You cannot buy your own listing. <div><a href='End/BrowseItems/browseServices.jsp'>Return to the Buy page.</a>");
					}
					else if(amountFloat != curr_price ) {
						out.println("The price you entered does not match the price of the service!!");
						
						out.println("<!DOCTYPE html>");

				 		out.println("<html>");
				 		out.println("<body>");
				 		
						out.println("One of your entry fields is empty, please try again. <div><a href='BuyServiceServlet'> Try again</a></div>");
 
				 		
				 		out.println("</html>");
				 		out.println("</body>");
						
						
					}
					
					else if(amountFloat == curr_price) {
						
						out.println("You have successfully purchased " + prod_name  );
						
						
						out.println(" Enter your details\n");
						
						
						
						out.println("<!DOCTYPE html>");
					

				 		out.println("<html>");
				 		out.println("<body>");
				 		
				 		out.println("<form action= AddAddressServlet method=POST> "); //going to work on this later
				 		out.println("<label for=\"street\">Street name:</label>");
				 		out.println("<input type=\"text\" id=\"street\" name=\"street\"><br><br>");
				 		
				 		out.println("<label for=\"city\">City name:</label>");
				 		out.println("<input type=\"text\" id=\"city\" name=\"city\"><br><br>");
				 		
				 		out.println("<label for=\"apt\">Apartment Number:</label>");
				 		out.println("<input type=\"text\" id=\"apt\" name=\"apt\"><br><br>");
				 		
				 		out.println("<label for=\"instructions\">Specific Instructions:</label>");
				 		
				 		
				 		out.println("<textarea id=\"instructions\" name=\"instructions\" rows=\"4\" cols=\"50\">Enter text here...</textarea><br><br>");
				 		
				 		//out.println("<input type=\"submit\" value=\"Submit\">");
				 		out.println("<button type=\"submit\" name=\"itemID\" value=" + thisListing + ">Submit</button>");
				 		

				 		out.println("</form>");
						
				 		//fix path
						//out.println("One of your entry fields is empty, please try again. <div><a href='End/CreateListing/itemListing.jsp'>Try again</a></div>");
				 		
				 		out.println("</body>");
						out.println("</html>");
						
//						String delete_listing_query = "delete from listings where item_id =" + thisListing;
//						
//						st.executeUpdate(delete_listing_query);
						
						//rs.next();
						
						
					}
					
					
					
					

					
					
				}

				catch(Exception e) {
					e.printStackTrace();
				}
				
		
		
	}

	}


