package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.model.Items;
import com.util.DatabaseConnection;

public class deleteItemService {
	private static Connection con;
	private static PreparedStatement ps;
	private static Statement stmt;
	
	public void deleteItem(Items i) {
		try {
			con=DatabaseConnection.getConnection();
			stmt=con.createStatement();
			
			ps=con.prepareStatement("delete from items where itemID=?");
			ps.setInt(1, i.getItemID());
			ps.executeUpdate();
			con.setAutoCommit(false);
			con.commit();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Database Connection failed."+e);
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
