package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        try{
        Connection conn=null;
		conn = ConnectionManager.getConnection();
		String ques=request.getParameter("ques");
		Integer uid=Integer.parseInt(request.getParameter("uid"));
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
		out.println("<script type=\"text/javascript\">");        // creating alert message using java
		out.println("alert('Answer Posted Successfully');");
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