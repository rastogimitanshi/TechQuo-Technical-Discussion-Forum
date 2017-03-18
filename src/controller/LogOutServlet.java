package controller;

import java.io.IOException;
//import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

//import connection.ConnectionManager;

public class LogOutServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(LogOutServlet.class);
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
		logger.info("Inside log out servlet");
		response.setContentType("text/html");  
					
		HttpSession session=request.getSession(); 
		session.invalidate(); 
		logger.info("session invalidated");
		System.out.println("You are successfully logged out!");  
		logger.info("You have successfully logged out");
		
		RequestDispatcher requestDispatcher;			
		requestDispatcher =request.getRequestDispatcher("login.jsp"); //change name later
		requestDispatcher.forward(request, response); 
		
	}  
}
