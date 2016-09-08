package com.guest.model;

import java.sql.Connection;
import java.sql.DriverManager;

public class OraDB {
	private Connection conn;
	
	public OraDB() {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="scott";
		String password="tiger";
		try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);
		}catch(Exception ex){}
	}
	
	public static Connection getConnection(){
		OraDB ora = new OraDB();
		Connection conn = ora.conn;
		return conn;
	}
	
}






