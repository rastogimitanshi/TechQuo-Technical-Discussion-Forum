package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;

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
		response.setContentType("text/html"); // type of response given by the server
		
		HttpSession session = request.getSession();
		User user =(User) session.getAttribute("USER_DETAILS");
		int UserId = Integer.parseInt(request.getParameter("UserId"));
		String Fname = request.getParameter("FirstName");
		String Lname= request.getParameter("LastName");
		String EmailId = request.getParameter("EmailId");
		String City = request.getParameter("City");
		String Country = request.getParameter("Country");
		String JobPosition = request.getParameter("JobPosition");
		String DOB = request.getParameter("DOB");
		InputStream inputStream = null; 
		String []Interests;
		Interests = request.getParameterValues("myInputs");
		String []Education;
		Education = request.getParameterValues("myEducation");
	
		
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
		
		try {
          
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception ex) {
            // handle the error
        }
        Connection conn = null;
        try {
            conn =
               (Connection) DriverManager.getConnection("jdbc:mysql://localhost/techquo?" +
                                           "user=root&password=tiger");
			System.out.println("Connection Established");
			
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement("UPDATE `user` SET Fname=?, Lname=?, City=?, Email=?, Country=? , DOB=?, JobPosition=?, Profile_Picture=? WHERE user_id=?");
		
			
			ps.setString(1, Fname);
			ps.setString(2, Lname);
			ps.setString(3, City);
			ps.setString(4, EmailId);
			ps.setString(5, Country);
			ps.setDate(6, java.sql.Date.valueOf(DOB));
			ps.setString(7, JobPosition);
			if (inputStream != null) {
                
                ps.setBlob(8, inputStream);
            }
			ps.setInt(9, UserId); 	// change to getUserId() later
 
            // sends the statement to the database server
			
			int i = ps.executeUpdate();
			PreparedStatement pst = (PreparedStatement) conn.prepareStatement("INSERT INTO interests_user VALUES(?,?)");
		
			for(i=0;i<Interests.length;i++){
				pst.setInt(1, UserId);
				pst.setString(2, Interests[i]);
				pst.addBatch();
				System.out.println(Interests[i]);
			}
			pst.executeBatch();
			
			PreparedStatement pstE = (PreparedStatement) conn.prepareStatement("INSERT INTO education_user VALUES(?,?)");
			for(int j=0;j<Education.length;j++){
				pstE.setInt(1, UserId);
				pstE.setString(2, Education[j]);
				pstE.addBatch();
				System.out.println(Education[j]);
			}
			pstE.executeBatch();
		
			PreparedStatement p = (PreparedStatement) conn.prepareStatement("SELECT user_id, Fname, Lname, Country, Email, City, JobPosition, DOB FROM `user` WHERE user_id=?");
			p.setInt(1, UserId); //change to getUserId() later
			
			ResultSet rs = p.executeQuery();
			
			/*if(!rs.next()){
				logger.info("User not found");
				throw new Exception();
			}*/
		
			User UserDetails;
			rs.next();
			UserDetails = new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getDate(8));
			conn.close();
			session.setAttribute("USER_DETAILS", UserDetails);
				logger.info("Profile edited successfully");
				out.println("<script type=\"text/javascript\">");        // creating alert message using java
				out.println("alert('Profile Edited Successfully');");
				out.println("location='UserLogin.jsp';");
				out.println("</script>");
			
		}
		catch(Exception e){
			System.out.println(e);
				logger.error(e);
				logger.info("Profile edited successfully");
				out.println("<script type=\"text/javascript\">");        // creating alert message using java
				out.println("alert('Some unexpected error occured. Please try again later');");
				out.println("location='UserLogin.jsp';");
				out.println("</script>");
			}
		}
	}
