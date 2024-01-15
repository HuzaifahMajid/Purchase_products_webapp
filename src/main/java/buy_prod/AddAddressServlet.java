//package buy_prod;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.Statement;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
///**
// * Servlet implementation class AddAddressServlet
// */
//@WebServlet("/AddAddressServlet")
//public class AddAddressServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public AddAddressServlet() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
////	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
////		// TODO Auto-generated method stub
////		response.getWriter().append("Served at: ").append(request.getContextPath());
////	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		PrintWriter out = response.getWriter();
//		HttpSession session = request.getSession();
//
//		
//		out.println("you are in the add address servlet");
//		//out.println("you are in the add address servlet" );
//
//		
//		String uname = (String) session.getAttribute("user");
//		String street = request.getParameter("street");
//		String city = request.getParameter("city");
//		String apt = request.getParameter("apt");
//		String instructions = request.getParameter("instructions");
//		String itemid = request.getParameter("itemID");
//		int thisListing = Integer.parseInt(itemid);
//		
//		out.println(thisListing);
//		
//		if(street == null || city == null || apt == null) {
//			
//			out.println("<!DOCTYPE html>");
//
//	 		out.println("<html>");
//	 		out.println("<body>");
//			
//	 		//fix path
//			out.println("One of your entry fields is empty, please try again. <div><a href='AddAddressServlet'>Try again</a></div>");
//			out.println("</body>");
//			out.println("</html>");
//		}
//		
//		
//		try {
//			Class.forName("com.mysql.cj.jdbc.Driver");
//			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ru_amazon","root", "PASSWORD");
//			Statement st = con.createStatement();
//			Statement newst = con.createStatement();
//			Statement newerst = con.createStatement();
//			ResultSet rs;
//			
//			
//			// adding to addresses table
//			String addAddressQuery = "insert into addresses values (?, ?, ?, ?, ?)";
//			PreparedStatement addAddressStatement = con.prepareStatement(addAddressQuery);
//			
//			
//			addAddressStatement.setString(1, uname);
//			addAddressStatement.setString(2, street);
//			addAddressStatement.setString(3, city);
//			addAddressStatement.setString(4, apt);
//			addAddressStatement.setString(5, instructions);
//			
//			//need to alert the seller 
//		
//			
//			
//			addAddressStatement.executeUpdate();
//			
//			
//			String params = "select seller, prod_name, current_price from listings natural join items where item_id = " + thisListing;
//			rs = st.executeQuery(params);
//			rs.next();
//			
//			
//			String price = rs.getString("current_price");
//			float sold_price = Float.parseFloat(price);
//			String seller = rs.getString("seller");
//			String prod_name = rs.getString("prod_name");
//			
////			out.println(seller);
////			out.println(uname);
//			
//			System.out.println(uname);
//			rs = st.executeQuery("select * from users where uname = " + uname);
//			while (rs.next()) {
//			  String un = rs.getString("upwd");
//			  out.println(un);
//			}
//
//		
////			st.executeUpdate("insert into alerts values ('" + seller + "', 'Your Item, " + prod_name + " has sold, ship it out asap!!')           ");
////			
////			newst.executeUpdate("insert into sold values('" + seller + "','" + uname +"', '" + thisListing + "', '" + price + "' )");
////			
//////		st.executeUpdate("insert into sold values('" + seller + "', 'mike', '" + thisListing + "', '" + price + "' )");
////
////			st.executeUpdate("delete from listings where item_id = " + thisListing);
////			
////			 	String page = "End/buySuccess.jsp";
////	            RequestDispatcher requestDispatcher = request.getRequestDispatcher(page);
////	            requestDispatcher.forward(request, response); 
//
//			
//			
//
//
//			
//			
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//		}
//		
//		
//		
//		out.println(street + "hey");
//		out.println(city + "bye");
//		
//		
//		
//	}
//
//}
package buy_prod;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddAddressServlet
 */
@WebServlet("/AddAddressServlet")
public class AddAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAddressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		
		out.println("you are in the add address servlet");
		//String buyer = (String)session.getAttribute("user");

		
		String uname = (String) session.getAttribute("user");
		out.println(uname + "i am the buyer");
		String street = request.getParameter("street");
		String city = request.getParameter("city");
		String apt = request.getParameter("apt");
		String instructions = request.getParameter("instructions");
		String itemid = request.getParameter("itemID");
		int thisListing = Integer.parseInt(itemid);
		
		//out.println(thisListing);
		
		if(street == null || city == null || apt == null) {
			
			out.println("<!DOCTYPE html>");

	 		out.println("<html>");
	 		out.println("<body>");
			
	 		//fix path
			out.println("One of your entry fields is empty, please try again. <div><a href='AddAddressServlet'>Try again</a></div>");
			out.println("</body>");
			out.println("</html>");
		}
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ru_amazon","root", "PASSWORD");
			Statement st = con.createStatement();
			Statement newst = con.createStatement();
			Statement newerst = con.createStatement();
			ResultSet rs;
			
			
			// adding to addresses table
			String addAddressQuery = "insert into addresses values (?, ?, ?, ?, ?)";
			PreparedStatement addAddressStatement = con.prepareStatement(addAddressQuery);
			
			
			addAddressStatement.setString(1, uname);
			addAddressStatement.setString(2, street);
			addAddressStatement.setString(3, city);
			addAddressStatement.setString(4, apt);
			addAddressStatement.setString(5, instructions);
			
			addAddressStatement.executeUpdate();
			
			
			
			//need to alert the seller 
			String params = "select seller, prod_name, current_price from listings natural join items where item_id = " + thisListing;
			rs = st.executeQuery(params);
			rs.next();
			
			String price = rs.getString("current_price");
			float sold_price = Float.parseFloat(price);
			String seller = rs.getString("seller");
			String prod_name = rs.getString("prod_name");
			

			//out.println("insert into sold values('" + seller + "', ' " + uname + ", '" + thisListing + "', '" + price + "' )");

			st.executeUpdate("insert into alerts values ('" + seller + "', 'Your Item, " + prod_name + " has sold, ship it out asap!!')           ");
			
			st.executeUpdate("insert into sold values('" + seller + "', '" + uname + "', '" + thisListing + "', '" + price + "' )");
			
			
			st.executeUpdate("delete from listings where item_id = " + thisListing);
			
			 	String page = "End/buySuccess.jsp";
	            RequestDispatcher requestDispatcher = request.getRequestDispatcher(page);
	            requestDispatcher.forward(request, response); 

			
			


			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
//		out.println(street + "hey");
//		out.println(city + "bye");
//		
		
		
	}

}