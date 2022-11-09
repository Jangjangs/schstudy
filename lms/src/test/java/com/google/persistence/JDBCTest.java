package com.google.persistence;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTest {
	
	@Test
	public void testConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn= DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/bigdata?serverTimezone=Asia/Seoul", 
					"root",
					"bigdata");
			log.info(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
