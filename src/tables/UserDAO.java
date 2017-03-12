package tables;

import java.sql.*;

public class UserDAO 
{
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static int flag = 0;

	public static UserBean login(UserBean bean) {

		String user = bean.getUsername();   
		String pass = bean.getPassword();   
		String searchQuery;


		try 
		{
			//connect to DB
			Class.forName("com.mysql.jdbc.Driver");    
			Connection myConn= DriverManager.getConnection("jdbc:mysql://localhost:3306/techquo?user=root&password=dnsingh87"); //database and table name=hello

			Statement stmt= (Statement) myConn.createStatement();
			searchQuery="SELECT Email, Password FROM user";
			stmt.executeQuery(searchQuery);
			ResultSet rs=stmt.getResultSet();
			while(rs.next())
			{
				if((user.equals(rs.getString("Email")))&&pass.equals(rs.getString("Password")))   //username=pragya ,password=pragya
				{

					System.out.println("Login successful");
					flag = 1;
					break;

				}
			}
			if(flag != 1){
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


