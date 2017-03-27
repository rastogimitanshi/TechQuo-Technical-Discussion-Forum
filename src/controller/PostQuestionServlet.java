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

import org.apache.log4j.Logger;

import com.mysql.jdbc.Connection;

import connection.ConnectionManager;

/**
 * Servlet implementation class PostQuestionServlet
 */
@WebServlet(urlPatterns={"/PostQuestion"})
public class PostQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private static final long serialVersionUID =1L;
	final static Logger logger= Logger.getLogger(PostQuestionServlet.class);  

    public PostQuestionServlet() {
        super();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		
		logger.info("Inside Post Question servlet");
		response.setContentType("text/html");
        response.setContentType("text/html");
       // PrintWriter out = response.getWriter();
        HttpSession session=request.getSession(false);  
    	if(session.getAttribute("user_details")==null){
    				request.setAttribute("SessionExpired", "Your session has expired. Please log in again.");
    				RequestDispatcher requestDispatcher;
    				requestDispatcher = request.getRequestDispatcher("/login.jsp");
    				requestDispatcher.forward(request,response);
    				return;
    			}
        try{
        Connection conn=null;
		conn = ConnectionManager.getConnection();
		String ques=request.getParameter("ques");
		Integer uid=Integer.parseInt(request.getParameter("uid"));
		String errorMsg=null;
		if(ques == null || ques.equals("")){
            errorMsg ="Question Field Cannot Be Empty!!";
        }
		 if(errorMsg != null){
	            RequestDispatcher rd = getServletContext().getRequestDispatcher("/Home.jsp");
	           // PrintWriter out= response.getWriter();
	            out.println("<font color=red>"+errorMsg+"</font>");
	            rd.include(request, response);
	        }
		String []tags;
		tags = request.getParameterValues("myInputs");
		System.out.println(ques);
		System.out.println(tags);
		System.out.println(uid);
		PreparedStatement pstI= (PreparedStatement) conn.prepareStatement("INSERT INTO"+
					"`question`(question,user_id) VALUES(?,?)");
		pstI.setString(1,ques);
		pstI.setInt(2,uid);
		pstI.executeUpdate();
		PreparedStatement pstS= (PreparedStatement) conn.prepareStatement("SELECT ques_id "+
					"FROM `question` ORDER BY create_time DESC LIMIT 1");
		ResultSet rs= pstS.executeQuery();
		int qid=0;
		if(rs.next())
		{
			 qid=rs.getInt(1);
		}
	PreparedStatement pstT= (PreparedStatement) conn.prepareStatement("INSERT INTO "+
					"`tags`(ques_id,tag) VALUES(?,?)");
	
		for (String tag: tags)
		{
			pstT.setInt(1,qid);
			pstT.setString(2,tag);
			pstT.executeUpdate();
		}
		PreparedStatement pstU=(PreparedStatement) conn.prepareStatement("UPDATE `user` SET QuestionsPosted=QuestionsPosted+1 WHERE user_id=?");
		pstU.setInt(1,uid);
		pstU.executeUpdate();
		out.println("<script type=\"text/javascript\">");        // creating alert message using java
		out.println("alert('Question Posted Successfully');");
		out.println("location='Home.jsp';");
		out.println("</script>");
		
	
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