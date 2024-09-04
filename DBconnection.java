package com.DBconnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {
	private static final String  driver_ClassName= "com.mysql.cj.jdbc.Driver";
	private static final String url = "jdbc:mysql://localhost:3306/batch";
	private static final String userName = "root";
	private static final String password = "root";
	
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName(driver_ClassName);
			 con = DriverManager.getConnection(url, userName, password);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return con;
	}
	
	
}
