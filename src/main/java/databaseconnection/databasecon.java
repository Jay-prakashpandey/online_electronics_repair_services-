package databaseconnection;
import java.sql.*;

public class databasecon 
{
	static Connection co;
	public static Connection getconnection()
	{
 		
 			
		try
		{
			Class.forName("org.sqlite.JDBC");	
			co = DriverManager.getConnection(""jdbc:sqlite:C:\\Users\\jaypr\\MySQLiteDB"");
		}
                
                
		catch(Exception e)
		{
			//System.out.println("Database Error"+e);
		}
		return co;
	}
	
}

