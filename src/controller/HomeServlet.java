package com.TechQuo.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HomeServlet
 */
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		Statement stmt = null;
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techquo", "root", "dnsingh87"); // Path of database, username, password for sql
			stmt = con.createStatement();
			String query = "SELECT user_id, Question from question;";

			
			ResultSet rs = stmt.executeQuery(query);
		      while (rs.next()) {
		        long uid = rs.getLong("User_id");
		        String question = rs.getString("Question");
		        out.println("<p> User Id : "+ uid +" </p>");
		        out.println("<p>"+ question + "</p>");
		      }
		
		}
		
		catch(Exception se)
        {
            se.printStackTrace();
        }
		
		
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
  }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		doGet(request, response);
	}

}
