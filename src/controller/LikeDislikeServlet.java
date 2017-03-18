package controller;
import connection.ConnectionManager;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import domain.Answer;
import org.apache.log4j.Logger;
import com.mysql.jdbc.Connection;
@WebServlet(urlPatterns ={"/LikeDislike"})

public class LikeDislikeServlet extends HttpServlet {
	private static final long serialVersionUID =1L;
	final static Logger logger= Logger.getLogger(LikeDislikeServlet.class);
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	logger.info("Inside Enter Answer servlet");
		//response.setContentType("text/html");
        response.setContentType("text/html");
        int like = Integer.parseInt(request.getParameter("like"));
        int dislike = Integer.parseInt(request.getParameter("dislike"));
        int ansid =  Integer.parseInt(request.getParameter("ansid"));
        System.out.println(like);
        System.out.println(dislike);
        System.out.println(ansid);
    //    PrintWriter out = response.getWriter();
        try{
        Connection conn=null;
		conn = ConnectionManager.getConnection();
        }
        catch(Exception e)
        {
        	
    }
}

        
    }

