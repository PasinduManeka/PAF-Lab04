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
			stmt=con.createStatement();
			ps=con.prepareStatement("insert into items (itemCode,itemName,itemPrice,itemDesc) values(?,?,?,?)");
			
			ps.setString(1, i.getItemCode());
			ps.setString(2, i.getItemName());
			ps.setFloat(3, i.getPrice());
			ps.setString(4, i.getDescription());
			ps.executeUpdate();
			con.setAutoCommit(false);
			con.commit();
			
			//System.out.print(i.getItemCode());
			
			
		}catch(Exception e) {
			//System.out.println(i.getItemCode());
			System.out.println("Database did not connect. "+ e );
			e.printStackTrace();
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
