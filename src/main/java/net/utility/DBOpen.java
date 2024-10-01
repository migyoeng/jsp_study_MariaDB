package net.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBOpen {
	
	//오라클 데이터베이스 연결 메소드
	public Connection getConnection() {
		Connection con = null;
		try {
			String url = "jdbc:mariadb://localhost:3306/greenit";
			String user = "root";
			String password = "1234";
			String driver = "org.mariadb.jdbc.Driver";
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
		} catch(Exception e) {
			System.out.println("Maria DB 연결 실패: " + e);
		}//end
		return con;
	}//getConnection() end
	
}//class end
