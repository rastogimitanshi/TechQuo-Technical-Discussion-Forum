package connection;
import com.mysql.jdbc.Connection;
import java.sql.DriverManager;

public class ConnectionManager {
    public static Connection getConnection(){
    	Connection conn = null;
    	try{
    		
    		Class.forName("com.mysql.jdbc.Driver").newInstance();
    		
    		conn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost/techquo?" +
    	                                           "user=root&password=tiger");
    		
    				System.out.println("Connection Established");
    	}
    	catch (Exception ex) {
    			ex.printStackTrace();
    	}
    	return conn;
    }
}
