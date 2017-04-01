package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ForgotPassword
 */
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPassword() {
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
		
		String mailid = request.getParameter("mailid");
		String Question = request.getParameter("Q1");
		String Answer = request.getParameter("Answer");
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techquo", "root", "tiger");
			stmt = con.createStatement();
			String query = "SELECT user_id from user where Email='"+mailid+"' AND ((Q1 ='"+Question+"' AND A1 ='"+Answer+"') OR (Q2 ='"+Question+"' AND A2 ='"+Answer+"'))";
			ResultSet rs = stmt.executeQuery(query);		
			if (!rs.next()){
				//ResultSet is empty
				out.println("<p> WHAAAAAT? Incorrect response.</p>");
				}
			else{
				//out.println("<p>Go to change password</p>"+mailid);   //link to the password one
				request.setAttribute("Mail", mailid);
				RequestDispatcher requestDispatcher; 
				requestDispatcher =request.getRequestDispatcher("UpdatePassword.jsp");
				requestDispatcher.forward(request, response); 
			}
		}
		
		catch(Exception se)
        {
            se.printStackTrace();
            out.println("Hello, Error!");
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
