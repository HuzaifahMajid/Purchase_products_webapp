package scholar_commons_homepage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
 * Servlet implementation class LoginServlet
 * 
 * This servlet will be responsible for controlling the login aspect of the website
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		
		String uname = request.getParameter("username");
		String upwd = request.getParameter("password");
		
		Connection con = null;
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		PrintWriter out = response.getWriter();
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ru_amazon","root", "PASSWORD");
			Statement st = con.createStatement();
			//Statement st2 = con.createStatement();
			ResultSet rs;
			
				
			rs = st.executeQuery("select * from users where uname='" + uname + "' and upwd='" + upwd + "'");
			
			if(rs.next()) {
				session.setAttribute("user", uname);
				
				//check the type of account
				String type = rs.getString("acct_type");
				//String college = rs.getString("college").toLowerCase();
				
				  
				
				if(type.equals("end")) {
					response.sendRedirect("End/rutgersMain.jsp");
				}
				else if(type.equals("rep")) {
					response.sendRedirect("Rep/repMain.jsp");
				}
				else {
					response.sendRedirect("Admin/AdminMain.jsp");
				}
				
			}
			
			else {
				out.println("<!DOCTYPE html>");

		 		out.println("<html>");
		 		out.println("<body>");
				
				out.println("Invalid Username and Password!!");
				out.println("<div>");
				out.println("<a href='login.jsp'>Try again</a>");		
				out.println("</div>");
				
				out.println("</body>");
				out.println("</html>");
				
			}
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		

		
		
		
	}

}
