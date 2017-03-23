package controller;
import connection.ConnectionManager;
import java.io.IOException;
//import java.io.OutputStream;
import java.sql.Connection;
//import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetProfilePicture extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int img_id = Integer.parseInt(request.getParameter("Uid"));
			Connection conn=null;
			conn = ConnectionManager.getConnection();
		PreparedStatement pstmt = null;
		//OutputStream oImage;
		try {
			pstmt = conn.prepareStatement("SELECT Profile_Picture from `user` WHERE user_id=?");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			pstmt.setInt(1, img_id);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	
			 try(ResultSet rs = pstmt.executeQuery()){
		    if(rs.next()) {
		    	byte[] content = rs.getBytes("Profile_Picture");
                response.setContentLength(content.length);
                response.getOutputStream().write(content);
		    }
		    else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND); 
		}
		 }

		 catch (SQLException e) {
	            
		}
	}	       
	}	
	

