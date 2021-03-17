package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.model.Items;
import com.util.DatabaseConnection;

public class addItemService {
	private static Connection con;
	private static PreparedStatement ps;
	private static Statement stmt;
	
	public void addItem(Items i) {
		try {
			con=DatabaseConnection.getConnection();
			stmt=con.prepareStatement("insert into items (itemCode,itemName,itemPrice,itemDesc) values(?,?,?,?)");
			
			ps.setString(1, i.getItemCode());
			ps.setString(2, i.getItemName());
			ps.setFloat(3, i.getPrice());
			ps.setString(4, i.getDescription());
			ps.executeUpdate();
			con.setAutoCommit(false);
			con.commit();
			
			
		}catch(Exception e) {
			System.out.println("Databsse did not connect. "+ e );
		}finally {
			if(con!=null) {
				try {
					con.close();
				}catch(SQLException e) {
					
				}
			}
		}
	}
	
	
}
