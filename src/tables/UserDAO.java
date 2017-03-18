package tables;
import domain.User;

//import java.io.PrintWriter;
import java.sql.*;

import connection.ConnectionManager;

public class UserDAO 
{
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static int flag = 0;

	public static User login(User bean) {

		String Email = bean.getEmailId();   
		String pass = bean.getPassword();   
		//String searchQuery;
		try 
		{
			Connection conn=null;
			conn = ConnectionManager.getConnection();
			PreparedStatement pst= (PreparedStatement) conn.prepareStatement("SELECT user_id,Fname, Lname, Email, DOB,"
        			+"Country, City, JobPosition,Password FROM"+
        		"`user` WHERE Email=? AND Password=?");
        pst.setString(1, Email);
        pst.setString(2,pass);
        ResultSet rs=pst.executeQuery();
			if(rs.next()){
					System.out.println("Login successful");
					flag = 1;
					bean =new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(6),rs.getString(4),rs.getString(7),
		            		rs.getString(8),rs.getDate(5),rs.getString(9));
			}
			
			else if(flag==0){
				System.out.println("Login unsuccessful. Check credentials.");
				return null;
			}
			
		}			
		catch (Exception ex) 
		{

			System.out.println("Log In failed: An Exception has occurred! " + ex);
		}
		return bean;
	}	
}


