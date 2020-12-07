package metier;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingletonConnexion {
	private static Connection con;
	
	static{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://sql2.freemysqlhosting.net/sql2315993","sql2315993","lE4%cM1*");
		
			//con=DriverManager.getConnection("jdbc:mysql://localhost:3306/liraki","root","");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Connection getCon() {
		return con;
	}
	
	

}
