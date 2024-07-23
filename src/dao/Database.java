package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {

	private Connection con;
	
	public Connection getCon() {
		//String url = "jdbc:postgresql://postgres-calcio:5432/WebAppCalcetto"; //per deploy su Docker
		String url = "jdbc:postgresql://localhost:5432/WebAppCalcetto"; //per utilizzo in locale esempio run dei test
		String user = "postgres";
		String pwd = "Parco112";
		
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(url, user, pwd);
			/*
			if(con != null) {
				System.out.println("connessione postgreSQL avvenuta");
				}
			*/
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return con;
	}
	
}
