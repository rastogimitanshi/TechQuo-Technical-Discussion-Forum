package com.TechQuo.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
//import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdatePassword
 */
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		Statement stmt = null;
		
		String pass = request.getParameter("npwd");
		String cpass = request.getParameter("cpwd");		
		String mailid = request.getParameter("Mail");   
		//out.println(mailid);
		if(pass.equals(cpass)){
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techquo", "root", "dnsingh87");
				stmt = con.createStatement();
				//String query = "Update user set Password='"+pass+"' where Email='"+mailid+"'";
				int i = stmt.executeUpdate("Update user set Password='"+pass+"' where Email='"+mailid+"'");
				if(i > 0){
					out.println("<p>Password changed</p>");
					out.println("<p><a href=\"http://localhost:8080/TechQuo/login.jsp\">"+"Login"+ "</a></p>");
					}
				}
			catch(Exception se)
	        {
	            se.printStackTrace();
	            out.println("Hello, Error!");
	        }
		}
		else {
			out.println("<p>Passwords don't match</p>");
		}
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
