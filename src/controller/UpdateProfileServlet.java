package controller;

import connection.ConnectionManager;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.log4j.Logger;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import domain.User;
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class UpdateProfileServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;
	final static Logger logger= Logger.getLogger(UpdateProfileServlet.class);
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		logger.info("Inside update profile servlet");
		response.setContentType("text/html");
		
		HttpSession session = request.getSession(false);
		if(session.getAttribute("user_details")==null){
					request.setAttribute("SessionExpired", "Your session has expired. Please log in again.");
					RequestDispatcher requestDispatcher;
					requestDispatcher = request.getRequestDispatcher("/login.jsp");
					requestDispatcher.forward(request,response);
					return;
				}
		
		User user =(User) session.getAttribute("user_details");
		String Fname = request.getParameter("FirstName");
		String Lname= request.getParameter("LastName");
		String EmailId = request.getParameter("EmailId");
		String City = request.getParameter("City");
		String Country = request.getParameter("Country");
		String JobPosition = request.getParameter("JobPosition");
		String DOB = request.getParameter("DOB");
		Date date= new Date();
		try {
			date = new SimpleDateFormat("dd-MM-yyyy").parse(DOB);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		java.sql.Date date3 = new java.sql.Date(date.getTime());
		InputStream inputStream = null; 
		String []Interests=new String[]{};
		Interests=request.getParameterValues("myInputs");
		String []Education=new String[]{};
		Education=request.getParameterValues("myEducation");
	
		
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            inputStream = filePart.getInputStream();
        }
		if(Fname==null || Fname==""){
			Fname=user.getFirstName();
		
		}
		if(Lname==null || Lname==""){
			Fname=user.getLastName();
		
		}
		if(EmailId==null || EmailId==""){
			EmailId=user.getEmailId();
		}
		System.out.println(Education.length);
		System.out.println(Interests.length);
		int UserId=user.getUserId();
		try{
			Connection con=null;
			con = ConnectionManager.getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE `user` SET Fname=?, Lname=?, City=?, Email=?, Country=? , DOB=?, JobPosition=?, Profile_Picture=? WHERE user_id=?");
		
			
			ps.setString(1, Fname);
			ps.setString(2, Lname);
			ps.setString(3, City);
			ps.setString(4, EmailId);
			ps.setString(5, Country);
			ps.setDate(6, date3);
			ps.setString(7, JobPosition);
			if (inputStream != null) {
                
                ps.setBlob(8, inputStream);
            }
			ps.setInt(9, UserId); 	// change to getUserId() later
			
            // sends the statement to the database server
			
			int i = ps.executeUpdate();
			System.out.println("User Table Updates");
			PreparedStatement pst = (PreparedStatement) con.prepareStatement("INSERT INTO `interests_user`(user_id_I,Interests) VALUES(?,?)");
			if (Interests!=null)
			{
			for(i=0;i<Interests.length;i++){
				pst.setInt(1, UserId);
				pst.setString(2, Interests[i]);
				pst.addBatch();
				System.out.println(Interests[i]);
			}
			pst.executeBatch();
			}
			
			PreparedStatement pstE = (PreparedStatement) con.prepareStatement("INSERT INTO `education_user` VALUES(?,?)");
			if (Education!=null)
			{
			for(int j=0;j<Education.length;j++){
				pstE.setInt(1, UserId);
				pstE.setString(2, Education[j]);
				pstE.addBatch();
				System.out.println(Education[j]);
			}
			pstE.executeBatch();
			}
			PreparedStatement p = (PreparedStatement) con.prepareStatement("SELECT user_id, Fname, Lname, Country, Email, City, JobPosition, DOB, Password, Role FROM `user` WHERE user_id=?");
			p.setInt(1, UserId); //change to getUserId() later
			
			ResultSet rs = p.executeQuery();
			
			if(!rs.next()){
				logger.info("User not found");
				throw new Exception();
			}
		
			User user_details;
			rs.next();
			user_details = new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getDate(8),rs.getString(9),rs.getString(10));
			session.setAttribute("user_details",user_details);
				logger.info("Profile edited successfully");
				out.println("<script type=\"text/javascript\">");        // creating alert message using java
				out.println("alert('Profile Edited Successfully');");
				out.println("location='Home.jsp';");
				out.println("</script>");
			
		}
		catch(Exception e){
			e.printStackTrace();
			
				logger.error(e);
				logger.info("Profile Not Edited");
				out.println("<script type=\"text/javascript\">");        // creating alert message using java
				out.println("alert('Some unexpected error occured. Please try again later');");
				out.println("location='Home.jsp';");
				out.println("</script>");
			}
		}
	}
