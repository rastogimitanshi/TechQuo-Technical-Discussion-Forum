package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;

import connection.ConnectionManager;
import domain.User;

/**
 * Servlet implementation class UpvoteServlet
 */
@WebServlet("/Upvote")
public class UpvoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpvoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session =request.getSession(false);
    	if(session.getAttribute("user_details")==null){
    	request.setAttribute("SessionExpired", "Your session has expired. Please log in again.");
    	RequestDispatcher requestDispatcher;
    	requestDispatcher = request.getRequestDispatcher("/login.jsp");
    	requestDispatcher.forward(request,response);
    	return;
    }
    	User user= (User)session.getAttribute("user_details");

		Integer ansid= Integer.parseInt(request.getParameter("ansid"));
		
		System.out.println(user.getUserId());
		System.out.println(ansid);
		try{
			Connection con=null;
			con = ConnectionManager.getConnection();
		PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * from `user_ans_likes` where user_id=? AND ans_id=?");
		ps.setInt(1,user.getUserId());
		ps.setInt(2,ansid);
		ResultSet rs= ps.executeQuery();
		if(rs.next())
		{
			out.println("You have already upvoted the Answer.");
		}
		else{
			PreparedStatement psU = (PreparedStatement) con.prepareStatement("UPDATE `answer` SET upvotes=upvotes+1 WHERE ans_id=?");
			psU.setInt(1,ansid);
			int i = psU.executeUpdate();
			PreparedStatement psI =(PreparedStatement)con.prepareStatement("INSERT INTO `user_ans_likes`(user_id,ans_id) VALUES(?,?)");
			psI.setInt(1,user.getUserId());
			psI.setInt(2,ansid);
			int j = psU.executeUpdate();
			
			if(i>0&&j>0)
			{
				out.println("Answer Liked Successfully");
			}
		
		}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			out.println("<script type=\"text/javascript\">");        // creating alert message using java
			out.println("alert('Some unexpected error occured. Please try again later');");
			out.println("location='Home.jsp';");
			out.println("</script>");
			
		}
	
	}
}
