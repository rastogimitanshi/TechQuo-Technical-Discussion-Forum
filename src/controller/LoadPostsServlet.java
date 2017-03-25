package controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import com.mysql.jdbc.Connection;
import connection.ConnectionManager;
import domain.Question;
public class LoadPostsServlet extends HttpServlet {

	public LoadPostsServlet() {
		// TODO Auto-generated constructor stub
	}
	private static final long serialVersionUID =1L;
	final static Logger logger= Logger.getLogger(LoadPostsServlet.class);
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	logger.info("Inside Load Posts servlet");
		response.setContentType("text/html");
        response.setContentType("text/html");
        HttpSession session=request.getSession(false);  
    	if(session.getAttribute("user_details")==null){
    				request.setAttribute("SessionExpired", "Your session has expired. Please log in again.");
    				RequestDispatcher requestDispatcher;
    				requestDispatcher = request.getRequestDispatcher("Home.jsp");
    				requestDispatcher.forward(request,response);
    				return;
    			}

        PrintWriter out = response.getWriter();
        try{
        Connection con=null;
		con = ConnectionManager.getConnection();
		Statement stmt = null;
		stmt = con.createStatement();
		String query = "SELECT ques_id, create_time, question,user_id, Question from `question` ORDER BY count DESC LIMIT 10";
		ResultSet rs = stmt.executeQuery(query);
		Question Q1=null;
		ArrayList<Question> ques_list = new ArrayList<Question>();
	
		while(rs.next()){
				
			Q1=new Question(rs.getInt(1),rs.getString(3),rs.getDate(2),rs.getInt(4));
			ques_list.add(Q1);
			System.out.println(Q1);
		}
		request.setAttribute("quesList", ques_list); 
	
		
}
        catch(Exception e)
        {
        	out.println("<script type=\"text/javascript\">");        // creating alert message using java
			out.println("alert('Some unexpected error occured. Please try again later');");
			out.println("location='login.jsp';");
			out.println("</script>");
        }
        }
    }

