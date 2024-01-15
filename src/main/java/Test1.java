

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Test1
 */
@WebServlet("/Test1")
public class Test1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Test1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//request.getWriter().append("Served at: ").append(request.getContextPath());
		
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// ServletOutputStream oos = null;
		// byte[] imgbyte = null;
		
		 byte[] imgbyte = null;
		ServletOutputStream oos = null;
		try {
			 
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ru_amazon","root", "PASSWORD");
				Statement st = con.createStatement();
				Statement newst = con.createStatement();
				Statement newerst = con.createStatement();
				ResultSet rs;
				
				String query = "select * from products";
				
				
				rs = st.executeQuery(query);
				
				if(rs.next()){

	                Blob img= rs.getBlob("photo");

	              imgbyte=img.getBytes(1, (int)img.length());
	              response.setContentType("image/jpg");
	              oos=response.getOutputStream();

	           }

	            oos.write(imgbyte);
	            con.close();
		              
		              
				
				
	}
		 catch(Exception e) {
			 e.printStackTrace();
		 }
	}

}
