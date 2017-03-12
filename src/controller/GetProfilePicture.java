package controller;
import connection.ConnectionManager;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.ConnectionManager;

public class GetProfilePicture extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int img_id = Integer.parseInt(request.getParameter("Uid"));
		try {
			Connection conn=null;
			conn = ConnectionManager.getConnection();
		            
		System.out.println("Connection Established");
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		OutputStream oImage;
		pstmt = conn.prepareStatement("SELECT Profile_Picture from `user` WHERE user_id=?");
		pstmt.setInt(1, img_id);
		rs = pstmt.executeQuery();
		    if(rs.next()) {
		        byte barray[] = rs.getBytes(1);
		        response.setContentType("image/jpeg");
		        oImage=response.getOutputStream();
		        oImage.write(barray);
		        oImage.flush();
		        oImage.close();
		    }
		    conn.close();
		}

		catch(Exception ex){
		    ex.printStackTrace();
		}
	}	       
		
	

	

}
