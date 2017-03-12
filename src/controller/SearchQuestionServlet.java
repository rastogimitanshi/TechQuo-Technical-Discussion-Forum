package controller;
import connection.ConnectionManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import domain.Question;

import org.apache.log4j.Logger;

import com.mysql.jdbc.Connection;
public class SearchQuestionServlet extends HttpServlet {
	private static final long serialVersionUID =1L;
	final static Logger logger= Logger.getLogger(UpdateProfileServlet.class);
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	logger.info("Inside Search Question servlet");
		//response.setContentType("text/html");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
        	Connection conn=null;
			conn = ConnectionManager.getConnection();
            String tag = request.getParameter("tag");
            System.out.println(tag);
            Question Q1 = null;
            ArrayList<Question> ques_list = new ArrayList<Question>();
            
            PreparedStatement pst= (PreparedStatement) conn.prepareStatement("SELECT Ques_id FROM `tags` WHERE tag LIKE ?");
            pst.setString(1,tag);
            ResultSet rs=pst.executeQuery();
           
 
            while(rs.next()) {
            	Integer qid=rs.getInt(1);
            	System.out.println(qid);
            	PreparedStatement ps= (PreparedStatement) conn.prepareStatement("SELECT Question, user_id, create_time FROM `question` WHERE Ques_id=?");
            	ps.setInt(1,qid);
            	ResultSet rst = ps.executeQuery();
            	rst.next();
            	Q1=new Question(qid,rst.getString(1),rst.getDate(3),rst.getInt(2));
                System.out.println(rst.getString(1));
                System.out.println(rst.getInt(2));
                System.out.println(rst.getDate(3));
                ques_list.add(Q1);
            	
            }
 
            request.setAttribute("quesList", ques_list);   
            getServletConfig().getServletContext().getRequestDispatcher("/searchview.jsp").forward(request,response);
            conn.close();      
            System.out.println("Disconnected!");
            
        } catch (Exception e) {
        	System.out.println(e);
			logger.error(e);
			logger.info("Search Successful!");
			out.println("<script type=\"text/javascript\">");        // creating alert message using java
			out.println("alert('Some unexpected error occured. Please try again later');");
			out.println("location='UserLogin.jsp';");
			out.println("</script>");
		}
        }
    }
