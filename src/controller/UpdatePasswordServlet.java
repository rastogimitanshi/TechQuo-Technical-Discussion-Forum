package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
//import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import connection.ConnectionManager;
import domain.User;
import service.SendMail;
@WebServlet(urlPatterns = { "/UpdatePassword"})
public class UpdatePasswordServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	final static Logger logger=Logger.getLogger(UpdatePasswordServlet.class);

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		logger.info("Inside update password servlet");
		PreparedStatement ps;
		response.setContentType("text/html"); // type of response given by the server
		HttpSession session = request.getSession(false);
		User user =(User) session.getAttribute("user_details");
		String Password =request.getParameter("NewPass");
		if(session.getAttribute("user_details")==null){
					request.setAttribute("SessionExpired", "Your session has expired. Please log in again.");
					RequestDispatcher requestDispatcher;
					requestDispatcher = request.getRequestDispatcher("/login.jsp");
					requestDispatcher.forward(request,response);
					return;
				}
		try{
			Connection con=null;
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("Update `user` set Password=? where user_id=?");
			ps.setString(1, Password);
			ps.setInt(2, user.getUserId());
			int i = ps.executeUpdate();
			if(i>0)
			SendMail.sendMail(user.getEmailId(), user.getFirstName(), "Dear" +user.getFirstName()+" Your Password has been changed sucessfully on TechQuo-Technical Discussion Forum!Login to you TechQuo account with new Password " );
			logger.info("Password updated successfully");
			out.println("<script type=\"text/javascript\">");        // creating alert message using java
			out.println("alert('Password Changed successfully');");
			out.println("location='Home.jsp';");
			out.println("</script>");
			out.println("user");
		

		}
		catch(Exception e){
			System.out.println(e);
			logger.error(e);
//			out.println("<script type=\"text/javascript\">");        // creating alert message using java
//			out.println("alert('Some unexpected error occured. Please try again later');");
//			out.println("location='home.jsp';");
//			out.println("</script>");
				out.println("usere");
			
				
		}
	}
}
