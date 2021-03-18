package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.model.Items;
import com.util.DatabaseConnection;

public class updateItemService {
	
	private static Connection con;
	private static PreparedStatement ps;
	private static Statement stmt;
	
	
	public void updateItems(Items i) {
		try {
			
			con=DatabaseConnection.getConnection();
			stmt=con.createStatement();
			ps=con.prepareStatement("update items set itemCode =?, itemName=?, itemPrice=?, itemDesc=? where itemID=?");
			
			ps.setString(1, i.getItemCode());
			ps.setString(2, i.getItemName());
			ps.setFloat(3, i.getPrice());
			ps.setString(4, i.getDescription());
			ps.setInt(5, i.getItemID());
			ps.executeUpdate();
			con.setAutoCommit(false);
			con.commit();
			
			//System.out.println(i.getItemName());
			
		}catch(Exception e) {
			System.out.print("Database does not connect. "+e);
			e.printStackTrace();
		}finally {
			if(con!=null) {
				try {
					con.close();
				}catch(SQLException e){
					
				}
			}
		}
	}

}
