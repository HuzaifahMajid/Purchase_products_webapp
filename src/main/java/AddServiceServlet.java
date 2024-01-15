

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
 * Servlet implementation class AddServiceServlet
 */
@WebServlet("/AddServiceServlet")
public class AddServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddServiceServlet() {
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

		String subject = request.getParameter("subject");
		String serviceName = request.getParameter("name");
		String serviceCharge = request.getParameter("charge");
		String serviceDesc = request.getParameter("description");
		String qualifications = request.getParameter("qualification");
		String location = request.getParameter("location");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ru_amazon","root", "PASSWORD");
			Statement st = con.createStatement();
			Statement newst = con.createStatement();
			Statement newerst = con.createStatement();
			ResultSet rs;
			
			
			if(
				subject.equals("")
				|| serviceName.equals("")
				|| serviceCharge.equals("")
				|| serviceDesc.equals("")
					
					) 
			{
				out.println("<!DOCTYPE html>");

		 		out.println("<html>");
		 		out.println("<body>");
				
		 		//fix path
				out.println("One of your entry fields is empty, please try again. <div><a href='End/CreateListing/serviceListing.jsp'>Try again</a></div>");
				out.println("</body>");
				out.println("</html>");
				
			}
			
			if(qualifications.equals("")) {
				
				out.println("<!DOCTYPE html>");

		 		out.println("<html>");
		 		out.println("<body>");
				
		 		//fix path
				out.println("Please enter atleast 1 qualification! <div><a href='End/CreateListing/itemListing.jsp'>Try again</a></div>");
				out.println("</body>");
				out.println("</html>");
				
			}
			else {
				ResultSet lastID = st.executeQuery("select max(item_id) highest from listings");
				lastID.next();
				Integer newListingID = lastID.getInt("highest");
				if (newListingID == null) {
					newListingID = 0;
				}
				newListingID += 1;
				
				
				String addItemQuery = "insert into items values (?, ?, ?, ?)";
				PreparedStatement addItemStatement = con.prepareStatement(addItemQuery);
				
				addItemStatement.setInt(1, newListingID);
				addItemStatement.setString(2, serviceName);
				addItemStatement.setString(3, location);
				addItemStatement.setString(4, serviceDesc);
				
				addItemStatement.executeUpdate();
				
				
				
				String addServiceQuery = "insert into services values (?, ?, ?, ?)";
				PreparedStatement addServiceStatement = con.prepareStatement(addServiceQuery);
				
				addServiceStatement.setInt(1, newListingID);
				addServiceStatement.setString(2, subject);
				//addServiceStatement.setString(3, serviceName);
				addServiceStatement.setString(3, serviceCharge);
				//addServiceStatement.setString(5, serviceDesc);
				addServiceStatement.setString(4, qualifications);

				addServiceStatement.executeUpdate();
				
				String addListingQuery = "insert into listings values(?, ?, ?)";
				PreparedStatement addListingStatement = con.prepareStatement(addListingQuery);

				addListingStatement.setString(1, seller);
				addListingStatement.setInt(2, newListingID);
				
				addListingStatement.setString(3, serviceCharge);
				
				
				addListingStatement.executeUpdate();
				
				
				out.println("<!DOCTYPE html>");

		 		out.println("<html>");
		 		out.println("<body>");
				
		 		
				out.println("Your service has been listed. <a href='End/rutgersMain.jsp'> Return to the main page.");
				out.println("</body>");
				out.println("</html>");

				
				
				
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		
	}

}
