package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import domain.User;
import org.apache.log4j.Logger;

import com.mysql.jdbc.Connection;

public class SearchUser {

	private static final long serialVersionUID =1L;
	final static Logger logger= Logger.getLogger(UpdateProfileServlet.class);
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	logger.info("Inside Search User servlet");
		//response.setContentType("text/html");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            

            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception ex) {
            
        }
        Connection conn = null;
        try {
            conn =
               (Connection) DriverManager.getConnection("jdbc:mysql://localhost/techquo?" +
                                           "user=root&password=tiger");
            
			System.out.println("Connection Established");
            Integer Uid = Integer.parseInt(request.getParameter("UID"));
            
}
        catch(Exception e){
        
        }
    }
}

