package com.TechQuo.Controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import tables.UserBean;
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
		
		PrintWriter out=response.getWriter(); 
		try
		{	    

			String role1 = "User";
			String role2 = "Admin";
			UserBean user = new UserBean();
			user.setUsername(request.getParameter("username"));
			user.setPassword(request.getParameter("password"));
			user.setRole(request.getParameter("Role"));
			user = UserDAO.login(user);
			if((user != null)&&(user.getRole().equals(role1))){
				out.print("Welcome "+ user.getUsername());  
				request.setAttribute("NAME", user.getUsername());
				HttpSession session = request.getSession();
				session.setAttribute("name", user.getUsername());
			}
			else if((user != null)&&(user.getRole().equals(role2))){
				RequestDispatcher requestDispatcher; 
				requestDispatcher =request.getRequestDispatcher("Admin.jsp");
				requestDispatcher.forward(request, response);
				request.setAttribute("NAME", user.getUsername());
				HttpSession session = request.getSession();
				session.setAttribute("name", user.getUsername());
			}
		} 


		catch (Throwable theException) 	    
		{
			System.out.println(theException); 
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
