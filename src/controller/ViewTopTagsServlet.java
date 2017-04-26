package controller;
import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.mysql.jdbc.Connection;

import connection.ConnectionManager;

public class ViewTopTagsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger logger= Logger.getLogger(ViewTopTagsServlet.class);
  
    public ViewTopTagsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		logger.info("Inside View Top Tags servlet");
		response.setContentType("text/html");
        response.setContentType("text/html");
        //PrintWriter out = response.getWriter();
        try{
        Connection con=null;
		con = ConnectionManager.getConnection();
		Statement stmt = null;
		stmt = con.createStatement();
		String query = "SELECT tag, COUNT(*) FROM tags GROUP BY tag ORDER BY COUNT(*) DESC LIMIT 10 ";
		ResultSet rs = stmt.executeQuery(query);
		ArrayList<String> tags= new ArrayList<String>();
		while(rs.next())
		{
			tags.add(rs.getString(1));
			System.out.println(rs.getString(1));
		}
		request.setAttribute("toptags",tags); 
	}
        catch(Exception ex)
        {
        	ex.printStackTrace();
        }
}
}
