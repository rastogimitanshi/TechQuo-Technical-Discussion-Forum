package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import domain.User;
import org.apache.log4j.Logger;
import com.mysql.jdbc.Connection;

public class SearchUserServlet extends HttpServlet{

	private static final long serialVersionUID =102831973239L;
	final static Logger logger= Logger.getLogger(UpdateProfileServlet.class);
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	logger.info("Inside Search User servlet");
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
            PreparedStatement pst= (PreparedStatement) conn.prepareStatement("SELECT Fname, Lname, Email, DOB,"
            			+"Country, City, JobPostion, Profile_views FROM"+
            		"`user` WHERE user_id=?");
            pst.setInt(1, Uid);
            ResultSet rs=pst.executeQuery();
            User user =new User(Uid,rs.getString(1),rs.getString(2),rs.getString(5),rs.getString(3),rs.getString(6),
            		rs.getString(7),rs.getDate(4));
            Integer pv=rs.getInt(8);
            PreparedStatement pstI= (PreparedStatement) conn.prepareStatement("SELECT Interests FROM `interests_user"+
            					"WHERE user_id_I=?");
            pstI.setInt(1,Uid);
            String Interests="";
            ResultSet rstI=pstI.executeQuery();
            while(rstI.next()){
            	Interests.concat(rstI.getString(1)+",");
            	
            }
            System.out.println(Interests);
            conn.close();
            RequestDispatcher requestDispatcher;			
    		requestDispatcher =request.getRequestDispatcher("UserLogin.jsp"); //change name later
    		requestDispatcher.forward(request, response); 
}
        catch(Exception e){
        	System.out.println(e);
			logger.error(e);
			logger.info("Some Error Occured");
			out.println("<script type=\"text/javascript\">");        // creating alert message using java
			out.println("alert('Some unexpected error occured. Please try again later');");
			out.println("location='QuestionDetails.jsp';");
			out.println("</script>");
        }
    }
}

