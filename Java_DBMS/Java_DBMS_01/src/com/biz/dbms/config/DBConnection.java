package com.biz.dbms.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	private static Connection dbConn = null;
	
	static {
		
		try {
			Class.forName(DBcontract.DB_DRIVER);
			dbConn = DriverManager.getConnection(DBcontract.DB_URL,
					DBcontract.DB_USER,
					DBcontract.DB_PASSWORD);
			System.out.println("DB Connection OK!!!!!");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //end
		
		
	
		
		
	}

	public static Connection getDbConn() {
		return dbConn;
	}


}
