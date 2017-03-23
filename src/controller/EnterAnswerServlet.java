package controller;
import connection.ConnectionManager;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
//import java.util.ArrayList;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import domain.Question;
import javax.servlet.http.HttpSession;

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
			String ans=request.getParameter("ans");
			String errorMsg=null;
			if(ans == null || ans.equals("")){
	            errorMsg ="Answer Cannot be empty!!";
	        }
			 if(errorMsg != null){
		            RequestDispatcher rd = getServletContext().getRequestDispatcher("/Home.jsp");
		           // PrintWriter out= response.getWriter();
		            out.println("<font color=red>"+errorMsg+"</font>");
		            rd.include(request, response);
		        }
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
            PreparedStatement pstU=(PreparedStatement) conn.prepareStatement("UPDATE `user` SET AnswersAnswered=AnswersAnswered+1 WHERE user_id=?");
    		pstU.setInt(1,uid);
            pstU.executeUpdate();
			if(i>0)
			{
				System.out.println("Answer Posted Successfully");
			}
			out.println("<script type=\"text/javascript\">");        // creating alert message using java
			out.println("alert('Answer Posted Successfully');");
			out.println("location='Home.jsp';");
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
