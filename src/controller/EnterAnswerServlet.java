package controller;
import connection.ConnectionManager;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
//import java.util.ArrayList;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import domain.Question;

import org.apache.log4j.Logger;

import com.mysql.jdbc.Connection;

public class EnterAnswerServlet extends HttpServlet {
	private static final long serialVersionUID =1L;
	final static Logger logger= Logger.getLogger(UpdateProfileServlet.class);
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	logger.info("Inside Enter Answer servlet");
		//response.setContentType("text/html");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try{
        Connection conn=null;
		conn = ConnectionManager.getConnection();
			String ans=request.getParameter("ans");
			System.out.println(ans);
			Integer qid=Integer.parseInt(request.getParameter("qid"));
			Integer uid=Integer.parseInt(request.getParameter("uid"));
			
			System.out.println(qid);
            PreparedStatement pstI= (PreparedStatement) conn.prepareStatement("INSERT INTO"+
			"`answer`(Ques_id_A,Answer,user_id_A) VALUES (?,?,?)");//change 123 to user id of the logged in user
			pstI.setInt(1,qid);
			pstI.setString(2,ans);
            pstI.setInt(3,uid);
            int i= pstI.executeUpdate();
			if(i>0)
			{
				System.out.println("Answer Posted Successfully");
			}
			out.println("<script type=\"text/javascript\">");        // creating alert message using java
			out.println("alert('Answer Posted Successfully');");
			out.println("location='UserLogin.jsp';");
			out.println("</script>");
			
			
			
        }
        catch(Exception ex){
        	ex.printStackTrace();
        	out.println("<script type=\"text/javascript\">");        // creating alert message using java
			out.println("alert('Some unexpected error occured. Please try again later');");
			out.println("location='/login.jsp';");
			out.println("</script>");
        }
        }
    }
