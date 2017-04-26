package controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connection.ConnectionManager;
import domain.User;
import tables.UserDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(urlPatterns = { "/login"})
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PreparedStatement ps;
		PrintWriter out=response.getWriter(); 
		response.setContentType("text/html");
		try
		{	    
			Connection con=null;
			con = ConnectionManager.getConnection();
			User user = new User();
			String errorMsg=null;
			String email= (request.getParameter("username"));
			String password = (request.getParameter("password"));
		    if(email == null || email.equals("")){
	            errorMsg ="User Email can't be null or empty";
	        }
		    else if(password == null || password.equals("")){
	            errorMsg = "Password can't be null or empty";
	        }

	        if(errorMsg != null){
	            RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
	            //PrintWriter out= response.getWriter();
	            out.println("<font color=red>"+errorMsg+"</font>");
	            rd.include(request, response);
	        }else{
	        	System.out.println("Email is"+email);
	        	System.out.println("Password is"+password);
	        
			user.setEmailId(email);
			user.setPassword(password);
			user = UserDAO.login(user);
			ps=con.prepareStatement("Select Flag from `user` where user_id=?");
			ps.setInt(1, user.getUserId());
			ResultSet rs = ps.executeQuery();
			String flag="";
			if(rs.next())
			{
				 flag=rs.getString(1);
			}
			System.out.println("flag before checking"+flag);
			if(user != null && flag.equalsIgnoreCase("Activate")){
				out.print("Welcome "+ user.getUserId()+""+user.getRole());
				System.out.println("Role is"+user.getRole()+"User id"+user.getUserId());
				request.setAttribute("NAME", user.getEmailId());
				HttpSession session=request.getSession();
				session.setAttribute("user_details", user);
				session.setAttribute("roles", user.getRole());
				//String flag_session=(String)session.getAttribute("flag_value");
				session.setAttribute("flag_val", flag);
				if(user.getRole().equalsIgnoreCase("User"))
				{
					RequestDispatcher requestDispatcher;			
		    		requestDispatcher =request.getRequestDispatcher("Home.jsp"); //change name later
		    		requestDispatcher.forward(request, response); 
					
				}
				else
				{
					RequestDispatcher requestDispatcher;			
		    		requestDispatcher =request.getRequestDispatcher("Admin.jsp"); //change name later
		    		requestDispatcher.forward(request, response); 
					
				}
				
				
			}
			else if(flag.equalsIgnoreCase("Deactivate"))
			{
				out.println("<script type=\"text/javascript\">");        // creating alert message using java
				out.println("alert('User is Deactivate by admin');");
				out.println("location='login.jsp';");
				out.println("</script>");
			}
			else
			{
				out.println("<script type=\"text/javascript\">");        // creating alert message using java
				out.println("alert('User Not Registered. Login with correct Credentials');");
				out.println("location='login.jsp';");
				out.println("</script>");
			}
		} 
		}


		catch (Throwable theException) 	    
		{
			System.out.println(theException); 
			out.println("<script type=\"text/javascript\">");        // creating alert message using java
			out.println("alert('Incorrect Credentials');");
			out.println("location='Register.jsp';");
			out.println("</script>");
		}
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
