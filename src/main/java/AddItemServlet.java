

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class AddlistingServlet
 */
@WebServlet("/AddlistingServlet")
@MultipartConfig(maxFileSize=16177215)
public class AddItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddItemServlet() {
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
		
		String seller = (String)session.getAttribute("user");
		String itemName = request.getParameter("name");
		String itemLoc = request.getParameter("location");
		String itemDesc = request.getParameter("description");
		//String delivery = request.getParameter("delivery");
		
		
		String condition = request.getParameter("condition");
		String itemType = request.getParameter("type");
		String itemColor = request.getParameter("color");
		String itemPrice = request.getParameter("price");
		
		
		String deliveryFree = request.getParameter("delivery");
		boolean delivery;
		
		if(deliveryFree.equals("false")) {
			delivery = false;
		}
		else {
			delivery = true;
		}
		
		
		InputStream inputStream = null; // input stream of the upload file

		Part filePart = request.getPart("photo");
		
		if(filePart != null) {
			 System.out.println(filePart.getName());
	         System.out.println(filePart.getSize());
	         System.out.println(filePart.getContentType());
	             
	        // obtains input stream of the upload file
	       inputStream = filePart.getInputStream();
	     
		}
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ru_amazon","root", "PASSWORD");
			Statement st = con.createStatement();
			Statement newst = con.createStatement();
			Statement newerst = con.createStatement();
			ResultSet rs;
			
			//|| filePart.equals("")
			
			if (
					itemName.equals("") 
					|| condition.equals("") 
					|| itemLoc.equals("") 
					|| itemType.equals("") 
					|| itemColor.equals("") 
					|| itemDesc.equals("")
					|| itemPrice.equals("") 
					|| filePart == null) {
				
				
				
				
				
				
				out.println("<!DOCTYPE html>");

		 		out.println("<html>");
		 		out.println("<body>");
				
		 		//fix path
				out.println("One of your entry fields is empty, please try again. <div><a href='End/CreateListing/itemListing.jsp'>Try again</a></div>");
				out.println("</body>");
				out.println("</html>");
				
				
			}
			else {
				
				
				ResultSet lastID = st.executeQuery("select max(item_id) highest from items");
				lastID.next();
				Integer newListingID = lastID.getInt("highest");
				
				if (newListingID == null) {
					newListingID = 0;
				}
				newListingID += 1;
				
				// broad table adding the item
				String addItemQuery = "insert into items values (?, ?, ?, ?)";
				PreparedStatement addItemStatement = con.prepareStatement(addItemQuery);
				
				addItemStatement.setInt(1, newListingID);
				addItemStatement.setString(2, itemName);
				addItemStatement.setString(3, itemLoc);
				//addItemStatement.setString(4, itemType);
				//addItemStatement.setString(5, itemColor);
				addItemStatement.setString(4, itemDesc);
				//addItemStatement.setBoolean(7, delivery);
				//addItemStatement.setString(8, condition);
				addItemStatement.executeUpdate();
				
				// now we are done with adding the PRODUCT to the ITEMS table
				

				
				//NOW we have to add the PRODUCT to the PRODUCTS table
				String addProductQuery = "insert into products values(?, ?, ?, ?, ?, ?)";
				
				PreparedStatement addProductStatement = con.prepareStatement(addProductQuery);
				
				addProductStatement.setInt(1, newListingID);
				addProductStatement.setString(2, itemType);
				addProductStatement.setString(3, itemColor);
				addProductStatement.setBoolean(4, delivery);
				addProductStatement.setString(5, condition);
				
				if (inputStream != null) {
	                // fetches input stream of the upload file for the blob column
				addProductStatement.setBlob(6, inputStream);
	        }
				
				addProductStatement.executeUpdate();
				
				
				String addListingQuery = "insert into listings values(?, ?, ?)";
				PreparedStatement addListingStatement = con.prepareStatement(addListingQuery);

				addListingStatement.setString(1, seller);
				addListingStatement.setInt(2, newListingID);
				
				addListingStatement.setString(3, itemPrice);
				
				
				addListingStatement.executeUpdate();
				
				
				out.println("<!DOCTYPE html>");

		 		out.println("<html>");
		 		out.println("<body>");
				
		 		//fix path
				out.println("Your item has been listed. <a href='End/rutgersMain.jsp'> Return to the main page.");
				out.println("</body>");
				out.println("</html>");

			}
			
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
